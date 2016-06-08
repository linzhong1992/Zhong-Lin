package com.lidroid.xutils.db.table;

import com.lidroid.xutils.db.converter.*;
import com.lidroid.xutils.util.*;
import android.text.*;
import java.util.*;
import java.lang.reflect.*;
import com.lidroid.xutils.db.sqlite.*;
import com.lidroid.xutils.db.annotation.*;

public class ColumnUtils
{
    private static final HashSet<String> DB_PRIMITIVE_TYPES;
    
    static {
        (DB_PRIMITIVE_TYPES = new HashSet<String>(14)).add(Integer.TYPE.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Long.TYPE.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Short.TYPE.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Byte.TYPE.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Float.TYPE.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Double.TYPE.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Integer.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Long.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Short.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Byte.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Float.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(Double.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(String.class.getCanonicalName());
        ColumnUtils.DB_PRIMITIVE_TYPES.add(byte[].class.getCanonicalName());
    }
    
    public static Object convert2DbColumnValueIfNeeded(final Object o) {
        Object fieldValue2ColumnValue = o;
        if (o != null) {
            final Class<?> class1 = o.getClass();
            fieldValue2ColumnValue = o;
            if (!isDbPrimitiveType(class1)) {
                final ColumnConverter columnConverter = ColumnConverterFactory.getColumnConverter(class1);
                if (columnConverter == null) {
                    return o;
                }
                fieldValue2ColumnValue = columnConverter.fieldValue2ColumnValue(o);
            }
        }
        return fieldValue2ColumnValue;
    }
    
    private static Method getBooleanColumnGetMethod(final Class<?> clazz, final String s) {
        String string = "is" + s.substring(0, 1).toUpperCase() + s.substring(1);
        if (isStartWithIs(s)) {
            string = s;
        }
        try {
            return clazz.getDeclaredMethod(string, (Class[])new Class[0]);
        }
        catch (NoSuchMethodException ex) {
            LogUtils.d(String.valueOf(string) + " not exist");
            return null;
        }
    }
    
    private static Method getBooleanColumnSetMethod(final Class<?> clazz, final Field field) {
        String s = field.getName();
        Label_0067: {
            if (!isStartWithIs(field.getName())) {
                break Label_0067;
            }
            s = "set" + s.substring(2, 3).toUpperCase() + s.substring(3);
            try {
                return clazz.getDeclaredMethod(s, field.getType());
                s = "set" + s.substring(0, 1).toUpperCase() + s.substring(1);
                return clazz.getDeclaredMethod(s, field.getType());
            }
            catch (NoSuchMethodException ex) {
                LogUtils.d(String.valueOf(s) + " not exist");
                return null;
            }
        }
    }
    
    public static String getCheck(final Field field) {
        final Check check = field.getAnnotation(Check.class);
        if (check != null) {
            return check.value();
        }
        return null;
    }
    
    public static String getColumnDefaultValue(final Field field) {
        final Column column = field.getAnnotation(Column.class);
        if (column != null && !TextUtils.isEmpty((CharSequence)column.defaultValue())) {
            return column.defaultValue();
        }
        return null;
    }
    
    public static Method getColumnGetMethod(final Class<?> clazz, final Field field) {
        String s = field.getName();
        Method method = null;
        if (field.getType() == Boolean.TYPE) {
            method = getBooleanColumnGetMethod(clazz, s);
        }
        while (true) {
            Method declaredMethod;
            if ((declaredMethod = method) != null) {
                break Label_0078;
            }
            s = "get" + s.substring(0, 1).toUpperCase() + s.substring(1);
            try {
                declaredMethod = clazz.getDeclaredMethod(s, (Class<?>[])new Class[0]);
                if ((method = declaredMethod) == null) {
                    method = declaredMethod;
                    if (!Object.class.equals(clazz.getSuperclass())) {
                        method = getColumnGetMethod(clazz.getSuperclass(), field);
                    }
                }
                return method;
            }
            catch (NoSuchMethodException ex) {
                LogUtils.d(String.valueOf(s) + " not exist");
                declaredMethod = method;
                continue;
            }
            break;
        }
    }
    
    public static String getColumnNameByField(final Field field) {
        final Column column = field.getAnnotation(Column.class);
        if (column != null && !TextUtils.isEmpty((CharSequence)column.column())) {
            return column.column();
        }
        final Id id = field.getAnnotation(Id.class);
        if (id != null && !TextUtils.isEmpty((CharSequence)id.column())) {
            return id.column();
        }
        final Foreign foreign = field.getAnnotation(Foreign.class);
        if (foreign != null && !TextUtils.isEmpty((CharSequence)foreign.column())) {
            return foreign.column();
        }
        if (field.getAnnotation(Finder.class) != null) {
            return field.getName();
        }
        return field.getName();
    }
    
    public static Method getColumnSetMethod(final Class<?> clazz, final Field field) {
        String s = field.getName();
        Method method = null;
        if (field.getType() == Boolean.TYPE) {
            method = getBooleanColumnSetMethod(clazz, field);
        }
        while (true) {
            Method declaredMethod;
            if ((declaredMethod = method) != null) {
                break Label_0084;
            }
            s = "set" + s.substring(0, 1).toUpperCase() + s.substring(1);
            try {
                declaredMethod = clazz.getDeclaredMethod(s, field.getType());
                if ((method = declaredMethod) == null) {
                    method = declaredMethod;
                    if (!Object.class.equals(clazz.getSuperclass())) {
                        method = getColumnSetMethod(clazz.getSuperclass(), field);
                    }
                }
                return method;
            }
            catch (NoSuchMethodException ex) {
                LogUtils.d(String.valueOf(s) + " not exist");
                declaredMethod = method;
                continue;
            }
            break;
        }
    }
    
    public static Class<?> getFinderTargetEntityType(final com.lidroid.xutils.db.table.Finder finder) {
        final Class<?> type = finder.getColumnField().getType();
        if (!type.equals(FinderLazyLoader.class)) {
            final Class<?> clazz = type;
            if (!type.equals(List.class)) {
                return clazz;
            }
        }
        return (Class<?>)((ParameterizedType)finder.getColumnField().getGenericType()).getActualTypeArguments()[0];
    }
    
    public static String getForeignColumnNameByField(final Field field) {
        final Foreign foreign = field.getAnnotation(Foreign.class);
        if (foreign != null) {
            return foreign.foreign();
        }
        return field.getName();
    }
    
    public static Class<?> getForeignEntityType(final com.lidroid.xutils.db.table.Foreign foreign) {
        final Class<?> type = foreign.getColumnField().getType();
        if (!type.equals(ForeignLazyLoader.class)) {
            final Class<?> clazz = type;
            if (!type.equals(List.class)) {
                return clazz;
            }
        }
        return (Class<?>)((ParameterizedType)foreign.getColumnField().getGenericType()).getActualTypeArguments()[0];
    }
    
    public static boolean isDbPrimitiveType(final Class<?> clazz) {
        return ColumnUtils.DB_PRIMITIVE_TYPES.contains(clazz.getCanonicalName());
    }
    
    public static boolean isFinder(final Field field) {
        return field.getAnnotation(Finder.class) != null;
    }
    
    public static boolean isForeign(final Field field) {
        return field.getAnnotation(Foreign.class) != null;
    }
    
    public static boolean isNotNull(final Field field) {
        return field.getAnnotation(NotNull.class) != null;
    }
    
    private static boolean isStartWithIs(final String s) {
        return s != null && s.startsWith("is");
    }
    
    public static boolean isTransient(final Field field) {
        return field.getAnnotation(Transient.class) != null;
    }
    
    public static boolean isUnique(final Field field) {
        return field.getAnnotation(Unique.class) != null;
    }
}
