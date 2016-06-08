package com.lidroid.xutils.bitmap.core;

public class BitmapSize
{
    public static final BitmapSize ZERO;
    private int height;
    private int width;
    
    static {
        ZERO = new BitmapSize(0, 0);
    }
    
    public BitmapSize() {
    }
    
    public BitmapSize(final int width, final int height) {
        this.width = width;
        this.height = height;
    }
    
    public int getHeight() {
        return this.height;
    }
    
    public int getWidth() {
        return this.width;
    }
    
    public BitmapSize scale(final float n) {
        return new BitmapSize((int)(this.width * n), (int)(this.height * n));
    }
    
    public BitmapSize scaleDown(final int n) {
        return new BitmapSize(this.width / n, this.height / n);
    }
    
    public void setHeight(final int height) {
        this.height = height;
    }
    
    public void setWidth(final int width) {
        this.width = width;
    }
    
    @Override
    public String toString() {
        return "_" + this.width + "_" + this.height;
    }
}
