package com.rscja.deviceapi;

import android.os.*;
import com.rscja.deviceapi.exception.*;

final class c
{
    private static String a;
    private String b;
    private String c;
    private int d;
    
    static {
        if (!(c.a = Build.DISPLAY.toUpperCase()).contains("C4000") && !c.a.contains("40006577")) {
            if (c.a.contains("40006582")) {
                c.a = "C40006582";
                return;
            }
            if (c.a.contains("40506582")) {
                c.a = "C40506582";
                return;
            }
        }
        c.a = "C4000";
    }
    
    private c(final String b, final String c, final int d) {
        this.b = b;
        this.c = c;
        this.d = d;
    }
    
    public static String a() {
        if (c.a.equals("i760")) {
            return "C4000";
        }
        return c.a.toUpperCase();
    }
    
    public static c b() throws a {
        return new c(a(), "/dev/ttyMT3", 115200);
    }
    
    public final String c() {
        return this.b;
    }
    
    public final String d() {
        return this.c;
    }
}
