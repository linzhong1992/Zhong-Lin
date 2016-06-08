package com.lidroid.xutils.bitmap;

import com.lidroid.xutils.bitmap.core.*;
import android.content.*;
import java.util.concurrent.atomic.*;
import android.app.*;
import java.util.concurrent.*;
import android.text.*;
import com.lidroid.xutils.bitmap.download.*;
import com.lidroid.xutils.util.core.*;
import com.lidroid.xutils.util.*;

public class BitmapGlobalConfig
{
    public static final int MIN_DISK_CACHE_SIZE = 10485760;
    public static final int MIN_MEMORY_CACHE_SIZE = 2097152;
    private static final ThreadFactory sThreadFactory;
    private boolean _dirty_params_bitmapLoadExecutor;
    private BitmapCache bitmapCache;
    private BitmapCacheListener bitmapCacheListener;
    private ExecutorService bitmapLoadExecutor;
    private long defaultCacheExpiry;
    private int defaultConnectTimeout;
    private int defaultReadTimeout;
    private boolean diskCacheEnabled;
    private LruDiskCache.DiskCacheFileNameGenerator diskCacheFileNameGenerator;
    private String diskCachePath;
    private int diskCacheSize;
    private Downloader downloader;
    private Context mContext;
    private boolean memoryCacheEnabled;
    private int memoryCacheSize;
    private int threadPoolSize;
    
    static {
        sThreadFactory = new ThreadFactory() {
            private final AtomicInteger mCount = new AtomicInteger(1);
            
            @Override
            public Thread newThread(final Runnable runnable) {
                final Thread thread = new Thread(runnable, "BitmapUtils #" + this.mCount.getAndIncrement());
                thread.setPriority(4);
                return thread;
            }
        };
    }
    
    public BitmapGlobalConfig(final Context mContext, final String diskCachePath) {
        this.memoryCacheSize = 4194304;
        this.diskCacheSize = 52428800;
        this.memoryCacheEnabled = true;
        this.diskCacheEnabled = true;
        this.threadPoolSize = 5;
        this._dirty_params_bitmapLoadExecutor = true;
        this.defaultCacheExpiry = 2592000000L;
        this.defaultConnectTimeout = 15000;
        this.defaultReadTimeout = 15000;
        if (mContext == null) {
            throw new IllegalArgumentException("context may not be null");
        }
        this.mContext = mContext;
        this.diskCachePath = diskCachePath;
        this.initBitmapCache();
    }
    
    private int getMemoryClass() {
        return ((ActivityManager)this.mContext.getSystemService("activity")).getMemoryClass();
    }
    
    private void initBitmapCache() {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(0);
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(1);
    }
    
    public void clearCache() {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(4);
    }
    
    public void clearCache(final String s) {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(7, s);
    }
    
    public void clearDiskCache() {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(6);
    }
    
    public void clearDiskCache(final String s) {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(9, s);
    }
    
    public void clearMemoryCache() {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(5);
    }
    
    public void clearMemoryCache(final String s) {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(8, s);
    }
    
    public void closeCache() {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(3);
    }
    
    public void flushCache() {
        ((CompatibleAsyncTask<Object, Object, Object>)new BitmapCacheManagementTask((BitmapCacheManagementTask)null)).execute(2);
    }
    
    public BitmapCache getBitmapCache() {
        if (this.bitmapCache == null) {
            this.bitmapCache = new BitmapCache(this);
        }
        return this.bitmapCache;
    }
    
    public BitmapCacheListener getBitmapCacheListener() {
        return this.bitmapCacheListener;
    }
    
    public ExecutorService getBitmapLoadExecutor() {
        if (this._dirty_params_bitmapLoadExecutor || this.bitmapLoadExecutor == null) {
            this.bitmapLoadExecutor = Executors.newFixedThreadPool(this.getThreadPoolSize(), BitmapGlobalConfig.sThreadFactory);
            this._dirty_params_bitmapLoadExecutor = false;
        }
        return this.bitmapLoadExecutor;
    }
    
    public long getDefaultCacheExpiry() {
        return this.defaultCacheExpiry;
    }
    
    public int getDefaultConnectTimeout() {
        return this.defaultConnectTimeout;
    }
    
    public int getDefaultReadTimeout() {
        return this.defaultReadTimeout;
    }
    
    public LruDiskCache.DiskCacheFileNameGenerator getDiskCacheFileNameGenerator() {
        return this.diskCacheFileNameGenerator;
    }
    
    public String getDiskCachePath() {
        if (TextUtils.isEmpty((CharSequence)this.diskCachePath)) {
            this.diskCachePath = BitmapCommonUtils.getDiskCacheDir(this.mContext, "xBitmapCache");
        }
        return this.diskCachePath;
    }
    
    public int getDiskCacheSize() {
        return this.diskCacheSize;
    }
    
    public Downloader getDownloader() {
        if (this.downloader == null) {
            this.downloader = new DefaultDownloader();
        }
        this.downloader.setContext(this.mContext);
        this.downloader.setDefaultExpiry(this.getDefaultCacheExpiry());
        this.downloader.setDefaultConnectTimeout(this.getDefaultConnectTimeout());
        this.downloader.setDefaultReadTimeout(this.getDefaultReadTimeout());
        return this.downloader;
    }
    
    public int getMemoryCacheSize() {
        return this.memoryCacheSize;
    }
    
    public int getThreadPoolSize() {
        return this.threadPoolSize;
    }
    
    public boolean isDiskCacheEnabled() {
        return this.diskCacheEnabled;
    }
    
    public boolean isMemoryCacheEnabled() {
        return this.memoryCacheEnabled;
    }
    
    public void setBitmapCacheListener(final BitmapCacheListener bitmapCacheListener) {
        this.bitmapCacheListener = bitmapCacheListener;
    }
    
    public void setDefaultCacheExpiry(final long defaultCacheExpiry) {
        this.defaultCacheExpiry = defaultCacheExpiry;
    }
    
    public void setDefaultConnectTimeout(final int defaultConnectTimeout) {
        this.defaultConnectTimeout = defaultConnectTimeout;
    }
    
    public void setDefaultReadTimeout(final int defaultReadTimeout) {
        this.defaultReadTimeout = defaultReadTimeout;
    }
    
    public void setDiskCacheEnabled(final boolean diskCacheEnabled) {
        this.diskCacheEnabled = diskCacheEnabled;
    }
    
    public void setDiskCacheFileNameGenerator(final LruDiskCache.DiskCacheFileNameGenerator diskCacheFileNameGenerator) {
        this.diskCacheFileNameGenerator = diskCacheFileNameGenerator;
        if (this.bitmapCache != null) {
            this.bitmapCache.setDiskCacheFileNameGenerator(diskCacheFileNameGenerator);
        }
    }
    
    public void setDiskCacheSize(final int diskCacheSize) {
        if (diskCacheSize >= 10485760) {
            this.diskCacheSize = diskCacheSize;
            if (this.bitmapCache != null) {
                this.bitmapCache.setDiskCacheSize(this.diskCacheSize);
            }
        }
    }
    
    public void setDownloader(final Downloader downloader) {
        this.downloader = downloader;
    }
    
    public void setMemCacheSizePercent(final float n) {
        if (n < 0.05f || n > 0.8f) {
            throw new IllegalArgumentException("percent must be between 0.05 and 0.8 (inclusive)");
        }
        this.memoryCacheSize = Math.round(this.getMemoryClass() * n * 1024.0f * 1024.0f);
        if (this.bitmapCache != null) {
            this.bitmapCache.setMemoryCacheSize(this.memoryCacheSize);
        }
    }
    
    public void setMemoryCacheEnabled(final boolean memoryCacheEnabled) {
        this.memoryCacheEnabled = memoryCacheEnabled;
    }
    
    public void setMemoryCacheSize(final int memoryCacheSize) {
        if (memoryCacheSize >= 2097152) {
            this.memoryCacheSize = memoryCacheSize;
            if (this.bitmapCache != null) {
                this.bitmapCache.setMemoryCacheSize(this.memoryCacheSize);
            }
            return;
        }
        this.setMemCacheSizePercent(0.3f);
    }
    
    public void setThreadPoolSize(final int threadPoolSize) {
        if (threadPoolSize > 0 && threadPoolSize != this.threadPoolSize) {
            this._dirty_params_bitmapLoadExecutor = true;
            this.threadPoolSize = threadPoolSize;
        }
    }
    
    private class BitmapCacheManagementTask extends CompatibleAsyncTask<Object, Void, Object[]>
    {
        public static final int MESSAGE_CLEAR = 4;
        public static final int MESSAGE_CLEAR_BY_KEY = 7;
        public static final int MESSAGE_CLEAR_DISK = 6;
        public static final int MESSAGE_CLEAR_DISK_BY_KEY = 9;
        public static final int MESSAGE_CLEAR_MEMORY = 5;
        public static final int MESSAGE_CLEAR_MEMORY_BY_KEY = 8;
        public static final int MESSAGE_CLOSE = 3;
        public static final int MESSAGE_FLUSH = 2;
        public static final int MESSAGE_INIT_DISK_CACHE = 1;
        public static final int MESSAGE_INIT_MEMORY_CACHE = 0;
        
        @Override
        protected Object[] doInBackground(final Object... array) {
            if (array != null && array.length != 0) {
                final BitmapCache bitmapCache = BitmapGlobalConfig.this.getBitmapCache();
                if (bitmapCache != null) {
                    Label_0181: {
                        Label_0163: {
                            Label_0145: {
                                Label_0139: {
                                    Label_0133: {
                                        Label_0127: {
                                            Label_0117: {
                                                Label_0111: {
                                                    try {
                                                        switch ((int)array[0]) {
                                                            case 0: {
                                                                bitmapCache.initMemoryCache();
                                                                return array;
                                                            }
                                                            case 1: {
                                                                break;
                                                            }
                                                            case 2: {
                                                                break Label_0111;
                                                            }
                                                            case 3: {
                                                                break Label_0117;
                                                            }
                                                            case 4: {
                                                                break Label_0127;
                                                            }
                                                            case 5: {
                                                                break Label_0133;
                                                            }
                                                            case 6: {
                                                                break Label_0139;
                                                            }
                                                            case 7: {
                                                                break Label_0145;
                                                            }
                                                            case 8: {
                                                                break Label_0163;
                                                            }
                                                            case 9: {
                                                                break Label_0181;
                                                            }
                                                            default: {
                                                                return array;
                                                            }
                                                        }
                                                    }
                                                    catch (Throwable t) {
                                                        LogUtils.e(t.getMessage(), t);
                                                        return array;
                                                    }
                                                    bitmapCache.initDiskCache();
                                                    return array;
                                                }
                                                bitmapCache.flush();
                                                return array;
                                            }
                                            bitmapCache.clearMemoryCache();
                                            bitmapCache.close();
                                            return array;
                                        }
                                        bitmapCache.clearCache();
                                        return array;
                                    }
                                    bitmapCache.clearMemoryCache();
                                    return array;
                                }
                                bitmapCache.clearDiskCache();
                                return array;
                            }
                            if (array.length == 2) {
                                bitmapCache.clearCache(String.valueOf(array[1]));
                                return array;
                            }
                            return array;
                        }
                        if (array.length == 2) {
                            bitmapCache.clearMemoryCache(String.valueOf(array[1]));
                            return array;
                        }
                        return array;
                    }
                    if (array.length == 2) {
                        bitmapCache.clearDiskCache(String.valueOf(array[1]));
                        return array;
                    }
                    return array;
                }
            }
            return array;
        }
        
        @Override
        protected void onPostExecute(final Object[] array) {
            if (BitmapGlobalConfig.this.bitmapCacheListener != null && array != null && array.length != 0) {
                Label_0235: {
                    Label_0210: {
                        Label_0185: {
                            Label_0172: {
                                Label_0159: {
                                    Label_0146: {
                                        Label_0133: {
                                            Label_0120: {
                                                try {
                                                    switch ((int)array[0]) {
                                                        case 0: {
                                                            BitmapGlobalConfig.this.bitmapCacheListener.onInitMemoryCacheFinished();
                                                            return;
                                                        }
                                                        case 1: {
                                                            break;
                                                        }
                                                        case 2: {
                                                            break Label_0120;
                                                        }
                                                        case 3: {
                                                            break Label_0133;
                                                        }
                                                        case 4: {
                                                            break Label_0146;
                                                        }
                                                        case 5: {
                                                            break Label_0159;
                                                        }
                                                        case 6: {
                                                            break Label_0172;
                                                        }
                                                        case 7: {
                                                            break Label_0185;
                                                        }
                                                        case 8: {
                                                            break Label_0210;
                                                        }
                                                        case 9: {
                                                            break Label_0235;
                                                        }
                                                        default: {
                                                            return;
                                                        }
                                                    }
                                                }
                                                catch (Throwable t) {
                                                    LogUtils.e(t.getMessage(), t);
                                                    return;
                                                }
                                                BitmapGlobalConfig.this.bitmapCacheListener.onInitDiskFinished();
                                                return;
                                            }
                                            BitmapGlobalConfig.this.bitmapCacheListener.onFlushCacheFinished();
                                            return;
                                        }
                                        BitmapGlobalConfig.this.bitmapCacheListener.onCloseCacheFinished();
                                        return;
                                    }
                                    BitmapGlobalConfig.this.bitmapCacheListener.onClearCacheFinished();
                                    return;
                                }
                                BitmapGlobalConfig.this.bitmapCacheListener.onClearMemoryCacheFinished();
                                return;
                            }
                            BitmapGlobalConfig.this.bitmapCacheListener.onClearDiskCacheFinished();
                            return;
                        }
                        if (array.length == 2) {
                            BitmapGlobalConfig.this.bitmapCacheListener.onClearCacheFinished(String.valueOf(array[1]));
                            return;
                        }
                        return;
                    }
                    if (array.length == 2) {
                        BitmapGlobalConfig.this.bitmapCacheListener.onClearMemoryCacheFinished(String.valueOf(array[1]));
                        return;
                    }
                    return;
                }
                if (array.length == 2) {
                    BitmapGlobalConfig.this.bitmapCacheListener.onClearDiskCacheFinished(String.valueOf(array[1]));
                }
            }
        }
    }
}
