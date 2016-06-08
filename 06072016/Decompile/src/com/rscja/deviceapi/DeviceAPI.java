package com.rscja.deviceapi;

final class DeviceAPI
{
    private static DeviceAPI a;
    
    static {
        DeviceAPI.a = null;
        System.loadLibrary("DeviceAPI");
    }
    
    public static DeviceAPI a() {
        synchronized (DeviceAPI.class) {
            if (DeviceAPI.a == null) {
                DeviceAPI.a = new DeviceAPI();
            }
            return DeviceAPI.a;
        }
    }
    
    public final native void UHFCloseAndDisconnect();
    
    public final native int UHFFree(final String p0);
    
    public final native char[] UHFGetPower();
    
    public final native int UHFInit(final String p0);
    
    public final native int UHFInventory_EX(final char p0, final char p1);
    
    public final native int UHFOpenAndConnect(final String p0);
    
    public final native int UHFSetPower(final char p0);
    
    public final native int UHFStopGet();
}
