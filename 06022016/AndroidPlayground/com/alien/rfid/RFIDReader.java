package com.alien.rfid;

import java.util.HashMap;
import java.util.Map;

public abstract class RFIDReader
{
  private Mask a = Mask.NONE;
  private String b = "00000000";
  
  public abstract void close();
  
  public String getAccessPwd()
  {
    return this.b;
  }
  
  public abstract String getInfo(RFIDInfo paramRFIDInfo);
  
  public Map getInfo()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put(RFIDInfo.HARDWARE_VER, getInfo(RFIDInfo.HARDWARE_VER));
    localHashMap.put(RFIDInfo.FIRMWARE_VER, getInfo(RFIDInfo.FIRMWARE_VER));
    return localHashMap;
  }
  
  public Mask getMask()
  {
    return this.a;
  }
  
  public abstract int getPower()
    throws ReaderException;
  
  public abstract int getQ()
    throws ReaderException;
  
  public abstract Session getSession()
    throws ReaderException;
  
  public abstract Target getTarget()
    throws ReaderException;
  
  public void inventory(RFIDCallback paramRFIDCallback)
    throws ReaderException
  {
    inventory(paramRFIDCallback, this.a);
  }
  
  public abstract void inventory(RFIDCallback paramRFIDCallback, Mask paramMask)
    throws ReaderException;
  
  public abstract boolean isRunning();
  
  public RFIDResult kill(String paramString)
    throws ReaderException
  {
    return kill(paramString, this.a);
  }
  
  public abstract RFIDResult kill(String paramString, Mask paramMask)
    throws ReaderException;
  
  public RFIDResult lock(LockFields paramLockFields, LockType paramLockType)
    throws ReaderException
  {
    return lock(paramLockFields, paramLockType, this.a, this.b);
  }
  
  public RFIDResult lock(LockFields paramLockFields, LockType paramLockType, Mask paramMask)
    throws ReaderException
  {
    return lock(paramLockFields, paramLockType, paramMask, this.b);
  }
  
  public abstract RFIDResult lock(LockFields paramLockFields, LockType paramLockType, Mask paramMask, String paramString)
    throws ReaderException;
  
  public RFIDResult lock(LockFields paramLockFields, LockType paramLockType, String paramString)
    throws ReaderException
  {
    return lock(paramLockFields, paramLockType, this.a, paramString);
  }
  
  public RFIDResult read()
    throws ReaderException
  {
    return read(this.a);
  }
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2)
    throws ReaderException
  {
    return read(paramBank, paramInt1, paramInt2, this.a, this.b);
  }
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2, Mask paramMask)
    throws ReaderException
  {
    return read(paramBank, paramInt1, paramInt2, paramMask, this.b);
  }
  
  public abstract RFIDResult read(Bank paramBank, int paramInt1, int paramInt2, Mask paramMask, String paramString)
    throws ReaderException;
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2, String paramString)
    throws ReaderException
  {
    return read(paramBank, paramInt1, paramInt2, this.a, paramString);
  }
  
  public abstract RFIDResult read(Mask paramMask)
    throws ReaderException;
  
  public void setAccessPwd(String paramString)
  {
    this.b = paramString;
  }
  
  public void setMask(Mask paramMask)
  {
    this.a = paramMask;
  }
  
  public abstract void setPower(int paramInt)
    throws ReaderException;
  
  public abstract void setQ(int paramInt)
    throws ReaderException;
  
  public abstract void setSession(Session paramSession)
    throws ReaderException;
  
  public abstract void setTarget(Target paramTarget)
    throws ReaderException;
  
  public abstract void stop()
    throws ReaderException;
  
  public RFIDResult write(Bank paramBank, int paramInt, String paramString)
    throws ReaderException
  {
    return write(paramBank, paramInt, paramString, this.a, this.b);
  }
  
  public RFIDResult write(Bank paramBank, int paramInt, String paramString, Mask paramMask)
    throws ReaderException
  {
    return write(paramBank, paramInt, paramString, paramMask, this.b);
  }
  
  public abstract RFIDResult write(Bank paramBank, int paramInt, String paramString1, Mask paramMask, String paramString2)
    throws ReaderException;
  
  public RFIDResult write(Bank paramBank, int paramInt, String paramString1, String paramString2)
    throws ReaderException
  {
    return write(paramBank, paramInt, paramString1, this.a, paramString2);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\RFIDReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */