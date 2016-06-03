package com.alien.rfid;

public enum Target
{
  private int a;
  
  private Target(int paramInt1)
  {
    this.a = paramInt1;
  }
  
  public static Target fromValue(int paramInt)
    throws InvalidParamException
  {
    switch (paramInt)
    {
    default: 
      throw new InvalidParamException("Invalid Target value");
    case 0: 
      return A;
    }
    return B;
  }
  
  public int getValue()
  {
    return this.a;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\Target.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */