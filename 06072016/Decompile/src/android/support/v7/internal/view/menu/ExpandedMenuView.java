package android.support.v7.internal.view.menu;

import android.content.*;
import android.util.*;
import android.support.v7.internal.widget.*;
import android.widget.*;
import android.view.*;

public final class ExpandedMenuView extends ListView implements ItemInvoker, MenuView, AdapterView$OnItemClickListener
{
    private static final int[] TINT_ATTRS;
    private int mAnimations;
    private MenuBuilder mMenu;
    
    static {
        TINT_ATTRS = new int[] { 16842964, 16843049 };
    }
    
    public ExpandedMenuView(final Context context, final AttributeSet set) {
        this(context, set, 16842868);
    }
    
    public ExpandedMenuView(final Context context, final AttributeSet set, final int n) {
        super(context, set);
        this.setOnItemClickListener((AdapterView$OnItemClickListener)this);
        final TintTypedArray obtainStyledAttributes = TintTypedArray.obtainStyledAttributes(context, set, ExpandedMenuView.TINT_ATTRS, n, 0);
        if (obtainStyledAttributes.hasValue(0)) {
            this.setBackgroundDrawable(obtainStyledAttributes.getDrawable(0));
        }
        if (obtainStyledAttributes.hasValue(1)) {
            this.setDivider(obtainStyledAttributes.getDrawable(1));
        }
        obtainStyledAttributes.recycle();
    }
    
    public int getWindowAnimations() {
        return this.mAnimations;
    }
    
    public void initialize(final MenuBuilder mMenu) {
        this.mMenu = mMenu;
    }
    
    public boolean invokeItem(final MenuItemImpl menuItemImpl) {
        return this.mMenu.performItemAction((MenuItem)menuItemImpl, 0);
    }
    
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.setChildrenDrawingCacheEnabled(false);
    }
    
    public void onItemClick(final AdapterView adapterView, final View view, final int n, final long n2) {
        this.invokeItem((MenuItemImpl)this.getAdapter().getItem(n));
    }
}
