package com.zebra.adc.decoder;

import android.content.Context;
import android.os.Build.VERSION;
import android.util.Log;

public class a
{
  private static final String a = a.class.getSimpleName();
  private static a c;
  private BarCodeReader b = null;
  
  static
  {
    System.loadLibrary("IAL");
    System.loadLibrary("SDL");
    if (Build.VERSION.SDK_INT >= 19) {
      System.loadLibrary("barcodereader44");
    }
    for (;;)
    {
      c = null;
      return;
      if (Build.VERSION.SDK_INT >= 18) {
        System.loadLibrary("barcodereader43");
      } else {
        System.loadLibrary("barcodereader");
      }
    }
  }
  
  public static a a()
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
  
  public void a(final a parama)
  {
    try
    {
      if (this.b != null) {
        this.b.setDecodeCallback(new BarCodeReader.DecodeCallback()
        {
          public void onDecodeComplete(int paramAnonymousInt1, int paramAnonymousInt2, byte[] paramAnonymousArrayOfByte, BarCodeReader paramAnonymousBarCodeReader)
          {
            if (paramAnonymousInt2 == -3) {
              return;
            }
            parama.a(paramAnonymousInt1, paramAnonymousInt2, paramAnonymousArrayOfByte);
          }
          
          public void onEvent(int paramAnonymousInt1, int paramAnonymousInt2, byte[] paramAnonymousArrayOfByte, BarCodeReader paramAnonymousBarCodeReader) {}
        });
      }
      return;
    }
    finally
    {
      parama = finally;
      throw parama;
    }
  }
  
  public boolean a(int paramInt1, int paramInt2)
  {
    return (this.b != null) && (this.b.setParameter(paramInt1, paramInt2) == 0);
  }
  
  public boolean a(Context paramContext)
  {
    boolean bool = false;
    for (;;)
    {
      try
      {
        if (Build.VERSION.SDK_INT < 18) {
          continue;
        }
        this.b = BarCodeReader.open(paramContext);
        paramContext = this.b;
        if (paramContext != null) {
          break label56;
        }
      }
      catch (Exception paramContext)
      {
        paramContext.printStackTrace();
        continue;
      }
      finally {}
      return bool;
      this.b = BarCodeReader.open();
      continue;
      label56:
      this.b.setParameter(765, 0);
      Log.i(a, "open() succ");
      bool = true;
    }
  }
  
  public void b()
  {
    try
    {
      Log.i(a, "scan() ok");
      if (this.b != null) {
        this.b.startDecode();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void c()
  {
    try
    {
      if (this.b != null) {
        this.b.stopDecode();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static abstract interface a
  {
    public abstract void a(int paramInt1, int paramInt2, byte[] paramArrayOfByte);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\zebra\adc\decoder\a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */