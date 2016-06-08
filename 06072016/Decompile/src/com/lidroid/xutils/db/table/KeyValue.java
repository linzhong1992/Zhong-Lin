package com.lidroid.xutils.db.table;

public class KeyValue
{
    private String key;
    private Object value;
    
    public KeyValue(final String key, final Object value) {
        this.key = key;
        this.value = value;
    }
    
    public String getKey() {
        return this.key;
    }
    
    public Object getValue() {
        return this.value;
    }
}
