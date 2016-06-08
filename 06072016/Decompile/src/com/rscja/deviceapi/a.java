package com.rscja.deviceapi;

import android.util.*;

public class a extends com.rscja.deviceapi.b
{
    private static a c;
    protected c a;
    
    static {
        a.c = null;
    }
    
    private a() throws a {
        this.a = com.rscja.deviceapi.c.b();
    }
    
    public static a b() throws a {
        synchronized (a.class) {
            if (a.c == null) {
                a.c = new a();
            }
            return a.c;
        }
    }
    
    protected DeviceAPI a() {
        return DeviceAPI.a();
    }
    
    public String a(final b b, final b b2, final b b3, final b b4, final b b5) {
        while (true) {
            while (true) {
                final byte a2;
                final byte a3;
                final byte a4;
                final byte a5;
                final byte[] array2;
                Label_0173: {
                    final byte a;
                    Label_0120: {
                        synchronized (this) {
                            a = b.f;
                            a2 = b2.f;
                            a3 = b3.f;
                            a4 = b4.f;
                            a5 = b5.f;
                            final byte[] array = { 0, 0, 0 };
                            if (a == 1) {
                                array[0] |= 0xC;
                                array[1] |= 0x2;
                                break Label_0173;
                            }
                            if (a == 2) {
                                array[0] |= 0xC;
                                array[1] = array[1];
                                break Label_0173;
                            }
                            break Label_0120;
                            return com.rscja.utility.a.a(array2, array2.length);
                        }
                    }
                    if (a == 3) {
                        array2[0] |= 0xC;
                        array2[1] |= 0x3;
                    }
                    else if (a == 4) {
                        array2[0] |= 0xC;
                        array2[1] |= 0x1;
                    }
                    else {
                        array2[0] &= 0x3;
                        array2[1] &= (byte)252;
                    }
                }
                if (a2 == 1) {
                    array2[0] |= 0x3;
                    array2[2] |= (byte)128;
                }
                else if (a2 == 2) {
                    array2[0] |= 0x3;
                    array2[2] = array2[2];
                }
                else if (a2 == 3) {
                    array2[0] |= 0x3;
                    array2[2] |= (byte)192;
                }
                else if (a2 == 4) {
                    array2[0] |= 0x3;
                    array2[2] |= 0x40;
                }
                else {
                    array2[0] &= 0xC;
                    array2[2] &= 0x3F;
                }
                if (a3 == 1) {
                    array2[1] |= (byte)192;
                    array2[2] |= 0x20;
                }
                else if (a3 == 2) {
                    array2[1] |= (byte)192;
                    array2[2] = array2[2];
                }
                else if (a3 == 3) {
                    array2[1] |= (byte)192;
                    array2[2] |= 0x30;
                }
                else if (a3 == 4) {
                    array2[1] |= (byte)192;
                    array2[2] |= 0x10;
                }
                else {
                    array2[1] &= 0x3F;
                    array2[2] &= (byte)207;
                }
                if (a4 == 1) {
                    array2[1] |= 0x30;
                    array2[2] |= 0x8;
                }
                else if (a4 == 2) {
                    array2[1] |= 0x30;
                    array2[2] = array2[2];
                }
                else if (a4 == 3) {
                    array2[1] |= 0x30;
                    array2[2] |= 0xC;
                }
                else if (a4 == 4) {
                    array2[1] |= 0x30;
                    array2[2] |= 0x4;
                }
                else {
                    array2[1] &= (byte)207;
                    array2[2] &= (byte)243;
                }
                if (a5 == 1) {
                    array2[1] |= 0xC;
                    array2[2] |= 0x2;
                    continue;
                }
                if (a5 == 2) {
                    array2[1] |= 0xC;
                    array2[2] = array2[2];
                    continue;
                }
                if (a5 == 3) {
                    array2[1] |= 0xC;
                    array2[2] |= 0x3;
                    continue;
                }
                if (a5 == 4) {
                    array2[1] |= 0xC;
                    array2[2] |= 0x1;
                    continue;
                }
                array2[1] &= (byte)243;
                array2[2] &= (byte)252;
                continue;
            }
        }
    }
    
    public boolean a(int uhfSetPower) {
        synchronized (this) {
            uhfSetPower = this.a().UHFSetPower((char)uhfSetPower);
            boolean b;
            if (uhfSetPower == 0) {
                b = true;
            }
            else {
                Log.e("RFIDWithUHF", "setPower() err :" + uhfSetPower);
                b = false;
            }
            return b;
        }
    }
    
    public boolean a(int uhfInventory_EX, final int n) {
        synchronized (this) {
            uhfInventory_EX = this.a().UHFInventory_EX((char)uhfInventory_EX, (char)n);
            boolean b;
            if (uhfInventory_EX == 0) {
                b = true;
            }
            else {
                Log.e("RFIDWithUHF", "startInventory() err :" + uhfInventory_EX);
                b = false;
            }
            return b;
        }
    }
    
    public boolean c() {
        while (true) {
            boolean b = true;
            synchronized (this) {
                final int uhfInit = this.a().UHFInit(this.a.c());
                if (uhfInit == 0) {
                    final int uhfOpenAndConnect = this.a().UHFOpenAndConnect(this.a.d());
                    if (uhfOpenAndConnect == 0) {
                        this.a(true);
                        return b;
                    }
                    Log.e("RFIDWithUHF", "init() err UHFOpenAndConnect result:" + uhfOpenAndConnect);
                }
                else {
                    Log.e("RFIDWithUHF", "init() err UHFInit result:" + uhfInit);
                }
            }
            b = false;
            return b;
        }
    }
    
    public boolean d() {
        boolean b = false;
        synchronized (this) {
            this.a().UHFCloseAndDisconnect();
            final int uhfFree = this.a().UHFFree(this.a.c());
            if (uhfFree == 0) {
                this.a(false);
                b = true;
            }
            else {
                Log.e("RFIDWithUHF", "free() err UHFFree result:" + uhfFree);
            }
            return b;
        }
    }
    
    public int e() {
        synchronized (this) {
            final char[] uhfGetPower = this.a().UHFGetPower();
            int n;
            if (uhfGetPower != null && uhfGetPower[0] == '\0') {
                n = uhfGetPower[1];
            }
            else {
                Log.e("RFIDWithUHF", "getPower() err :" + (int)uhfGetPower[0]);
                n = -1;
            }
            return n;
        }
    }
    
    public boolean f() {
        synchronized (this) {
            final int uhfStopGet = this.a().UHFStopGet();
            boolean b;
            if (uhfStopGet == 0) {
                b = true;
            }
            else {
                Log.e("RFIDWithUHF", "stopInventory() err :" + uhfStopGet);
                b = false;
            }
            return b;
        }
    }
    
    public enum a
    {
        a("RESERVED", 0, (byte)0), 
        b("UII", 1, (byte)1), 
        c("TID", 2, (byte)2), 
        d("USER", 3, (byte)3);
        
        private final byte e;
        
        static {
            f = new a[] { a.a, a.b, a.c, a.d };
        }
        
        private a(final String s, final int n, final byte e) {
            this.e = e;
        }
    }
    
    public enum b
    {
        a("HOLD", 0, (byte)0), 
        b("LOCK", 1, (byte)1), 
        c("UNLOCK", 2, (byte)2), 
        d("PLOCK", 3, (byte)3), 
        e("PUNLOCK", 4, (byte)4);
        
        private final byte f;
        
        static {
            g = new b[] { b.a, b.b, b.c, b.d, b.e };
        }
        
        private b(final String s, final int n, final byte f) {
            this.f = f;
        }
    }
}
