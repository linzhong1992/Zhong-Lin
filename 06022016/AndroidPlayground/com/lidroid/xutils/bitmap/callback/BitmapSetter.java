package com.lidroid.xutils.bitmap.callback;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.view.View;

public abstract interface BitmapSetter<T extends View>
{
  public abstract Drawable getDrawable(T paramT);
  
  public abstract void setBitmap(T paramT, Bitmap paramBitmap);
  
  public abstract void setDrawable(T paramT, Drawable paramDrawable);
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\callback\BitmapSetter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */