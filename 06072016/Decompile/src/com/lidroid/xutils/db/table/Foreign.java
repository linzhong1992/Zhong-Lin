package com.lidroid.xutils.db.table;

import com.lidroid.xutils.*;
import java.lang.reflect.*;
import com.lidroid.xutils.db.converter.*;
import com.lidroid.xutils.db.sqlite.*;
import java.util.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.exception.*;
import android.database.*;

public class Foreign extends Column
{
    public DbUtils db;
    private final ColumnConverter foreignColumnConverter;
    private final String foreignColumnName;
    
    protected Foreign(final Class<?> clazz, final Field field) {
        super(clazz, field);
        this.foreignColumnName = ColumnUtils.getForeignColumnNameByField(field);
        this.foreignColumnConverter = ColumnConverterFactory.getColumnConverter(TableUtils.getColumnOrId(this.getForeignEntityType(), this.foreignColumnName).columnField.getType());
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return this.foreignColumnConverter.getColumnDbType();
    }
    
    @Override
    public Object getColumnValue(Object o) {
        final Object fieldValue = this.getFieldValue(o);
        final Object o2 = null;
        final Object o3 = null;
        Object columnValue = null;
        if (fieldValue != null) {
            final Class<?> type = this.columnField.getType();
            if (type.equals(ForeignLazyLoader.class)) {
                columnValue = ((ForeignLazyLoader)fieldValue).getColumnValue();
            }
            else {
                if (type.equals(List.class)) {
                    o = o2;
                    try {
                        final List<Object> list = (List<Object>)fieldValue;
                        columnValue = columnValue;
                        o = o2;
                        if (list.size() > 0) {
                            o = o2;
                            final Column columnOrId = TableUtils.getColumnOrId(ColumnUtils.getForeignEntityType(this), this.foreignColumnName);
                            o = o2;
                            final Object o4 = o = columnOrId.getColumnValue(list.get(0));
                            if (this.db != null && o4 == null) {
                                o = o4;
                                if (columnOrId instanceof Id) {
                                    o = o4;
                                    this.db.saveOrUpdateAll(list);
                                }
                            }
                            o = o4;
                            return columnOrId.getColumnValue(list.get(0));
                        }
                        return columnValue;
                    }
                    catch (Throwable t) {
                        LogUtils.e(t.getMessage(), t);
                        return o;
                    }
                }
                o = o3;
                try {
                    final Column columnOrId2 = TableUtils.getColumnOrId(type, this.foreignColumnName);
                    o = o3;
                    final Object o5 = o = columnOrId2.getColumnValue(fieldValue);
                    Label_0243: {
                        if (this.db == null || o5 != null) {
                            break Label_0243;
                        }
                        o = o5;
                        if (!(columnOrId2 instanceof Id)) {
                            break Label_0243;
                        }
                        o = o5;
                        try {
                            this.db.saveOrUpdate(fieldValue);
                            o = o5;
                            return columnOrId2.getColumnValue(fieldValue);
                        }
                        catch (DbException ex) {
                            o = o5;
                            LogUtils.e(ex.getMessage(), ex);
                        }
                    }
                }
                catch (Throwable t2) {
                    LogUtils.e(t2.getMessage(), t2);
                    return o;
                }
            }
        }
        return columnValue;
    }
    
    @Override
    public Object getDefaultValue() {
        return null;
    }
    
    public String getForeignColumnName() {
        return this.foreignColumnName;
    }
    
    public Class<?> getForeignEntityType() {
        return ColumnUtils.getForeignEntityType(this);
    }
    
    @Override
    public void setValue2Entity(final Object o, Cursor cursor, final int n) {
        final Object fieldValue = this.foreignColumnConverter.getFieldValue(cursor, n);
        if (fieldValue == null) {
            return;
        }
        cursor = null;
        final Class<?> type = this.columnField.getType();
        while (true) {
            Label_0086: {
                if (!type.equals(ForeignLazyLoader.class)) {
                    break Label_0086;
                }
                cursor = (Cursor)new ForeignLazyLoader(this, fieldValue);
                if (this.setMethod != null) {
                    try {
                        this.setMethod.invoke(o, cursor);
                        return;
                    }
                    catch (Throwable t) {
                        LogUtils.e(t.getMessage(), t);
                        return;
                    }
                }
                else {
                    try {
                        this.columnField.setAccessible(true);
                        this.columnField.set(o, cursor);
                        return;
                    }
                    catch (Throwable t2) {
                        LogUtils.e(t2.getMessage(), t2);
                        return;
                    }
                }
            }
            if (type.equals(List.class)) {
                try {
                    cursor = (Cursor)new ForeignLazyLoader(this, fieldValue).getAllFromDb();
                }
                catch (DbException ex) {
                    LogUtils.e(ex.getMessage(), ex);
                }
                continue;
            }
            try {
                cursor = new ForeignLazyLoader<Cursor>(this, fieldValue).getFirstFromDb();
            }
            catch (DbException ex2) {
                LogUtils.e(ex2.getMessage(), ex2);
            }
            continue;
        }
    }
}
