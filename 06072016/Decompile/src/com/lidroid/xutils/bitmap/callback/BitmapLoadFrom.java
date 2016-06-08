package com.lidroid.xutils.bitmap.callback;

public enum BitmapLoadFrom
{
    DISK_CACHE("DISK_CACHE", 1), 
    MEMORY_CACHE("MEMORY_CACHE", 0), 
    URI("URI", 2);
    
    private BitmapLoadFrom(final String s, final int n) {
    }
}
