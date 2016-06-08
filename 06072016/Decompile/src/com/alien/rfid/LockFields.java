package com.alien.rfid;

public class LockFields
{
    public static final int ACCESS_PWD = 1;
    public static final int EPC = 4;
    public static final int KILL_PWD = 2;
    public static final int USER = 8;
    private int a;
    
    public LockFields(final int a) {
        this.a = 0;
        this.a = a;
    }
    
    public int getFieldBitmap() {
        return this.a;
    }
}
