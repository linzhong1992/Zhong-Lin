package com.alien.common;

import android.content.Context;
import android.os.Build;
import android.telephony.TelephonyManager;

public class DeviceInfo
{
  private Context a;
  
  public DeviceInfo(Context paramContext)
  {
    this.a = paramContext;
  }
  
  private native String encodeId(String paramString);
  
  public String getDeviceID()
  {
    String str = ((TelephonyManager)this.a.getSystemService("phone")).getDeviceId();
    if ((str == null) || (str.length() == 0)) {
      return "";
    }
    return encodeId(str);
  }
  
  public String getModel()
  {
    return Build.MODEL;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\common\DeviceInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */