package android.support.v4.view;

import android.view.*;

public class MenuCompat
{
    @Deprecated
    public static void setShowAsAction(final MenuItem menuItem, final int n) {
        MenuItemCompat.setShowAsAction(menuItem, n);
    }
}
