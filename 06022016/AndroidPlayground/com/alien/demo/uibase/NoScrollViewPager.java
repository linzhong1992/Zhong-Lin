package com.alien.demo.uibase;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;

public class NoScrollViewPager
  extends LazyViewPager
{
  private boolean noScroll = true;
  
  public NoScrollViewPager(Context paramContext)
  {
    super(paramContext);
  }
  
  public NoScrollViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.noScroll) {
      return false;
    }
    return super.onInterceptTouchEvent(paramMotionEvent);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.noScroll) {
      return false;
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public void scrollTo(int paramInt1, int paramInt2)
  {
    super.scrollTo(paramInt1, paramInt2);
  }
  
  public void setCurrentItem(int paramInt)
  {
    super.setCurrentItem(paramInt);
  }
  
  public void setCurrentItem(int paramInt, boolean paramBoolean)
  {
    super.setCurrentItem(paramInt, paramBoolean);
  }
  
  public void setNoScroll(boolean paramBoolean)
  {
    this.noScroll = paramBoolean;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\uibase\NoScrollViewPager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */