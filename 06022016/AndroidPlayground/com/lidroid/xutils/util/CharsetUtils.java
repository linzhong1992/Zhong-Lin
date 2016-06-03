package com.lidroid.xutils.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CharsetUtils
{
  public static final String DEFAULT_ENCODING_CHARSET = "ISO-8859-1";
  public static final List<String> SUPPORT_CHARSET = new ArrayList();
  
  static
  {
    SUPPORT_CHARSET.add("ISO-8859-1");
    SUPPORT_CHARSET.add("GB2312");
    SUPPORT_CHARSET.add("GBK");
    SUPPORT_CHARSET.add("GB18030");
    SUPPORT_CHARSET.add("US-ASCII");
    SUPPORT_CHARSET.add("ASCII");
    SUPPORT_CHARSET.add("ISO-2022-KR");
    SUPPORT_CHARSET.add("ISO-8859-2");
    SUPPORT_CHARSET.add("ISO-2022-JP");
    SUPPORT_CHARSET.add("ISO-2022-JP-2");
    SUPPORT_CHARSET.add("UTF-8");
  }
  
  public static String getEncoding(String paramString, int paramInt)
  {
    Iterator localIterator = SUPPORT_CHARSET.iterator();
    String str;
    do
    {
      if (!localIterator.hasNext()) {
        return "ISO-8859-1";
      }
      str = (String)localIterator.next();
    } while (!isCharset(paramString, str, paramInt));
    return str;
  }
  
  public static boolean isCharset(String paramString1, String paramString2, int paramInt)
  {
    try
    {
      if (paramString1.length() > paramInt) {
        paramString1 = paramString1.substring(0, paramInt);
      }
      for (;;)
      {
        boolean bool = paramString1.equals(new String(paramString1.getBytes(paramString2), paramString2));
        return bool;
      }
      return false;
    }
    catch (Throwable paramString1) {}
  }
  
  public static String toCharset(String paramString1, String paramString2, int paramInt)
  {
    try
    {
      paramString2 = new String(paramString1.getBytes(getEncoding(paramString1, paramInt)), paramString2);
      return paramString2;
    }
    catch (Throwable paramString2)
    {
      LogUtils.w(paramString2);
    }
    return paramString1;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\CharsetUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */