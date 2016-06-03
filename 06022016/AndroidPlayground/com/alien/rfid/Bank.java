package com.alien.rfid;

public enum Bank
{
  private int a;
  
  private Bank(int paramInt1)
  {
    this.a = paramInt1;
  }
  
  public static Bank fromValue(int paramInt)
    throws InvalidParamException
  {
    switch (paramInt)
    {
    default: 
      throw new InvalidParamException("Invalid Memory Bank value");
    case 0: 
      return RESERVED;
    case 1: 
      return EPC;
    case 2: 
      return TID;
    }
    return USER;
  }
  
  public int getValue()
  {
    return this.a;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\Bank.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */