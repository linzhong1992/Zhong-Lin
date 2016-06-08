package android.support.v4.text;

import android.os.*;
import java.util.*;

public class ICUCompat
{
    private static final ICUCompatImpl IMPL;
    
    static {
        final int sdk_INT = Build$VERSION.SDK_INT;
        if (sdk_INT >= 21) {
            IMPL = (ICUCompatImpl)new ICUCompatImplLollipop();
            return;
        }
        if (sdk_INT >= 14) {
            IMPL = (ICUCompatImpl)new ICUCompatImplIcs();
            return;
        }
        IMPL = (ICUCompatImpl)new ICUCompatImplBase();
    }
    
    public static String maximizeAndGetScript(final Locale locale) {
        return ICUCompat.IMPL.maximizeAndGetScript(locale);
    }
    
    interface ICUCompatImpl
    {
        String maximizeAndGetScript(final Locale p0);
    }
    
    static class ICUCompatImplBase implements ICUCompatImpl
    {
        @Override
        public String maximizeAndGetScript(final Locale locale) {
            return null;
        }
    }
    
    static class ICUCompatImplIcs implements ICUCompatImpl
    {
        @Override
        public String maximizeAndGetScript(final Locale locale) {
            return ICUCompatIcs.maximizeAndGetScript(locale);
        }
    }
    
    static class ICUCompatImplLollipop implements ICUCompatImpl
    {
        @Override
        public String maximizeAndGetScript(final Locale locale) {
            return ICUCompatApi23.maximizeAndGetScript(locale);
        }
    }
}
