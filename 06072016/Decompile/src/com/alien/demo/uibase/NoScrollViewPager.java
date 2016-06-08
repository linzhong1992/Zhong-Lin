package com.alien.demo.uibase;

import android.content.*;
import android.util.*;
import android.view.*;

public class NoScrollViewPager extends LazyViewPager
{
    private boolean noScroll;
    
    public NoScrollViewPager(final Context context) {
        super(context);
        this.noScroll = true;
    }
    
    public NoScrollViewPager(final Context context, final AttributeSet set) {
        super(context, set);
        this.noScroll = true;
    }
    
    @Override
    public boolean onInterceptTouchEvent(final MotionEvent motionEvent) {
        return !this.noScroll && super.onInterceptTouchEvent(motionEvent);
    }
    
    @Override
    public boolean onTouchEvent(final MotionEvent motionEvent) {
        return !this.noScroll && super.onTouchEvent(motionEvent);
    }
    
    public void scrollTo(final int n, final int n2) {
        super.scrollTo(n, n2);
    }
    
    @Override
    public void setCurrentItem(final int currentItem) {
        super.setCurrentItem(currentItem);
    }
    
    @Override
    public void setCurrentItem(final int n, final boolean b) {
        super.setCurrentItem(n, b);
    }
    
    public void setNoScroll(final boolean noScroll) {
        this.noScroll = noScroll;
    }
}
