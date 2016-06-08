package com.alien.rfid;

import java.util.*;
import com.rscja.utility.*;

class ALRH450CusAPI
{
    public static final a a;
    public static final a b;
    public static final a c;
    public static final a d;
    public static final a e;
    
    static {
        a = new a(6, 240, 4);
        b = new a(6, 15, 0);
        c = new a(4, 192, 6);
        d = new a(4, 48, 4);
        e = new a(4, 8, 3);
        System.loadLibrary("aliencus");
    }
    
    public int a(final int[] array, final a a) {
        return (array[a.a] & a.b) >> a.c;
    }
    
    public void a(final int[] array, final a a, final int n) {
        final int a2 = a.a;
        array[a2] &= (0xFFFF & ~a.b);
        final int a3 = a.a;
        array[a3] |= (n << a.c & a.b);
    }
    
    public boolean a(final b b) {
        return this.a(this.singleInventory(), b);
    }
    
    public boolean a(final byte[] array, final b b) {
        if (array == null) {
            return false;
        }
        final byte[] copyOfRange = Arrays.copyOfRange(array, 0, 2);
        final int n = (copyOfRange[0] & 0xFF) >>> 3;
        final byte[] copyOfRange2 = Arrays.copyOfRange(array, 0, n * 2 + 2);
        final byte[] copyOfRange3 = Arrays.copyOfRange(array, array.length - 3, array.length - 1);
        final byte d = array[array.length - 1];
        b.a = com.rscja.utility.a.a(copyOfRange2, copyOfRange2.length);
        if (array.length - copyOfRange2.length - copyOfRange3.length - 1 == 12) {
            final int n2 = n * 2 + 2;
            Arrays.copyOfRange(array, n2, n2 + 12);
            b.b = com.rscja.utility.a.a(copyOfRange, copyOfRange.length);
        }
        b.d = d;
        b.c = -(65536 - Integer.parseInt(com.rscja.utility.a.a(copyOfRange3, copyOfRange3.length), 16)) / 10.0f;
        return true;
    }
    
    public boolean b(final b b) {
        return this.a(this.invGetTagInfo(), b);
    }
    
    public native void enableInventory(final boolean p0);
    
    public native int getFirmwareVersion();
    
    public native int getGen2Parameter(final int[] p0);
    
    public native int getHardwareVersion();
    
    public native long getModuleId();
    
    public native int getRegion();
    
    public native byte[] invGetTagInfo();
    
    public native int killTag(final String p0, final int p1, final int p2, final String p3, final int p4);
    
    public native int lockUnlockFields(final String p0, final int p1, final int p2, final String p3, final int p4, final String p5);
    
    public native String readData(final String p0, final int p1, final int p2, final String p3, final int p4, final int p5, final int p6, final int p7);
    
    public native int setFilter(final int p0, final int p1, final String p2, final int p3);
    
    public native int setGen2Parameter(final int[] p0);
    
    public native void setInvMaxTry(final int p0);
    
    public native void setInvReadWaitTime(final int p0);
    
    public native byte[] singleInventory();
    
    public native int writeData(final String p0, final int p1, final int p2, final String p3, final int p4, final int p5, final int p6, final int p7, final String p8);
    
    static class a
    {
        int a;
        int b;
        int c;
        
        a(final int a, final int b, final int c) {
            this.a = a;
            this.b = b;
            this.c = c;
        }
    }
    
    static class b
    {
        String a;
        String b;
        double c;
        int d;
    }
}
