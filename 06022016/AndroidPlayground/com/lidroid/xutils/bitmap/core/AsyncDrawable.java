package com.lidroid.xutils.bitmap.core;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.view.View;
import com.lidroid.xutils.BitmapUtils.BitmapLoadTask;
import java.lang.ref.WeakReference;

public class AsyncDrawable<T extends View>
  extends Drawable
{
  private final Drawable baseDrawable;
  private final WeakReference<BitmapUtils.BitmapLoadTask<T>> bitmapLoadTaskReference;
  
  public AsyncDrawable(Drawable paramDrawable, BitmapUtils.BitmapLoadTask<T> paramBitmapLoadTask)
  {
    if (paramDrawable == null) {
      throw new IllegalArgumentException("drawable may not be null");
    }
    if (paramBitmapLoadTask == null) {
      throw new IllegalArgumentException("bitmapWorkerTask may not be null");
    }
    this.baseDrawable = paramDrawable;
    this.bitmapLoadTaskReference = new WeakReference(paramBitmapLoadTask);
  }
  
  public void clearColorFilter()
  {
    this.baseDrawable.clearColorFilter();
  }
  
  public void draw(Canvas paramCanvas)
  {
    this.baseDrawable.draw(paramCanvas);
  }
  
  public BitmapUtils.BitmapLoadTask<T> getBitmapWorkerTask()
  {
    return (BitmapUtils.BitmapLoadTask)this.bitmapLoadTaskReference.get();
  }
  
  public int getChangingConfigurations()
  {
    return this.baseDrawable.getChangingConfigurations();
  }
  
  public Drawable.ConstantState getConstantState()
  {
    return this.baseDrawable.getConstantState();
  }
  
  public Drawable getCurrent()
  {
    return this.baseDrawable.getCurrent();
  }
  
  public int getIntrinsicHeight()
  {
    return this.baseDrawable.getIntrinsicHeight();
  }
  
  public int getIntrinsicWidth()
  {
    return this.baseDrawable.getIntrinsicWidth();
  }
  
  public int getMinimumHeight()
  {
    return this.baseDrawable.getMinimumHeight();
  }
  
  public int getMinimumWidth()
  {
    return this.baseDrawable.getMinimumWidth();
  }
  
  public int getOpacity()
  {
    return this.baseDrawable.getOpacity();
  }
  
  public boolean getPadding(Rect paramRect)
  {
    return this.baseDrawable.getPadding(paramRect);
  }
  
  public int[] getState()
  {
    return this.baseDrawable.getState();
  }
  
  public Region getTransparentRegion()
  {
    return this.baseDrawable.getTransparentRegion();
  }
  
  public void invalidateSelf()
  {
    this.baseDrawable.invalidateSelf();
  }
  
  public boolean isStateful()
  {
    return this.baseDrawable.isStateful();
  }
  
  public Drawable mutate()
  {
    return this.baseDrawable.mutate();
  }
  
  public void scheduleSelf(Runnable paramRunnable, long paramLong)
  {
    this.baseDrawable.scheduleSelf(paramRunnable, paramLong);
  }
  
  public void setAlpha(int paramInt)
  {
    this.baseDrawable.setAlpha(paramInt);
  }
  
  public void setBounds(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.baseDrawable.setBounds(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setBounds(Rect paramRect)
  {
    this.baseDrawable.setBounds(paramRect);
  }
  
  public void setChangingConfigurations(int paramInt)
  {
    this.baseDrawable.setChangingConfigurations(paramInt);
  }
  
  public void setColorFilter(int paramInt, PorterDuff.Mode paramMode)
  {
    this.baseDrawable.setColorFilter(paramInt, paramMode);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    this.baseDrawable.setColorFilter(paramColorFilter);
  }
  
  public void setDither(boolean paramBoolean)
  {
    this.baseDrawable.setDither(paramBoolean);
  }
  
  public void setFilterBitmap(boolean paramBoolean)
  {
    this.baseDrawable.setFilterBitmap(paramBoolean);
  }
  
  public boolean setState(int[] paramArrayOfInt)
  {
    return this.baseDrawable.setState(paramArrayOfInt);
  }
  
  public boolean setVisible(boolean paramBoolean1, boolean paramBoolean2)
  {
    return this.baseDrawable.setVisible(paramBoolean1, paramBoolean2);
  }
  
  public void unscheduleSelf(Runnable paramRunnable)
  {
    this.baseDrawable.unscheduleSelf(paramRunnable);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\core\AsyncDrawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */