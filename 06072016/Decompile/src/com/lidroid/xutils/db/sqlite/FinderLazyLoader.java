package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.db.table.*;
import java.util.*;
import com.lidroid.xutils.exception.*;

public class FinderLazyLoader<T>
{
    private final Finder finderColumn;
    private final Object finderValue;
    
    public FinderLazyLoader(final Finder finderColumn, final Object o) {
        this.finderColumn = finderColumn;
        this.finderValue = ColumnUtils.convert2DbColumnValueIfNeeded(o);
    }
    
    public FinderLazyLoader(final Class<?> clazz, final String s, final Object o) {
        this.finderColumn = (Finder)TableUtils.getColumnOrId(clazz, s);
        this.finderValue = ColumnUtils.convert2DbColumnValueIfNeeded(o);
    }
    
    public List<T> getAllFromDb() throws DbException {
        List<T> all = null;
        if (this.finderColumn != null) {
            all = all;
            if (this.finderColumn.db != null) {
                all = this.finderColumn.db.findAll(Selector.from(this.finderColumn.getTargetEntityType()).where(this.finderColumn.getTargetColumnName(), "=", this.finderValue));
            }
        }
        return all;
    }
    
    public T getFirstFromDb() throws DbException {
        T first = null;
        if (this.finderColumn != null) {
            first = first;
            if (this.finderColumn.db != null) {
                first = this.finderColumn.db.findFirst(Selector.from(this.finderColumn.getTargetEntityType()).where(this.finderColumn.getTargetColumnName(), "=", this.finderValue));
            }
        }
        return first;
    }
}
