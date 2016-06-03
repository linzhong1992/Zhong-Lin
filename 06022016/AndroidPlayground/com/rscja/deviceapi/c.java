package com.rscja.deviceapi;

import android.os.Build;
import com.rscja.deviceapi.exception.a;

final class c
{
  private static String a = "C4000";
  private String b;
  private String c;
  private int d;
  
  static
  {
    String str = Build.DISPLAY.toUpperCase();
    a = str;
    if ((!str.contains("C4000")) && (!a.contains("40006577")))
    {
      if (a.contains("40006582"))
      {
        a = "C40006582";
        return;
      }
      if (a.contains("40506582"))
      {
        a = "C40506582";
        return;
      }
    }
  }
  
  private c(String paramString1, String paramString2, int paramInt)
  {
    this.b = paramString1;
    this.c = paramString2;
    this.d = paramInt;
  }
  
  public static String a()
  {
    if (a.equals("i760")) {
      return "C4000";
    }
    return a.toUpperCase();
  }
  
  public static c b()
    throws a
  {
    return new c(a(), "/dev/ttyMT3", 115200);
  }
  
  public final String c()
  {
    return this.b;
  }
  
  public final String d()
  {
    return this.c;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\rscja\deviceapi\c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */