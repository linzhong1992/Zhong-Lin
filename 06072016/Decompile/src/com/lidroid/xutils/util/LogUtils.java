package com.lidroid.xutils.util;

import android.util.*;
import android.text.*;

public class LogUtils
{
    public static boolean allowD;
    public static boolean allowE;
    public static boolean allowI;
    public static boolean allowV;
    public static boolean allowW;
    public static boolean allowWtf;
    public static CustomLogger customLogger;
    public static String customTagPrefix;
    
    static {
        LogUtils.customTagPrefix = "";
        LogUtils.allowD = true;
        LogUtils.allowE = true;
        LogUtils.allowI = true;
        LogUtils.allowV = true;
        LogUtils.allowW = true;
        LogUtils.allowWtf = true;
    }
    
    public static void d(final String s) {
        if (!LogUtils.allowD) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.d(generateTag, s);
            return;
        }
        Log.d(generateTag, s);
    }
    
    public static void d(final String s, final Throwable t) {
        if (!LogUtils.allowD) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.d(generateTag, s, t);
            return;
        }
        Log.d(generateTag, s, t);
    }
    
    public static void e(final String s) {
        if (!LogUtils.allowE) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.e(generateTag, s);
            return;
        }
        Log.e(generateTag, s);
    }
    
    public static void e(final String s, final Throwable t) {
        if (!LogUtils.allowE) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.e(generateTag, s, t);
            return;
        }
        Log.e(generateTag, s, t);
    }
    
    private static String generateTag(final StackTraceElement stackTraceElement) {
        final String className = stackTraceElement.getClassName();
        final String format = String.format("%s.%s(L:%d)", className.substring(className.lastIndexOf(".") + 1), stackTraceElement.getMethodName(), stackTraceElement.getLineNumber());
        if (TextUtils.isEmpty((CharSequence)LogUtils.customTagPrefix)) {
            return format;
        }
        return String.valueOf(LogUtils.customTagPrefix) + ":" + format;
    }
    
    public static void i(final String s) {
        if (!LogUtils.allowI) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.i(generateTag, s);
            return;
        }
        Log.i(generateTag, s);
    }
    
    public static void i(final String s, final Throwable t) {
        if (!LogUtils.allowI) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.i(generateTag, s, t);
            return;
        }
        Log.i(generateTag, s, t);
    }
    
    public static void v(final String s) {
        if (!LogUtils.allowV) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.v(generateTag, s);
            return;
        }
        Log.v(generateTag, s);
    }
    
    public static void v(final String s, final Throwable t) {
        if (!LogUtils.allowV) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.v(generateTag, s, t);
            return;
        }
        Log.v(generateTag, s, t);
    }
    
    public static void w(final String s) {
        if (!LogUtils.allowW) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.w(generateTag, s);
            return;
        }
        Log.w(generateTag, s);
    }
    
    public static void w(final String s, final Throwable t) {
        if (!LogUtils.allowW) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.w(generateTag, s, t);
            return;
        }
        Log.w(generateTag, s, t);
    }
    
    public static void w(final Throwable t) {
        if (!LogUtils.allowW) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.w(generateTag, t);
            return;
        }
        Log.w(generateTag, t);
    }
    
    public static void wtf(final String s) {
        if (!LogUtils.allowWtf) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.wtf(generateTag, s);
            return;
        }
        Log.wtf(generateTag, s);
    }
    
    public static void wtf(final String s, final Throwable t) {
        if (!LogUtils.allowWtf) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.wtf(generateTag, s, t);
            return;
        }
        Log.wtf(generateTag, s, t);
    }
    
    public static void wtf(final Throwable t) {
        if (!LogUtils.allowWtf) {
            return;
        }
        final String generateTag = generateTag(OtherUtils.getCallerStackTraceElement());
        if (LogUtils.customLogger != null) {
            LogUtils.customLogger.wtf(generateTag, t);
            return;
        }
        Log.wtf(generateTag, t);
    }
    
    public interface CustomLogger
    {
        void d(final String p0, final String p1);
        
        void d(final String p0, final String p1, final Throwable p2);
        
        void e(final String p0, final String p1);
        
        void e(final String p0, final String p1, final Throwable p2);
        
        void i(final String p0, final String p1);
        
        void i(final String p0, final String p1, final Throwable p2);
        
        void v(final String p0, final String p1);
        
        void v(final String p0, final String p1, final Throwable p2);
        
        void w(final String p0, final String p1);
        
        void w(final String p0, final String p1, final Throwable p2);
        
        void w(final String p0, final Throwable p1);
        
        void wtf(final String p0, final String p1);
        
        void wtf(final String p0, final String p1, final Throwable p2);
        
        void wtf(final String p0, final Throwable p1);
    }
}
