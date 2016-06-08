package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.exception.*;
import com.lidroid.xutils.*;
import java.util.*;
import com.lidroid.xutils.db.table.*;

public class SqlInfoBuilder
{
    public static SqlInfo buildCreateTableSqlInfo(final Class<?> clazz) throws DbException {
        final String tableName = TableUtils.getTableName(clazz);
        final Id id = TableUtils.getId(clazz);
        final StringBuffer sb = new StringBuffer();
        sb.append("CREATE TABLE IF NOT EXISTS ");
        sb.append(tableName);
        sb.append(" ( ");
        if (id.isAutoIncrement()) {
            sb.append("\"").append(id.getColumnName()).append("\"  ").append("INTEGER PRIMARY KEY AUTOINCREMENT,");
        }
        else {
            sb.append("\"").append(id.getColumnName()).append("\"  ").append(id.getColumnDbType()).append(" PRIMARY KEY,");
        }
        for (final Column column : TableUtils.getColumnMap(clazz).values()) {
            if (!(column instanceof Finder)) {
                sb.append("\"").append(column.getColumnName()).append("\"  ");
                sb.append(column.getColumnDbType());
                if (ColumnUtils.isUnique(column.getColumnField())) {
                    sb.append(" UNIQUE");
                }
                if (ColumnUtils.isNotNull(column.getColumnField())) {
                    sb.append(" NOT NULL");
                }
                final String check = ColumnUtils.getCheck(column.getColumnField());
                if (check != null) {
                    sb.append(" CHECK(").append(check).append(")");
                }
                sb.append(",");
            }
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(" )");
        return new SqlInfo(sb.toString());
    }
    
    private static String buildDeleteSqlByTableName(final String s) {
        return "DELETE FROM " + s;
    }
    
    public static SqlInfo buildDeleteSqlInfo(final Class<?> clazz, final WhereBuilder whereBuilder) throws DbException {
        final StringBuilder sb = new StringBuilder(buildDeleteSqlByTableName(TableUtils.getTableName(clazz)));
        if (whereBuilder != null && whereBuilder.getWhereItemSize() > 0) {
            sb.append(" WHERE ").append(whereBuilder.toString());
        }
        return new SqlInfo(sb.toString());
    }
    
    public static SqlInfo buildDeleteSqlInfo(final Class<?> clazz, final Object o) throws DbException {
        final SqlInfo sqlInfo = new SqlInfo();
        final String tableName = TableUtils.getTableName(clazz);
        final Id id = TableUtils.getId(clazz);
        if (o == null) {
            throw new DbException("this entity[" + clazz + "]'s id value is null");
        }
        final StringBuilder sb = new StringBuilder(buildDeleteSqlByTableName(tableName));
        sb.append(" WHERE ").append(WhereBuilder.b(id.getColumnName(), "=", o));
        sqlInfo.setSql(sb.toString());
        return sqlInfo;
    }
    
    public static SqlInfo buildDeleteSqlInfo(final Object o) throws DbException {
        final SqlInfo sqlInfo = new SqlInfo();
        final Class<?> class1 = o.getClass();
        final String tableName = TableUtils.getTableName(class1);
        final Id id = TableUtils.getId(class1);
        final Object columnValue = id.getColumnValue(o);
        if (columnValue == null) {
            throw new DbException("this entity[" + o.getClass() + "]'s id value is null");
        }
        final StringBuilder sb = new StringBuilder(buildDeleteSqlByTableName(tableName));
        sb.append(" WHERE ").append(WhereBuilder.b(id.getColumnName(), "=", columnValue));
        sqlInfo.setSql(sb.toString());
        return sqlInfo;
    }
    
    public static SqlInfo buildInsertSqlInfo(final DbUtils dbUtils, final Object o) throws DbException {
        final List<KeyValue> entity2KeyValueList = entity2KeyValueList(dbUtils, o);
        if (entity2KeyValueList.size() == 0) {
            return null;
        }
        final SqlInfo sqlInfo = new SqlInfo();
        final StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO ");
        sb.append(TableUtils.getTableName(o.getClass()));
        sb.append(" (");
        for (final KeyValue keyValue : entity2KeyValueList) {
            sb.append(keyValue.getKey()).append(",");
            sqlInfo.addBindArgWithoutConverter(keyValue.getValue());
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(") VALUES (");
        for (int size = entity2KeyValueList.size(), i = 0; i < size; ++i) {
            sb.append("?,");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(")");
        sqlInfo.setSql(sb.toString());
        return sqlInfo;
    }
    
    public static SqlInfo buildReplaceSqlInfo(final DbUtils dbUtils, final Object o) throws DbException {
        final List<KeyValue> entity2KeyValueList = entity2KeyValueList(dbUtils, o);
        if (entity2KeyValueList.size() == 0) {
            return null;
        }
        final SqlInfo sqlInfo = new SqlInfo();
        final StringBuffer sb = new StringBuffer();
        sb.append("REPLACE INTO ");
        sb.append(TableUtils.getTableName(o.getClass()));
        sb.append(" (");
        for (final KeyValue keyValue : entity2KeyValueList) {
            sb.append(keyValue.getKey()).append(",");
            sqlInfo.addBindArgWithoutConverter(keyValue.getValue());
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(") VALUES (");
        for (int size = entity2KeyValueList.size(), i = 0; i < size; ++i) {
            sb.append("?,");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(")");
        sqlInfo.setSql(sb.toString());
        return sqlInfo;
    }
    
    public static SqlInfo buildUpdateSqlInfo(final DbUtils dbUtils, Object o, final WhereBuilder whereBuilder, final String... array) throws DbException {
        final List<KeyValue> entity2KeyValueList = entity2KeyValueList(dbUtils, o);
        if (entity2KeyValueList.size() == 0) {
            return null;
        }
        Collection<? super String> collection2;
        final Collection<? super String> collection = collection2 = null;
        if (array != null) {
            collection2 = collection;
            if (array.length > 0) {
                collection2 = new HashSet<Object>(array.length);
                Collections.addAll(collection2, array);
            }
        }
        final String tableName = TableUtils.getTableName(o.getClass());
        o = new SqlInfo();
        final StringBuffer sb = new StringBuffer("UPDATE ");
        sb.append(tableName);
        sb.append(" SET ");
        for (final KeyValue keyValue : entity2KeyValueList) {
            if (collection2 == null || ((HashSet)collection2).contains(keyValue.getKey())) {
                sb.append(keyValue.getKey()).append("=?,");
                ((SqlInfo)o).addBindArgWithoutConverter(keyValue.getValue());
            }
        }
        sb.deleteCharAt(sb.length() - 1);
        if (whereBuilder != null && whereBuilder.getWhereItemSize() > 0) {
            sb.append(" WHERE ").append(whereBuilder.toString());
        }
        ((SqlInfo)o).setSql(sb.toString());
        return (SqlInfo)o;
    }
    
    public static SqlInfo buildUpdateSqlInfo(final DbUtils dbUtils, Object o, final String... array) throws DbException {
        final List<KeyValue> entity2KeyValueList = entity2KeyValueList(dbUtils, o);
        if (entity2KeyValueList.size() == 0) {
            return null;
        }
        Collection<? super String> collection2;
        final Collection<? super String> collection = collection2 = null;
        if (array != null) {
            collection2 = collection;
            if (array.length > 0) {
                collection2 = new HashSet<Object>(array.length);
                Collections.addAll(collection2, array);
            }
        }
        final Class<?> class1 = o.getClass();
        final String tableName = TableUtils.getTableName(class1);
        final Id id = TableUtils.getId(class1);
        final Object columnValue = id.getColumnValue(o);
        if (columnValue == null) {
            throw new DbException("this entity[" + o.getClass() + "]'s id value is null");
        }
        o = new SqlInfo();
        final StringBuffer sb = new StringBuffer("UPDATE ");
        sb.append(tableName);
        sb.append(" SET ");
        for (final KeyValue keyValue : entity2KeyValueList) {
            if (collection2 == null || ((HashSet)collection2).contains(keyValue.getKey())) {
                sb.append(keyValue.getKey()).append("=?,");
                ((SqlInfo)o).addBindArgWithoutConverter(keyValue.getValue());
            }
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(" WHERE ").append(WhereBuilder.b(id.getColumnName(), "=", columnValue));
        ((SqlInfo)o).setSql(sb.toString());
        return (SqlInfo)o;
    }
    
    private static KeyValue column2KeyValue(Object o, final Column column) {
        final KeyValue keyValue = null;
        final String columnName = column.getColumnName();
        if ((o = column.getColumnValue(o)) == null) {
            o = column.getDefaultValue();
        }
        KeyValue keyValue2 = keyValue;
        if (columnName != null) {
            keyValue2 = new KeyValue(columnName, o);
        }
        return keyValue2;
    }
    
    public static List<KeyValue> entity2KeyValueList(final DbUtils dbUtils, final Object o) {
        final ArrayList<KeyValue> list = new ArrayList<KeyValue>();
        final Class<?> class1 = o.getClass();
        final Id id = TableUtils.getId(class1);
        if (!id.isAutoIncrement()) {
            list.add(new KeyValue(id.getColumnName(), id.getColumnValue(o)));
        }
        for (final Column column : TableUtils.getColumnMap(class1).values()) {
            if (column instanceof Finder) {
                ((Finder)column).db = dbUtils;
            }
            else {
                if (column instanceof Foreign) {
                    ((Foreign)column).db = dbUtils;
                }
                final KeyValue column2KeyValue = column2KeyValue(o, column);
                if (column2KeyValue == null) {
                    continue;
                }
                list.add(column2KeyValue);
            }
        }
        return list;
    }
}
