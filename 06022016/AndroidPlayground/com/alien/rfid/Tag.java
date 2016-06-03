package com.alien.rfid;

import com.rscja.utility.a;

public class Tag
{
  private RFIDReader a;
  private String b;
  private double c;
  
  Tag(RFIDReader paramRFIDReader, String paramString, double paramDouble)
  {
    this.a = paramRFIDReader;
    this.b = paramString;
    this.c = paramDouble;
  }
  
  private void a()
    throws ReaderException
  {
    if ((getEPC() == null) || (getEPC().isEmpty())) {
      throw new ReaderException("epc is empty!!");
    }
  }
  
  private Mask b()
  {
    try
    {
      Object localObject = getEPC();
      localObject = new Mask(Bank.EPC, 32, ((String)localObject).length() * 4, (String)localObject);
      return (Mask)localObject;
    }
    catch (ReaderException localReaderException) {}
    return null;
  }
  
  public String getEPC()
  {
    if (this.b == null) {
      return "";
    }
    return this.b.substring(4);
  }
  
  public String getPC()
  {
    if (this.b == null) {
      return "";
    }
    return this.b.substring(0, 4);
  }
  
  public double getRSSI()
  {
    return this.c;
  }
  
  public RFIDResult kill(String paramString)
    throws ReaderException
  {
    a();
    return this.a.kill(paramString, b());
  }
  
  public RFIDResult lock(LockFields paramLockFields, LockType paramLockType)
    throws ReaderException
  {
    a();
    return this.a.lock(paramLockFields, paramLockType, b());
  }
  
  public RFIDResult lock(LockFields paramLockFields, LockType paramLockType, String paramString)
    throws ReaderException
  {
    a();
    return this.a.lock(paramLockFields, paramLockType, b(), paramString);
  }
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2)
    throws ReaderException
  {
    a();
    return this.a.read(paramBank, paramInt1, paramInt2, b());
  }
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2, String paramString)
    throws ReaderException
  {
    a();
    return this.a.read(paramBank, paramInt1, paramInt2, b(), paramString);
  }
  
  public RFIDResult readAccessPwd()
    throws ReaderException
  {
    a();
    return this.a.read(Bank.RESERVED, 2, 2, b());
  }
  
  public RFIDResult readKillPwd()
    throws ReaderException
  {
    a();
    return this.a.read(Bank.RESERVED, 0, 2, b());
  }
  
  public RFIDResult readTID()
    throws ReaderException
  {
    a();
    Object localObject = this.a.read(Bank.TID, 0, 2, b());
    if (!((RFIDResult)localObject).isSuccess()) {
      return (RFIDResult)localObject;
    }
    localObject = (String)((RFIDResult)localObject).getData();
    if (((String)localObject).startsWith("E2003411")) {
      return this.a.read(Bank.TID, 0, 5, b());
    }
    if ((((String)localObject).startsWith("E2003412")) || (((String)localObject).startsWith("E2003414"))) {
      return this.a.read(Bank.TID, 0, 12, b());
    }
    if (((String)localObject).startsWith("E2003811")) {
      return this.a.read(Bank.TID, 0, 21, b());
    }
    int i = 2;
    for (;;)
    {
      RFIDResult localRFIDResult = this.a.read(Bank.TID, i, 2, b());
      if (!localRFIDResult.isSuccess()) {
        return new RFIDResult(true, localObject);
      }
      localObject = (String)localObject + (String)localRFIDResult.getData();
      i += 2;
    }
  }
  
  public RFIDResult readUser()
    throws ReaderException
  {
    boolean bool = false;
    a();
    String str = "";
    int i = 0;
    for (;;)
    {
      RFIDResult localRFIDResult = this.a.read(Bank.USER, i, 2, b());
      if (!localRFIDResult.isSuccess())
      {
        if (str.length() > 0) {
          bool = true;
        }
        if (bool) {}
        for (;;)
        {
          return new RFIDResult(bool, str);
          str = null;
        }
      }
      str = str + (String)localRFIDResult.getData();
      i += 2;
    }
  }
  
  public RFIDResult write(Bank paramBank, int paramInt, String paramString)
    throws ReaderException
  {
    a();
    return this.a.write(paramBank, paramInt, paramString, b());
  }
  
  public RFIDResult write(Bank paramBank, int paramInt, String paramString1, String paramString2)
    throws ReaderException
  {
    a();
    return this.a.write(paramBank, paramInt, paramString1, b(), paramString2);
  }
  
  public RFIDResult writeAccessPwd(String paramString)
    throws ReaderException
  {
    a();
    return this.a.write(Bank.RESERVED, 2, paramString, b());
  }
  
  public RFIDResult writeEPC(String paramString)
    throws ReaderException
  {
    a();
    if (paramString.length() % 4 != 0) {
      throw new InvalidParamException("EPC parameter value must be in WORD units.");
    }
    Object localObject = getPC();
    String str = a.a((byte)((Integer.parseInt(((String)localObject).substring(0, 2), 16) & 0x1 | paramString.length() / 4 << 3) & 0xFF));
    paramString = str + ((String)localObject).substring(2) + paramString;
    localObject = this.a.write(Bank.EPC, 1, paramString, b());
    if (((RFIDResult)localObject).isSuccess()) {
      this.b = paramString;
    }
    return (RFIDResult)localObject;
  }
  
  public RFIDResult writeKillPwd(String paramString)
    throws ReaderException
  {
    a();
    return this.a.write(Bank.RESERVED, 0, paramString, b());
  }
  
  public RFIDResult writeUser(String paramString)
    throws ReaderException
  {
    a();
    if (paramString.length() % 4 != 0) {
      throw new InvalidParamException("Invalid USER data. USER data must be word units");
    }
    int i;
    for (int j = 0; j < paramString.length(); j = i)
    {
      int k = j + 8;
      i = k;
      if (k > paramString.length()) {
        i = paramString.length();
      }
      Object localObject = paramString.substring(j, i);
      j /= 4;
      localObject = this.a.write(Bank.USER, j, (String)localObject, b());
      if (!((RFIDResult)localObject).isSuccess()) {
        return (RFIDResult)localObject;
      }
    }
    return new RFIDResult(true);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\Tag.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */