package com.alien.rfid;

public enum Session
{
  private int a;
  
  private Session(int paramInt1)
  {
    this.a = paramInt1;
  }
  
  public static Session fromValue(int paramInt)
    throws InvalidParamException
  {
    switch (paramInt)
    {
    default: 
      throw new InvalidParamException("Invalid Session value");
    case 0: 
      return S0;
    case 1: 
      return S1;
    case 2: 
      return S2;
    }
    return S3;
  }
  
  public int getValue()
  {
    return this.a;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\Session.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */