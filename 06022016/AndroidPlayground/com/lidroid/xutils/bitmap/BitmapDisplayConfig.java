package com.lidroid.xutils.bitmap;

import android.graphics.Bitmap.Config;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import com.lidroid.xutils.bitmap.core.BitmapSize;

public class BitmapDisplayConfig
{
  private static final Drawable TRANSPARENT_DRAWABLE = new ColorDrawable(0);
  private Animation animation;
  private boolean autoRotation = false;
  private Bitmap.Config bitmapConfig = Bitmap.Config.RGB_565;
  private BitmapSize bitmapMaxSize;
  private Drawable loadFailedDrawable;
  private Drawable loadingDrawable;
  private boolean showOriginal = false;
  
  public BitmapDisplayConfig cloneNew()
  {
    BitmapDisplayConfig localBitmapDisplayConfig = new BitmapDisplayConfig();
    localBitmapDisplayConfig.bitmapMaxSize = this.bitmapMaxSize;
    localBitmapDisplayConfig.animation = this.animation;
    localBitmapDisplayConfig.loadingDrawable = this.loadingDrawable;
    localBitmapDisplayConfig.loadFailedDrawable = this.loadFailedDrawable;
    localBitmapDisplayConfig.autoRotation = this.autoRotation;
    localBitmapDisplayConfig.showOriginal = this.showOriginal;
    localBitmapDisplayConfig.bitmapConfig = this.bitmapConfig;
    return localBitmapDisplayConfig;
  }
  
  public Animation getAnimation()
  {
    return this.animation;
  }
  
  public Bitmap.Config getBitmapConfig()
  {
    return this.bitmapConfig;
  }
  
  public BitmapSize getBitmapMaxSize()
  {
    if (this.bitmapMaxSize == null) {
      return BitmapSize.ZERO;
    }
    return this.bitmapMaxSize;
  }
  
  public Drawable getLoadFailedDrawable()
  {
    if (this.loadFailedDrawable == null) {
      return TRANSPARENT_DRAWABLE;
    }
    return this.loadFailedDrawable;
  }
  
  public Drawable getLoadingDrawable()
  {
    if (this.loadingDrawable == null) {
      return TRANSPARENT_DRAWABLE;
    }
    return this.loadingDrawable;
  }
  
  public boolean isAutoRotation()
  {
    return this.autoRotation;
  }
  
  public boolean isShowOriginal()
  {
    return this.showOriginal;
  }
  
  public void setAnimation(Animation paramAnimation)
  {
    this.animation = paramAnimation;
  }
  
  public void setAutoRotation(boolean paramBoolean)
  {
    this.autoRotation = paramBoolean;
  }
  
  public void setBitmapConfig(Bitmap.Config paramConfig)
  {
    this.bitmapConfig = paramConfig;
  }
  
  public void setBitmapMaxSize(BitmapSize paramBitmapSize)
  {
    this.bitmapMaxSize = paramBitmapSize;
  }
  
  public void setLoadFailedDrawable(Drawable paramDrawable)
  {
    this.loadFailedDrawable = paramDrawable;
  }
  
  public void setLoadingDrawable(Drawable paramDrawable)
  {
    this.loadingDrawable = paramDrawable;
  }
  
  public void setShowOriginal(boolean paramBoolean)
  {
    this.showOriginal = paramBoolean;
  }
  
  public String toString()
  {
    if (isShowOriginal()) {
      return "";
    }
    return this.bitmapMaxSize.toString();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\BitmapDisplayConfig.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */