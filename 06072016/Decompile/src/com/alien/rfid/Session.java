package com.alien.rfid;

public enum Session
{
    S0("S0", 0, 0), 
    S1("S1", 1, 1), 
    S2("S2", 2, 2), 
    S3("S3", 3, 3);
    
    private int a;
    
    private Session(final String s, final int n, final int a) {
        this.a = a;
    }
    
    public static Session fromValue(final int n) throws InvalidParamException {
        switch (n) {
            default: {
                throw new InvalidParamException("Invalid Session value");
            }
            case 0: {
                return Session.S0;
            }
            case 1: {
                return Session.S1;
            }
            case 2: {
                return Session.S2;
            }
            case 3: {
                return Session.S3;
            }
        }
    }
    
    public int getValue() {
        return this.a;
    }
}
