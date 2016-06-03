package com.lidroid.xutils.bitmap.core;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.media.ExifInterface;
import com.lidroid.xutils.bitmap.BitmapCommonUtils;
import com.lidroid.xutils.bitmap.BitmapDisplayConfig;
import com.lidroid.xutils.bitmap.BitmapGlobalConfig;
import com.lidroid.xutils.util.IOUtils;
import com.lidroid.xutils.util.LogUtils;
import com.lidroid.xutils.util.core.LruDiskCache;
import com.lidroid.xutils.util.core.LruDiskCache.DiskCacheFileNameGenerator;
import com.lidroid.xutils.util.core.LruDiskCache.Snapshot;
import com.lidroid.xutils.util.core.LruMemoryCache;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class BitmapCache
{
  private final int DISK_CACHE_INDEX = 0;
  private BitmapGlobalConfig globalConfig;
  private boolean isDiskCacheReadied = false;
  private final Object mDiskCacheLock = new Object();
  private LruDiskCache mDiskLruCache;
  private LruMemoryCache<MemoryCacheKey, Bitmap> mMemoryCache;
  
  public BitmapCache(BitmapGlobalConfig paramBitmapGlobalConfig)
  {
    if (paramBitmapGlobalConfig == null) {
      throw new IllegalArgumentException("globalConfig may not be null");
    }
    this.globalConfig = paramBitmapGlobalConfig;
  }
  
  private void addBitmapToMemoryCache(String paramString, BitmapDisplayConfig paramBitmapDisplayConfig, Bitmap paramBitmap, long paramLong)
    throws IOException
  {
    if ((paramString != null) && (paramBitmap != null) && (this.globalConfig.isMemoryCacheEnabled()) && (this.mMemoryCache != null)) {
      if (paramBitmapDisplayConfig != null) {
        break label56;
      }
    }
    label56:
    for (paramBitmapDisplayConfig = null;; paramBitmapDisplayConfig = paramBitmapDisplayConfig.toString())
    {
      paramString = new MemoryCacheKey(paramString, paramBitmapDisplayConfig, null);
      this.mMemoryCache.put(paramString, paramBitmap, paramLong);
      return;
    }
  }
  
  private Bitmap decodeBitmapMeta(BitmapMeta paramBitmapMeta, BitmapDisplayConfig paramBitmapDisplayConfig)
    throws IOException
  {
    if (paramBitmapMeta == null) {}
    do
    {
      return null;
      if (paramBitmapMeta.inputStream != null)
      {
        if ((paramBitmapDisplayConfig == null) || (paramBitmapDisplayConfig.isShowOriginal())) {
          return BitmapDecoder.decodeFileDescriptor(paramBitmapMeta.inputStream.getFD());
        }
        return BitmapDecoder.decodeSampledBitmapFromDescriptor(paramBitmapMeta.inputStream.getFD(), paramBitmapDisplayConfig.getBitmapMaxSize(), paramBitmapDisplayConfig.getBitmapConfig());
      }
    } while (paramBitmapMeta.data == null);
    if ((paramBitmapDisplayConfig == null) || (paramBitmapDisplayConfig.isShowOriginal())) {
      return BitmapDecoder.decodeByteArray(paramBitmapMeta.data);
    }
    return BitmapDecoder.decodeSampledBitmapFromByteArray(paramBitmapMeta.data, paramBitmapDisplayConfig.getBitmapMaxSize(), paramBitmapDisplayConfig.getBitmapConfig());
  }
  
  private Bitmap rotateBitmapIfNeeded(String paramString, BitmapDisplayConfig paramBitmapDisplayConfig, Bitmap paramBitmap)
  {
    Bitmap localBitmap1 = paramBitmap;
    Bitmap localBitmap2 = localBitmap1;
    if (paramBitmapDisplayConfig != null)
    {
      localBitmap2 = localBitmap1;
      if (paramBitmapDisplayConfig.isAutoRotation())
      {
        paramString = getBitmapFileFromDiskCache(paramString);
        localBitmap2 = localBitmap1;
        if (paramString != null)
        {
          localBitmap2 = localBitmap1;
          if (!paramString.exists()) {}
        }
      }
    }
    for (;;)
    {
      try
      {
        paramString = new ExifInterface(paramString.getPath());
        switch (paramString.getAttributeInt("Orientation", 0))
        {
        case 4: 
        case 5: 
        case 7: 
        default: 
          i = 0;
          localBitmap2 = localBitmap1;
          if (i != 0)
          {
            paramString = new Matrix();
            paramString.postRotate(i);
            localBitmap2 = Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), paramString, true);
            paramBitmap.recycle();
          }
          return localBitmap2;
        }
      }
      catch (Throwable paramString)
      {
        return localBitmap1;
      }
      int i = 90;
      continue;
      i = 180;
      continue;
      i = 270;
    }
  }
  
  public void clearCache()
  {
    clearMemoryCache();
    clearDiskCache();
  }
  
  public void clearCache(String paramString)
  {
    clearMemoryCache(paramString);
    clearDiskCache(paramString);
  }
  
  public void clearDiskCache()
  {
    synchronized (this.mDiskCacheLock)
    {
      if (this.mDiskLruCache != null)
      {
        boolean bool = this.mDiskLruCache.isClosed();
        if (bool) {}
      }
      try
      {
        this.mDiskLruCache.delete();
        this.mDiskLruCache = null;
        this.isDiskCacheReadied = false;
        initDiskCache();
        return;
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          LogUtils.e(localThrowable.getMessage(), localThrowable);
        }
      }
    }
  }
  
  public void clearDiskCache(String paramString)
  {
    synchronized (this.mDiskCacheLock)
    {
      if (this.mDiskLruCache != null)
      {
        boolean bool = this.mDiskLruCache.isClosed();
        if (bool) {}
      }
      try
      {
        this.mDiskLruCache.remove(paramString);
        return;
      }
      catch (Throwable paramString)
      {
        for (;;)
        {
          LogUtils.e(paramString.getMessage(), paramString);
        }
      }
    }
  }
  
  public void clearMemoryCache()
  {
    if (this.mMemoryCache != null) {
      this.mMemoryCache.evictAll();
    }
  }
  
  public void clearMemoryCache(String paramString)
  {
    paramString = new MemoryCacheKey(paramString, null, null);
    if (this.mMemoryCache != null) {}
    for (;;)
    {
      if (!this.mMemoryCache.containsKey(paramString)) {
        return;
      }
      this.mMemoryCache.remove(paramString);
    }
  }
  
  public void close()
  {
    synchronized (this.mDiskCacheLock)
    {
      LruDiskCache localLruDiskCache = this.mDiskLruCache;
      if (localLruDiskCache != null) {}
      try
      {
        if (!this.mDiskLruCache.isClosed())
        {
          this.mDiskLruCache.close();
          this.mDiskLruCache = null;
        }
        return;
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          LogUtils.e(localThrowable.getMessage(), localThrowable);
        }
      }
    }
  }
  
  /* Error */
  public Bitmap downloadBitmap(String paramString, BitmapDisplayConfig paramBitmapDisplayConfig, com.lidroid.xutils.BitmapUtils.BitmapLoadTask<?> paramBitmapLoadTask)
  {
    // Byte code:
    //   0: new 8	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta
    //   3: dup
    //   4: aload_0
    //   5: aconst_null
    //   6: invokespecial 225	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:<init>	(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;)V
    //   9: astore 25
    //   11: aconst_null
    //   12: astore 20
    //   14: aconst_null
    //   15: astore 17
    //   17: aconst_null
    //   18: astore 18
    //   20: aconst_null
    //   21: astore 12
    //   23: aconst_null
    //   24: astore 21
    //   26: aconst_null
    //   27: astore 16
    //   29: aconst_null
    //   30: astore 6
    //   32: aconst_null
    //   33: astore 13
    //   35: aconst_null
    //   36: astore 11
    //   38: aconst_null
    //   39: astore 22
    //   41: aconst_null
    //   42: astore 23
    //   44: aconst_null
    //   45: astore 19
    //   47: aconst_null
    //   48: astore 24
    //   50: aconst_null
    //   51: astore 15
    //   53: aconst_null
    //   54: astore 14
    //   56: aload 12
    //   58: astore 8
    //   60: aload 22
    //   62: astore 10
    //   64: aload 21
    //   66: astore 7
    //   68: aload 23
    //   70: astore 9
    //   72: aload_0
    //   73: getfield 45	com/lidroid/xutils/bitmap/core/BitmapCache:globalConfig	Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
    //   76: invokevirtual 228	com/lidroid/xutils/bitmap/BitmapGlobalConfig:isDiskCacheEnabled	()Z
    //   79: ifeq +950 -> 1029
    //   82: aload 12
    //   84: astore 8
    //   86: aload 22
    //   88: astore 10
    //   90: aload 21
    //   92: astore 7
    //   94: aload 23
    //   96: astore 9
    //   98: aload_0
    //   99: getfield 34	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskCacheLock	Ljava/lang/Object;
    //   102: astore 24
    //   104: aload 12
    //   106: astore 8
    //   108: aload 22
    //   110: astore 10
    //   112: aload 21
    //   114: astore 7
    //   116: aload 23
    //   118: astore 9
    //   120: aload 24
    //   122: monitorenter
    //   123: aload 18
    //   125: astore 7
    //   127: aload 11
    //   129: astore 6
    //   131: aload_0
    //   132: getfield 36	com/lidroid/xutils/bitmap/core/BitmapCache:isDiskCacheReadied	Z
    //   135: ifeq +265 -> 400
    //   138: aload 18
    //   140: astore 7
    //   142: aload 11
    //   144: astore 6
    //   146: aload_0
    //   147: getfield 183	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskLruCache	Lcom/lidroid/xutils/util/core/LruDiskCache;
    //   150: astore 10
    //   152: aload 14
    //   154: astore 12
    //   156: aload 20
    //   158: astore 8
    //   160: aload 19
    //   162: astore 9
    //   164: aload 10
    //   166: ifnull +503 -> 669
    //   169: aload 15
    //   171: astore 12
    //   173: aload 17
    //   175: astore 8
    //   177: aload 13
    //   179: astore 9
    //   181: aload 18
    //   183: astore 7
    //   185: aload 11
    //   187: astore 6
    //   189: aload_0
    //   190: getfield 183	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskLruCache	Lcom/lidroid/xutils/util/core/LruDiskCache;
    //   193: aload_1
    //   194: invokevirtual 232	com/lidroid/xutils/util/core/LruDiskCache:get	(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    //   197: astore 13
    //   199: aload 16
    //   201: astore 11
    //   203: aload 13
    //   205: astore 10
    //   207: aload 13
    //   209: ifnonnull +299 -> 508
    //   212: aload 15
    //   214: astore 12
    //   216: aload 17
    //   218: astore 8
    //   220: aload 13
    //   222: astore 9
    //   224: aload 18
    //   226: astore 7
    //   228: aload 13
    //   230: astore 6
    //   232: aload_0
    //   233: getfield 183	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskLruCache	Lcom/lidroid/xutils/util/core/LruDiskCache;
    //   236: aload_1
    //   237: invokevirtual 236	com/lidroid/xutils/util/core/LruDiskCache:edit	(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    //   240: astore 19
    //   242: aload 16
    //   244: astore 11
    //   246: aload 13
    //   248: astore 10
    //   250: aload 19
    //   252: ifnull +256 -> 508
    //   255: aload 15
    //   257: astore 12
    //   259: aload 17
    //   261: astore 8
    //   263: aload 13
    //   265: astore 9
    //   267: aload 18
    //   269: astore 7
    //   271: aload 13
    //   273: astore 6
    //   275: aload 19
    //   277: iconst_0
    //   278: invokevirtual 242	com/lidroid/xutils/util/core/LruDiskCache$Editor:newOutputStream	(I)Ljava/io/OutputStream;
    //   281: astore 11
    //   283: aload 15
    //   285: astore 12
    //   287: aload 11
    //   289: astore 8
    //   291: aload 13
    //   293: astore 9
    //   295: aload 11
    //   297: astore 7
    //   299: aload 13
    //   301: astore 6
    //   303: aload 25
    //   305: aload_0
    //   306: getfield 45	com/lidroid/xutils/bitmap/core/BitmapCache:globalConfig	Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
    //   309: invokevirtual 246	com/lidroid/xutils/bitmap/BitmapGlobalConfig:getDownloader	()Lcom/lidroid/xutils/bitmap/download/Downloader;
    //   312: aload_1
    //   313: aload 11
    //   315: aload_3
    //   316: invokevirtual 252	com/lidroid/xutils/bitmap/download/Downloader:downloadToStream	(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J
    //   319: putfield 256	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:expiryTimestamp	J
    //   322: aload 15
    //   324: astore 12
    //   326: aload 11
    //   328: astore 8
    //   330: aload 13
    //   332: astore 9
    //   334: aload 11
    //   336: astore 7
    //   338: aload 13
    //   340: astore 6
    //   342: aload 25
    //   344: getfield 256	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:expiryTimestamp	J
    //   347: lconst_0
    //   348: lcmp
    //   349: ifge +74 -> 423
    //   352: aload 15
    //   354: astore 12
    //   356: aload 11
    //   358: astore 8
    //   360: aload 13
    //   362: astore 9
    //   364: aload 11
    //   366: astore 7
    //   368: aload 13
    //   370: astore 6
    //   372: aload 19
    //   374: invokevirtual 259	com/lidroid/xutils/util/core/LruDiskCache$Editor:abort	()V
    //   377: aload 11
    //   379: astore 7
    //   381: aload 13
    //   383: astore 6
    //   385: aload 24
    //   387: monitorexit
    //   388: aload 11
    //   390: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   393: aload 13
    //   395: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   398: aconst_null
    //   399: areturn
    //   400: aload 18
    //   402: astore 7
    //   404: aload 11
    //   406: astore 6
    //   408: aload_0
    //   409: getfield 34	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskCacheLock	Ljava/lang/Object;
    //   412: invokevirtual 268	java/lang/Object:wait	()V
    //   415: goto -292 -> 123
    //   418: astore 6
    //   420: goto -297 -> 123
    //   423: aload 15
    //   425: astore 12
    //   427: aload 11
    //   429: astore 8
    //   431: aload 13
    //   433: astore 9
    //   435: aload 11
    //   437: astore 7
    //   439: aload 13
    //   441: astore 6
    //   443: aload 19
    //   445: aload 25
    //   447: getfield 256	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:expiryTimestamp	J
    //   450: invokevirtual 272	com/lidroid/xutils/util/core/LruDiskCache$Editor:setEntryExpiryTimestamp	(J)V
    //   453: aload 15
    //   455: astore 12
    //   457: aload 11
    //   459: astore 8
    //   461: aload 13
    //   463: astore 9
    //   465: aload 11
    //   467: astore 7
    //   469: aload 13
    //   471: astore 6
    //   473: aload 19
    //   475: invokevirtual 275	com/lidroid/xutils/util/core/LruDiskCache$Editor:commit	()V
    //   478: aload 15
    //   480: astore 12
    //   482: aload 11
    //   484: astore 8
    //   486: aload 13
    //   488: astore 9
    //   490: aload 11
    //   492: astore 7
    //   494: aload 13
    //   496: astore 6
    //   498: aload_0
    //   499: getfield 183	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskLruCache	Lcom/lidroid/xutils/util/core/LruDiskCache;
    //   502: aload_1
    //   503: invokevirtual 232	com/lidroid/xutils/util/core/LruDiskCache:get	(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    //   506: astore 10
    //   508: aload 14
    //   510: astore 12
    //   512: aload 11
    //   514: astore 8
    //   516: aload 10
    //   518: astore 9
    //   520: aload 10
    //   522: ifnull +147 -> 669
    //   525: aload 15
    //   527: astore 12
    //   529: aload 11
    //   531: astore 8
    //   533: aload 10
    //   535: astore 9
    //   537: aload 11
    //   539: astore 7
    //   541: aload 10
    //   543: astore 6
    //   545: aload 25
    //   547: aload 10
    //   549: iconst_0
    //   550: invokevirtual 281	com/lidroid/xutils/util/core/LruDiskCache$Snapshot:getInputStream	(I)Ljava/io/FileInputStream;
    //   553: putfield 80	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:inputStream	Ljava/io/FileInputStream;
    //   556: aload 15
    //   558: astore 12
    //   560: aload 11
    //   562: astore 8
    //   564: aload 10
    //   566: astore 9
    //   568: aload 11
    //   570: astore 7
    //   572: aload 10
    //   574: astore 6
    //   576: aload_0
    //   577: aload 25
    //   579: aload_2
    //   580: invokespecial 283	com/lidroid/xutils/bitmap/core/BitmapCache:decodeBitmapMeta	(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
    //   583: astore 13
    //   585: aload 13
    //   587: astore 12
    //   589: aload 11
    //   591: astore 8
    //   593: aload 10
    //   595: astore 9
    //   597: aload 13
    //   599: ifnonnull +70 -> 669
    //   602: aload 13
    //   604: astore 12
    //   606: aload 11
    //   608: astore 8
    //   610: aload 10
    //   612: astore 9
    //   614: aload 11
    //   616: astore 7
    //   618: aload 10
    //   620: astore 6
    //   622: aload 25
    //   624: aconst_null
    //   625: putfield 80	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:inputStream	Ljava/io/FileInputStream;
    //   628: aload 13
    //   630: astore 12
    //   632: aload 11
    //   634: astore 8
    //   636: aload 10
    //   638: astore 9
    //   640: aload 11
    //   642: astore 7
    //   644: aload 10
    //   646: astore 6
    //   648: aload_0
    //   649: getfield 183	com/lidroid/xutils/bitmap/core/BitmapCache:mDiskLruCache	Lcom/lidroid/xutils/util/core/LruDiskCache;
    //   652: aload_1
    //   653: invokevirtual 207	com/lidroid/xutils/util/core/LruDiskCache:remove	(Ljava/lang/String;)Z
    //   656: pop
    //   657: aload 10
    //   659: astore 9
    //   661: aload 11
    //   663: astore 8
    //   665: aload 13
    //   667: astore 12
    //   669: aload 8
    //   671: astore 7
    //   673: aload 9
    //   675: astore 6
    //   677: aload 24
    //   679: monitorexit
    //   680: aload 8
    //   682: astore 7
    //   684: aload 9
    //   686: astore 6
    //   688: aload 12
    //   690: astore 11
    //   692: aload 11
    //   694: ifnonnull +329 -> 1023
    //   697: new 285	java/io/ByteArrayOutputStream
    //   700: dup
    //   701: invokespecial 286	java/io/ByteArrayOutputStream:<init>	()V
    //   704: astore 11
    //   706: aload 11
    //   708: astore 8
    //   710: aload 6
    //   712: astore 10
    //   714: aload 11
    //   716: astore 7
    //   718: aload 6
    //   720: astore 9
    //   722: aload 25
    //   724: aload_0
    //   725: getfield 45	com/lidroid/xutils/bitmap/core/BitmapCache:globalConfig	Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
    //   728: invokevirtual 246	com/lidroid/xutils/bitmap/BitmapGlobalConfig:getDownloader	()Lcom/lidroid/xutils/bitmap/download/Downloader;
    //   731: aload_1
    //   732: aload 11
    //   734: aload_3
    //   735: invokevirtual 252	com/lidroid/xutils/bitmap/download/Downloader:downloadToStream	(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J
    //   738: putfield 256	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:expiryTimestamp	J
    //   741: aload 11
    //   743: astore 8
    //   745: aload 6
    //   747: astore 10
    //   749: aload 11
    //   751: astore 7
    //   753: aload 6
    //   755: astore 9
    //   757: aload 25
    //   759: getfield 256	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:expiryTimestamp	J
    //   762: lstore 4
    //   764: lload 4
    //   766: lconst_0
    //   767: lcmp
    //   768: ifge +89 -> 857
    //   771: aload 11
    //   773: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   776: aload 6
    //   778: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   781: aconst_null
    //   782: areturn
    //   783: astore 10
    //   785: aload 8
    //   787: astore 7
    //   789: aload 9
    //   791: astore 6
    //   793: aload 10
    //   795: invokevirtual 197	java/lang/Throwable:getMessage	()Ljava/lang/String;
    //   798: aload 10
    //   800: invokestatic 203	com/lidroid/xutils/util/LogUtils:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   803: goto -134 -> 669
    //   806: astore_1
    //   807: aload 24
    //   809: monitorexit
    //   810: aload 7
    //   812: astore 8
    //   814: aload 6
    //   816: astore 10
    //   818: aload 6
    //   820: astore 9
    //   822: aload_1
    //   823: athrow
    //   824: astore_1
    //   825: aload 10
    //   827: astore 6
    //   829: aload 8
    //   831: astore 7
    //   833: aload 6
    //   835: astore 9
    //   837: aload_1
    //   838: invokevirtual 197	java/lang/Throwable:getMessage	()Ljava/lang/String;
    //   841: aload_1
    //   842: invokestatic 203	com/lidroid/xutils/util/LogUtils:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   845: aload 8
    //   847: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   850: aload 6
    //   852: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   855: aconst_null
    //   856: areturn
    //   857: aload 11
    //   859: astore 8
    //   861: aload 6
    //   863: astore 10
    //   865: aload 11
    //   867: astore 7
    //   869: aload 6
    //   871: astore 9
    //   873: aload 25
    //   875: aload 11
    //   877: checkcast 285	java/io/ByteArrayOutputStream
    //   880: invokevirtual 290	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   883: putfield 111	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:data	[B
    //   886: aload 11
    //   888: astore 8
    //   890: aload 6
    //   892: astore 10
    //   894: aload 11
    //   896: astore 7
    //   898: aload 6
    //   900: astore 9
    //   902: aload_0
    //   903: aload 25
    //   905: aload_2
    //   906: invokespecial 283	com/lidroid/xutils/bitmap/core/BitmapCache:decodeBitmapMeta	(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
    //   909: astore 12
    //   911: aload 11
    //   913: astore_3
    //   914: aload 12
    //   916: astore 11
    //   918: aload 11
    //   920: astore 7
    //   922: aload 11
    //   924: ifnull +58 -> 982
    //   927: aload_3
    //   928: astore 8
    //   930: aload 6
    //   932: astore 10
    //   934: aload_3
    //   935: astore 7
    //   937: aload 6
    //   939: astore 9
    //   941: aload_0
    //   942: aload_1
    //   943: aload_2
    //   944: aload 11
    //   946: invokespecial 292	com/lidroid/xutils/bitmap/core/BitmapCache:rotateBitmapIfNeeded	(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    //   949: astore 11
    //   951: aload_3
    //   952: astore 8
    //   954: aload 6
    //   956: astore 10
    //   958: aload_3
    //   959: astore 7
    //   961: aload 6
    //   963: astore 9
    //   965: aload_0
    //   966: aload_1
    //   967: aload_2
    //   968: aload 11
    //   970: aload 25
    //   972: getfield 256	com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta:expiryTimestamp	J
    //   975: invokespecial 294	com/lidroid/xutils/bitmap/core/BitmapCache:addBitmapToMemoryCache	(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;J)V
    //   978: aload 11
    //   980: astore 7
    //   982: aload_3
    //   983: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   986: aload 6
    //   988: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   991: aload 7
    //   993: areturn
    //   994: astore_1
    //   995: aload 9
    //   997: astore 6
    //   999: aload 7
    //   1001: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   1004: aload 6
    //   1006: invokestatic 265	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   1009: aload_1
    //   1010: athrow
    //   1011: astore_1
    //   1012: goto -13 -> 999
    //   1015: astore_1
    //   1016: aload 7
    //   1018: astore 8
    //   1020: goto -191 -> 829
    //   1023: aload 7
    //   1025: astore_3
    //   1026: goto -108 -> 918
    //   1029: aconst_null
    //   1030: astore 7
    //   1032: aload 24
    //   1034: astore 11
    //   1036: goto -344 -> 692
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1039	0	this	BitmapCache
    //   0	1039	1	paramString	String
    //   0	1039	2	paramBitmapDisplayConfig	BitmapDisplayConfig
    //   0	1039	3	paramBitmapLoadTask	com.lidroid.xutils.BitmapUtils.BitmapLoadTask<?>
    //   762	3	4	l	long
    //   30	377	6	localObject1	Object
    //   418	1	6	localThrowable1	Throwable
    //   441	564	6	localObject2	Object
    //   66	965	7	localObject3	Object
    //   58	961	8	localObject4	Object
    //   70	926	9	localObject5	Object
    //   62	686	10	localObject6	Object
    //   783	16	10	localThrowable2	Throwable
    //   816	141	10	localObject7	Object
    //   36	999	11	localObject8	Object
    //   21	894	12	localObject9	Object
    //   33	633	13	localObject10	Object
    //   54	455	14	localObject11	Object
    //   51	506	15	localObject12	Object
    //   27	216	16	localObject13	Object
    //   15	245	17	localObject14	Object
    //   18	383	18	localObject15	Object
    //   45	429	19	localEditor	com.lidroid.xutils.util.core.LruDiskCache.Editor
    //   12	145	20	localObject16	Object
    //   24	89	21	localObject17	Object
    //   39	70	22	localObject18	Object
    //   42	75	23	localObject19	Object
    //   48	985	24	localObject20	Object
    //   9	962	25	localBitmapMeta	BitmapMeta
    // Exception table:
    //   from	to	target	type
    //   408	415	418	java/lang/Throwable
    //   189	199	783	java/lang/Throwable
    //   232	242	783	java/lang/Throwable
    //   275	283	783	java/lang/Throwable
    //   303	322	783	java/lang/Throwable
    //   342	352	783	java/lang/Throwable
    //   372	377	783	java/lang/Throwable
    //   443	453	783	java/lang/Throwable
    //   473	478	783	java/lang/Throwable
    //   498	508	783	java/lang/Throwable
    //   545	556	783	java/lang/Throwable
    //   576	585	783	java/lang/Throwable
    //   622	628	783	java/lang/Throwable
    //   648	657	783	java/lang/Throwable
    //   131	138	806	finally
    //   146	152	806	finally
    //   189	199	806	finally
    //   232	242	806	finally
    //   275	283	806	finally
    //   303	322	806	finally
    //   342	352	806	finally
    //   372	377	806	finally
    //   385	388	806	finally
    //   408	415	806	finally
    //   443	453	806	finally
    //   473	478	806	finally
    //   498	508	806	finally
    //   545	556	806	finally
    //   576	585	806	finally
    //   622	628	806	finally
    //   648	657	806	finally
    //   677	680	806	finally
    //   793	803	806	finally
    //   807	810	806	finally
    //   72	82	824	java/lang/Throwable
    //   98	104	824	java/lang/Throwable
    //   120	123	824	java/lang/Throwable
    //   722	741	824	java/lang/Throwable
    //   757	764	824	java/lang/Throwable
    //   822	824	824	java/lang/Throwable
    //   873	886	824	java/lang/Throwable
    //   902	911	824	java/lang/Throwable
    //   941	951	824	java/lang/Throwable
    //   965	978	824	java/lang/Throwable
    //   72	82	994	finally
    //   98	104	994	finally
    //   120	123	994	finally
    //   722	741	994	finally
    //   757	764	994	finally
    //   822	824	994	finally
    //   837	845	994	finally
    //   873	886	994	finally
    //   902	911	994	finally
    //   941	951	994	finally
    //   965	978	994	finally
    //   697	706	1011	finally
    //   697	706	1015	java/lang/Throwable
  }
  
  public void flush()
  {
    synchronized (this.mDiskCacheLock)
    {
      LruDiskCache localLruDiskCache = this.mDiskLruCache;
      if (localLruDiskCache != null) {}
      try
      {
        this.mDiskLruCache.flush();
        return;
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          LogUtils.e(localThrowable.getMessage(), localThrowable);
        }
      }
    }
  }
  
  public File getBitmapFileFromDiskCache(String paramString)
  {
    if (this.mDiskLruCache != null) {
      return this.mDiskLruCache.getCacheFile(paramString, 0);
    }
    return null;
  }
  
  public Bitmap getBitmapFromDiskCache(String paramString, BitmapDisplayConfig paramBitmapDisplayConfig)
  {
    if ((paramString == null) || (!this.globalConfig.isDiskCacheEnabled())) {
      return null;
    }
    Object localObject1;
    Object localObject3;
    synchronized (this.mDiskCacheLock)
    {
      if (this.isDiskCacheReadied)
      {
        localObject1 = this.mDiskLruCache;
        if (localObject1 == null) {
          break label219;
        }
        localObject3 = null;
        localObject1 = null;
      }
    }
    for (;;)
    {
      try
      {
        LruDiskCache.Snapshot localSnapshot = this.mDiskLruCache.get(paramString);
        Object localObject2;
        if (localSnapshot != null)
        {
          if (paramBitmapDisplayConfig != null)
          {
            localObject1 = localSnapshot;
            localObject3 = localSnapshot;
            if (!paramBitmapDisplayConfig.isShowOriginal()) {}
          }
          else
          {
            localObject1 = localSnapshot;
            localObject3 = localSnapshot;
            localBitmap = BitmapDecoder.decodeFileDescriptor(localSnapshot.getInputStream(0).getFD());
            localObject1 = localSnapshot;
            localObject3 = localSnapshot;
            localBitmap = rotateBitmapIfNeeded(paramString, paramBitmapDisplayConfig, localBitmap);
            localObject1 = localSnapshot;
            localObject3 = localSnapshot;
            addBitmapToMemoryCache(paramString, paramBitmapDisplayConfig, localBitmap, this.mDiskLruCache.getExpiryTimestamp(paramString));
            IOUtils.closeQuietly(localSnapshot);
            return localBitmap;
            paramString = finally;
            throw paramString;
            try
            {
              this.mDiskCacheLock.wait();
            }
            catch (Throwable localThrowable) {}
            break;
          }
          localObject2 = localSnapshot;
          localObject3 = localSnapshot;
          Bitmap localBitmap = BitmapDecoder.decodeSampledBitmapFromDescriptor(localSnapshot.getInputStream(0).getFD(), paramBitmapDisplayConfig.getBitmapMaxSize(), paramBitmapDisplayConfig.getBitmapConfig());
          continue;
        }
        label219:
        IOUtils.closeQuietly(localSnapshot);
      }
      catch (Throwable paramString)
      {
        localObject3 = localObject2;
        LogUtils.e(paramString.getMessage(), paramString);
        IOUtils.closeQuietly((Closeable)localObject2);
        return null;
      }
      finally
      {
        IOUtils.closeQuietly((Closeable)localObject3);
      }
    }
  }
  
  public Bitmap getBitmapFromMemCache(String paramString, BitmapDisplayConfig paramBitmapDisplayConfig)
  {
    if ((this.mMemoryCache != null) && (this.globalConfig.isMemoryCacheEnabled()))
    {
      if (paramBitmapDisplayConfig == null) {}
      for (paramBitmapDisplayConfig = null;; paramBitmapDisplayConfig = paramBitmapDisplayConfig.toString())
      {
        paramString = new MemoryCacheKey(paramString, paramBitmapDisplayConfig, null);
        return (Bitmap)this.mMemoryCache.get(paramString);
      }
    }
    return null;
  }
  
  public void initDiskCache()
  {
    if (!this.globalConfig.isDiskCacheEnabled()) {
      return;
    }
    File localFile;
    long l1;
    synchronized (this.mDiskCacheLock)
    {
      if ((this.mDiskLruCache == null) || (this.mDiskLruCache.isClosed()))
      {
        localFile = new File(this.globalConfig.getDiskCachePath());
        if (!localFile.exists()) {
          localFile.mkdirs();
        }
        l1 = BitmapCommonUtils.getAvailableSpace(localFile);
        int i = this.globalConfig.getDiskCacheSize();
        long l2 = i;
        if (l1 <= l2) {
          break label145;
        }
        l1 = l2;
      }
    }
    try
    {
      label145:
      for (;;)
      {
        this.mDiskLruCache = LruDiskCache.open(localFile, 1, 1, l1);
        this.mDiskLruCache.setDiskCacheFileNameGenerator(this.globalConfig.getDiskCacheFileNameGenerator());
        this.isDiskCacheReadied = true;
        this.mDiskCacheLock.notifyAll();
        return;
        localObject2 = finally;
        throw ((Throwable)localObject2);
      }
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        this.mDiskLruCache = null;
        LogUtils.e(localThrowable.getMessage(), localThrowable);
      }
    }
  }
  
  public void initMemoryCache()
  {
    if (!this.globalConfig.isMemoryCacheEnabled()) {
      return;
    }
    if (this.mMemoryCache != null) {}
    try
    {
      clearMemoryCache();
      this.mMemoryCache = new LruMemoryCache(this.globalConfig.getMemoryCacheSize())
      {
        protected int sizeOf(BitmapCache.MemoryCacheKey paramAnonymousMemoryCacheKey, Bitmap paramAnonymousBitmap)
        {
          if (paramAnonymousBitmap == null) {
            return 0;
          }
          return paramAnonymousBitmap.getRowBytes() * paramAnonymousBitmap.getHeight();
        }
      };
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
  
  public void setDiskCacheFileNameGenerator(LruDiskCache.DiskCacheFileNameGenerator paramDiskCacheFileNameGenerator)
  {
    if ((this.mDiskLruCache != null) && (paramDiskCacheFileNameGenerator != null)) {
      this.mDiskLruCache.setDiskCacheFileNameGenerator(paramDiskCacheFileNameGenerator);
    }
  }
  
  public void setDiskCacheSize(int paramInt)
  {
    if (this.mDiskLruCache != null) {
      this.mDiskLruCache.setMaxSize(paramInt);
    }
  }
  
  public void setMemoryCacheSize(int paramInt)
  {
    if (this.mMemoryCache != null) {
      this.mMemoryCache.setMaxSize(paramInt);
    }
  }
  
  private class BitmapMeta
  {
    public byte[] data;
    public long expiryTimestamp;
    public FileInputStream inputStream;
    
    private BitmapMeta() {}
  }
  
  public class MemoryCacheKey
  {
    private String subKey;
    private String uri;
    
    private MemoryCacheKey(String paramString1, String paramString2)
    {
      this.uri = paramString1;
      this.subKey = paramString2;
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if (!(paramObject instanceof MemoryCacheKey)) {
          return false;
        }
        paramObject = (MemoryCacheKey)paramObject;
        if (!this.uri.equals(((MemoryCacheKey)paramObject).uri)) {
          return false;
        }
      } while ((this.subKey == null) || (((MemoryCacheKey)paramObject).subKey == null));
      return this.subKey.equals(((MemoryCacheKey)paramObject).subKey);
    }
    
    public int hashCode()
    {
      return this.uri.hashCode();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\core\BitmapCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */