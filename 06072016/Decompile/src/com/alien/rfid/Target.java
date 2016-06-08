package com.alien.rfid;

public enum Target
{
    A("A", 0, 0), 
    B("B", 1, 1);
    
    private int a;
    
    private Target(final String s, final int n, final int a) {
        this.a = a;
    }
    
    public static Target fromValue(final int n) throws InvalidParamException {
        switch (n) {
            default: {
                throw new InvalidParamException("Invalid Target value");
            }
            case 0: {
                return Target.A;
            }
            case 1: {
                return Target.B;
            }
        }
    }
    
    public int getValue() {
        return this.a;
    }
}
