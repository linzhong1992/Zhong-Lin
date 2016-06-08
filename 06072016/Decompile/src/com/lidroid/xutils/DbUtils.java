package com.lidroid.xutils;

import java.util.concurrent.locks.*;
import android.content.*;
import android.text.*;
import java.io.*;
import android.database.sqlite.*;
import com.lidroid.xutils.exception.*;
import com.lidroid.xutils.util.*;
import android.database.*;
import java.util.*;
import com.lidroid.xutils.db.sqlite.*;
import com.lidroid.xutils.db.table.*;
import java.util.concurrent.*;

public class DbUtils
{
    private static HashMap<String, DbUtils> daoMap;
    private boolean allowTransaction;
    private DaoConfig daoConfig;
    private SQLiteDatabase database;
    private boolean debug;
    private final FindTempCache findTempCache;
    private Lock writeLock;
    private volatile boolean writeLocked;
    
    static {
        DbUtils.daoMap = new HashMap<String, DbUtils>();
    }
    
    private DbUtils(final DaoConfig daoConfig) {
        this.debug = false;
        this.allowTransaction = false;
        this.writeLock = new ReentrantLock();
        this.writeLocked = false;
        this.findTempCache = new FindTempCache((FindTempCache)null);
        if (daoConfig == null) {
            throw new IllegalArgumentException("daoConfig may not be null");
        }
        if (daoConfig.getContext() == null) {
            throw new IllegalArgumentException("context mey not be null");
        }
        this.database = this.createDatabase(daoConfig);
        this.daoConfig = daoConfig;
    }
    
    private void beginTransaction() {
        if (this.allowTransaction) {
            this.database.beginTransaction();
            return;
        }
        this.writeLock.lock();
        this.writeLocked = true;
    }
    
    public static DbUtils create(final Context context) {
        return getInstance(new DaoConfig(context));
    }
    
    public static DbUtils create(final Context context, final String dbName) {
        final DaoConfig daoConfig = new DaoConfig(context);
        daoConfig.setDbName(dbName);
        return getInstance(daoConfig);
    }
    
    public static DbUtils create(final Context context, final String dbName, final int dbVersion, final DbUpgradeListener dbUpgradeListener) {
        final DaoConfig daoConfig = new DaoConfig(context);
        daoConfig.setDbName(dbName);
        daoConfig.setDbVersion(dbVersion);
        daoConfig.setDbUpgradeListener(dbUpgradeListener);
        return getInstance(daoConfig);
    }
    
    public static DbUtils create(final Context context, final String dbDir, final String dbName) {
        final DaoConfig daoConfig = new DaoConfig(context);
        daoConfig.setDbDir(dbDir);
        daoConfig.setDbName(dbName);
        return getInstance(daoConfig);
    }
    
    public static DbUtils create(final Context context, final String dbDir, final String dbName, final int dbVersion, final DbUpgradeListener dbUpgradeListener) {
        final DaoConfig daoConfig = new DaoConfig(context);
        daoConfig.setDbDir(dbDir);
        daoConfig.setDbName(dbName);
        daoConfig.setDbVersion(dbVersion);
        daoConfig.setDbUpgradeListener(dbUpgradeListener);
        return getInstance(daoConfig);
    }
    
    public static DbUtils create(final DaoConfig daoConfig) {
        return getInstance(daoConfig);
    }
    
    private SQLiteDatabase createDatabase(final DaoConfig daoConfig) {
        final String dbDir = daoConfig.getDbDir();
        if (!TextUtils.isEmpty((CharSequence)dbDir)) {
            final File file = new File(dbDir);
            if (!file.exists()) {
                file.mkdirs();
            }
            return SQLiteDatabase.openOrCreateDatabase(new File(dbDir, daoConfig.getDbName()), (SQLiteDatabase$CursorFactory)null);
        }
        return daoConfig.getContext().openOrCreateDatabase(daoConfig.getDbName(), 0, (SQLiteDatabase$CursorFactory)null);
    }
    
    private void debugSql(final String s) {
        if (this.debug) {
            LogUtils.d(s);
        }
    }
    
    private void endTransaction() {
        if (this.allowTransaction) {
            this.database.endTransaction();
        }
        if (this.writeLocked) {
            this.writeLock.unlock();
            this.writeLocked = false;
        }
    }
    
    private static DbUtils getInstance(final DaoConfig daoConfig) {
        while (true) {
            while (true) {
                Label_0111: {
                    DbUtils dbUtils;
                    synchronized (DbUtils.class) {
                        dbUtils = DbUtils.daoMap.get(daoConfig.getDbName());
                        if (dbUtils == null) {
                            dbUtils = new DbUtils(daoConfig);
                            DbUtils.daoMap.put(daoConfig.getDbName(), dbUtils);
                        }
                        else {
                            dbUtils.daoConfig = daoConfig;
                        }
                        final SQLiteDatabase database = dbUtils.database;
                        final int version = database.getVersion();
                        final int dbVersion = daoConfig.getDbVersion();
                        if (version != dbVersion) {
                            if (version != 0) {
                                final DbUpgradeListener dbUpgradeListener = daoConfig.getDbUpgradeListener();
                                if (dbUpgradeListener == null) {
                                    break Label_0111;
                                }
                                dbUpgradeListener.onUpgrade(dbUtils, version, dbVersion);
                            }
                            database.setVersion(dbVersion);
                        }
                        return dbUtils;
                    }
                    try {
                        dbUtils.dropDb();
                        continue;
                    }
                    catch (DbException ex) {
                        LogUtils.e(ex.getMessage(), ex);
                        continue;
                    }
                }
                continue;
            }
        }
    }
    
    private long getLastAutoIncrementId(String execQuery) throws DbException {
        long long1 = -1L;
        execQuery = (String)this.execQuery("SELECT seq FROM sqlite_sequence WHERE name='" + execQuery + "'");
        long n = long1;
        if (execQuery == null) {
            return n;
        }
        try {
            if (((Cursor)execQuery).moveToNext()) {
                long1 = ((Cursor)execQuery).getLong(0);
            }
            IOUtils.closeQuietly((Cursor)execQuery);
            n = long1;
            return n;
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
        finally {
            IOUtils.closeQuietly((Cursor)execQuery);
        }
    }
    
    private boolean saveBindingIdWithoutTransaction(final Object o) throws DbException {
        final Class<?> class1 = o.getClass();
        final String tableName = TableUtils.getTableName(class1);
        final Id id = TableUtils.getId(class1);
        if (!id.isAutoIncrement()) {
            this.execNonQuery(SqlInfoBuilder.buildInsertSqlInfo(this, o));
            return true;
        }
        this.execNonQuery(SqlInfoBuilder.buildInsertSqlInfo(this, o));
        final long lastAutoIncrementId = this.getLastAutoIncrementId(tableName);
        if (lastAutoIncrementId == -1L) {
            return false;
        }
        id.setAutoIncrementId(o, lastAutoIncrementId);
        return true;
    }
    
    private void saveOrUpdateWithoutTransaction(final Object o) throws DbException {
        final Id id = TableUtils.getId(o.getClass());
        if (!id.isAutoIncrement()) {
            this.execNonQuery(SqlInfoBuilder.buildReplaceSqlInfo(this, o));
            return;
        }
        if (id.getColumnValue(o) != null) {
            this.execNonQuery(SqlInfoBuilder.buildUpdateSqlInfo(this, o, new String[0]));
            return;
        }
        this.saveBindingIdWithoutTransaction(o);
    }
    
    private void setTransactionSuccessful() {
        if (this.allowTransaction) {
            this.database.setTransactionSuccessful();
        }
    }
    
    public DbUtils configAllowTransaction(final boolean allowTransaction) {
        this.allowTransaction = allowTransaction;
        return this;
    }
    
    public DbUtils configDebug(final boolean debug) {
        this.debug = debug;
        return this;
    }
    
    public long count(final Selector selector) throws DbException {
        final Class<?> entityType = selector.getEntityType();
        if (!this.tableIsExist(entityType)) {
            return 0L;
        }
        return this.findDbModelFirst(selector.select("count(" + TableUtils.getId(entityType).getColumnName() + ") as count")).getLong("count");
    }
    
    public long count(final Class<?> clazz) throws DbException {
        return this.count(Selector.from(clazz));
    }
    
    public long count(final Class<?> clazz, final WhereBuilder whereBuilder) throws DbException {
        return this.count(Selector.from(clazz).where(whereBuilder));
    }
    
    public long count(final Object o) throws DbException {
        if (!this.tableIsExist(o.getClass())) {
            return 0L;
        }
        final Selector from = Selector.from(o.getClass());
        final List<KeyValue> entity2KeyValueList = SqlInfoBuilder.entity2KeyValueList(this, o);
        if (entity2KeyValueList != null) {
            final WhereBuilder b = WhereBuilder.b();
            for (final KeyValue keyValue : entity2KeyValueList) {
                final Object value = keyValue.getValue();
                if (value != null) {
                    b.and(keyValue.getKey(), "=", value);
                }
            }
            from.where(b);
        }
        return this.count(from);
    }
    
    public void createTableIfNotExist(final Class<?> clazz) throws DbException {
        if (!this.tableIsExist(clazz)) {
            this.execNonQuery(SqlInfoBuilder.buildCreateTableSqlInfo(clazz));
            final String execAfterTableCreated = TableUtils.getExecAfterTableCreated(clazz);
            if (!TextUtils.isEmpty((CharSequence)execAfterTableCreated)) {
                this.execNonQuery(execAfterTableCreated);
            }
        }
    }
    
    public void delete(final Class<?> clazz, final WhereBuilder whereBuilder) throws DbException {
        if (!this.tableIsExist(clazz)) {
            return;
        }
        try {
            this.beginTransaction();
            this.execNonQuery(SqlInfoBuilder.buildDeleteSqlInfo(clazz, whereBuilder));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void delete(final Object o) throws DbException {
        if (!this.tableIsExist(o.getClass())) {
            return;
        }
        try {
            this.beginTransaction();
            this.execNonQuery(SqlInfoBuilder.buildDeleteSqlInfo(o));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void deleteAll(final Class<?> clazz) throws DbException {
        this.delete(clazz, null);
    }
    
    public void deleteAll(final List<?> list) throws DbException {
        if (list == null || list.size() == 0 || !this.tableIsExist(list.get(0).getClass())) {
            return;
        }
        try {
            this.beginTransaction();
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.execNonQuery(SqlInfoBuilder.buildDeleteSqlInfo(iterator.next()));
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void deleteById(final Class<?> clazz, final Object o) throws DbException {
        if (!this.tableIsExist(clazz)) {
            return;
        }
        try {
            this.beginTransaction();
            this.execNonQuery(SqlInfoBuilder.buildDeleteSqlInfo(clazz, o));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void dropDb() throws DbException {
        final Cursor execQuery = this.execQuery("SELECT name FROM sqlite_master WHERE type='table' AND name<>'sqlite_sequence'");
        if (execQuery == null) {
            return;
        }
        try {
            while (execQuery.moveToNext()) {
                try {
                    final String string = execQuery.getString(0);
                    this.execNonQuery("DROP TABLE " + string);
                    Table.remove(this, string);
                }
                catch (Throwable t) {
                    LogUtils.e(t.getMessage(), t);
                }
            }
        }
        catch (Throwable t2) {
            throw new DbException(t2);
        }
        finally {
            IOUtils.closeQuietly(execQuery);
        }
    }
    
    public void dropTable(final Class<?> clazz) throws DbException {
        if (!this.tableIsExist(clazz)) {
            return;
        }
        this.execNonQuery("DROP TABLE " + TableUtils.getTableName(clazz));
        Table.remove(this, clazz);
    }
    
    public void execNonQuery(final SqlInfo sqlInfo) throws DbException {
        this.debugSql(sqlInfo.getSql());
        try {
            if (sqlInfo.getBindArgs() != null) {
                this.database.execSQL(sqlInfo.getSql(), sqlInfo.getBindArgsAsArray());
                return;
            }
            this.database.execSQL(sqlInfo.getSql());
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
    }
    
    public void execNonQuery(final String s) throws DbException {
        this.debugSql(s);
        try {
            this.database.execSQL(s);
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
    }
    
    public Cursor execQuery(final SqlInfo sqlInfo) throws DbException {
        this.debugSql(sqlInfo.getSql());
        try {
            return this.database.rawQuery(sqlInfo.getSql(), sqlInfo.getBindArgsAsStrArray());
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
    }
    
    public Cursor execQuery(final String s) throws DbException {
        this.debugSql(s);
        try {
            return this.database.rawQuery(s, (String[])null);
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
    }
    
    public <T> List<T> findAll(final Selector selector) throws DbException {
        if (!this.tableIsExist(selector.getEntityType())) {
            return null;
        }
        final String string = selector.toString();
        final long seq = CursorUtils.FindCacheSequence.getSeq();
        this.findTempCache.setSeq(seq);
        final Object value = this.findTempCache.get(string);
        if (value != null) {
            return (List<T>)value;
        }
        final ArrayList<T> list = new ArrayList<T>();
        final Cursor execQuery = this.execQuery(string);
        if (execQuery == null) {
            return list;
        }
        try {
            while (execQuery.moveToNext()) {
                list.add(CursorUtils.getEntity(this, execQuery, selector.getEntityType(), seq));
            }
            this.findTempCache.put(string, list);
            return list;
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
        finally {
            IOUtils.closeQuietly(execQuery);
        }
    }
    
    public <T> List<T> findAll(final Class<T> clazz) throws DbException {
        return this.findAll(Selector.from(clazz));
    }
    
    public <T> List<T> findAll(final Class<T> clazz, final WhereBuilder whereBuilder) throws DbException {
        return this.findAll(Selector.from(clazz).where(whereBuilder));
    }
    
    public <T> List<T> findAll(final Object o) throws DbException {
        if (!this.tableIsExist(o.getClass())) {
            return null;
        }
        final Selector from = Selector.from(o.getClass());
        final List<KeyValue> entity2KeyValueList = SqlInfoBuilder.entity2KeyValueList(this, o);
        if (entity2KeyValueList != null) {
            final WhereBuilder b = WhereBuilder.b();
            for (final KeyValue keyValue : entity2KeyValueList) {
                final Object value = keyValue.getValue();
                if (value != null) {
                    b.and(keyValue.getKey(), "=", value);
                }
            }
            from.where(b);
        }
        return (List<T>)this.findAll(from);
    }
    
    public <T> T findById(final Class<T> clazz, Object o) throws DbException {
        if (!this.tableIsExist(clazz)) {
            o = null;
        }
        else {
            final String string = Selector.from(clazz).where(TableUtils.getId(clazz).getColumnName(), "=", o).limit(1).toString();
            final long seq = CursorUtils.FindCacheSequence.getSeq();
            this.findTempCache.setSeq(seq);
            if ((o = this.findTempCache.get(string)) == null) {
                o = this.execQuery(string);
                if (o != null) {
                    try {
                        if (((Cursor)o).moveToNext()) {
                            final T entity = CursorUtils.getEntity(this, (Cursor)o, clazz, seq);
                            this.findTempCache.put(string, entity);
                            return entity;
                        }
                    }
                    catch (Throwable t) {
                        throw new DbException(t);
                    }
                    finally {
                        IOUtils.closeQuietly((Cursor)o);
                    }
                    IOUtils.closeQuietly((Cursor)o);
                }
                return null;
            }
        }
        return (T)o;
    }
    
    public List<DbModel> findDbModelAll(final DbModelSelector dbModelSelector) throws DbException {
        List<DbModel> list;
        if (!this.tableIsExist(dbModelSelector.getEntityType())) {
            list = null;
        }
        else {
            final ArrayList<DbModel> list2 = new ArrayList<DbModel>();
            final Cursor execQuery = this.execQuery(dbModelSelector.toString());
            list = list2;
            if (execQuery != null) {
                try {
                    while (execQuery.moveToNext()) {
                        list2.add(CursorUtils.getDbModel(execQuery));
                    }
                    return list2;
                }
                catch (Throwable t) {
                    throw new DbException(t);
                }
                finally {
                    IOUtils.closeQuietly(execQuery);
                }
            }
        }
        return list;
    }
    
    public List<DbModel> findDbModelAll(SqlInfo execQuery) throws DbException {
        final ArrayList<DbModel> list = new ArrayList<DbModel>();
        execQuery = (SqlInfo)this.execQuery(execQuery);
        if (execQuery == null) {
            return list;
        }
        try {
            while (((Cursor)execQuery).moveToNext()) {
                list.add(CursorUtils.getDbModel((Cursor)execQuery));
            }
            return list;
        }
        catch (Throwable t) {
            throw new DbException(t);
        }
        finally {
            IOUtils.closeQuietly((Cursor)execQuery);
        }
    }
    
    public DbModel findDbModelFirst(DbModelSelector execQuery) throws DbException {
        if (this.tableIsExist(execQuery.getEntityType())) {
            execQuery = (DbModelSelector)this.execQuery(execQuery.limit(1).toString());
            if (execQuery != null) {
                try {
                    if (((Cursor)execQuery).moveToNext()) {
                        return CursorUtils.getDbModel((Cursor)execQuery);
                    }
                }
                catch (Throwable t) {
                    throw new DbException(t);
                }
                finally {
                    IOUtils.closeQuietly((Cursor)execQuery);
                }
                IOUtils.closeQuietly((Cursor)execQuery);
                return null;
            }
        }
        return null;
    }
    
    public DbModel findDbModelFirst(SqlInfo execQuery) throws DbException {
        execQuery = (SqlInfo)this.execQuery(execQuery);
        if (execQuery != null) {
            try {
                if (((Cursor)execQuery).moveToNext()) {
                    return CursorUtils.getDbModel((Cursor)execQuery);
                }
            }
            catch (Throwable t) {
                throw new DbException(t);
            }
            finally {
                IOUtils.closeQuietly((Cursor)execQuery);
            }
            IOUtils.closeQuietly((Cursor)execQuery);
        }
        return null;
    }
    
    public <T> T findFirst(final Selector selector) throws DbException {
        Object value;
        if (!this.tableIsExist(selector.getEntityType())) {
            value = null;
        }
        else {
            final String string = selector.limit(1).toString();
            final long seq = CursorUtils.FindCacheSequence.getSeq();
            this.findTempCache.setSeq(seq);
            if ((value = this.findTempCache.get(string)) == null) {
                final Cursor execQuery = this.execQuery(string);
                if (execQuery != null) {
                    try {
                        if (execQuery.moveToNext()) {
                            final T entity = CursorUtils.getEntity(this, execQuery, selector.getEntityType(), seq);
                            this.findTempCache.put(string, entity);
                            return entity;
                        }
                    }
                    catch (Throwable t) {
                        throw new DbException(t);
                    }
                    finally {
                        IOUtils.closeQuietly(execQuery);
                    }
                    IOUtils.closeQuietly(execQuery);
                }
                return null;
            }
        }
        return (T)value;
    }
    
    public <T> T findFirst(final Class<T> clazz) throws DbException {
        return this.findFirst(Selector.from(clazz));
    }
    
    public <T> T findFirst(final Class<T> clazz, final WhereBuilder whereBuilder) throws DbException {
        return this.findFirst(Selector.from(clazz).where(whereBuilder));
    }
    
    public <T> T findFirst(final Object o) throws DbException {
        if (!this.tableIsExist(o.getClass())) {
            return null;
        }
        final Selector from = Selector.from(o.getClass());
        final List<KeyValue> entity2KeyValueList = SqlInfoBuilder.entity2KeyValueList(this, o);
        if (entity2KeyValueList != null) {
            final WhereBuilder b = WhereBuilder.b();
            for (final KeyValue keyValue : entity2KeyValueList) {
                final Object value = keyValue.getValue();
                if (value != null) {
                    b.and(keyValue.getKey(), "=", value);
                }
            }
            from.where(b);
        }
        return (T)this.findFirst(from);
    }
    
    public DaoConfig getDaoConfig() {
        return this.daoConfig;
    }
    
    public SQLiteDatabase getDatabase() {
        return this.database;
    }
    
    public void replace(final Object o) throws DbException {
        try {
            this.beginTransaction();
            this.createTableIfNotExist(o.getClass());
            this.execNonQuery(SqlInfoBuilder.buildReplaceSqlInfo(this, o));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void replaceAll(final List<?> list) throws DbException {
        if (list == null || list.size() == 0) {
            return;
        }
        try {
            this.beginTransaction();
            this.createTableIfNotExist(list.get(0).getClass());
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.execNonQuery(SqlInfoBuilder.buildReplaceSqlInfo(this, iterator.next()));
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void save(final Object o) throws DbException {
        try {
            this.beginTransaction();
            this.createTableIfNotExist(o.getClass());
            this.execNonQuery(SqlInfoBuilder.buildInsertSqlInfo(this, o));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void saveAll(final List<?> list) throws DbException {
        if (list == null || list.size() == 0) {
            return;
        }
        try {
            this.beginTransaction();
            this.createTableIfNotExist(list.get(0).getClass());
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.execNonQuery(SqlInfoBuilder.buildInsertSqlInfo(this, iterator.next()));
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public boolean saveBindingId(final Object o) throws DbException {
        try {
            this.beginTransaction();
            this.createTableIfNotExist(o.getClass());
            final boolean saveBindingIdWithoutTransaction = this.saveBindingIdWithoutTransaction(o);
            this.setTransactionSuccessful();
            return saveBindingIdWithoutTransaction;
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void saveBindingIdAll(final List<?> list) throws DbException {
        if (list == null || list.size() == 0) {
            return;
        }
        try {
            this.beginTransaction();
            this.createTableIfNotExist(list.get(0).getClass());
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                if (!this.saveBindingIdWithoutTransaction(iterator.next())) {
                    throw new DbException("saveBindingId error, transaction will not commit!");
                }
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void saveOrUpdate(final Object o) throws DbException {
        try {
            this.beginTransaction();
            this.createTableIfNotExist(o.getClass());
            this.saveOrUpdateWithoutTransaction(o);
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void saveOrUpdateAll(final List<?> list) throws DbException {
        if (list == null || list.size() == 0) {
            return;
        }
        try {
            this.beginTransaction();
            this.createTableIfNotExist(list.get(0).getClass());
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.saveOrUpdateWithoutTransaction(iterator.next());
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public boolean tableIsExist(Class<?> execQuery) throws DbException {
        final Table value = Table.get(this, (Class<?>)execQuery);
        if (value.isCheckedDatabase()) {
            return true;
        }
        execQuery = this.execQuery("SELECT COUNT(*) AS c FROM sqlite_master WHERE type='table' AND name='" + value.getTableName() + "'");
        if (execQuery != null) {
            try {
                if (execQuery.moveToNext() && execQuery.getInt(0) > 0) {
                    value.setCheckedDatabase(true);
                    return true;
                }
            }
            catch (Throwable t) {
                throw new DbException(t);
            }
            finally {
                IOUtils.closeQuietly(execQuery);
            }
            IOUtils.closeQuietly(execQuery);
        }
        return false;
    }
    
    public void update(final Object o, final WhereBuilder whereBuilder, final String... array) throws DbException {
        if (!this.tableIsExist(o.getClass())) {
            return;
        }
        try {
            this.beginTransaction();
            this.execNonQuery(SqlInfoBuilder.buildUpdateSqlInfo(this, o, whereBuilder, array));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void update(final Object o, final String... array) throws DbException {
        if (!this.tableIsExist(o.getClass())) {
            return;
        }
        try {
            this.beginTransaction();
            this.execNonQuery(SqlInfoBuilder.buildUpdateSqlInfo(this, o, array));
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void updateAll(final List<?> list, final WhereBuilder whereBuilder, final String... array) throws DbException {
        if (list == null || list.size() == 0 || !this.tableIsExist(list.get(0).getClass())) {
            return;
        }
        try {
            this.beginTransaction();
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.execNonQuery(SqlInfoBuilder.buildUpdateSqlInfo(this, iterator.next(), whereBuilder, array));
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public void updateAll(final List<?> list, final String... array) throws DbException {
        if (list == null || list.size() == 0 || !this.tableIsExist(list.get(0).getClass())) {
            return;
        }
        try {
            this.beginTransaction();
            final Iterator<?> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.execNonQuery(SqlInfoBuilder.buildUpdateSqlInfo(this, iterator.next(), array));
            }
            this.setTransactionSuccessful();
        }
        finally {
            this.endTransaction();
        }
    }
    
    public static class DaoConfig
    {
        private Context context;
        private String dbDir;
        private String dbName;
        private DbUpgradeListener dbUpgradeListener;
        private int dbVersion;
        
        public DaoConfig(final Context context) {
            this.dbName = "xUtils.db";
            this.dbVersion = 1;
            this.context = context;
        }
        
        public Context getContext() {
            return this.context;
        }
        
        public String getDbDir() {
            return this.dbDir;
        }
        
        public String getDbName() {
            return this.dbName;
        }
        
        public DbUpgradeListener getDbUpgradeListener() {
            return this.dbUpgradeListener;
        }
        
        public int getDbVersion() {
            return this.dbVersion;
        }
        
        public void setDbDir(final String dbDir) {
            this.dbDir = dbDir;
        }
        
        public void setDbName(final String dbName) {
            if (!TextUtils.isEmpty((CharSequence)dbName)) {
                this.dbName = dbName;
            }
        }
        
        public void setDbUpgradeListener(final DbUpgradeListener dbUpgradeListener) {
            this.dbUpgradeListener = dbUpgradeListener;
        }
        
        public void setDbVersion(final int dbVersion) {
            this.dbVersion = dbVersion;
        }
    }
    
    public interface DbUpgradeListener
    {
        void onUpgrade(final DbUtils p0, final int p1, final int p2);
    }
    
    private class FindTempCache
    {
        private final ConcurrentHashMap<String, Object> cache;
        private long seq;
        
        private FindTempCache() {
            this.cache = new ConcurrentHashMap<String, Object>();
            this.seq = 0L;
        }
        
        public Object get(final String s) {
            return this.cache.get(s);
        }
        
        public void put(final String s, final Object o) {
            if (s != null && o != null) {
                this.cache.put(s, o);
            }
        }
        
        public void setSeq(final long seq) {
            if (this.seq != seq) {
                this.cache.clear();
                this.seq = seq;
            }
        }
    }
}
