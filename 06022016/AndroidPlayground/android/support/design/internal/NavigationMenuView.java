package android.support.design.internal;

import android.content.Context;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuView;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;

public class NavigationMenuView
  extends RecyclerView
  implements MenuView
{
  public NavigationMenuView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NavigationMenuView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public NavigationMenuView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public int getWindowAnimations()
  {
    return 0;
  }
  
  public void initialize(MenuBuilder paramMenuBuilder) {}
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\design\internal\NavigationMenuView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */