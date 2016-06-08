package android.support.v7.widget;

import android.content.*;
import android.support.v7.appcompat.*;
import android.support.v7.internal.view.*;
import android.support.annotation.*;
import android.support.v7.internal.view.menu.*;
import android.view.*;

public class PopupMenu implements MenuBuilder.Callback, MenuPresenter.Callback
{
    private View mAnchor;
    private Context mContext;
    private OnDismissListener mDismissListener;
    private View$OnTouchListener mDragListener;
    private MenuBuilder mMenu;
    private OnMenuItemClickListener mMenuItemClickListener;
    private MenuPopupHelper mPopup;
    
    public PopupMenu(final Context context, final View view) {
        this(context, view, 0);
    }
    
    public PopupMenu(final Context context, final View view, final int n) {
        this(context, view, n, R.attr.popupMenuStyle, 0);
    }
    
    public PopupMenu(final Context mContext, final View mAnchor, final int gravity, final int n, final int n2) {
        this.mContext = mContext;
        (this.mMenu = new MenuBuilder(mContext)).setCallback((MenuBuilder.Callback)this);
        this.mAnchor = mAnchor;
        (this.mPopup = new MenuPopupHelper(mContext, this.mMenu, mAnchor, false, n, n2)).setGravity(gravity);
        this.mPopup.setCallback(this);
    }
    
    public void dismiss() {
        this.mPopup.dismiss();
    }
    
    public View$OnTouchListener getDragToOpenListener() {
        if (this.mDragListener == null) {
            this.mDragListener = (View$OnTouchListener)new ListPopupWindow.ForwardingListener(this.mAnchor) {
                @Override
                public ListPopupWindow getPopup() {
                    return PopupMenu.this.mPopup.getPopup();
                }
                
                @Override
                protected boolean onForwardingStarted() {
                    PopupMenu.this.show();
                    return true;
                }
                
                @Override
                protected boolean onForwardingStopped() {
                    PopupMenu.this.dismiss();
                    return true;
                }
            };
        }
        return this.mDragListener;
    }
    
    public int getGravity() {
        return this.mPopup.getGravity();
    }
    
    public Menu getMenu() {
        return (Menu)this.mMenu;
    }
    
    public MenuInflater getMenuInflater() {
        return new SupportMenuInflater(this.mContext);
    }
    
    public void inflate(@MenuRes final int n) {
        this.getMenuInflater().inflate(n, (Menu)this.mMenu);
    }
    
    @Override
    public void onCloseMenu(final MenuBuilder menuBuilder, final boolean b) {
        if (this.mDismissListener != null) {
            this.mDismissListener.onDismiss(this);
        }
    }
    
    public void onCloseSubMenu(final SubMenuBuilder subMenuBuilder) {
    }
    
    @Override
    public boolean onMenuItemSelected(final MenuBuilder menuBuilder, final MenuItem menuItem) {
        return this.mMenuItemClickListener != null && this.mMenuItemClickListener.onMenuItemClick(menuItem);
    }
    
    @Override
    public void onMenuModeChange(final MenuBuilder menuBuilder) {
    }
    
    @Override
    public boolean onOpenSubMenu(final MenuBuilder menuBuilder) {
        boolean b = true;
        if (menuBuilder == null) {
            b = false;
        }
        else if (menuBuilder.hasVisibleItems()) {
            new MenuPopupHelper(this.mContext, menuBuilder, this.mAnchor).show();
            return true;
        }
        return b;
    }
    
    public void setGravity(final int gravity) {
        this.mPopup.setGravity(gravity);
    }
    
    public void setOnDismissListener(final OnDismissListener mDismissListener) {
        this.mDismissListener = mDismissListener;
    }
    
    public void setOnMenuItemClickListener(final OnMenuItemClickListener mMenuItemClickListener) {
        this.mMenuItemClickListener = mMenuItemClickListener;
    }
    
    public void show() {
        this.mPopup.show();
    }
    
    public interface OnDismissListener
    {
        void onDismiss(final PopupMenu p0);
    }
    
    public interface OnMenuItemClickListener
    {
        boolean onMenuItemClick(final MenuItem p0);
    }
}
