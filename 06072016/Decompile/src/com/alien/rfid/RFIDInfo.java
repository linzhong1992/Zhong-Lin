package com.alien.rfid;

public enum RFIDInfo
{
    FIRMWARE_VER("FIRMWARE_VER", 0), 
    HARDWARE_VER("HARDWARE_VER", 1), 
    MODULE_ID("MODULE_ID", 2), 
    REGION("REGION", 3);
    
    private RFIDInfo(final String s, final int n) {
    }
}
