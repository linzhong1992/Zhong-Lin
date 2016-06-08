package com.lidroid.xutils.db.sqlite;

import java.util.*;
import com.lidroid.xutils.db.table.*;

public class SqlInfo
{
    private LinkedList<Object> bindArgs;
    private String sql;
    
    public SqlInfo() {
    }
    
    public SqlInfo(final String sql) {
        this.sql = sql;
    }
    
    public SqlInfo(final String sql, final Object... array) {
        this.sql = sql;
        this.addBindArgs(array);
    }
    
    public void addBindArg(final Object o) {
        if (this.bindArgs == null) {
            this.bindArgs = new LinkedList<Object>();
        }
        this.bindArgs.add(ColumnUtils.convert2DbColumnValueIfNeeded(o));
    }
    
    void addBindArgWithoutConverter(final Object o) {
        if (this.bindArgs == null) {
            this.bindArgs = new LinkedList<Object>();
        }
        this.bindArgs.add(o);
    }
    
    public void addBindArgs(final Object... array) {
        if (array != null) {
            for (int length = array.length, i = 0; i < length; ++i) {
                this.addBindArg(array[i]);
            }
        }
    }
    
    public LinkedList<Object> getBindArgs() {
        return this.bindArgs;
    }
    
    public Object[] getBindArgsAsArray() {
        if (this.bindArgs != null) {
            return this.bindArgs.toArray();
        }
        return null;
    }
    
    public String[] getBindArgsAsStrArray() {
        if (this.bindArgs != null) {
            final String[] array = new String[this.bindArgs.size()];
            for (int i = 0; i < this.bindArgs.size(); ++i) {
                final Object value = this.bindArgs.get(i);
                String string;
                if (value == null) {
                    string = null;
                }
                else {
                    string = value.toString();
                }
                array[i] = string;
            }
            return array;
        }
        return null;
    }
    
    public String getSql() {
        return this.sql;
    }
    
    public void setSql(final String sql) {
        this.sql = sql;
    }
}
