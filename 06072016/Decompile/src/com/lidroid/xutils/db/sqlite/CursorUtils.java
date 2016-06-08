package com.lidroid.xutils.db.sqlite;

import android.database.*;
import com.lidroid.xutils.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.db.table.*;
import java.util.*;
import com.lidroid.xutils.util.core.*;

public class CursorUtils
{
    public static DbModel getDbModel(final Cursor cursor) {
        DbModel dbModel = null;
        if (cursor != null) {
            dbModel = new DbModel();
            for (int columnCount = cursor.getColumnCount(), i = 0; i < columnCount; ++i) {
                dbModel.add(cursor.getColumnName(i), cursor.getString(i));
            }
        }
        return dbModel;
    }
    
    public static <T> T getEntity(final DbUtils dbUtils, final Cursor cursor, final Class<T> clazz, final long seq) {
        T value = null;
        Label_0011: {
            if (dbUtils == null || cursor == null) {
                value = null;
            }
            else {
            Label_0103_Outer:
                while (true) {
                    EntityTempCache.setSeq(seq);
                    while (true) {
                        Table value2;
                        T instance;
                        int n;
                        try {
                            value2 = Table.get(dbUtils, clazz);
                            final Id id = value2.getId();
                            final int columnIndex = cursor.getColumnIndex(id.getColumnName());
                            final String string = cursor.getString(columnIndex);
                            if ((value = EntityTempCache.get(clazz, string)) != null) {
                                break;
                            }
                            instance = clazz.newInstance();
                            id.setValue2Entity(instance, cursor, columnIndex);
                            EntityTempCache.put(instance, string);
                            final int columnCount = cursor.getColumnCount();
                            n = 0;
                            if (n >= columnCount) {
                                final Iterator<Column> iterator = value2.columnMap.values().iterator();
                                while (true) {
                                    value = instance;
                                    if (!iterator.hasNext()) {
                                        break Label_0011;
                                    }
                                    final Column column = iterator.next();
                                    if (!(column instanceof Finder)) {
                                        continue Label_0103_Outer;
                                    }
                                    final Finder finder = (Finder)column;
                                    finder.db = dbUtils;
                                    finder.setValue2Entity(instance, null, 0);
                                }
                            }
                        }
                        catch (Throwable t) {
                            LogUtils.e(t.getMessage(), t);
                            return null;
                        }
                        final Column column2 = value2.columnMap.get(cursor.getColumnName(n));
                        if (column2 != null) {
                            if (column2 instanceof Foreign) {
                                final Foreign foreign = (Foreign)column2;
                                foreign.db = dbUtils;
                                foreign.setValue2Entity(instance, cursor, n);
                            }
                            else {
                                column2.setValue2Entity(instance, cursor, n);
                            }
                        }
                        ++n;
                        continue;
                    }
                }
            }
        }
        return value;
    }
    
    private static class EntityTempCache
    {
        private static final DoubleKeyValueMap<Class<?>, String, Object> cache;
        private static long seq;
        
        static {
            cache = new DoubleKeyValueMap<Class<?>, String, Object>();
            EntityTempCache.seq = 0L;
        }
        
        public static <T> T get(final Class<T> clazz, final String s) {
            return (T)EntityTempCache.cache.get(clazz, s);
        }
        
        public static void put(final Object o, final String s) {
            if (o != null && s != null) {
                EntityTempCache.cache.put(o.getClass(), s, o);
            }
        }
        
        public static void setSeq(final long seq) {
            if (EntityTempCache.seq != seq) {
                EntityTempCache.cache.clear();
                EntityTempCache.seq = seq;
            }
        }
    }
    
    public static class FindCacheSequence
    {
        private static final String FINDER_LAZY_LOADER_CLASS_NAME;
        private static final String FOREIGN_LAZY_LOADER_CLASS_NAME;
        private static long seq;
        
        static {
            FindCacheSequence.seq = 0L;
            FOREIGN_LAZY_LOADER_CLASS_NAME = ForeignLazyLoader.class.getName();
            FINDER_LAZY_LOADER_CLASS_NAME = FinderLazyLoader.class.getName();
        }
        
        public static long getSeq() {
            final String className = Thread.currentThread().getStackTrace()[4].getClassName();
            if (!className.equals(FindCacheSequence.FOREIGN_LAZY_LOADER_CLASS_NAME) && !className.equals(FindCacheSequence.FINDER_LAZY_LOADER_CLASS_NAME)) {
                ++FindCacheSequence.seq;
            }
            return FindCacheSequence.seq;
        }
    }
}
