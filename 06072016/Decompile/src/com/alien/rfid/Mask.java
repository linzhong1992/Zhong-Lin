package com.alien.rfid;

public class Mask
{
    public static final Mask NONE;
    private Bank a;
    private int b;
    private int c;
    private String d;
    
    static {
        NONE = a(Bank.EPC, 0, 0, "");
    }
    
    private Mask() {
    }
    
    public Mask(final Bank a, final int b, final int n, final String s) throws InvalidParamException {
        if (b < 0) {
            throw new InvalidParamException("bitPointer cannot be negative");
        }
        if (n < 0) {
            throw new InvalidParamException("bitLength cannot be negative");
        }
        int c;
        if ((c = n) > 255) {
            c = 255;
        }
        String substring = s;
        if (s.length() > 64) {
            substring = s.substring(0, 64);
        }
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = substring;
    }
    
    private static Mask a(final Bank a, final int b, final int c, final String d) {
        final Mask mask = new Mask();
        mask.a = a;
        mask.b = b;
        mask.c = c;
        mask.d = d;
        return mask;
    }
    
    public static Mask maskEPC(final String s) throws InvalidParamException {
        return new Mask(Bank.EPC, 32, s.length() * 4, s);
    }
    
    public static Mask maskTID(final String s) throws InvalidParamException {
        return new Mask(Bank.TID, 0, s.length() * 4, s);
    }
    
    public static Mask maskUser(final String s) throws InvalidParamException {
        return new Mask(Bank.USER, 0, s.length() * 4, s);
    }
    
    public Bank getBank() {
        return this.a;
    }
    
    public int getBitLength() {
        return this.c;
    }
    
    public int getBitPointer() {
        return this.b;
    }
    
    public String getData() {
        return this.d;
    }
    
    public void setBank(final Bank a) {
        this.a = a;
    }
    
    public void setBitLength(final int c) throws InvalidParamException {
        if (c < 0 || c > 255) {
            throw new InvalidParamException("bitLength must be 0..255");
        }
        this.c = c;
    }
    
    public void setBitPointer(final int b) throws InvalidParamException {
        if (b < 0) {
            throw new InvalidParamException("bitPointer cannot be negative");
        }
        this.b = b;
    }
    
    public void setData(final String d) {
        this.d = d;
    }
}
