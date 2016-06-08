package android.support.design.internal;

import android.content.*;
import android.view.*;
import android.support.v7.internal.view.menu.*;

public class NavigationMenu extends MenuBuilder
{
    public NavigationMenu(final Context context) {
        super(context);
    }
    
    @Override
    public SubMenu addSubMenu(final int n, final int n2, final int n3, final CharSequence charSequence) {
        final MenuItemImpl menuItemImpl = (MenuItemImpl)this.addInternal(n, n2, n3, charSequence);
        final NavigationSubMenu subMenu = new NavigationSubMenu(this.getContext(), this, menuItemImpl);
        menuItemImpl.setSubMenu(subMenu);
        return (SubMenu)subMenu;
    }
}
