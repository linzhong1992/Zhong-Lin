package android.support.v7.internal.view.menu;

import android.content.*;
import android.support.v4.internal.view.*;
import android.graphics.drawable.*;
import android.view.*;

class SubMenuWrapperICS extends MenuWrapperICS implements SubMenu
{
    SubMenuWrapperICS(final Context context, final SupportSubMenu supportSubMenu) {
        super(context, supportSubMenu);
    }
    
    public void clearHeader() {
        this.getWrappedObject().clearHeader();
    }
    
    public MenuItem getItem() {
        return this.getMenuItemWrapper(this.getWrappedObject().getItem());
    }
    
    public SupportSubMenu getWrappedObject() {
        return (SupportSubMenu)this.mWrappedObject;
    }
    
    public SubMenu setHeaderIcon(final int headerIcon) {
        this.getWrappedObject().setHeaderIcon(headerIcon);
        return (SubMenu)this;
    }
    
    public SubMenu setHeaderIcon(final Drawable headerIcon) {
        this.getWrappedObject().setHeaderIcon(headerIcon);
        return (SubMenu)this;
    }
    
    public SubMenu setHeaderTitle(final int headerTitle) {
        this.getWrappedObject().setHeaderTitle(headerTitle);
        return (SubMenu)this;
    }
    
    public SubMenu setHeaderTitle(final CharSequence headerTitle) {
        this.getWrappedObject().setHeaderTitle(headerTitle);
        return (SubMenu)this;
    }
    
    public SubMenu setHeaderView(final View headerView) {
        this.getWrappedObject().setHeaderView(headerView);
        return (SubMenu)this;
    }
    
    public SubMenu setIcon(final int icon) {
        this.getWrappedObject().setIcon(icon);
        return (SubMenu)this;
    }
    
    public SubMenu setIcon(final Drawable icon) {
        this.getWrappedObject().setIcon(icon);
        return (SubMenu)this;
    }
}
