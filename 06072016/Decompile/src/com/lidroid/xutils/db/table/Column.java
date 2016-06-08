package com.lidroid.xutils.db.table;

import java.lang.reflect.*;
import com.lidroid.xutils.db.converter.*;
import com.lidroid.xutils.db.sqlite.*;
import com.lidroid.xutils.util.*;
import android.database.*;

public class Column
{
    protected final ColumnConverter columnConverter;
    protected final Field columnField;
    protected final String columnName;
    private final Object defaultValue;
    protected final Method getMethod;
    protected final Method setMethod;
    
    protected Column(final Class<?> clazz, final Field columnField) {
        this.columnField = columnField;
        this.columnConverter = ColumnConverterFactory.getColumnConverter(columnField.getType());
        this.columnName = ColumnUtils.getColumnNameByField(columnField);
        if (this.columnConverter != null) {
            this.defaultValue = this.columnConverter.getFieldValue(ColumnUtils.getColumnDefaultValue(columnField));
        }
        else {
            this.defaultValue = null;
        }
        this.getMethod = ColumnUtils.getColumnGetMethod(clazz, columnField);
        this.setMethod = ColumnUtils.getColumnSetMethod(clazz, columnField);
    }
    
    public ColumnDbType getColumnDbType() {
        return this.columnConverter.getColumnDbType();
    }
    
    public Field getColumnField() {
        return this.columnField;
    }
    
    public String getColumnName() {
        return this.columnName;
    }
    
    public Object getColumnValue(Object fieldValue) {
        fieldValue = this.getFieldValue(fieldValue);
        return this.columnConverter.fieldValue2ColumnValue(fieldValue);
    }
    
    public Object getDefaultValue() {
        return this.defaultValue;
    }
    
    public Object getFieldValue(Object value) {
        Object invoke = null;
        if (value == null) {
            return invoke;
        }
        Label_0039: {
            if (this.getMethod == null) {
                break Label_0039;
            }
            try {
                invoke = this.getMethod.invoke(value, new Object[0]);
                return invoke;
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
                return null;
            }
            try {
                this.columnField.setAccessible(true);
                value = this.columnField.get(value);
                return value;
            }
            catch (Throwable t2) {
                LogUtils.e(t2.getMessage(), t2);
                return null;
            }
        }
    }
    
    public void setValue2Entity(final Object o, final Cursor cursor, final int n) {
        final Object fieldValue = this.columnConverter.getFieldValue(cursor, n);
        if (fieldValue == null && this.defaultValue == null) {
            return;
        }
        if (this.setMethod != null) {
            try {
                final Method setMethod = this.setMethod;
                Object defaultValue = fieldValue;
                if (fieldValue == null) {
                    defaultValue = this.defaultValue;
                }
                setMethod.invoke(o, defaultValue);
                return;
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
                return;
            }
        }
        try {
            this.columnField.setAccessible(true);
            final Field columnField = this.columnField;
            Object defaultValue2;
            if ((defaultValue2 = fieldValue) == null) {
                defaultValue2 = this.defaultValue;
            }
            columnField.set(o, defaultValue2);
        }
        catch (Throwable t2) {
            LogUtils.e(t2.getMessage(), t2);
        }
    }
}
