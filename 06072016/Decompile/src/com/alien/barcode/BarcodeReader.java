package com.alien.barcode;

import com.zebra.adc.decoder.*;
import android.content.*;
import java.util.*;

public class BarcodeReader
{
    private static a a;
    private static BarcodeCallback b;
    
    public BarcodeReader(final Context context) {
        if (BarcodeReader.a == null) {
            BarcodeReader.a = com.zebra.adc.decoder.a.a();
            if (BarcodeReader.a != null && BarcodeReader.a.a(context)) {
                BarcodeReader.a.a(324, 1);
                BarcodeReader.a.a(300, 0);
                BarcodeReader.a.a(361, 0);
            }
        }
        BarcodeReader.a.a((a.a)new a.a() {
            @Override
            public void a(final int n, final int n2, final byte[] array) {
                if (n2 > 0 && array != null && n2 > 0 && BarcodeReader.b != null) {
                    BarcodeReader.b.onBarcodeRead(new String(Arrays.copyOf(array, n2)));
                }
                BarcodeReader.b = null;
            }
        });
    }
    
    public boolean isRunning() {
        boolean b = false;
        if (BarcodeReader.a == null) {
            return false;
        }
        synchronized (BarcodeReader.a) {
            if (BarcodeReader.b != null) {
                b = true;
            }
            return b;
        }
    }
    
    public void start(final BarcodeCallback barcodeCallback) {
        if (BarcodeReader.a == null) {
            return;
        }
        synchronized (BarcodeReader.a) {
            if (BarcodeReader.b != null) {
                return;
            }
        }
        final BarcodeCallback b;
        BarcodeReader.b = b;
        BarcodeReader.a.b();
    }
    // monitorexit(a)
    
    public void stop() {
        if (BarcodeReader.a == null) {
            return;
        }
        synchronized (BarcodeReader.a) {
            if (BarcodeReader.b == null) {
                return;
            }
        }
        BarcodeReader.a.c();
        BarcodeReader.b = null;
    }
    // monitorexit(a)
}
