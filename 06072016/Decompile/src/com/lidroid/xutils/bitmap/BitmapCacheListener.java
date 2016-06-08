package com.lidroid.xutils.bitmap;

public interface BitmapCacheListener
{
    void onClearCacheFinished();
    
    void onClearCacheFinished(final String p0);
    
    void onClearDiskCacheFinished();
    
    void onClearDiskCacheFinished(final String p0);
    
    void onClearMemoryCacheFinished();
    
    void onClearMemoryCacheFinished(final String p0);
    
    void onCloseCacheFinished();
    
    void onFlushCacheFinished();
    
    void onInitDiskFinished();
    
    void onInitMemoryCacheFinished();
}
