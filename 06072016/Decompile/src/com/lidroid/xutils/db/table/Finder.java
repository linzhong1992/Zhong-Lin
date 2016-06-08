package com.lidroid.xutils.db.table;

import com.lidroid.xutils.*;
import java.lang.reflect.*;
import android.database.*;
import com.lidroid.xutils.db.sqlite.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.exception.*;
import java.util.*;

public class Finder extends Column
{
    public DbUtils db;
    private final String targetColumnName;
    private final String valueColumnName;
    
    protected Finder(final Class<?> clazz, final Field field) {
        super(clazz, field);
        final com.lidroid.xutils.db.annotation.Finder finder = field.getAnnotation(com.lidroid.xutils.db.annotation.Finder.class);
        this.valueColumnName = finder.valueColumn();
        this.targetColumnName = finder.targetColumn();
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.TEXT;
    }
    
    @Override
    public Object getColumnValue(final Object o) {
        return null;
    }
    
    @Override
    public Object getDefaultValue() {
        return null;
    }
    
    public String getTargetColumnName() {
        return this.targetColumnName;
    }
    
    public Class<?> getTargetEntityType() {
        return ColumnUtils.getFinderTargetEntityType(this);
    }
    
    @Override
    public void setValue2Entity(final Object o, Cursor cursor, final int n) {
        cursor = null;
        final Class<?> type = this.columnField.getType();
        final Object columnValue = TableUtils.getColumnOrId(o.getClass(), this.valueColumnName).getColumnValue(o);
        Label_0166: {
            Label_0074: {
                if (!type.equals(FinderLazyLoader.class)) {
                    break Label_0074;
                }
                cursor = (Cursor)new FinderLazyLoader(this, columnValue);
            Block_5_Outer:
                while (true) {
                    if (this.setMethod == null) {
                        break Label_0166;
                    }
                    try {
                        this.setMethod.invoke(o, cursor);
                        return;
                        // iftrue(Label_0120:, !type.equals((Object)List.class))
                        while (true) {
                            try {
                                cursor = (Cursor)new FinderLazyLoader(this, columnValue).getAllFromDb();
                            }
                            catch (DbException ex) {
                                LogUtils.e(ex.getMessage(), ex);
                            }
                            continue Block_5_Outer;
                            continue;
                        }
                        try {
                            Label_0120: {
                                cursor = new FinderLazyLoader<Cursor>(this, columnValue).getFirstFromDb();
                            }
                        }
                        catch (DbException ex2) {
                            LogUtils.e(ex2.getMessage(), ex2);
                        }
                        continue Block_5_Outer;
                    }
                    catch (Throwable t) {
                        LogUtils.e(t.getMessage(), t);
                        return;
                    }
                    break;
                }
            }
            try {
                this.columnField.setAccessible(true);
                this.columnField.set(o, cursor);
            }
            catch (Throwable t2) {
                LogUtils.e(t2.getMessage(), t2);
            }
        }
    }
}
