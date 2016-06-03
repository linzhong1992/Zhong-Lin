package com.rscja.deviceapi;

final class DeviceAPI
{
  private static DeviceAPI a = null;
  
  static
  {
    System.loadLibrary("DeviceAPI");
  }
  
  public static DeviceAPI a()
  {
    try
    {
      if (a == null) {
        a = new DeviceAPI();
      }
      DeviceAPI localDeviceAPI = a;
      return localDeviceAPI;
    }
    finally {}
  }
  
  public final native void UHFCloseAndDisconnect();
  
  public final native int UHFFree(String paramString);
  
  public final native char[] UHFGetPower();
  
  public final native int UHFInit(String paramString);
  
  public final native int UHFInventory_EX(char paramChar1, char paramChar2);
  
  public final native int UHFOpenAndConnect(String paramString);
  
  public final native int UHFSetPower(char paramChar);
  
  public final native int UHFStopGet();
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\rscja\deviceapi\DeviceAPI.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */