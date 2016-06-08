package com.zebra.adc.decoder;

import android.os.*;
import android.content.*;
import android.util.*;

public class a
{
    private static final String a;
    private static a c;
    private BarCodeReader b;
    
    static {
        a = a.class.getSimpleName();
        System.loadLibrary("IAL");
        System.loadLibrary("SDL");
        if (Build$VERSION.SDK_INT >= 19) {
            System.loadLibrary("barcodereader44");
        }
        else if (Build$VERSION.SDK_INT >= 18) {
            System.loadLibrary("barcodereader43");
        }
        else {
            System.loadLibrary("barcodereader");
        }
        com.zebra.adc.decoder.a.c = null;
    }
    
    private a() {
        this.b = null;
    }
    
    public static a a() {
        synchronized (a.class) {
            if (com.zebra.adc.decoder.a.c == null) {
                com.zebra.adc.decoder.a.c = new a();
            }
            return com.zebra.adc.decoder.a.c;
        }
    }
    
    public void a(final a a) {
        synchronized (this) {
            if (this.b != null) {
                this.b.setDecodeCallback((BarCodeReader.DecodeCallback)new BarCodeReader.DecodeCallback() {
                    @Override
                    public void onDecodeComplete(final int n, final int n2, final byte[] array, final BarCodeReader barCodeReader) {
                        if (n2 == -3) {
                            return;
                        }
                        a.a(n, n2, array);
                    }
                    
                    @Override
                    public void onEvent(final int n, final int n2, final byte[] array, final BarCodeReader barCodeReader) {
                    }
                });
            }
        }
    }
    
    public boolean a(final int n, final int n2) {
        return this.b != null && this.b.setParameter(n, n2) == 0;
    }
    
    public boolean a(final Context context) {
        while (true) {
            boolean b = false;
            synchronized (this) {
                try {
                    if (Build$VERSION.SDK_INT >= 18) {
                        this.b = BarCodeReader.open(context);
                    }
                    else {
                        this.b = BarCodeReader.open();
                    }
                    if (this.b == null) {
                        return b;
                    }
                }
                catch (Exception ex) {
                    ex.printStackTrace();
                    return b;
                }
            }
            this.b.setParameter(765, 0);
            Log.i(com.zebra.adc.decoder.a.a, "open() succ");
            b = true;
            return b;
        }
    }
    
    public void b() {
        synchronized (this) {
            Log.i(com.zebra.adc.decoder.a.a, "scan() ok");
            if (this.b != null) {
                this.b.startDecode();
            }
        }
    }
    
    public void c() {
        synchronized (this) {
            if (this.b != null) {
                this.b.stopDecode();
            }
        }
    }
    
    public interface a
    {
        void a(final int p0, final int p1, final byte[] p2);
    }
}
