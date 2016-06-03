package com.lidroid.xutils.util;

import android.webkit.MimeTypeMap;

public class MimeTypeUtils
{
  public static String getMimeType(String paramString)
  {
    String str = "application/octet-stream";
    int i = paramString.lastIndexOf(".");
    if (i != -1)
    {
      paramString = paramString.substring(i + 1);
      str = MimeTypeMap.getSingleton().getMimeTypeFromExtension(paramString);
    }
    return str;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\MimeTypeUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */