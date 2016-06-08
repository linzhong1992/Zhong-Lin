package android.support.v4.text;

import java.util.*;
import android.util.*;
import java.lang.reflect.*;

public class ICUCompatApi23
{
    private static final String TAG = "ICUCompatIcs";
    private static Method sAddLikelySubtagsMethod;
    
    static {
        try {
            ICUCompatApi23.sAddLikelySubtagsMethod = Class.forName("libcore.icu.ICU").getMethod("addLikelySubtags", Locale.class);
        }
        catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
    }
    
    public static String maximizeAndGetScript(final Locale locale) {
        try {
            return ((Locale)ICUCompatApi23.sAddLikelySubtagsMethod.invoke(null, locale)).getScript();
        }
        catch (InvocationTargetException ex) {
            Log.w("ICUCompatIcs", (Throwable)ex);
        }
        catch (IllegalAccessException ex2) {
            Log.w("ICUCompatIcs", (Throwable)ex2);
            goto Label_0032;
        }
    }
}
