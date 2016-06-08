package com.lidroid.xutils;

import android.content.*;
import android.view.*;
import android.text.*;
import com.lidroid.xutils.bitmap.core.*;
import android.view.animation.*;
import android.graphics.*;
import android.graphics.drawable.*;
import com.lidroid.xutils.bitmap.download.*;
import com.lidroid.xutils.bitmap.*;
import com.lidroid.xutils.bitmap.callback.*;
import java.util.concurrent.*;
import java.io.*;
import com.lidroid.xutils.util.core.*;
import java.lang.ref.*;

public class BitmapUtils
{
    private Context context;
    private BitmapDisplayConfig defaultDisplayConfig;
    private BitmapGlobalConfig globalConfig;
    private boolean pauseTask;
    private final Object pauseTaskLock;
    
    public BitmapUtils(final Context context) {
        this(context, null);
    }
    
    public BitmapUtils(final Context context, final String s) {
        this.pauseTask = false;
        this.pauseTaskLock = new Object();
        if (context == null) {
            throw new IllegalArgumentException("context may not be null");
        }
        this.context = context;
        this.globalConfig = new BitmapGlobalConfig(context, s);
        this.defaultDisplayConfig = new BitmapDisplayConfig();
    }
    
    public BitmapUtils(final Context context, final String s, final float memCacheSizePercent) {
        this(context, s);
        this.globalConfig.setMemCacheSizePercent(memCacheSizePercent);
    }
    
    public BitmapUtils(final Context context, final String s, final float memCacheSizePercent, final int diskCacheSize) {
        this(context, s);
        this.globalConfig.setMemCacheSizePercent(memCacheSizePercent);
        this.globalConfig.setDiskCacheSize(diskCacheSize);
    }
    
    public BitmapUtils(final Context context, final String s, final int memoryCacheSize) {
        this(context, s);
        this.globalConfig.setMemoryCacheSize(memoryCacheSize);
    }
    
    public BitmapUtils(final Context context, final String s, final int memoryCacheSize, final int diskCacheSize) {
        this(context, s);
        this.globalConfig.setMemoryCacheSize(memoryCacheSize);
        this.globalConfig.setDiskCacheSize(diskCacheSize);
    }
    
    private static <T extends View> boolean bitmapLoadTaskExist(final T t, final String s, final BitmapLoadCallBack<T> bitmapLoadCallBack) {
        boolean b = true;
        final BitmapLoadTask<T> bitmapTaskFromContainer = getBitmapTaskFromContainer(t, bitmapLoadCallBack);
        if (bitmapTaskFromContainer != null) {
            final String access$3 = ((BitmapLoadTask<View>)bitmapTaskFromContainer).uri;
            if (!TextUtils.isEmpty((CharSequence)access$3) && access$3.equals(s)) {
                return b;
            }
            bitmapTaskFromContainer.cancel(true);
        }
        b = false;
        return b;
    }
    
    private static <T extends View> BitmapLoadTask<T> getBitmapTaskFromContainer(final T t, final BitmapLoadCallBack<T> bitmapLoadCallBack) {
        if (t != null) {
            final Drawable drawable = bitmapLoadCallBack.getDrawable(t);
            if (drawable instanceof AsyncDrawable) {
                return ((AsyncDrawable<T>)drawable).getBitmapWorkerTask();
            }
        }
        return null;
    }
    
    public void clearCache() {
        this.globalConfig.clearCache();
    }
    
    public void clearCache(final String s) {
        this.globalConfig.clearCache(s);
    }
    
    public void clearDiskCache() {
        this.globalConfig.clearDiskCache();
    }
    
    public void clearDiskCache(final String s) {
        this.globalConfig.clearDiskCache(s);
    }
    
    public void clearMemoryCache() {
        this.globalConfig.clearMemoryCache();
    }
    
    public void clearMemoryCache(final String s) {
        this.globalConfig.clearMemoryCache(s);
    }
    
    public void closeCache() {
        this.globalConfig.closeCache();
    }
    
    public BitmapUtils configBitmapCacheListener(final BitmapCacheListener bitmapCacheListener) {
        this.globalConfig.setBitmapCacheListener(bitmapCacheListener);
        return this;
    }
    
    public BitmapUtils configDefaultAutoRotation(final boolean autoRotation) {
        this.defaultDisplayConfig.setAutoRotation(autoRotation);
        return this;
    }
    
    public BitmapUtils configDefaultBitmapConfig(final Bitmap$Config bitmapConfig) {
        this.defaultDisplayConfig.setBitmapConfig(bitmapConfig);
        return this;
    }
    
    public BitmapUtils configDefaultBitmapMaxSize(final int n, final int n2) {
        this.defaultDisplayConfig.setBitmapMaxSize(new BitmapSize(n, n2));
        return this;
    }
    
    public BitmapUtils configDefaultBitmapMaxSize(final BitmapSize bitmapMaxSize) {
        this.defaultDisplayConfig.setBitmapMaxSize(bitmapMaxSize);
        return this;
    }
    
    public BitmapUtils configDefaultCacheExpiry(final long defaultCacheExpiry) {
        this.globalConfig.setDefaultCacheExpiry(defaultCacheExpiry);
        return this;
    }
    
    public BitmapUtils configDefaultConnectTimeout(final int defaultConnectTimeout) {
        this.globalConfig.setDefaultConnectTimeout(defaultConnectTimeout);
        return this;
    }
    
    public BitmapUtils configDefaultDisplayConfig(final BitmapDisplayConfig defaultDisplayConfig) {
        this.defaultDisplayConfig = defaultDisplayConfig;
        return this;
    }
    
    public BitmapUtils configDefaultImageLoadAnimation(final Animation animation) {
        this.defaultDisplayConfig.setAnimation(animation);
        return this;
    }
    
    public BitmapUtils configDefaultLoadFailedImage(final int n) {
        this.defaultDisplayConfig.setLoadFailedDrawable(this.context.getResources().getDrawable(n));
        return this;
    }
    
    public BitmapUtils configDefaultLoadFailedImage(final Bitmap bitmap) {
        this.defaultDisplayConfig.setLoadFailedDrawable((Drawable)new BitmapDrawable(this.context.getResources(), bitmap));
        return this;
    }
    
    public BitmapUtils configDefaultLoadFailedImage(final Drawable loadFailedDrawable) {
        this.defaultDisplayConfig.setLoadFailedDrawable(loadFailedDrawable);
        return this;
    }
    
    public BitmapUtils configDefaultLoadingImage(final int n) {
        this.defaultDisplayConfig.setLoadingDrawable(this.context.getResources().getDrawable(n));
        return this;
    }
    
    public BitmapUtils configDefaultLoadingImage(final Bitmap bitmap) {
        this.defaultDisplayConfig.setLoadingDrawable((Drawable)new BitmapDrawable(this.context.getResources(), bitmap));
        return this;
    }
    
    public BitmapUtils configDefaultLoadingImage(final Drawable loadingDrawable) {
        this.defaultDisplayConfig.setLoadingDrawable(loadingDrawable);
        return this;
    }
    
    public BitmapUtils configDefaultReadTimeout(final int defaultReadTimeout) {
        this.globalConfig.setDefaultReadTimeout(defaultReadTimeout);
        return this;
    }
    
    public BitmapUtils configDefaultShowOriginal(final boolean showOriginal) {
        this.defaultDisplayConfig.setShowOriginal(showOriginal);
        return this;
    }
    
    public BitmapUtils configDiskCacheEnabled(final boolean diskCacheEnabled) {
        this.globalConfig.setDiskCacheEnabled(diskCacheEnabled);
        return this;
    }
    
    public BitmapUtils configDiskCacheFileNameGenerator(final LruDiskCache.DiskCacheFileNameGenerator diskCacheFileNameGenerator) {
        this.globalConfig.setDiskCacheFileNameGenerator(diskCacheFileNameGenerator);
        return this;
    }
    
    public BitmapUtils configDownloader(final Downloader downloader) {
        this.globalConfig.setDownloader(downloader);
        return this;
    }
    
    public BitmapUtils configGlobalConfig(final BitmapGlobalConfig globalConfig) {
        this.globalConfig = globalConfig;
        return this;
    }
    
    public BitmapUtils configMemoryCacheEnabled(final boolean memoryCacheEnabled) {
        this.globalConfig.setMemoryCacheEnabled(memoryCacheEnabled);
        return this;
    }
    
    public BitmapUtils configThreadPoolSize(final int threadPoolSize) {
        this.globalConfig.setThreadPoolSize(threadPoolSize);
        return this;
    }
    
    public <T extends View> void display(final T t, final String s) {
        this.display(t, s, null, null);
    }
    
    public <T extends View> void display(final T t, final String s, final BitmapDisplayConfig bitmapDisplayConfig) {
        this.display(t, s, bitmapDisplayConfig, null);
    }
    
    public <T extends View> void display(final T t, final String s, final BitmapDisplayConfig bitmapDisplayConfig, final BitmapLoadCallBack<T> bitmapLoadCallBack) {
        if (t != null) {
            t.clearAnimation();
            BitmapLoadCallBack<T> bitmapLoadCallBack2;
            if ((bitmapLoadCallBack2 = bitmapLoadCallBack) == null) {
                bitmapLoadCallBack2 = new DefaultBitmapLoadCallBack<T>();
            }
            BitmapDisplayConfig cloneNew;
            if (bitmapDisplayConfig == null || (cloneNew = bitmapDisplayConfig) == this.defaultDisplayConfig) {
                cloneNew = this.defaultDisplayConfig.cloneNew();
            }
            final BitmapSize bitmapMaxSize = cloneNew.getBitmapMaxSize();
            cloneNew.setBitmapMaxSize(BitmapCommonUtils.optimizeMaxSizeByView(t, bitmapMaxSize.getWidth(), bitmapMaxSize.getHeight()));
            bitmapLoadCallBack2.onPreLoad(t, s, cloneNew);
            if (TextUtils.isEmpty((CharSequence)s)) {
                bitmapLoadCallBack2.onLoadFailed(t, s, cloneNew.getLoadFailedDrawable());
                return;
            }
            final Bitmap bitmapFromMemCache = this.globalConfig.getBitmapCache().getBitmapFromMemCache(s, cloneNew);
            if (bitmapFromMemCache != null) {
                bitmapLoadCallBack2.onLoadStarted(t, s, cloneNew);
                bitmapLoadCallBack2.onLoadCompleted(t, s, bitmapFromMemCache, cloneNew, BitmapLoadFrom.MEMORY_CACHE);
                return;
            }
            if (!bitmapLoadTaskExist(t, s, bitmapLoadCallBack2)) {
                final BitmapLoadTask bitmapLoadTask = new BitmapLoadTask(t, s, cloneNew, (BitmapLoadCallBack<View>)bitmapLoadCallBack2);
                bitmapLoadCallBack2.setDrawable(t, new AsyncDrawable<Object>(cloneNew.getLoadingDrawable(), (BitmapLoadTask<View>)bitmapLoadTask));
                bitmapLoadTask.executeOnExecutor(this.globalConfig.getBitmapLoadExecutor(), new Object[0]);
            }
        }
    }
    
    public <T extends View> void display(final T t, final String s, final BitmapLoadCallBack<T> bitmapLoadCallBack) {
        this.display(t, s, null, bitmapLoadCallBack);
    }
    
    public void flushCache() {
        this.globalConfig.flushCache();
    }
    
    public File getBitmapFileFromDiskCache(final String s) {
        return this.globalConfig.getBitmapCache().getBitmapFileFromDiskCache(s);
    }
    
    public Bitmap getBitmapFromMemCache(final String s, final BitmapDisplayConfig bitmapDisplayConfig) {
        BitmapDisplayConfig defaultDisplayConfig = bitmapDisplayConfig;
        if (bitmapDisplayConfig == null) {
            defaultDisplayConfig = this.defaultDisplayConfig;
        }
        return this.globalConfig.getBitmapCache().getBitmapFromMemCache(s, defaultDisplayConfig);
    }
    
    public void pauseTasks() {
        this.pauseTask = true;
        this.flushCache();
    }
    
    public void resumeTasks() {
        this.pauseTask = false;
        synchronized (this.pauseTaskLock) {
            this.pauseTaskLock.notifyAll();
        }
    }
    
    public void stopTasks() {
        this.pauseTask = true;
        synchronized (this.pauseTaskLock) {
            this.pauseTaskLock.notifyAll();
        }
    }
    
    public class BitmapLoadTask<T extends View> extends CompatibleAsyncTask<Object, Object, Bitmap>
    {
        private static final int PROGRESS_LOADING = 1;
        private static final int PROGRESS_LOAD_STARTED = 0;
        private final BitmapLoadCallBack<T> callBack;
        private final WeakReference<T> containerReference;
        private final BitmapDisplayConfig displayConfig;
        private BitmapLoadFrom from;
        private final String uri;
        
        public BitmapLoadTask(final T t, final String uri, final BitmapDisplayConfig displayConfig, final BitmapLoadCallBack<T> callBack) {
            this.from = BitmapLoadFrom.DISK_CACHE;
            if (t == null || uri == null || displayConfig == null || callBack == null) {
                throw new IllegalArgumentException("args may not be null");
            }
            this.containerReference = new WeakReference<T>(t);
            this.callBack = callBack;
            this.uri = uri;
            this.displayConfig = displayConfig;
        }
        
        @Override
        protected Bitmap doInBackground(Object... array) {
            array = (Object[])BitmapUtils.this.pauseTaskLock;
            synchronized (array) {
                while (BitmapUtils.this.pauseTask && !this.isCancelled()) {
                    try {
                        BitmapUtils.this.pauseTaskLock.wait();
                    }
                    catch (Throwable t) {}
                }
                // monitorexit(array)
                final Object[] array2 = array = null;
                if (!this.isCancelled()) {
                    array = array2;
                    if (this.getTargetContainer() != null) {
                        this.publishProgress(0);
                        array = (Object[])(Object)BitmapUtils.this.globalConfig.getBitmapCache().getBitmapFromDiskCache(this.uri, this.displayConfig);
                    }
                }
                final Object[] array3;
                if ((array3 = array) == null && !this.isCancelled() && this.getTargetContainer() != null) {
                    BitmapUtils.this.globalConfig.getBitmapCache().downloadBitmap(this.uri, this.displayConfig, (BitmapLoadTask<?>)this);
                    this.from = BitmapLoadFrom.URI;
                }
                return (Bitmap)array;
            }
        }
        
        public T getTargetContainer() {
            final View view = this.containerReference.get();
            if (this == getBitmapTaskFromContainer(view, this.callBack)) {
                return (T)view;
            }
            return null;
        }
        
        @Override
        protected void onCancelled(final Bitmap bitmap) {
            synchronized (BitmapUtils.this.pauseTaskLock) {
                BitmapUtils.this.pauseTaskLock.notifyAll();
            }
        }
        
        @Override
        protected void onPostExecute(final Bitmap bitmap) {
            final View targetContainer = this.getTargetContainer();
            if (targetContainer != null) {
                if (bitmap == null) {
                    this.callBack.onLoadFailed((T)targetContainer, this.uri, this.displayConfig.getLoadFailedDrawable());
                    return;
                }
                this.callBack.onLoadCompleted((T)targetContainer, this.uri, bitmap, this.displayConfig, this.from);
            }
        }
        
        @Override
        protected void onProgressUpdate(final Object... array) {
            if (array != null && array.length != 0) {
                final View targetContainer = this.getTargetContainer();
                if (targetContainer != null) {
                    switch ((int)array[0]) {
                        default: {}
                        case 0: {
                            this.callBack.onLoadStarted((T)targetContainer, this.uri, this.displayConfig);
                        }
                        case 1: {
                            if (array.length == 3) {
                                this.callBack.onLoading((T)targetContainer, this.uri, this.displayConfig, (long)array[1], (long)array[2]);
                                return;
                            }
                            break;
                        }
                    }
                }
            }
        }
        
        public void updateProgress(final long n, final long n2) {
            this.publishProgress(1, n, n2);
        }
    }
}
