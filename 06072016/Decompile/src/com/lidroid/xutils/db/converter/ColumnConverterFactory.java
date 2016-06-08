package com.lidroid.xutils.db.converter;

import java.util.concurrent.*;
import java.util.*;
import com.lidroid.xutils.db.sqlite.*;

public class ColumnConverterFactory
{
    private static final ConcurrentHashMap<String, ColumnConverter> columnType_columnConverter_map;
    
    static {
        columnType_columnConverter_map = new ConcurrentHashMap<String, ColumnConverter>();
        final BooleanColumnConverter booleanColumnConverter = new BooleanColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Boolean.TYPE.getCanonicalName(), booleanColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Boolean.class.getCanonicalName(), booleanColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(byte[].class.getCanonicalName(), new ByteArrayColumnConverter());
        final ByteColumnConverter byteColumnConverter = new ByteColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Byte.TYPE.getCanonicalName(), byteColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Byte.class.getCanonicalName(), byteColumnConverter);
        final CharColumnConverter charColumnConverter = new CharColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Character.TYPE.getCanonicalName(), charColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Character.class.getCanonicalName(), charColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Date.class.getCanonicalName(), new DateColumnConverter());
        final DoubleColumnConverter doubleColumnConverter = new DoubleColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Double.TYPE.getCanonicalName(), doubleColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Double.class.getCanonicalName(), doubleColumnConverter);
        final FloatColumnConverter floatColumnConverter = new FloatColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Float.TYPE.getCanonicalName(), floatColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Float.class.getCanonicalName(), floatColumnConverter);
        final IntegerColumnConverter integerColumnConverter = new IntegerColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Integer.TYPE.getCanonicalName(), integerColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Integer.class.getCanonicalName(), integerColumnConverter);
        final LongColumnConverter longColumnConverter = new LongColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Long.TYPE.getCanonicalName(), longColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Long.class.getCanonicalName(), longColumnConverter);
        final ShortColumnConverter shortColumnConverter = new ShortColumnConverter();
        ColumnConverterFactory.columnType_columnConverter_map.put(Short.TYPE.getCanonicalName(), shortColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(Short.class.getCanonicalName(), shortColumnConverter);
        ColumnConverterFactory.columnType_columnConverter_map.put(java.sql.Date.class.getCanonicalName(), new SqlDateColumnConverter());
        ColumnConverterFactory.columnType_columnConverter_map.put(String.class.getCanonicalName(), new StringColumnConverter());
    }
    
    public static ColumnConverter getColumnConverter(final Class clazz) {
        if (ColumnConverterFactory.columnType_columnConverter_map.containsKey(clazz.getCanonicalName())) {
            return ColumnConverterFactory.columnType_columnConverter_map.get(clazz.getCanonicalName());
        }
        if (ColumnConverter.class.isAssignableFrom(clazz)) {
            try {
                final ColumnConverter columnConverter = (ColumnConverter)clazz.newInstance();
                if (columnConverter != null) {
                    ColumnConverterFactory.columnType_columnConverter_map.put(clazz.getCanonicalName(), columnConverter);
                }
                return columnConverter;
            }
            catch (Throwable t) {}
        }
        return null;
    }
    
    public static ColumnDbType getDbColumnType(final Class clazz) {
        final ColumnConverter columnConverter = getColumnConverter(clazz);
        if (columnConverter != null) {
            return columnConverter.getColumnDbType();
        }
        return ColumnDbType.TEXT;
    }
    
    public static boolean isSupportColumnConverter(final Class clazz) {
        if (!ColumnConverterFactory.columnType_columnConverter_map.containsKey(clazz.getCanonicalName())) {
            if (ColumnConverter.class.isAssignableFrom(clazz)) {
                try {
                    final ColumnConverter columnConverter = (ColumnConverter)clazz.newInstance();
                    if (columnConverter != null) {
                        ColumnConverterFactory.columnType_columnConverter_map.put(clazz.getCanonicalName(), columnConverter);
                    }
                    if (columnConverter != null) {
                        return false;
                    }
                    return true;
                }
                catch (Throwable t) {}
            }
            return false;
        }
        return true;
    }
    
    public static void registerColumnConverter(final Class clazz, final ColumnConverter columnConverter) {
        ColumnConverterFactory.columnType_columnConverter_map.put(clazz.getCanonicalName(), columnConverter);
    }
}
