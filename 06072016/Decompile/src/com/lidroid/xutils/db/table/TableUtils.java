package com.lidroid.xutils.db.table;

import java.util.concurrent.*;
import java.util.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.db.converter.*;
import java.lang.reflect.*;
import com.lidroid.xutils.db.annotation.*;
import android.text.*;

public class TableUtils
{
    private static ConcurrentHashMap<String, HashMap<String, Column>> entityColumnsMap;
    private static ConcurrentHashMap<String, Id> entityIdMap;
    
    static {
        TableUtils.entityColumnsMap = new ConcurrentHashMap<String, HashMap<String, Column>>();
        TableUtils.entityIdMap = new ConcurrentHashMap<String, Id>();
    }
    
    private static void addColumns2Map(final Class<?> clazz, final String s, final HashMap<String, Column> hashMap) {
        if (!Object.class.equals(clazz)) {
            while (true) {
                while (true) {
                    Field[] declaredFields;
                    int n;
                    try {
                        declaredFields = clazz.getDeclaredFields();
                        final int length = declaredFields.length;
                        n = 0;
                        if (n >= length) {
                            if (!Object.class.equals(clazz.getSuperclass())) {
                                addColumns2Map(clazz.getSuperclass(), s, hashMap);
                                return;
                            }
                            break;
                        }
                    }
                    catch (Throwable t) {
                        LogUtils.e(t.getMessage(), t);
                        return;
                    }
                    final Field field = declaredFields[n];
                    if (!ColumnUtils.isTransient(field)) {
                        if (!Modifier.isStatic(field.getModifiers())) {
                            if (ColumnConverterFactory.isSupportColumnConverter(field.getType())) {
                                if (!field.getName().equals(s)) {
                                    final Column column = new Column(clazz, field);
                                    if (!hashMap.containsKey(column.getColumnName())) {
                                        hashMap.put(column.getColumnName(), column);
                                    }
                                }
                            }
                            else if (ColumnUtils.isForeign(field)) {
                                final Foreign foreign = new Foreign(clazz, field);
                                if (!hashMap.containsKey(foreign.getColumnName())) {
                                    hashMap.put(foreign.getColumnName(), foreign);
                                }
                            }
                            else if (ColumnUtils.isFinder(field)) {
                                final Finder finder = new Finder(clazz, field);
                                if (!hashMap.containsKey(finder.getColumnName())) {
                                    hashMap.put(finder.getColumnName(), finder);
                                }
                            }
                        }
                    }
                    ++n;
                    continue;
                }
            }
        }
    }
    
    public static HashMap<String, Column> getColumnMap(final Class<?> clazz) {
        synchronized (TableUtils.class) {
            HashMap<String, Column> hashMap;
            if (TableUtils.entityColumnsMap.containsKey(clazz.getCanonicalName())) {
                hashMap = TableUtils.entityColumnsMap.get(clazz.getCanonicalName());
            }
            else {
                final HashMap<String, Column> hashMap2 = new HashMap<String, Column>();
                addColumns2Map(clazz, getPrimaryKeyFieldName(clazz), hashMap2);
                TableUtils.entityColumnsMap.put(clazz.getCanonicalName(), hashMap2);
                hashMap = hashMap2;
            }
            return hashMap;
        }
    }
    
    public static Column getColumnOrId(final Class<?> clazz, final String s) {
        if (getPrimaryKeyColumnName(clazz).equals(s)) {
            return getId(clazz);
        }
        return getColumnMap(clazz).get(s);
    }
    
    public static Column getColumnOrId(final Class<?> clazz, final Field field) {
        final String columnNameByField = ColumnUtils.getColumnNameByField(field);
        if (getPrimaryKeyColumnName(clazz).equals(columnNameByField)) {
            return getId(clazz);
        }
        return getColumnMap(clazz).get(columnNameByField);
    }
    
    public static String getExecAfterTableCreated(final Class<?> clazz) {
        final Table table = clazz.getAnnotation(Table.class);
        if (table != null) {
            return table.execAfterTableCreated();
        }
        return null;
    }
    
    public static Id getId(final Class<?> clazz) {
        final int n = 0;
        synchronized (TableUtils.class) {
            if (Object.class.equals(clazz)) {
                throw new RuntimeException("field 'id' not found");
            }
        }
        final Class<?> clazz2;
        Id id;
        if (TableUtils.entityIdMap.containsKey(clazz2.getCanonicalName())) {
            id = TableUtils.entityIdMap.get(clazz2.getCanonicalName());
        }
        else {
            Field field = null;
            Field field2 = null;
            final Field[] declaredFields = clazz2.getDeclaredFields();
            Label_0106: {
                if (declaredFields != null) {
                    final int length = declaredFields.length;
                    int i = 0;
                    while (true) {
                        while (i < length) {
                            final Field field3 = declaredFields[i];
                            if (field3.getAnnotation(com.lidroid.xutils.db.annotation.Id.class) != null) {
                                field2 = field3;
                                field = field2;
                                if (field2 == null) {
                                    for (int length2 = declaredFields.length, j = n; j < length2; ++j) {
                                        field = declaredFields[j];
                                        if ("id".equals(field.getName()) || "_id".equals(field.getName())) {
                                            break Label_0106;
                                        }
                                    }
                                    field = field2;
                                }
                                break Label_0106;
                            }
                            else {
                                ++i;
                            }
                        }
                        continue;
                    }
                }
            }
            if (field == null) {
                id = getId(clazz2.getSuperclass());
            }
            else {
                final Id id2 = new Id(clazz2, field);
                TableUtils.entityIdMap.put(clazz2.getCanonicalName(), id2);
                id = id2;
            }
        }
        // monitorexit(TableUtils.class)
        return id;
    }
    
    private static String getPrimaryKeyColumnName(final Class<?> clazz) {
        final Id id = getId(clazz);
        if (id == null) {
            return null;
        }
        return id.getColumnName();
    }
    
    private static String getPrimaryKeyFieldName(final Class<?> clazz) {
        final Id id = getId(clazz);
        if (id == null) {
            return null;
        }
        return id.getColumnField().getName();
    }
    
    public static String getTableName(final Class<?> clazz) {
        final Table table = clazz.getAnnotation(Table.class);
        if (table == null || TextUtils.isEmpty((CharSequence)table.name())) {
            return clazz.getName().replace('.', '_');
        }
        return table.name();
    }
}
