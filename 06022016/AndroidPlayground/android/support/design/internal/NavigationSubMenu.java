package android.support.design.internal;

import android.content.Context;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.support.v7.internal.view.menu.SubMenuBuilder;
import android.view.MenuItem;

public class NavigationSubMenu
  extends SubMenuBuilder
{
  public NavigationSubMenu(Context paramContext, NavigationMenu paramNavigationMenu, MenuItemImpl paramMenuItemImpl)
  {
    super(paramContext, paramNavigationMenu, paramMenuItemImpl);
  }
  
  private void notifyParent()
  {
    ((MenuBuilder)getParentMenu()).onItemsChanged(true);
  }
  
  public MenuItem add(int paramInt)
  {
    MenuItem localMenuItem = super.add(paramInt);
    notifyParent();
    return localMenuItem;
  }
  
  public MenuItem add(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    MenuItem localMenuItem = super.add(paramInt1, paramInt2, paramInt3, paramInt4);
    notifyParent();
    return localMenuItem;
  }
  
  public MenuItem add(int paramInt1, int paramInt2, int paramInt3, CharSequence paramCharSequence)
  {
    paramCharSequence = super.add(paramInt1, paramInt2, paramInt3, paramCharSequence);
    notifyParent();
    return paramCharSequence;
  }
  
  public MenuItem add(CharSequence paramCharSequence)
  {
    paramCharSequence = super.add(paramCharSequence);
    notifyParent();
    return paramCharSequence;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\design\internal\NavigationSubMenu.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */