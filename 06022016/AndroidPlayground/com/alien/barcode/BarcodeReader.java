package com.alien.barcode;

import android.content.Context;
import com.zebra.adc.decoder.a;
import com.zebra.adc.decoder.a.a;
import java.util.Arrays;

public class BarcodeReader
{
  private static a a;
  private static BarcodeCallback b;
  
  public BarcodeReader(Context paramContext)
  {
    if (a == null)
    {
      a = a.a();
      if ((a != null) && (a.a(paramContext)))
      {
        a.a(324, 1);
        a.a(300, 0);
        a.a(361, 0);
      }
    }
    a.a(new a.a()
    {
      public void a(int paramAnonymousInt1, int paramAnonymousInt2, byte[] paramAnonymousArrayOfByte)
      {
        if ((paramAnonymousInt2 > 0) && (paramAnonymousArrayOfByte != null) && (paramAnonymousInt2 > 0) && (BarcodeReader.a() != null)) {
          BarcodeReader.a().onBarcodeRead(new String(Arrays.copyOf(paramAnonymousArrayOfByte, paramAnonymousInt2)));
        }
        BarcodeReader.a(null);
      }
    });
  }
  
  public boolean isRunning()
  {
    boolean bool = false;
    if (a == null) {
      return false;
    }
    synchronized (a)
    {
      if (b != null) {
        bool = true;
      }
      return bool;
    }
  }
  
  public void start(BarcodeCallback paramBarcodeCallback)
  {
    if (a == null) {
      return;
    }
    synchronized (a)
    {
      if (b != null) {
        return;
      }
    }
    b = paramBarcodeCallback;
    a.b();
  }
  
  public void stop()
  {
    if (a == null) {
      return;
    }
    synchronized (a)
    {
      if (b == null) {
        return;
      }
    }
    a.c();
    b = null;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\barcode\BarcodeReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */