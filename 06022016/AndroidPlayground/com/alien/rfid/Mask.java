package com.alien.rfid;

public class Mask
{
  public static final Mask NONE = a(Bank.EPC, 0, 0, "");
  private Bank a;
  private int b;
  private int c;
  private String d;
  
  private Mask() {}
  
  public Mask(Bank paramBank, int paramInt1, int paramInt2, String paramString)
    throws InvalidParamException
  {
    if (paramInt1 < 0) {
      throw new InvalidParamException("bitPointer cannot be negative");
    }
    if (paramInt2 < 0) {
      throw new InvalidParamException("bitLength cannot be negative");
    }
    int i = paramInt2;
    if (paramInt2 > 255) {
      i = 255;
    }
    String str = paramString;
    if (paramString.length() > 64) {
      str = paramString.substring(0, 64);
    }
    this.a = paramBank;
    this.b = paramInt1;
    this.c = i;
    this.d = str;
  }
  
  private static Mask a(Bank paramBank, int paramInt1, int paramInt2, String paramString)
  {
    Mask localMask = new Mask();
    localMask.a = paramBank;
    localMask.b = paramInt1;
    localMask.c = paramInt2;
    localMask.d = paramString;
    return localMask;
  }
  
  public static Mask maskEPC(String paramString)
    throws InvalidParamException
  {
    return new Mask(Bank.EPC, 32, paramString.length() * 4, paramString);
  }
  
  public static Mask maskTID(String paramString)
    throws InvalidParamException
  {
    return new Mask(Bank.TID, 0, paramString.length() * 4, paramString);
  }
  
  public static Mask maskUser(String paramString)
    throws InvalidParamException
  {
    return new Mask(Bank.USER, 0, paramString.length() * 4, paramString);
  }
  
  public Bank getBank()
  {
    return this.a;
  }
  
  public int getBitLength()
  {
    return this.c;
  }
  
  public int getBitPointer()
  {
    return this.b;
  }
  
  public String getData()
  {
    return this.d;
  }
  
  public void setBank(Bank paramBank)
  {
    this.a = paramBank;
  }
  
  public void setBitLength(int paramInt)
    throws InvalidParamException
  {
    if ((paramInt < 0) || (paramInt > 255)) {
      throw new InvalidParamException("bitLength must be 0..255");
    }
    this.c = paramInt;
  }
  
  public void setBitPointer(int paramInt)
    throws InvalidParamException
  {
    if (paramInt < 0) {
      throw new InvalidParamException("bitPointer cannot be negative");
    }
    this.b = paramInt;
  }
  
  public void setData(String paramString)
  {
    this.d = paramString;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\Mask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */