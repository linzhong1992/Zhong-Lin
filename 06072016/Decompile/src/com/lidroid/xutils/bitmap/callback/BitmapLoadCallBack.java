package com.lidroid.xutils.bitmap.callback;

import android.view.*;
import android.widget.*;
import android.graphics.*;
import com.lidroid.xutils.bitmap.*;
import android.graphics.drawable.*;

public abstract class BitmapLoadCallBack<T extends View>
{
    private BitmapSetter<T> bitmapSetter;
    
    public Drawable getDrawable(final T t) {
        if (this.bitmapSetter != null) {
            return this.bitmapSetter.getDrawable(t);
        }
        if (t instanceof ImageView) {
            return ((ImageView)t).getDrawable();
        }
        return t.getBackground();
    }
    
    public abstract void onLoadCompleted(final T p0, final String p1, final Bitmap p2, final BitmapDisplayConfig p3, final BitmapLoadFrom p4);
    
    public abstract void onLoadFailed(final T p0, final String p1, final Drawable p2);
    
    public void onLoadStarted(final T t, final String s, final BitmapDisplayConfig bitmapDisplayConfig) {
    }
    
    public void onLoading(final T t, final String s, final BitmapDisplayConfig bitmapDisplayConfig, final long n, final long n2) {
    }
    
    public void onPreLoad(final T t, final String s, final BitmapDisplayConfig bitmapDisplayConfig) {
    }
    
    public void setBitmap(final T t, final Bitmap imageBitmap) {
        if (this.bitmapSetter != null) {
            this.bitmapSetter.setBitmap(t, imageBitmap);
            return;
        }
        if (t instanceof ImageView) {
            ((ImageView)t).setImageBitmap(imageBitmap);
            return;
        }
        t.setBackgroundDrawable((Drawable)new BitmapDrawable(t.getResources(), imageBitmap));
    }
    
    public void setBitmapSetter(final BitmapSetter<T> bitmapSetter) {
        this.bitmapSetter = bitmapSetter;
    }
    
    public void setDrawable(final T t, final Drawable drawable) {
        if (this.bitmapSetter != null) {
            this.bitmapSetter.setDrawable(t, drawable);
            return;
        }
        if (t instanceof ImageView) {
            ((ImageView)t).setImageDrawable(drawable);
            return;
        }
        t.setBackgroundDrawable(drawable);
    }
}
