package com.rscja.deviceapi;

import android.util.Log;

public class a
  extends b
{
  private static a c = null;
  protected c a = c.b();
  
  private a()
    throws com.rscja.deviceapi.exception.a
  {}
  
  public static a b()
    throws com.rscja.deviceapi.exception.a
  {
    try
    {
      if (c == null) {
        c = new a();
      }
      a locala = c;
      return locala;
    }
    finally {}
  }
  
  protected DeviceAPI a()
  {
    return DeviceAPI.a();
  }
  
  public String a(b paramb1, b paramb2, b paramb3, b paramb4, b paramb5)
  {
    for (;;)
    {
      int i;
      int j;
      int k;
      int m;
      int n;
      try
      {
        i = b.a(paramb1);
        j = b.a(paramb2);
        k = b.a(paramb3);
        m = b.a(paramb4);
        n = b.a(paramb5);
        paramb1 = new byte[3];
        paramb1[0] = 0;
        paramb1[1] = 0;
        paramb1[2] = 0;
        if (i == 1)
        {
          paramb1[0] = ((byte)(paramb1[0] | 0xC));
          paramb1[1] = ((byte)(paramb1[1] | 0x2));
          break label173;
          paramb1 = com.rscja.utility.a.a(paramb1, paramb1.length);
          return paramb1;
        }
        else if (i == 2)
        {
          paramb1[0] = ((byte)(paramb1[0] | 0xC));
          paramb1[1] = ((byte)paramb1[1]);
        }
      }
      finally {}
      if (i == 3)
      {
        paramb1[0] = ((byte)(paramb1[0] | 0xC));
        paramb1[1] = ((byte)(paramb1[1] | 0x3));
      }
      label173:
      label199:
      label226:
      label436:
      label547:
      label655:
      do
      {
        paramb1[1] = ((byte)(paramb1[1] & 0xF3));
        paramb1[2] = ((byte)(paramb1[2] & 0xFC));
        break;
        if (j == 1)
        {
          paramb1[0] = ((byte)(paramb1[0] | 0x3));
          paramb1[2] = ((byte)(paramb1[2] | 0x80));
          if (k != 1) {
            break label436;
          }
          paramb1[1] = ((byte)(paramb1[1] | 0xC0));
          paramb1[2] = ((byte)(paramb1[2] | 0x20));
          if (m != 1) {
            break label547;
          }
          paramb1[1] = ((byte)(paramb1[1] | 0x30));
          paramb1[2] = ((byte)(paramb1[2] | 0x8));
        }
        for (;;)
        {
          if (n != 1) {
            break label655;
          }
          paramb1[1] = ((byte)(paramb1[1] | 0xC));
          paramb1[2] = ((byte)(paramb1[2] | 0x2));
          break;
          if (i == 4)
          {
            paramb1[0] = ((byte)(paramb1[0] | 0xC));
            paramb1[1] = ((byte)(paramb1[1] | 0x1));
            break label173;
          }
          paramb1[0] = ((byte)(paramb1[0] & 0x3));
          paramb1[1] = ((byte)(paramb1[1] & 0xFC));
          break label173;
          if (j == 2)
          {
            paramb1[0] = ((byte)(paramb1[0] | 0x3));
            paramb1[2] = ((byte)paramb1[2]);
            break label199;
          }
          if (j == 3)
          {
            paramb1[0] = ((byte)(paramb1[0] | 0x3));
            paramb1[2] = ((byte)(paramb1[2] | 0xC0));
            break label199;
          }
          if (j == 4)
          {
            paramb1[0] = ((byte)(paramb1[0] | 0x3));
            paramb1[2] = ((byte)(paramb1[2] | 0x40));
            break label199;
          }
          paramb1[0] = ((byte)(paramb1[0] & 0xC));
          paramb1[2] = ((byte)(paramb1[2] & 0x3F));
          break label199;
          if (k == 2)
          {
            paramb1[1] = ((byte)(paramb1[1] | 0xC0));
            paramb1[2] = ((byte)paramb1[2]);
            break label226;
          }
          if (k == 3)
          {
            paramb1[1] = ((byte)(paramb1[1] | 0xC0));
            paramb1[2] = ((byte)(paramb1[2] | 0x30));
            break label226;
          }
          if (k == 4)
          {
            paramb1[1] = ((byte)(paramb1[1] | 0xC0));
            paramb1[2] = ((byte)(paramb1[2] | 0x10));
            break label226;
          }
          paramb1[1] = ((byte)(paramb1[1] & 0x3F));
          paramb1[2] = ((byte)(paramb1[2] & 0xCF));
          break label226;
          if (m == 2)
          {
            paramb1[1] = ((byte)(paramb1[1] | 0x30));
            paramb1[2] = ((byte)paramb1[2]);
          }
          else if (m == 3)
          {
            paramb1[1] = ((byte)(paramb1[1] | 0x30));
            paramb1[2] = ((byte)(paramb1[2] | 0xC));
          }
          else if (m == 4)
          {
            paramb1[1] = ((byte)(paramb1[1] | 0x30));
            paramb1[2] = ((byte)(paramb1[2] | 0x4));
          }
          else
          {
            paramb1[1] = ((byte)(paramb1[1] & 0xCF));
            paramb1[2] = ((byte)(paramb1[2] & 0xF3));
          }
        }
        if (n == 2)
        {
          paramb1[1] = ((byte)(paramb1[1] | 0xC));
          paramb1[2] = ((byte)paramb1[2]);
          break;
        }
        if (n == 3)
        {
          paramb1[1] = ((byte)(paramb1[1] | 0xC));
          paramb1[2] = ((byte)(paramb1[2] | 0x3));
          break;
        }
      } while (n != 4);
      paramb1[1] = ((byte)(paramb1[1] | 0xC));
      paramb1[2] = ((byte)(paramb1[2] | 0x1));
    }
  }
  
  /* Error */
  public boolean a(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 49	com/rscja/deviceapi/a:a	()Lcom/rscja/deviceapi/DeviceAPI;
    //   6: iload_1
    //   7: i2c
    //   8: invokevirtual 53	com/rscja/deviceapi/DeviceAPI:UHFSetPower	(C)I
    //   11: istore_1
    //   12: iload_1
    //   13: ifne +9 -> 22
    //   16: iconst_1
    //   17: istore_2
    //   18: aload_0
    //   19: monitorexit
    //   20: iload_2
    //   21: ireturn
    //   22: ldc 55
    //   24: new 57	java/lang/StringBuilder
    //   27: dup
    //   28: ldc 59
    //   30: invokespecial 62	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   33: iload_1
    //   34: invokevirtual 66	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   37: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   40: invokestatic 76	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   43: pop
    //   44: iconst_0
    //   45: istore_2
    //   46: goto -28 -> 18
    //   49: astore_3
    //   50: aload_0
    //   51: monitorexit
    //   52: aload_3
    //   53: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	54	0	this	a
    //   0	54	1	paramInt	int
    //   17	29	2	bool	boolean
    //   49	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	12	49	finally
    //   22	44	49	finally
  }
  
  /* Error */
  public boolean a(int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 49	com/rscja/deviceapi/a:a	()Lcom/rscja/deviceapi/DeviceAPI;
    //   6: iload_1
    //   7: i2c
    //   8: iload_2
    //   9: i2c
    //   10: invokevirtual 81	com/rscja/deviceapi/DeviceAPI:UHFInventory_EX	(CC)I
    //   13: istore_1
    //   14: iload_1
    //   15: ifne +9 -> 24
    //   18: iconst_1
    //   19: istore_3
    //   20: aload_0
    //   21: monitorexit
    //   22: iload_3
    //   23: ireturn
    //   24: ldc 55
    //   26: new 57	java/lang/StringBuilder
    //   29: dup
    //   30: ldc 83
    //   32: invokespecial 62	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   35: iload_1
    //   36: invokevirtual 66	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   39: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   42: invokestatic 76	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   45: pop
    //   46: iconst_0
    //   47: istore_3
    //   48: goto -28 -> 20
    //   51: astore 4
    //   53: aload_0
    //   54: monitorexit
    //   55: aload 4
    //   57: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	58	0	this	a
    //   0	58	1	paramInt1	int
    //   0	58	2	paramInt2	int
    //   19	29	3	bool	boolean
    //   51	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	14	51	finally
    //   24	46	51	finally
  }
  
  public boolean c()
  {
    boolean bool = true;
    for (;;)
    {
      try
      {
        int i = a().UHFInit(this.a.c());
        if (i == 0)
        {
          i = a().UHFOpenAndConnect(this.a.d());
          if (i == 0)
          {
            a(true);
            return bool;
          }
          Log.e("RFIDWithUHF", "init() err UHFOpenAndConnect result:" + i);
        }
        else
        {
          Log.e("RFIDWithUHF", "init() err UHFInit result:" + i);
        }
      }
      finally {}
      bool = false;
    }
  }
  
  /* Error */
  public boolean d()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: invokevirtual 49	com/rscja/deviceapi/a:a	()Lcom/rscja/deviceapi/DeviceAPI;
    //   8: invokevirtual 106	com/rscja/deviceapi/DeviceAPI:UHFCloseAndDisconnect	()V
    //   11: aload_0
    //   12: invokevirtual 49	com/rscja/deviceapi/a:a	()Lcom/rscja/deviceapi/DeviceAPI;
    //   15: aload_0
    //   16: getfield 30	com/rscja/deviceapi/a:a	Lcom/rscja/deviceapi/c;
    //   19: invokevirtual 86	com/rscja/deviceapi/c:c	()Ljava/lang/String;
    //   22: invokevirtual 109	com/rscja/deviceapi/DeviceAPI:UHFFree	(Ljava/lang/String;)I
    //   25: istore_1
    //   26: iload_1
    //   27: ifne +14 -> 41
    //   30: aload_0
    //   31: iconst_0
    //   32: invokevirtual 99	com/rscja/deviceapi/a:a	(Z)V
    //   35: iconst_1
    //   36: istore_2
    //   37: aload_0
    //   38: monitorexit
    //   39: iload_2
    //   40: ireturn
    //   41: ldc 55
    //   43: new 57	java/lang/StringBuilder
    //   46: dup
    //   47: ldc 111
    //   49: invokespecial 62	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   52: iload_1
    //   53: invokevirtual 66	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   56: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   59: invokestatic 76	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   62: pop
    //   63: goto -26 -> 37
    //   66: astore_3
    //   67: aload_0
    //   68: monitorexit
    //   69: aload_3
    //   70: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	71	0	this	a
    //   25	28	1	i	int
    //   1	39	2	bool	boolean
    //   66	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   4	26	66	finally
    //   30	35	66	finally
    //   41	63	66	finally
  }
  
  /* Error */
  public int e()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 49	com/rscja/deviceapi/a:a	()Lcom/rscja/deviceapi/DeviceAPI;
    //   6: invokevirtual 116	com/rscja/deviceapi/DeviceAPI:UHFGetPower	()[C
    //   9: astore_2
    //   10: aload_2
    //   11: ifnull +17 -> 28
    //   14: aload_2
    //   15: iconst_0
    //   16: caload
    //   17: ifne +11 -> 28
    //   20: aload_2
    //   21: iconst_1
    //   22: caload
    //   23: istore_1
    //   24: aload_0
    //   25: monitorexit
    //   26: iload_1
    //   27: ireturn
    //   28: ldc 55
    //   30: new 57	java/lang/StringBuilder
    //   33: dup
    //   34: ldc 118
    //   36: invokespecial 62	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   39: aload_2
    //   40: iconst_0
    //   41: caload
    //   42: invokevirtual 66	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   45: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   48: invokestatic 76	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   51: pop
    //   52: iconst_m1
    //   53: istore_1
    //   54: goto -30 -> 24
    //   57: astore_2
    //   58: aload_0
    //   59: monitorexit
    //   60: aload_2
    //   61: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	62	0	this	a
    //   23	31	1	i	int
    //   9	31	2	arrayOfChar	char[]
    //   57	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	10	57	finally
    //   28	52	57	finally
  }
  
  /* Error */
  public boolean f()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 49	com/rscja/deviceapi/a:a	()Lcom/rscja/deviceapi/DeviceAPI;
    //   6: invokevirtual 122	com/rscja/deviceapi/DeviceAPI:UHFStopGet	()I
    //   9: istore_1
    //   10: iload_1
    //   11: ifne +9 -> 20
    //   14: iconst_1
    //   15: istore_2
    //   16: aload_0
    //   17: monitorexit
    //   18: iload_2
    //   19: ireturn
    //   20: ldc 55
    //   22: new 57	java/lang/StringBuilder
    //   25: dup
    //   26: ldc 124
    //   28: invokespecial 62	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   31: iload_1
    //   32: invokevirtual 66	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   35: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   38: invokestatic 76	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   41: pop
    //   42: iconst_0
    //   43: istore_2
    //   44: goto -28 -> 16
    //   47: astore_3
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_3
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	a
    //   9	23	1	i	int
    //   15	29	2	bool	boolean
    //   47	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	10	47	finally
    //   20	42	47	finally
  }
  
  public static enum a
  {
    private final byte e;
    
    private a(byte paramByte)
    {
      this.e = paramByte;
    }
  }
  
  public static enum b
  {
    private final byte f;
    
    private b(byte paramByte)
    {
      this.f = paramByte;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\rscja\deviceapi\a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */