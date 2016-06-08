package android.support.design.widget;

import android.support.design.*;
import android.content.*;
import android.content.res.*;

class ThemeUtils
{
    private static final int[] APPCOMPAT_CHECK_ATTRS;
    
    static {
        APPCOMPAT_CHECK_ATTRS = new int[] { R.attr.colorPrimary };
    }
    
    static void checkAppCompatTheme(final Context context) {
        boolean b = false;
        final TypedArray obtainStyledAttributes = context.obtainStyledAttributes(ThemeUtils.APPCOMPAT_CHECK_ATTRS);
        if (!obtainStyledAttributes.hasValue(0)) {
            b = true;
        }
        if (obtainStyledAttributes != null) {
            obtainStyledAttributes.recycle();
        }
        if (b) {
            throw new IllegalArgumentException("You need to use a Theme.AppCompat theme (or descendant) with the design library.");
        }
    }
}
