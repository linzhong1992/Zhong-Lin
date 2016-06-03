package com.lidroid.xutils.bitmap;

import android.app.ActivityManager;
import android.content.Context;
import android.text.TextUtils;
import com.lidroid.xutils.bitmap.core.BitmapCache;
import com.lidroid.xutils.bitmap.download.DefaultDownloader;
import com.lidroid.xutils.bitmap.download.Downloader;
import com.lidroid.xutils.util.LogUtils;
import com.lidroid.xutils.util.core.CompatibleAsyncTask;
import com.lidroid.xutils.util.core.LruDiskCache.DiskCacheFileNameGenerator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

public class BitmapGlobalConfig
{
  public static final int MIN_DISK_CACHE_SIZE = 10485760;
  public static final int MIN_MEMORY_CACHE_SIZE = 2097152;
  private static final ThreadFactory sThreadFactory = new ThreadFactory()
  {
    private final AtomicInteger mCount = new AtomicInteger(1);
    
    public Thread newThread(Runnable paramAnonymousRunnable)
    {
      paramAnonymousRunnable = new Thread(paramAnonymousRunnable, "BitmapUtils #" + this.mCount.getAndIncrement());
      paramAnonymousRunnable.setPriority(4);
      return paramAnonymousRunnable;
    }
  };
  private boolean _dirty_params_bitmapLoadExecutor = true;
  private BitmapCache bitmapCache;
  private BitmapCacheListener bitmapCacheListener;
  private ExecutorService bitmapLoadExecutor;
  private long defaultCacheExpiry = 2592000000L;
  private int defaultConnectTimeout = 15000;
  private int defaultReadTimeout = 15000;
  private boolean diskCacheEnabled = true;
  private LruDiskCache.DiskCacheFileNameGenerator diskCacheFileNameGenerator;
  private String diskCachePath;
  private int diskCacheSize = 52428800;
  private Downloader downloader;
  private Context mContext;
  private boolean memoryCacheEnabled = true;
  private int memoryCacheSize = 4194304;
  private int threadPoolSize = 5;
  
  public BitmapGlobalConfig(Context paramContext, String paramString)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context may not be null");
    }
    this.mContext = paramContext;
    this.diskCachePath = paramString;
    initBitmapCache();
  }
  
  private int getMemoryClass()
  {
    return ((ActivityManager)this.mContext.getSystemService("activity")).getMemoryClass();
  }
  
  private void initBitmapCache()
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(0) });
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(1) });
  }
  
  public void clearCache()
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(4) });
  }
  
  public void clearCache(String paramString)
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(7), paramString });
  }
  
  public void clearDiskCache()
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(6) });
  }
  
  public void clearDiskCache(String paramString)
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(9), paramString });
  }
  
  public void clearMemoryCache()
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(5) });
  }
  
  public void clearMemoryCache(String paramString)
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(8), paramString });
  }
  
  public void closeCache()
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(3) });
  }
  
  public void flushCache()
  {
    new BitmapCacheManagementTask(null).execute(new Object[] { Integer.valueOf(2) });
  }
  
  public BitmapCache getBitmapCache()
  {
    if (this.bitmapCache == null) {
      this.bitmapCache = new BitmapCache(this);
    }
    return this.bitmapCache;
  }
  
  public BitmapCacheListener getBitmapCacheListener()
  {
    return this.bitmapCacheListener;
  }
  
  public ExecutorService getBitmapLoadExecutor()
  {
    if ((this._dirty_params_bitmapLoadExecutor) || (this.bitmapLoadExecutor == null))
    {
      this.bitmapLoadExecutor = Executors.newFixedThreadPool(getThreadPoolSize(), sThreadFactory);
      this._dirty_params_bitmapLoadExecutor = false;
    }
    return this.bitmapLoadExecutor;
  }
  
  public long getDefaultCacheExpiry()
  {
    return this.defaultCacheExpiry;
  }
  
  public int getDefaultConnectTimeout()
  {
    return this.defaultConnectTimeout;
  }
  
  public int getDefaultReadTimeout()
  {
    return this.defaultReadTimeout;
  }
  
  public LruDiskCache.DiskCacheFileNameGenerator getDiskCacheFileNameGenerator()
  {
    return this.diskCacheFileNameGenerator;
  }
  
  public String getDiskCachePath()
  {
    if (TextUtils.isEmpty(this.diskCachePath)) {
      this.diskCachePath = BitmapCommonUtils.getDiskCacheDir(this.mContext, "xBitmapCache");
    }
    return this.diskCachePath;
  }
  
  public int getDiskCacheSize()
  {
    return this.diskCacheSize;
  }
  
  public Downloader getDownloader()
  {
    if (this.downloader == null) {
      this.downloader = new DefaultDownloader();
    }
    this.downloader.setContext(this.mContext);
    this.downloader.setDefaultExpiry(getDefaultCacheExpiry());
    this.downloader.setDefaultConnectTimeout(getDefaultConnectTimeout());
    this.downloader.setDefaultReadTimeout(getDefaultReadTimeout());
    return this.downloader;
  }
  
  public int getMemoryCacheSize()
  {
    return this.memoryCacheSize;
  }
  
  public int getThreadPoolSize()
  {
    return this.threadPoolSize;
  }
  
  public boolean isDiskCacheEnabled()
  {
    return this.diskCacheEnabled;
  }
  
  public boolean isMemoryCacheEnabled()
  {
    return this.memoryCacheEnabled;
  }
  
  public void setBitmapCacheListener(BitmapCacheListener paramBitmapCacheListener)
  {
    this.bitmapCacheListener = paramBitmapCacheListener;
  }
  
  public void setDefaultCacheExpiry(long paramLong)
  {
    this.defaultCacheExpiry = paramLong;
  }
  
  public void setDefaultConnectTimeout(int paramInt)
  {
    this.defaultConnectTimeout = paramInt;
  }
  
  public void setDefaultReadTimeout(int paramInt)
  {
    this.defaultReadTimeout = paramInt;
  }
  
  public void setDiskCacheEnabled(boolean paramBoolean)
  {
    this.diskCacheEnabled = paramBoolean;
  }
  
  public void setDiskCacheFileNameGenerator(LruDiskCache.DiskCacheFileNameGenerator paramDiskCacheFileNameGenerator)
  {
    this.diskCacheFileNameGenerator = paramDiskCacheFileNameGenerator;
    if (this.bitmapCache != null) {
      this.bitmapCache.setDiskCacheFileNameGenerator(paramDiskCacheFileNameGenerator);
    }
  }
  
  public void setDiskCacheSize(int paramInt)
  {
    if (paramInt >= 10485760)
    {
      this.diskCacheSize = paramInt;
      if (this.bitmapCache != null) {
        this.bitmapCache.setDiskCacheSize(this.diskCacheSize);
      }
    }
  }
  
  public void setDownloader(Downloader paramDownloader)
  {
    this.downloader = paramDownloader;
  }
  
  public void setMemCacheSizePercent(float paramFloat)
  {
    if ((paramFloat < 0.05F) || (paramFloat > 0.8F)) {
      throw new IllegalArgumentException("percent must be between 0.05 and 0.8 (inclusive)");
    }
    this.memoryCacheSize = Math.round(getMemoryClass() * paramFloat * 1024.0F * 1024.0F);
    if (this.bitmapCache != null) {
      this.bitmapCache.setMemoryCacheSize(this.memoryCacheSize);
    }
  }
  
  public void setMemoryCacheEnabled(boolean paramBoolean)
  {
    this.memoryCacheEnabled = paramBoolean;
  }
  
  public void setMemoryCacheSize(int paramInt)
  {
    if (paramInt >= 2097152)
    {
      this.memoryCacheSize = paramInt;
      if (this.bitmapCache != null) {
        this.bitmapCache.setMemoryCacheSize(this.memoryCacheSize);
      }
      return;
    }
    setMemCacheSizePercent(0.3F);
  }
  
  public void setThreadPoolSize(int paramInt)
  {
    if ((paramInt > 0) && (paramInt != this.threadPoolSize))
    {
      this._dirty_params_bitmapLoadExecutor = true;
      this.threadPoolSize = paramInt;
    }
  }
  
  private class BitmapCacheManagementTask
    extends CompatibleAsyncTask<Object, Void, Object[]>
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
    
    private BitmapCacheManagementTask() {}
    
    protected Object[] doInBackground(Object... paramVarArgs)
    {
      if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {}
      do
      {
        do
        {
          do
          {
            BitmapCache localBitmapCache;
            do
            {
              return paramVarArgs;
              localBitmapCache = BitmapGlobalConfig.this.getBitmapCache();
            } while (localBitmapCache == null);
            try
            {
              switch (((Integer)paramVarArgs[0]).intValue())
              {
              case 0: 
                localBitmapCache.initMemoryCache();
                return paramVarArgs;
              }
            }
            catch (Throwable localThrowable)
            {
              LogUtils.e(localThrowable.getMessage(), localThrowable);
              return paramVarArgs;
            }
            localThrowable.initDiskCache();
            return paramVarArgs;
            localThrowable.flush();
            return paramVarArgs;
            localThrowable.clearMemoryCache();
            localThrowable.close();
            return paramVarArgs;
            localThrowable.clearCache();
            return paramVarArgs;
            localThrowable.clearMemoryCache();
            return paramVarArgs;
            localThrowable.clearDiskCache();
            return paramVarArgs;
          } while (paramVarArgs.length != 2);
          localThrowable.clearCache(String.valueOf(paramVarArgs[1]));
          return paramVarArgs;
        } while (paramVarArgs.length != 2);
        localThrowable.clearMemoryCache(String.valueOf(paramVarArgs[1]));
        return paramVarArgs;
      } while (paramVarArgs.length != 2);
      localThrowable.clearDiskCache(String.valueOf(paramVarArgs[1]));
      return paramVarArgs;
      return paramVarArgs;
    }
    
    protected void onPostExecute(Object[] paramArrayOfObject)
    {
      if ((BitmapGlobalConfig.this.bitmapCacheListener == null) || (paramArrayOfObject == null) || (paramArrayOfObject.length == 0)) {}
      do
      {
        do
        {
          do
          {
            return;
            try
            {
              switch (((Integer)paramArrayOfObject[0]).intValue())
              {
              case 0: 
                BitmapGlobalConfig.this.bitmapCacheListener.onInitMemoryCacheFinished();
                return;
              }
            }
            catch (Throwable paramArrayOfObject)
            {
              LogUtils.e(paramArrayOfObject.getMessage(), paramArrayOfObject);
              return;
            }
            BitmapGlobalConfig.this.bitmapCacheListener.onInitDiskFinished();
            return;
            BitmapGlobalConfig.this.bitmapCacheListener.onFlushCacheFinished();
            return;
            BitmapGlobalConfig.this.bitmapCacheListener.onCloseCacheFinished();
            return;
            BitmapGlobalConfig.this.bitmapCacheListener.onClearCacheFinished();
            return;
            BitmapGlobalConfig.this.bitmapCacheListener.onClearMemoryCacheFinished();
            return;
            BitmapGlobalConfig.this.bitmapCacheListener.onClearDiskCacheFinished();
            return;
          } while (paramArrayOfObject.length != 2);
          BitmapGlobalConfig.this.bitmapCacheListener.onClearCacheFinished(String.valueOf(paramArrayOfObject[1]));
          return;
        } while (paramArrayOfObject.length != 2);
        BitmapGlobalConfig.this.bitmapCacheListener.onClearMemoryCacheFinished(String.valueOf(paramArrayOfObject[1]));
        return;
      } while (paramArrayOfObject.length != 2);
      BitmapGlobalConfig.this.bitmapCacheListener.onClearDiskCacheFinished(String.valueOf(paramArrayOfObject[1]));
      return;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\BitmapGlobalConfig.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */