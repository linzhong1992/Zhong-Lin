package com.alien.rfid;

public class LockFields
{
  public static final int ACCESS_PWD = 1;
  public static final int EPC = 4;
  public static final int KILL_PWD = 2;
  public static final int USER = 8;
  private int a = 0;
  
  public LockFields(int paramInt)
  {
    this.a = paramInt;
  }
  
  public int getFieldBitmap()
  {
    return this.a;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\LockFields.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */