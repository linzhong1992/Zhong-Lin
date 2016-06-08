package com.alien.rfid;

public enum LockType
{
    LOCK("LOCK", 0, 0), 
    PERMALOCK("PERMALOCK", 2, 2), 
    PERMAUNLOCK("PERMAUNLOCK", 3, 3), 
    UNLOCK("UNLOCK", 1, 1);
    
    private int a;
    
    private LockType(final String s, final int n, final int a) {
        this.a = a;
    }
}
