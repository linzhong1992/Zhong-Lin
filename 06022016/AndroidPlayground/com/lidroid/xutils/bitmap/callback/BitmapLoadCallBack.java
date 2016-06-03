package com.lidroid.xutils.bitmap.callback;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import com.lidroid.xutils.bitmap.BitmapDisplayConfig;

public abstract class BitmapLoadCallBack<T extends View>
{
  private BitmapSetter<T> bitmapSetter;
  
  public Drawable getDrawable(T paramT)
  {
    if (this.bitmapSetter != null) {
      return this.bitmapSetter.getDrawable(paramT);
    }
    if ((paramT instanceof ImageView)) {
      return ((ImageView)paramT).getDrawable();
    }
    return paramT.getBackground();
  }
  
  public abstract void onLoadCompleted(T paramT, String paramString, Bitmap paramBitmap, BitmapDisplayConfig paramBitmapDisplayConfig, BitmapLoadFrom paramBitmapLoadFrom);
  
  public abstract void onLoadFailed(T paramT, String paramString, Drawable paramDrawable);
  
  public void onLoadStarted(T paramT, String paramString, BitmapDisplayConfig paramBitmapDisplayConfig) {}
  
  public void onLoading(T paramT, String paramString, BitmapDisplayConfig paramBitmapDisplayConfig, long paramLong1, long paramLong2) {}
  
  public void onPreLoad(T paramT, String paramString, BitmapDisplayConfig paramBitmapDisplayConfig) {}
  
  public void setBitmap(T paramT, Bitmap paramBitmap)
  {
    if (this.bitmapSetter != null)
    {
      this.bitmapSetter.setBitmap(paramT, paramBitmap);
      return;
    }
    if ((paramT instanceof ImageView))
    {
      ((ImageView)paramT).setImageBitmap(paramBitmap);
      return;
    }
    paramT.setBackgroundDrawable(new BitmapDrawable(paramT.getResources(), paramBitmap));
  }
  
  public void setBitmapSetter(BitmapSetter<T> paramBitmapSetter)
  {
    this.bitmapSetter = paramBitmapSetter;
  }
  
  public void setDrawable(T paramT, Drawable paramDrawable)
  {
    if (this.bitmapSetter != null)
    {
      this.bitmapSetter.setDrawable(paramT, paramDrawable);
      return;
    }
    if ((paramT instanceof ImageView))
    {
      ((ImageView)paramT).setImageDrawable(paramDrawable);
      return;
    }
    paramT.setBackgroundDrawable(paramDrawable);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\callback\BitmapLoadCallBack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */