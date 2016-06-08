package android.support.v7.internal.view.menu;

import android.content.*;
import android.os.*;
import android.support.v4.internal.view.*;
import android.view.*;

public final class MenuWrapperFactory
{
    public static Menu wrapSupportMenu(final Context context, final SupportMenu supportMenu) {
        if (Build$VERSION.SDK_INT >= 14) {
            return (Menu)new MenuWrapperICS(context, supportMenu);
        }
        throw new UnsupportedOperationException();
    }
    
    public static MenuItem wrapSupportMenuItem(final Context context, final SupportMenuItem supportMenuItem) {
        if (Build$VERSION.SDK_INT >= 16) {
            return (MenuItem)new MenuItemWrapperJB(context, supportMenuItem);
        }
        if (Build$VERSION.SDK_INT >= 14) {
            return (MenuItem)new MenuItemWrapperICS(context, supportMenuItem);
        }
        throw new UnsupportedOperationException();
    }
    
    public static SubMenu wrapSupportSubMenu(final Context context, final SupportSubMenu supportSubMenu) {
        if (Build$VERSION.SDK_INT >= 14) {
            return (SubMenu)new SubMenuWrapperICS(context, supportSubMenu);
        }
        throw new UnsupportedOperationException();
    }
}
