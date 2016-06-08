package com.lidroid.xutils.db.table;

import java.util.*;
import java.lang.reflect.*;
import com.lidroid.xutils.db.annotation.*;
import com.lidroid.xutils.util.*;

public class Id extends Column
{
    private static final HashSet<String> AUTO_INCREMENT_TYPES;
    private static final HashSet<String> INTEGER_TYPES;
    private String columnFieldClassName;
    private boolean isAutoIncrement;
    private boolean isAutoIncrementChecked;
    
    static {
        INTEGER_TYPES = new HashSet<String>(2);
        AUTO_INCREMENT_TYPES = new HashSet<String>(4);
        Id.INTEGER_TYPES.add(Integer.TYPE.getCanonicalName());
        Id.INTEGER_TYPES.add(Integer.class.getCanonicalName());
        Id.AUTO_INCREMENT_TYPES.addAll((Collection<?>)Id.INTEGER_TYPES);
        Id.AUTO_INCREMENT_TYPES.add(Long.TYPE.getCanonicalName());
        Id.AUTO_INCREMENT_TYPES.add(Long.class.getCanonicalName());
    }
    
    protected Id(final Class<?> clazz, final Field field) {
        super(clazz, field);
        this.isAutoIncrementChecked = false;
        this.isAutoIncrement = false;
        this.columnFieldClassName = this.columnField.getType().getCanonicalName();
    }
    
    @Override
    public Object getColumnValue(Object o) {
        final Object columnValue = super.getColumnValue(o);
        if (columnValue != null) {
            o = columnValue;
            if (this.isAutoIncrement()) {
                if (!columnValue.equals(0)) {
                    o = columnValue;
                    if (!columnValue.equals(0L)) {
                        return o;
                    }
                }
                o = null;
            }
            return o;
        }
        return null;
    }
    
    public boolean isAutoIncrement() {
        boolean isAutoIncrement = true;
        if (!this.isAutoIncrementChecked) {
            this.isAutoIncrementChecked = true;
            if (this.columnField.getAnnotation(NoAutoIncrement.class) != null || !Id.AUTO_INCREMENT_TYPES.contains(this.columnFieldClassName)) {
                isAutoIncrement = false;
            }
            this.isAutoIncrement = isAutoIncrement;
        }
        return this.isAutoIncrement;
    }
    
    public void setAutoIncrementId(final Object o, final long n) {
        Number n2 = n;
        if (Id.INTEGER_TYPES.contains(this.columnFieldClassName)) {
            n2 = (int)n;
        }
        if (this.setMethod != null) {
            try {
                this.setMethod.invoke(o, n2);
                return;
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
                return;
            }
        }
        try {
            this.columnField.setAccessible(true);
            this.columnField.set(o, n2);
        }
        catch (Throwable t2) {
            LogUtils.e(t2.getMessage(), t2);
        }
    }
}
