package com.alien.common;

import android.content.*;
import android.telephony.*;
import android.os.*;

public class DeviceInfo
{
    private Context a;
    
    public DeviceInfo(final Context a) {
        this.a = a;
    }
    
    private native String encodeId(final String p0);
    
    public String getDeviceID() {
        final String deviceId = ((TelephonyManager)this.a.getSystemService("phone")).getDeviceId();
        if (deviceId == null || deviceId.length() == 0) {
            return "";
        }
        return this.encodeId(deviceId);
    }
    
    public String getModel() {
        return Build.MODEL;
    }
}
