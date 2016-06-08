package com.lidroid.xutils.bitmap;

import android.view.animation.*;
import android.graphics.*;
import com.lidroid.xutils.bitmap.core.*;
import android.graphics.drawable.*;

public class BitmapDisplayConfig
{
    private static final Drawable TRANSPARENT_DRAWABLE;
    private Animation animation;
    private boolean autoRotation;
    private Bitmap$Config bitmapConfig;
    private BitmapSize bitmapMaxSize;
    private Drawable loadFailedDrawable;
    private Drawable loadingDrawable;
    private boolean showOriginal;
    
    static {
        TRANSPARENT_DRAWABLE = (Drawable)new ColorDrawable(0);
    }
    
    public BitmapDisplayConfig() {
        this.autoRotation = false;
        this.showOriginal = false;
        this.bitmapConfig = Bitmap$Config.RGB_565;
    }
    
    public BitmapDisplayConfig cloneNew() {
        final BitmapDisplayConfig bitmapDisplayConfig = new BitmapDisplayConfig();
        bitmapDisplayConfig.bitmapMaxSize = this.bitmapMaxSize;
        bitmapDisplayConfig.animation = this.animation;
        bitmapDisplayConfig.loadingDrawable = this.loadingDrawable;
        bitmapDisplayConfig.loadFailedDrawable = this.loadFailedDrawable;
        bitmapDisplayConfig.autoRotation = this.autoRotation;
        bitmapDisplayConfig.showOriginal = this.showOriginal;
        bitmapDisplayConfig.bitmapConfig = this.bitmapConfig;
        return bitmapDisplayConfig;
    }
    
    public Animation getAnimation() {
        return this.animation;
    }
    
    public Bitmap$Config getBitmapConfig() {
        return this.bitmapConfig;
    }
    
    public BitmapSize getBitmapMaxSize() {
        if (this.bitmapMaxSize == null) {
            return BitmapSize.ZERO;
        }
        return this.bitmapMaxSize;
    }
    
    public Drawable getLoadFailedDrawable() {
        if (this.loadFailedDrawable == null) {
            return BitmapDisplayConfig.TRANSPARENT_DRAWABLE;
        }
        return this.loadFailedDrawable;
    }
    
    public Drawable getLoadingDrawable() {
        if (this.loadingDrawable == null) {
            return BitmapDisplayConfig.TRANSPARENT_DRAWABLE;
        }
        return this.loadingDrawable;
    }
    
    public boolean isAutoRotation() {
        return this.autoRotation;
    }
    
    public boolean isShowOriginal() {
        return this.showOriginal;
    }
    
    public void setAnimation(final Animation animation) {
        this.animation = animation;
    }
    
    public void setAutoRotation(final boolean autoRotation) {
        this.autoRotation = autoRotation;
    }
    
    public void setBitmapConfig(final Bitmap$Config bitmapConfig) {
        this.bitmapConfig = bitmapConfig;
    }
    
    public void setBitmapMaxSize(final BitmapSize bitmapMaxSize) {
        this.bitmapMaxSize = bitmapMaxSize;
    }
    
    public void setLoadFailedDrawable(final Drawable loadFailedDrawable) {
        this.loadFailedDrawable = loadFailedDrawable;
    }
    
    public void setLoadingDrawable(final Drawable loadingDrawable) {
        this.loadingDrawable = loadingDrawable;
    }
    
    public void setShowOriginal(final boolean showOriginal) {
        this.showOriginal = showOriginal;
    }
    
    @Override
    public String toString() {
        if (this.isShowOriginal()) {
            return "";
        }
        return this.bitmapMaxSize.toString();
    }
}
