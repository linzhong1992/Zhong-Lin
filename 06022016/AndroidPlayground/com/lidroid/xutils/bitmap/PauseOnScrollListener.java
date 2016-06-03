package com.lidroid.xutils.bitmap;

import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import com.lidroid.xutils.BitmapUtils;

public class PauseOnScrollListener
  implements AbsListView.OnScrollListener
{
  private BitmapUtils bitmapUtils;
  private final AbsListView.OnScrollListener externalListener;
  private final boolean pauseOnFling;
  private final boolean pauseOnScroll;
  
  public PauseOnScrollListener(BitmapUtils paramBitmapUtils, boolean paramBoolean1, boolean paramBoolean2)
  {
    this(paramBitmapUtils, paramBoolean1, paramBoolean2, null);
  }
  
  public PauseOnScrollListener(BitmapUtils paramBitmapUtils, boolean paramBoolean1, boolean paramBoolean2, AbsListView.OnScrollListener paramOnScrollListener)
  {
    this.bitmapUtils = paramBitmapUtils;
    this.pauseOnScroll = paramBoolean1;
    this.pauseOnFling = paramBoolean2;
    this.externalListener = paramOnScrollListener;
  }
  
  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if (this.externalListener != null) {
      this.externalListener.onScroll(paramAbsListView, paramInt1, paramInt2, paramInt3);
    }
  }
  
  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    switch (paramInt)
    {
    }
    for (;;)
    {
      if (this.externalListener != null) {
        this.externalListener.onScrollStateChanged(paramAbsListView, paramInt);
      }
      return;
      this.bitmapUtils.resumeTasks();
      continue;
      if (this.pauseOnScroll)
      {
        this.bitmapUtils.pauseTasks();
        continue;
        if (this.pauseOnFling) {
          this.bitmapUtils.pauseTasks();
        }
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\PauseOnScrollListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */