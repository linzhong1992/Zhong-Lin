package com.alien.rfid;

public class RFIDResult
{
  private boolean a;
  private Object b;
  
  RFIDResult(boolean paramBoolean)
  {
    this(paramBoolean, null);
  }
  
  RFIDResult(boolean paramBoolean, Object paramObject)
  {
    this.a = paramBoolean;
    this.b = paramObject;
  }
  
  public Object getData()
  {
    return this.b;
  }
  
  public int getError()
  {
    if (this.a) {
      return 0;
    }
    return 1;
  }
  
  public boolean isSuccess()
  {
    return this.a;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\RFIDResult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */