package com.lidroid.xutils.db.table;

import java.util.*;

public class DbModel
{
    private HashMap<String, String> dataMap;
    
    public DbModel() {
        this.dataMap = new HashMap<String, String>();
    }
    
    public void add(final String s, final String s2) {
        this.dataMap.put(s, s2);
    }
    
    public boolean getBoolean(String string) {
        string = this.getString(string);
        if (string == null) {
            return false;
        }
        if (string.length() == 1) {
            return "1".equals(string);
        }
        return Boolean.valueOf(string);
    }
    
    public HashMap<String, String> getDataMap() {
        return this.dataMap;
    }
    
    public Date getDate(final String s) {
        return new Date(Long.valueOf(this.getString(s)));
    }
    
    public double getDouble(final String s) {
        return Double.valueOf(this.getString(s));
    }
    
    public float getFloat(final String s) {
        return Float.valueOf(this.getString(s));
    }
    
    public int getInt(final String s) {
        return Integer.valueOf(this.getString(s));
    }
    
    public long getLong(final String s) {
        return Long.valueOf(this.getString(s));
    }
    
    public java.sql.Date getSqlDate(final String s) {
        return new java.sql.Date(Long.valueOf(this.getString(s)));
    }
    
    public String getString(final String s) {
        return this.dataMap.get(s);
    }
}
