package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.db.table.*;
import java.util.*;
import com.lidroid.xutils.exception.*;

public class ForeignLazyLoader<T>
{
    private Object columnValue;
    private final Foreign foreignColumn;
    
    public ForeignLazyLoader(final Foreign foreignColumn, final Object o) {
        this.foreignColumn = foreignColumn;
        this.columnValue = ColumnUtils.convert2DbColumnValueIfNeeded(o);
    }
    
    public ForeignLazyLoader(final Class<?> clazz, final String s, final Object o) {
        this.foreignColumn = (Foreign)TableUtils.getColumnOrId(clazz, s);
        this.columnValue = ColumnUtils.convert2DbColumnValueIfNeeded(o);
    }
    
    public List<T> getAllFromDb() throws DbException {
        List<T> all = null;
        if (this.foreignColumn != null) {
            all = all;
            if (this.foreignColumn.db != null) {
                all = this.foreignColumn.db.findAll(Selector.from(this.foreignColumn.getForeignEntityType()).where(this.foreignColumn.getForeignColumnName(), "=", this.columnValue));
            }
        }
        return all;
    }
    
    public Object getColumnValue() {
        return this.columnValue;
    }
    
    public T getFirstFromDb() throws DbException {
        T first = null;
        if (this.foreignColumn != null) {
            first = first;
            if (this.foreignColumn.db != null) {
                first = this.foreignColumn.db.findFirst(Selector.from(this.foreignColumn.getForeignEntityType()).where(this.foreignColumn.getForeignColumnName(), "=", this.columnValue));
            }
        }
        return first;
    }
    
    public void setColumnValue(final Object o) {
        this.columnValue = ColumnUtils.convert2DbColumnValueIfNeeded(o);
    }
}
