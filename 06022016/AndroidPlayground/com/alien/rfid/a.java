package com.alien.rfid;

import android.net.LocalServerSocket;
import com.rscja.deviceapi.a.a;
import com.rscja.deviceapi.a.b;
import java.util.concurrent.CountDownLatch;

class a
  extends RFIDReader
{
  private static a h = null;
  private int a = 10;
  private int b = 0;
  private com.rscja.deviceapi.a c;
  private ALRH450CusAPI d;
  private boolean e;
  private boolean f;
  private CountDownLatch g;
  private LocalServerSocket i;
  
  private a()
    throws ReaderException
  {
    d();
  }
  
  public static RFIDReader a()
    throws ReaderException
  {
    try
    {
      if (h == null) {
        h = new a();
      }
      h.d();
      a locala = h;
      return locala;
    }
    finally {}
  }
  
  private RFIDResult a(LockFields paramLockFields, Mask paramMask, String paramString, a.b paramb)
    throws ReaderException
  {
    try
    {
      e();
      if (paramMask.getData().length() * 4 <= paramMask.getBitLength()) {
        throw new InvalidParamException("Mask data is shorter than the bit length");
      }
    }
    finally {}
    paramLockFields = a(paramLockFields, paramb);
    if (this.d.lockUnlockFields(paramString, paramMask.getBank().getValue(), paramMask.getBitPointer(), paramMask.getData(), paramMask.getBitLength(), paramLockFields) == 0) {}
    for (boolean bool = true;; bool = false)
    {
      paramLockFields = new RFIDResult(bool);
      return paramLockFields;
    }
  }
  
  private a.a a(Bank paramBank)
    throws InvalidParamException
  {
    try
    {
      if (paramBank == Bank.EPC) {
        paramBank = a.a.b;
      }
      for (;;)
      {
        return paramBank;
        if (paramBank == Bank.TID)
        {
          paramBank = a.a.c;
        }
        else if (paramBank == Bank.RESERVED)
        {
          paramBank = a.a.a;
        }
        else
        {
          if (paramBank != Bank.USER) {
            break;
          }
          paramBank = a.a.d;
        }
      }
      throw new InvalidParamException("Invalid Memory Bank");
    }
    finally {}
  }
  
  private String a(LockFields paramLockFields, a.b paramb)
  {
    try
    {
      a.b localb1 = a.b.a;
      a.b localb2 = a.b.a;
      a.b localb3 = a.b.a;
      a.b localb5 = a.b.a;
      a.b localb4 = a.b.a;
      if ((paramLockFields.getFieldBitmap() & 0x2) != 0) {
        localb1 = paramb;
      }
      if ((paramLockFields.getFieldBitmap() & 0x1) != 0) {
        localb2 = paramb;
      }
      if ((paramLockFields.getFieldBitmap() & 0x4) != 0) {
        localb3 = paramb;
      }
      if ((paramLockFields.getFieldBitmap() & 0x8) != 0) {
        localb4 = paramb;
      }
      paramLockFields = this.c.a(localb1, localb2, localb3, localb5, localb4);
      return paramLockFields;
    }
    finally {}
  }
  
  private void a(Mask paramMask)
    throws ReaderException
  {
    int j = 0;
    for (;;)
    {
      if (j < 4) {}
      try
      {
        this.d.setFilter(j, 0, "", 0);
        j += 1;
      }
      finally {}
    }
    if (this.d.setFilter(paramMask.getBank().getValue(), paramMask.getBitPointer(), paramMask.getData(), paramMask.getBitLength()) != 0) {
      throw new ReaderException("Error setting mask");
    }
  }
  
  private void b()
  {
    this.d.setInvMaxTry(1000);
    this.d.setInvReadWaitTime(5);
  }
  
  private void c()
  {
    this.d.setInvMaxTry(500);
    this.d.setInvReadWaitTime(10);
  }
  
  /* Error */
  private void d()
    throws ReaderException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   6: astore_1
    //   7: aload_1
    //   8: ifnull +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: new 172	android/net/LocalServerSocket
    //   18: dup
    //   19: ldc -82
    //   21: invokespecial 175	android/net/LocalServerSocket:<init>	(Ljava/lang/String;)V
    //   24: putfield 177	com/alien/rfid/a:i	Landroid/net/LocalServerSocket;
    //   27: aload_0
    //   28: new 87	com/alien/rfid/ALRH450CusAPI
    //   31: dup
    //   32: invokespecial 178	com/alien/rfid/ALRH450CusAPI:<init>	()V
    //   35: putfield 73	com/alien/rfid/a:d	Lcom/alien/rfid/ALRH450CusAPI;
    //   38: aload_0
    //   39: invokestatic 181	com/rscja/deviceapi/a:b	()Lcom/rscja/deviceapi/a;
    //   42: putfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   45: aload_0
    //   46: getfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   49: invokevirtual 184	com/rscja/deviceapi/a:c	()Z
    //   52: ifeq -41 -> 11
    //   55: aload_0
    //   56: getfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   59: invokevirtual 186	com/rscja/deviceapi/a:f	()Z
    //   62: pop
    //   63: aload_0
    //   64: invokespecial 188	com/alien/rfid/a:b	()V
    //   67: bipush 8
    //   69: newarray <illegal type>
    //   71: astore_1
    //   72: aload_0
    //   73: getfield 73	com/alien/rfid/a:d	Lcom/alien/rfid/ALRH450CusAPI;
    //   76: aload_1
    //   77: invokevirtual 192	com/alien/rfid/ALRH450CusAPI:getGen2Parameter	([I)I
    //   80: ifeq +57 -> 137
    //   83: new 32	com/alien/rfid/ReaderException
    //   86: dup
    //   87: ldc -62
    //   89: invokespecial 153	com/alien/rfid/ReaderException:<init>	(Ljava/lang/String;)V
    //   92: athrow
    //   93: astore_1
    //   94: new 32	com/alien/rfid/ReaderException
    //   97: dup
    //   98: new 196	java/lang/StringBuilder
    //   101: dup
    //   102: invokespecial 197	java/lang/StringBuilder:<init>	()V
    //   105: ldc -57
    //   107: invokevirtual 203	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   110: aload_1
    //   111: invokevirtual 206	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   114: invokevirtual 209	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   117: invokespecial 153	com/alien/rfid/ReaderException:<init>	(Ljava/lang/String;)V
    //   120: athrow
    //   121: astore_1
    //   122: aload_0
    //   123: monitorexit
    //   124: aload_1
    //   125: athrow
    //   126: astore_1
    //   127: new 211	com/alien/rfid/RFIDBusyException
    //   130: dup
    //   131: ldc -43
    //   133: invokespecial 214	com/alien/rfid/RFIDBusyException:<init>	(Ljava/lang/String;)V
    //   136: athrow
    //   137: aload_0
    //   138: aload_0
    //   139: getfield 73	com/alien/rfid/a:d	Lcom/alien/rfid/ALRH450CusAPI;
    //   142: aload_1
    //   143: getstatic 217	com/alien/rfid/ALRH450CusAPI:a	Lcom/alien/rfid/ALRH450CusAPI$a;
    //   146: invokevirtual 220	com/alien/rfid/ALRH450CusAPI:a	([ILcom/alien/rfid/ALRH450CusAPI$a;)I
    //   149: putfield 38	com/alien/rfid/a:b	I
    //   152: goto -141 -> 11
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	155	0	this	a
    //   6	71	1	localObject1	Object
    //   93	18	1	localException1	Exception
    //   121	4	1	localObject2	Object
    //   126	17	1	localException2	Exception
    // Exception table:
    //   from	to	target	type
    //   27	93	93	java/lang/Exception
    //   137	152	93	java/lang/Exception
    //   2	7	121	finally
    //   14	27	121	finally
    //   27	93	121	finally
    //   94	121	121	finally
    //   127	137	121	finally
    //   137	152	121	finally
    //   14	27	126	java/lang/Exception
  }
  
  private void e()
    throws ReaderException
  {
    if (this.e) {
      throw new RFIDBusyException("Reader is busy!");
    }
  }
  
  /* Error */
  public void close()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 177	com/alien/rfid/a:i	Landroid/net/LocalServerSocket;
    //   6: astore_1
    //   7: aload_1
    //   8: ifnull +15 -> 23
    //   11: aload_0
    //   12: getfield 177	com/alien/rfid/a:i	Landroid/net/LocalServerSocket;
    //   15: invokevirtual 227	android/net/LocalServerSocket:close	()V
    //   18: aload_0
    //   19: aconst_null
    //   20: putfield 177	com/alien/rfid/a:i	Landroid/net/LocalServerSocket;
    //   23: aload_0
    //   24: getfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   27: ifnull +16 -> 43
    //   30: aload_0
    //   31: getfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   34: invokevirtual 229	com/rscja/deviceapi/a:d	()Z
    //   37: pop
    //   38: aload_0
    //   39: aconst_null
    //   40: putfield 135	com/alien/rfid/a:c	Lcom/rscja/deviceapi/a;
    //   43: aload_0
    //   44: monitorexit
    //   45: return
    //   46: astore_1
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_1
    //   50: athrow
    //   51: astore_1
    //   52: goto -34 -> 18
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	55	0	this	a
    //   6	2	1	localLocalServerSocket	LocalServerSocket
    //   46	4	1	localObject	Object
    //   51	1	1	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   2	7	46	finally
    //   11	18	46	finally
    //   18	23	46	finally
    //   23	43	46	finally
    //   11	18	51	java/lang/Exception
  }
  
  public String getInfo(RFIDInfo paramRFIDInfo)
  {
    switch (2.a[paramRFIDInfo.ordinal()])
    {
    default: 
    case 1: 
    case 2: 
    case 3: 
      long l;
      do
      {
        int j;
        do
        {
          do
          {
            return null;
            j = this.d.getHardwareVersion();
          } while (j == -1);
          return "" + (j & 0xFF) + "." + ((j & 0xFF00) >> 8) + "." + ((j & 0xFF0000) >> 16);
          j = this.d.getFirmwareVersion();
        } while (j == -1);
        return "" + (j & 0xFF) + "." + ((j & 0xFF00) >> 8) + "." + ((j & 0xFF0000) >> 16);
        l = this.d.getModuleId();
      } while (l == -1L);
      return "" + l;
    }
    switch (this.d.getRegion())
    {
    default: 
      return null;
    case 1: 
      return "China 1";
    case 2: 
      return "China 2";
    case 4: 
      return "Europe";
    case 8: 
      return "USA";
    case 22: 
      return "Korea";
    case 50: 
      return "Japan";
    case 51: 
      return "Brazil";
    }
    return "WR1";
  }
  
  public int getPower()
    throws ReaderException
  {
    try
    {
      e();
      int j = this.c.e();
      return j;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int getQ()
    throws ReaderException
  {
    try
    {
      int j = this.b;
      return j;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public Session getSession()
    throws ReaderException
  {
    try
    {
      e();
      int[] arrayOfInt1 = new int[8];
      if (this.d.getGen2Parameter(arrayOfInt1) != 0) {
        throw new ReaderException("Error reading Gen2 params");
      }
    }
    finally {}
    Session localSession = Session.fromValue(this.d.a(arrayOfInt2, ALRH450CusAPI.d));
    return localSession;
  }
  
  public Target getTarget()
    throws ReaderException
  {
    try
    {
      e();
      int[] arrayOfInt1 = new int[8];
      if (this.d.getGen2Parameter(arrayOfInt1) != 0) {
        throw new ReaderException("Error reading Gen2 params");
      }
    }
    finally {}
    Target localTarget = Target.fromValue(this.d.a(arrayOfInt2, ALRH450CusAPI.e));
    return localTarget;
  }
  
  public void inventory(final RFIDCallback paramRFIDCallback, Mask paramMask)
    throws ReaderException
  {
    try
    {
      e();
      if (this.c == null) {
        throw new ReaderException("RFID is not initialized!");
      }
    }
    finally {}
    this.e = true;
    this.g = new CountDownLatch(1);
    a(paramMask);
    new Thread(new Runnable()
    {
      public void run()
      {
        if (!a.a(a.this))
        {
          Object localObject = a.c(a.this);
          int i;
          if (a.b(a.this) > 0) {
            i = 1;
          }
          while (((com.rscja.deviceapi.a)localObject).a(i, a.b(a.this)))
          {
            localObject = new ALRH450CusAPI.b();
            for (;;)
            {
              if ((a.d(a.this)) && (!a.a(a.this)))
              {
                if (a.e(a.this).b((ALRH450CusAPI.b)localObject))
                {
                  Tag localTag = new Tag(jdField_this, ((ALRH450CusAPI.b)localObject).a, ((ALRH450CusAPI.b)localObject).c);
                  paramRFIDCallback.onTagRead(localTag);
                }
                if (!a.a(a.this))
                {
                  try
                  {
                    Thread.sleep(a.f(a.this));
                  }
                  catch (InterruptedException localInterruptedException) {}
                  continue;
                  i = 0;
                  break;
                }
              }
            }
            a.c(a.this).f();
          }
        }
        a.g(a.this).countDown();
        a.a(a.this, null);
        a.a(a.this, false);
      }
    }).start();
  }
  
  public boolean isRunning()
  {
    return this.e;
  }
  
  public RFIDResult kill(String paramString, Mask paramMask)
    throws ReaderException
  {
    try
    {
      e();
      if (paramMask.getData().length() * 4 < paramMask.getBitLength()) {
        throw new InvalidParamException("Mask data is shorter than the bit length");
      }
    }
    finally {}
    if (this.d.killTag(paramString, paramMask.getBank().getValue(), paramMask.getBitPointer(), paramMask.getData(), paramMask.getBitLength()) == 0) {}
    for (boolean bool = true;; bool = false)
    {
      paramString = new RFIDResult(bool);
      return paramString;
    }
  }
  
  public RFIDResult lock(LockFields paramLockFields, LockType paramLockType, Mask paramMask, String paramString)
    throws ReaderException
  {
    try
    {
      switch (2.b[paramLockType.ordinal()])
      {
      case 1: 
        throw new InvalidParamException("Invalid lock type");
      }
    }
    finally
    {
      throw paramLockFields;
      paramLockType = a.b.b;
      for (;;)
      {
        paramLockFields = a(paramLockFields, paramMask, paramString, paramLockType);
        return paramLockFields;
        paramLockType = a.b.c;
        continue;
        paramLockType = a.b.d;
      }
      paramLockType = a.b.e;
    }
  }
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2, Mask paramMask, String paramString)
    throws ReaderException
  {
    try
    {
      e();
      if (paramMask.getData().length() * 4 < paramMask.getBitLength()) {
        throw new InvalidParamException("Mask data is shorter than the bit length");
      }
    }
    finally {}
    try
    {
      c();
      paramBank = this.d.readData(paramString, paramMask.getBank().getValue(), paramMask.getBitPointer(), paramMask.getData(), paramMask.getBitLength(), paramBank.getValue(), paramInt1, paramInt2);
      if (paramBank != null) {
        paramBank = paramBank.toUpperCase();
      }
      for (;;)
      {
        if (paramBank != null) {}
        for (boolean bool = true;; bool = false)
        {
          paramBank = new RFIDResult(bool, paramBank);
          b();
          return paramBank;
        }
      }
    }
    finally
    {
      b();
    }
  }
  
  /* Error */
  public RFIDResult read(Mask paramMask)
    throws ReaderException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 46	com/alien/rfid/a:e	()V
    //   6: aload_0
    //   7: aload_1
    //   8: invokespecial 313	com/alien/rfid/a:a	(Lcom/alien/rfid/Mask;)V
    //   11: new 367	com/alien/rfid/ALRH450CusAPI$b
    //   14: dup
    //   15: invokespecial 368	com/alien/rfid/ALRH450CusAPI$b:<init>	()V
    //   18: astore_1
    //   19: aload_0
    //   20: getfield 73	com/alien/rfid/a:d	Lcom/alien/rfid/ALRH450CusAPI;
    //   23: aload_1
    //   24: invokevirtual 371	com/alien/rfid/ALRH450CusAPI:a	(Lcom/alien/rfid/ALRH450CusAPI$b;)Z
    //   27: ifne +16 -> 43
    //   30: new 93	com/alien/rfid/RFIDResult
    //   33: dup
    //   34: iconst_0
    //   35: invokespecial 96	com/alien/rfid/RFIDResult:<init>	(Z)V
    //   38: astore_1
    //   39: aload_0
    //   40: monitorexit
    //   41: aload_1
    //   42: areturn
    //   43: new 93	com/alien/rfid/RFIDResult
    //   46: dup
    //   47: iconst_1
    //   48: new 373	com/alien/rfid/Tag
    //   51: dup
    //   52: aload_0
    //   53: aload_1
    //   54: getfield 376	com/alien/rfid/ALRH450CusAPI$b:a	Ljava/lang/String;
    //   57: aload_1
    //   58: getfield 379	com/alien/rfid/ALRH450CusAPI$b:c	D
    //   61: invokespecial 382	com/alien/rfid/Tag:<init>	(Lcom/alien/rfid/RFIDReader;Ljava/lang/String;D)V
    //   64: invokespecial 364	com/alien/rfid/RFIDResult:<init>	(ZLjava/lang/Object;)V
    //   67: astore_1
    //   68: goto -29 -> 39
    //   71: astore_1
    //   72: aload_0
    //   73: monitorexit
    //   74: aload_1
    //   75: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	76	0	this	a
    //   0	76	1	paramMask	Mask
    // Exception table:
    //   from	to	target	type
    //   2	39	71	finally
    //   43	68	71	finally
  }
  
  public void setPower(int paramInt)
    throws ReaderException
  {
    try
    {
      e();
      if ((paramInt < 0) || (paramInt > 30)) {
        throw new InvalidParamException("Power value must be 1-30 dBm");
      }
    }
    finally {}
    this.c.a(paramInt);
  }
  
  public void setQ(int paramInt)
    throws ReaderException
  {
    try
    {
      e();
      if ((paramInt < 0) || (paramInt > 15)) {
        throw new InvalidParamException("Q value must be 0-" + Integer.toString(15));
      }
    }
    finally {}
    this.b = paramInt;
    int[] arrayOfInt = new int[8];
    if (this.d.getGen2Parameter(arrayOfInt) != 0) {
      throw new ReaderException("Error reading Gen2 params");
    }
    this.d.a(arrayOfInt, ALRH450CusAPI.a, paramInt);
    if (this.d.setGen2Parameter(arrayOfInt) != 0) {
      throw new ReaderException("Error setting Gen2 params");
    }
  }
  
  public void setSession(Session paramSession)
    throws ReaderException
  {
    int[] arrayOfInt;
    try
    {
      e();
      arrayOfInt = new int[8];
      if (this.d.getGen2Parameter(arrayOfInt) != 0) {
        throw new ReaderException("Error reading Gen2 params");
      }
    }
    finally {}
    this.d.a(arrayOfInt, ALRH450CusAPI.d, paramSession.getValue());
    if (this.d.setGen2Parameter(arrayOfInt) != 0) {
      throw new ReaderException("Error setting Gen2 params");
    }
  }
  
  public void setTarget(Target paramTarget)
    throws ReaderException
  {
    int[] arrayOfInt;
    try
    {
      e();
      arrayOfInt = new int[8];
      if (this.d.getGen2Parameter(arrayOfInt) != 0) {
        throw new ReaderException("Error reading Gen2 params");
      }
    }
    finally {}
    this.d.a(arrayOfInt, ALRH450CusAPI.e, paramTarget.getValue());
    if (this.d.setGen2Parameter(arrayOfInt) != 0) {
      throw new ReaderException("Error setting Gen2 params");
    }
  }
  
  public void stop()
    throws ReaderException
  {
    for (;;)
    {
      CountDownLatch localCountDownLatch;
      try
      {
        boolean bool = this.e;
        if (!bool) {
          return;
        }
      }
      finally {}
      try
      {
        this.f = true;
        this.d.enableInventory(false);
        localCountDownLatch = this.g;
        if (localCountDownLatch != null) {
          localCountDownLatch.await();
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        continue;
      }
      this.f = false;
      this.d.enableInventory(true);
    }
  }
  
  /* Error */
  public RFIDResult write(Bank paramBank, int paramInt, String paramString1, Mask paramMask, String paramString2)
    throws ReaderException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 46	com/alien/rfid/a:e	()V
    //   6: aload_0
    //   7: aload_1
    //   8: invokespecial 423	com/alien/rfid/a:a	(Lcom/alien/rfid/Bank;)Lcom/rscja/deviceapi/a$a;
    //   11: pop
    //   12: aload 4
    //   14: invokevirtual 52	com/alien/rfid/Mask:getData	()Ljava/lang/String;
    //   17: invokevirtual 58	java/lang/String:length	()I
    //   20: iconst_4
    //   21: imul
    //   22: aload 4
    //   24: invokevirtual 61	com/alien/rfid/Mask:getBitLength	()I
    //   27: if_icmpge +19 -> 46
    //   30: new 63	com/alien/rfid/InvalidParamException
    //   33: dup
    //   34: ldc_w 425
    //   37: invokespecial 68	com/alien/rfid/InvalidParamException:<init>	(Ljava/lang/String;)V
    //   40: athrow
    //   41: astore_1
    //   42: aload_0
    //   43: monitorexit
    //   44: aload_1
    //   45: athrow
    //   46: aload_3
    //   47: invokevirtual 58	java/lang/String:length	()I
    //   50: iconst_4
    //   51: irem
    //   52: ifeq +14 -> 66
    //   55: new 63	com/alien/rfid/InvalidParamException
    //   58: dup
    //   59: ldc_w 427
    //   62: invokespecial 68	com/alien/rfid/InvalidParamException:<init>	(Ljava/lang/String;)V
    //   65: athrow
    //   66: aload_0
    //   67: invokespecial 354	com/alien/rfid/a:c	()V
    //   70: aload_0
    //   71: getfield 73	com/alien/rfid/a:d	Lcom/alien/rfid/ALRH450CusAPI;
    //   74: aload 5
    //   76: aload 4
    //   78: invokevirtual 77	com/alien/rfid/Mask:getBank	()Lcom/alien/rfid/Bank;
    //   81: invokevirtual 82	com/alien/rfid/Bank:getValue	()I
    //   84: aload 4
    //   86: invokevirtual 85	com/alien/rfid/Mask:getBitPointer	()I
    //   89: aload 4
    //   91: invokevirtual 52	com/alien/rfid/Mask:getData	()Ljava/lang/String;
    //   94: aload 4
    //   96: invokevirtual 61	com/alien/rfid/Mask:getBitLength	()I
    //   99: aload_1
    //   100: invokevirtual 82	com/alien/rfid/Bank:getValue	()I
    //   103: iload_2
    //   104: aload_3
    //   105: invokevirtual 58	java/lang/String:length	()I
    //   108: iconst_4
    //   109: idiv
    //   110: aload_3
    //   111: invokevirtual 431	com/alien/rfid/ALRH450CusAPI:writeData	(Ljava/lang/String;IILjava/lang/String;IIIILjava/lang/String;)I
    //   114: ifne +24 -> 138
    //   117: iconst_1
    //   118: istore 6
    //   120: new 93	com/alien/rfid/RFIDResult
    //   123: dup
    //   124: iload 6
    //   126: invokespecial 96	com/alien/rfid/RFIDResult:<init>	(Z)V
    //   129: astore_1
    //   130: aload_0
    //   131: invokespecial 188	com/alien/rfid/a:b	()V
    //   134: aload_0
    //   135: monitorexit
    //   136: aload_1
    //   137: areturn
    //   138: iconst_0
    //   139: istore 6
    //   141: goto -21 -> 120
    //   144: astore_1
    //   145: aload_0
    //   146: invokespecial 188	com/alien/rfid/a:b	()V
    //   149: aload_1
    //   150: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	151	0	this	a
    //   0	151	1	paramBank	Bank
    //   0	151	2	paramInt	int
    //   0	151	3	paramString1	String
    //   0	151	4	paramMask	Mask
    //   0	151	5	paramString2	String
    //   118	22	6	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	41	41	finally
    //   46	66	41	finally
    //   130	134	41	finally
    //   145	151	41	finally
    //   66	117	144	finally
    //   120	130	144	finally
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */