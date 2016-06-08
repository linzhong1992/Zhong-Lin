package com.lidroid.xutils.bitmap.core;

import android.view.*;
import java.lang.ref.*;
import com.lidroid.xutils.*;
import android.graphics.drawable.*;
import android.graphics.*;

public class AsyncDrawable<T extends View> extends Drawable
{
    private final Drawable baseDrawable;
    private final WeakReference<BitmapUtils.BitmapLoadTask<T>> bitmapLoadTaskReference;
    
    public AsyncDrawable(final Drawable baseDrawable, final BitmapUtils.BitmapLoadTask<T> bitmapLoadTask) {
        if (baseDrawable == null) {
            throw new IllegalArgumentException("drawable may not be null");
        }
        if (bitmapLoadTask == null) {
            throw new IllegalArgumentException("bitmapWorkerTask may not be null");
        }
        this.baseDrawable = baseDrawable;
        this.bitmapLoadTaskReference = new WeakReference<BitmapUtils.BitmapLoadTask<T>>(bitmapLoadTask);
    }
    
    public void clearColorFilter() {
        this.baseDrawable.clearColorFilter();
    }
    
    public void draw(final Canvas canvas) {
        this.baseDrawable.draw(canvas);
    }
    
    public BitmapUtils.BitmapLoadTask<T> getBitmapWorkerTask() {
        return (BitmapUtils.BitmapLoadTask<T>)this.bitmapLoadTaskReference.get();
    }
    
    public int getChangingConfigurations() {
        return this.baseDrawable.getChangingConfigurations();
    }
    
    public Drawable$ConstantState getConstantState() {
        return this.baseDrawable.getConstantState();
    }
    
    public Drawable getCurrent() {
        return this.baseDrawable.getCurrent();
    }
    
    public int getIntrinsicHeight() {
        return this.baseDrawable.getIntrinsicHeight();
    }
    
    public int getIntrinsicWidth() {
        return this.baseDrawable.getIntrinsicWidth();
    }
    
    public int getMinimumHeight() {
        return this.baseDrawable.getMinimumHeight();
    }
    
    public int getMinimumWidth() {
        return this.baseDrawable.getMinimumWidth();
    }
    
    public int getOpacity() {
        return this.baseDrawable.getOpacity();
    }
    
    public boolean getPadding(final Rect rect) {
        return this.baseDrawable.getPadding(rect);
    }
    
    public int[] getState() {
        return this.baseDrawable.getState();
    }
    
    public Region getTransparentRegion() {
        return this.baseDrawable.getTransparentRegion();
    }
    
    public void invalidateSelf() {
        this.baseDrawable.invalidateSelf();
    }
    
    public boolean isStateful() {
        return this.baseDrawable.isStateful();
    }
    
    public Drawable mutate() {
        return this.baseDrawable.mutate();
    }
    
    public void scheduleSelf(final Runnable runnable, final long n) {
        this.baseDrawable.scheduleSelf(runnable, n);
    }
    
    public void setAlpha(final int alpha) {
        this.baseDrawable.setAlpha(alpha);
    }
    
    public void setBounds(final int n, final int n2, final int n3, final int n4) {
        this.baseDrawable.setBounds(n, n2, n3, n4);
    }
    
    public void setBounds(final Rect bounds) {
        this.baseDrawable.setBounds(bounds);
    }
    
    public void setChangingConfigurations(final int changingConfigurations) {
        this.baseDrawable.setChangingConfigurations(changingConfigurations);
    }
    
    public void setColorFilter(final int n, final PorterDuff$Mode porterDuff$Mode) {
        this.baseDrawable.setColorFilter(n, porterDuff$Mode);
    }
    
    public void setColorFilter(final ColorFilter colorFilter) {
        this.baseDrawable.setColorFilter(colorFilter);
    }
    
    public void setDither(final boolean dither) {
        this.baseDrawable.setDither(dither);
    }
    
    public void setFilterBitmap(final boolean filterBitmap) {
        this.baseDrawable.setFilterBitmap(filterBitmap);
    }
    
    public boolean setState(final int[] state) {
        return this.baseDrawable.setState(state);
    }
    
    public boolean setVisible(final boolean b, final boolean b2) {
        return this.baseDrawable.setVisible(b, b2);
    }
    
    public void unscheduleSelf(final Runnable runnable) {
        this.baseDrawable.unscheduleSelf(runnable);
    }
}
