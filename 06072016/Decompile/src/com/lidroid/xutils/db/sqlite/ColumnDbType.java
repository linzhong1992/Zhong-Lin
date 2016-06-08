package com.lidroid.xutils.db.sqlite;

public enum ColumnDbType
{
    BLOB("BLOB", 3, "BLOB"), 
    INTEGER("INTEGER", 0, "INTEGER"), 
    REAL("REAL", 1, "REAL"), 
    TEXT("TEXT", 2, "TEXT");
    
    private String value;
    
    private ColumnDbType(final String s, final int n, final String value) {
        this.value = value;
    }
    
    @Override
    public String toString() {
        return this.value;
    }
}
