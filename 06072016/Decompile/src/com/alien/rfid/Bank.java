package com.alien.rfid;

public enum Bank
{
    EPC("EPC", 1, 1), 
    RESERVED("RESERVED", 0, 0), 
    TID("TID", 2, 2), 
    USER("USER", 3, 3);
    
    private int a;
    
    private Bank(final String s, final int n, final int a) {
        this.a = a;
    }
    
    public static Bank fromValue(final int n) throws InvalidParamException {
        switch (n) {
            default: {
                throw new InvalidParamException("Invalid Memory Bank value");
            }
            case 0: {
                return Bank.RESERVED;
            }
            case 1: {
                return Bank.EPC;
            }
            case 2: {
                return Bank.TID;
            }
            case 3: {
                return Bank.USER;
            }
        }
    }
    
    public int getValue() {
        return this.a;
    }
}
