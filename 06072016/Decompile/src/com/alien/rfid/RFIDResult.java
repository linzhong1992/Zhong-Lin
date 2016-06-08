package com.alien.rfid;

public class RFIDResult
{
    private boolean a;
    private Object b;
    
    RFIDResult(final boolean b) {
        this(b, null);
    }
    
    RFIDResult(final boolean a, final Object b) {
        this.a = a;
        this.b = b;
    }
    
    public Object getData() {
        return this.b;
    }
    
    public int getError() {
        if (this.a) {
            return 0;
        }
        return 1;
    }
    
    public boolean isSuccess() {
        return this.a;
    }
}
