package com.rscja.utility;

public class a
{
  public static String a(byte paramByte)
  {
    try
    {
      String str2 = Integer.toHexString(paramByte & 0xFF);
      String str1 = str2;
      if (str2.length() == 1) {
        str1 = "0" + str2;
      }
      str1 = "" + str1.toUpperCase();
      return str1;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "";
  }
  
  public static String a(byte[] paramArrayOfByte, int paramInt)
  {
    Object localObject = "";
    int i = 0;
    for (;;)
    {
      if (i >= paramInt) {
        return (String)localObject;
      }
      try
      {
        String str2 = Integer.toHexString(paramArrayOfByte[i] & 0xFF);
        String str1 = str2;
        if (str2.length() == 1) {
          str1 = "0" + str2;
        }
        str1 = localObject + str1.toUpperCase();
        localObject = str1;
        i += 1;
      }
      catch (Exception paramArrayOfByte)
      {
        paramArrayOfByte.printStackTrace();
      }
    }
    return (String)localObject;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\rscja\utility\a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */