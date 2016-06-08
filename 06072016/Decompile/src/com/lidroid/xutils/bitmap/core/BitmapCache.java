package com.lidroid.xutils.bitmap.core;

import com.lidroid.xutils.util.core.*;
import com.lidroid.xutils.bitmap.*;
import android.media.*;
import android.graphics.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.*;
import java.io.*;

public class BitmapCache
{
    private final int DISK_CACHE_INDEX;
    private BitmapGlobalConfig globalConfig;
    private boolean isDiskCacheReadied;
    private final Object mDiskCacheLock;
    private LruDiskCache mDiskLruCache;
    private LruMemoryCache<MemoryCacheKey, Bitmap> mMemoryCache;
    
    public BitmapCache(final BitmapGlobalConfig globalConfig) {
        this.DISK_CACHE_INDEX = 0;
        this.mDiskCacheLock = new Object();
        this.isDiskCacheReadied = false;
        if (globalConfig == null) {
            throw new IllegalArgumentException("globalConfig may not be null");
        }
        this.globalConfig = globalConfig;
    }
    
    private void addBitmapToMemoryCache(final String s, final BitmapDisplayConfig bitmapDisplayConfig, final Bitmap bitmap, final long n) throws IOException {
        if (s != null && bitmap != null && this.globalConfig.isMemoryCacheEnabled() && this.mMemoryCache != null) {
            String string;
            if (bitmapDisplayConfig == null) {
                string = null;
            }
            else {
                string = bitmapDisplayConfig.toString();
            }
            this.mMemoryCache.put(new MemoryCacheKey(s, string, (MemoryCacheKey)null), bitmap, n);
        }
    }
    
    private Bitmap decodeBitmapMeta(final BitmapMeta bitmapMeta, final BitmapDisplayConfig bitmapDisplayConfig) throws IOException {
        if (bitmapMeta != null) {
            if (bitmapMeta.inputStream != null) {
                if (bitmapDisplayConfig == null || bitmapDisplayConfig.isShowOriginal()) {
                    return BitmapDecoder.decodeFileDescriptor(bitmapMeta.inputStream.getFD());
                }
                return BitmapDecoder.decodeSampledBitmapFromDescriptor(bitmapMeta.inputStream.getFD(), bitmapDisplayConfig.getBitmapMaxSize(), bitmapDisplayConfig.getBitmapConfig());
            }
            else if (bitmapMeta.data != null) {
                if (bitmapDisplayConfig == null || bitmapDisplayConfig.isShowOriginal()) {
                    return BitmapDecoder.decodeByteArray(bitmapMeta.data);
                }
                return BitmapDecoder.decodeSampledBitmapFromByteArray(bitmapMeta.data, bitmapDisplayConfig.getBitmapMaxSize(), bitmapDisplayConfig.getBitmapConfig());
            }
        }
        return null;
    }
    
    private Bitmap rotateBitmapIfNeeded(final String s, final BitmapDisplayConfig bitmapDisplayConfig, final Bitmap bitmap) {
        Bitmap bitmap2 = bitmap;
        if (bitmapDisplayConfig == null) {
            return bitmap2;
        }
        bitmap2 = bitmap;
        if (!bitmapDisplayConfig.isAutoRotation()) {
            return bitmap2;
        }
        final File bitmapFileFromDiskCache = this.getBitmapFileFromDiskCache(s);
        bitmap2 = bitmap;
        if (bitmapFileFromDiskCache == null) {
            return bitmap2;
        }
        bitmap2 = bitmap;
        if (!bitmapFileFromDiskCache.exists()) {
            return bitmap2;
        }
        while (true) {
            while (true) {
                Label_0176: {
                    Label_0168: {
                        try {
                            switch (new ExifInterface(bitmapFileFromDiskCache.getPath()).getAttributeInt("Orientation", 0)) {
                                default: {
                                    final int n = 0;
                                    bitmap2 = bitmap;
                                    if (n != 0) {
                                        final Matrix matrix = new Matrix();
                                        matrix.postRotate((float)n);
                                        bitmap2 = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
                                        bitmap.recycle();
                                    }
                                    return bitmap2;
                                }
                                case 6: {
                                    break;
                                }
                                case 3: {
                                    break Label_0168;
                                }
                                case 8: {
                                    break Label_0176;
                                }
                            }
                        }
                        catch (Throwable t) {
                            return bitmap;
                        }
                        final int n = 90;
                        continue;
                    }
                    final int n = 180;
                    continue;
                }
                final int n = 270;
                continue;
            }
        }
    }
    
    public void clearCache() {
        this.clearMemoryCache();
        this.clearDiskCache();
    }
    
    public void clearCache(final String s) {
        this.clearMemoryCache(s);
        this.clearDiskCache(s);
    }
    
    public void clearDiskCache() {
        synchronized (this.mDiskCacheLock) {
            Label_0043: {
                if (this.mDiskLruCache == null || this.mDiskLruCache.isClosed()) {
                    break Label_0043;
                }
                try {
                    this.mDiskLruCache.delete();
                    this.mDiskLruCache = null;
                    this.isDiskCacheReadied = false;
                    // monitorexit(this.mDiskCacheLock)
                    this.initDiskCache();
                }
                catch (Throwable t) {
                    LogUtils.e(t.getMessage(), t);
                }
            }
        }
    }
    
    public void clearDiskCache(final String s) {
        synchronized (this.mDiskCacheLock) {
            if (this.mDiskLruCache == null || this.mDiskLruCache.isClosed()) {
                return;
            }
            try {
                this.mDiskLruCache.remove(s);
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
            }
        }
    }
    
    public void clearMemoryCache() {
        if (this.mMemoryCache != null) {
            this.mMemoryCache.evictAll();
        }
    }
    
    public void clearMemoryCache(final String s) {
        final MemoryCacheKey memoryCacheKey = new MemoryCacheKey(s, (String)null, (MemoryCacheKey)null);
        if (this.mMemoryCache != null) {
            while (this.mMemoryCache.containsKey(memoryCacheKey)) {
                this.mMemoryCache.remove(memoryCacheKey);
            }
        }
    }
    
    public void close() {
        synchronized (this.mDiskCacheLock) {
            if (this.mDiskLruCache == null) {
                return;
            }
            try {
                if (!this.mDiskLruCache.isClosed()) {
                    this.mDiskLruCache.close();
                    this.mDiskLruCache = null;
                }
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
            }
        }
    }
    
    public Bitmap downloadBitmap(final String p0, final BitmapDisplayConfig p1, final BitmapUtils.BitmapLoadTask<?> p2) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     3: dup            
        //     4: aload_0        
        //     5: aconst_null    
        //     6: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.<init>:(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;)V
        //     9: astore          25
        //    11: aconst_null    
        //    12: astore          20
        //    14: aconst_null    
        //    15: astore          17
        //    17: aconst_null    
        //    18: astore          18
        //    20: aconst_null    
        //    21: astore          12
        //    23: aconst_null    
        //    24: astore          21
        //    26: aconst_null    
        //    27: astore          16
        //    29: aconst_null    
        //    30: astore          6
        //    32: aconst_null    
        //    33: astore          13
        //    35: aconst_null    
        //    36: astore          11
        //    38: aconst_null    
        //    39: astore          22
        //    41: aconst_null    
        //    42: astore          23
        //    44: aconst_null    
        //    45: astore          19
        //    47: aconst_null    
        //    48: astore          24
        //    50: aconst_null    
        //    51: astore          15
        //    53: aconst_null    
        //    54: astore          14
        //    56: aload           12
        //    58: astore          8
        //    60: aload           22
        //    62: astore          10
        //    64: aload           21
        //    66: astore          7
        //    68: aload           23
        //    70: astore          9
        //    72: aload_0        
        //    73: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //    76: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.isDiskCacheEnabled:()Z
        //    79: ifeq            1029
        //    82: aload           12
        //    84: astore          8
        //    86: aload           22
        //    88: astore          10
        //    90: aload           21
        //    92: astore          7
        //    94: aload           23
        //    96: astore          9
        //    98: aload_0        
        //    99: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskCacheLock:Ljava/lang/Object;
        //   102: astore          24
        //   104: aload           12
        //   106: astore          8
        //   108: aload           22
        //   110: astore          10
        //   112: aload           21
        //   114: astore          7
        //   116: aload           23
        //   118: astore          9
        //   120: aload           24
        //   122: monitorenter   
        //   123: aload           18
        //   125: astore          7
        //   127: aload           11
        //   129: astore          6
        //   131: aload_0        
        //   132: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.isDiskCacheReadied:Z
        //   135: ifeq            400
        //   138: aload           18
        //   140: astore          7
        //   142: aload           11
        //   144: astore          6
        //   146: aload_0        
        //   147: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   150: astore          10
        //   152: aload           14
        //   154: astore          12
        //   156: aload           20
        //   158: astore          8
        //   160: aload           19
        //   162: astore          9
        //   164: aload           10
        //   166: ifnull          669
        //   169: aload           15
        //   171: astore          12
        //   173: aload           17
        //   175: astore          8
        //   177: aload           13
        //   179: astore          9
        //   181: aload           18
        //   183: astore          7
        //   185: aload           11
        //   187: astore          6
        //   189: aload_0        
        //   190: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   193: aload_1        
        //   194: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.get:(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
        //   197: astore          13
        //   199: aload           16
        //   201: astore          11
        //   203: aload           13
        //   205: astore          10
        //   207: aload           13
        //   209: ifnonnull       508
        //   212: aload           15
        //   214: astore          12
        //   216: aload           17
        //   218: astore          8
        //   220: aload           13
        //   222: astore          9
        //   224: aload           18
        //   226: astore          7
        //   228: aload           13
        //   230: astore          6
        //   232: aload_0        
        //   233: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   236: aload_1        
        //   237: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.edit:(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
        //   240: astore          19
        //   242: aload           16
        //   244: astore          11
        //   246: aload           13
        //   248: astore          10
        //   250: aload           19
        //   252: ifnull          508
        //   255: aload           15
        //   257: astore          12
        //   259: aload           17
        //   261: astore          8
        //   263: aload           13
        //   265: astore          9
        //   267: aload           18
        //   269: astore          7
        //   271: aload           13
        //   273: astore          6
        //   275: aload           19
        //   277: iconst_0       
        //   278: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Editor.newOutputStream:(I)Ljava/io/OutputStream;
        //   281: astore          11
        //   283: aload           15
        //   285: astore          12
        //   287: aload           11
        //   289: astore          8
        //   291: aload           13
        //   293: astore          9
        //   295: aload           11
        //   297: astore          7
        //   299: aload           13
        //   301: astore          6
        //   303: aload           25
        //   305: aload_0        
        //   306: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //   309: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.getDownloader:()Lcom/lidroid/xutils/bitmap/download/Downloader;
        //   312: aload_1        
        //   313: aload           11
        //   315: aload_3        
        //   316: invokevirtual   com/lidroid/xutils/bitmap/download/Downloader.downloadToStream:(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J
        //   319: putfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.expiryTimestamp:J
        //   322: aload           15
        //   324: astore          12
        //   326: aload           11
        //   328: astore          8
        //   330: aload           13
        //   332: astore          9
        //   334: aload           11
        //   336: astore          7
        //   338: aload           13
        //   340: astore          6
        //   342: aload           25
        //   344: getfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.expiryTimestamp:J
        //   347: lconst_0       
        //   348: lcmp           
        //   349: ifge            423
        //   352: aload           15
        //   354: astore          12
        //   356: aload           11
        //   358: astore          8
        //   360: aload           13
        //   362: astore          9
        //   364: aload           11
        //   366: astore          7
        //   368: aload           13
        //   370: astore          6
        //   372: aload           19
        //   374: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Editor.abort:()V
        //   377: aload           11
        //   379: astore          7
        //   381: aload           13
        //   383: astore          6
        //   385: aload           24
        //   387: monitorexit    
        //   388: aload           11
        //   390: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   393: aload           13
        //   395: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   398: aconst_null    
        //   399: areturn        
        //   400: aload           18
        //   402: astore          7
        //   404: aload           11
        //   406: astore          6
        //   408: aload_0        
        //   409: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskCacheLock:Ljava/lang/Object;
        //   412: invokevirtual   java/lang/Object.wait:()V
        //   415: goto            123
        //   418: astore          6
        //   420: goto            123
        //   423: aload           15
        //   425: astore          12
        //   427: aload           11
        //   429: astore          8
        //   431: aload           13
        //   433: astore          9
        //   435: aload           11
        //   437: astore          7
        //   439: aload           13
        //   441: astore          6
        //   443: aload           19
        //   445: aload           25
        //   447: getfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.expiryTimestamp:J
        //   450: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Editor.setEntryExpiryTimestamp:(J)V
        //   453: aload           15
        //   455: astore          12
        //   457: aload           11
        //   459: astore          8
        //   461: aload           13
        //   463: astore          9
        //   465: aload           11
        //   467: astore          7
        //   469: aload           13
        //   471: astore          6
        //   473: aload           19
        //   475: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Editor.commit:()V
        //   478: aload           15
        //   480: astore          12
        //   482: aload           11
        //   484: astore          8
        //   486: aload           13
        //   488: astore          9
        //   490: aload           11
        //   492: astore          7
        //   494: aload           13
        //   496: astore          6
        //   498: aload_0        
        //   499: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   502: aload_1        
        //   503: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.get:(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
        //   506: astore          10
        //   508: aload           14
        //   510: astore          12
        //   512: aload           11
        //   514: astore          8
        //   516: aload           10
        //   518: astore          9
        //   520: aload           10
        //   522: ifnull          669
        //   525: aload           15
        //   527: astore          12
        //   529: aload           11
        //   531: astore          8
        //   533: aload           10
        //   535: astore          9
        //   537: aload           11
        //   539: astore          7
        //   541: aload           10
        //   543: astore          6
        //   545: aload           25
        //   547: aload           10
        //   549: iconst_0       
        //   550: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Snapshot.getInputStream:(I)Ljava/io/FileInputStream;
        //   553: putfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.inputStream:Ljava/io/FileInputStream;
        //   556: aload           15
        //   558: astore          12
        //   560: aload           11
        //   562: astore          8
        //   564: aload           10
        //   566: astore          9
        //   568: aload           11
        //   570: astore          7
        //   572: aload           10
        //   574: astore          6
        //   576: aload_0        
        //   577: aload           25
        //   579: aload_2        
        //   580: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache.decodeBitmapMeta:(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
        //   583: astore          13
        //   585: aload           13
        //   587: astore          12
        //   589: aload           11
        //   591: astore          8
        //   593: aload           10
        //   595: astore          9
        //   597: aload           13
        //   599: ifnonnull       669
        //   602: aload           13
        //   604: astore          12
        //   606: aload           11
        //   608: astore          8
        //   610: aload           10
        //   612: astore          9
        //   614: aload           11
        //   616: astore          7
        //   618: aload           10
        //   620: astore          6
        //   622: aload           25
        //   624: aconst_null    
        //   625: putfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.inputStream:Ljava/io/FileInputStream;
        //   628: aload           13
        //   630: astore          12
        //   632: aload           11
        //   634: astore          8
        //   636: aload           10
        //   638: astore          9
        //   640: aload           11
        //   642: astore          7
        //   644: aload           10
        //   646: astore          6
        //   648: aload_0        
        //   649: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   652: aload_1        
        //   653: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.remove:(Ljava/lang/String;)Z
        //   656: pop            
        //   657: aload           10
        //   659: astore          9
        //   661: aload           11
        //   663: astore          8
        //   665: aload           13
        //   667: astore          12
        //   669: aload           8
        //   671: astore          7
        //   673: aload           9
        //   675: astore          6
        //   677: aload           24
        //   679: monitorexit    
        //   680: aload           8
        //   682: astore          7
        //   684: aload           9
        //   686: astore          6
        //   688: aload           12
        //   690: astore          11
        //   692: aload           11
        //   694: ifnonnull       1023
        //   697: new             Ljava/io/ByteArrayOutputStream;
        //   700: dup            
        //   701: invokespecial   java/io/ByteArrayOutputStream.<init>:()V
        //   704: astore          11
        //   706: aload           11
        //   708: astore          8
        //   710: aload           6
        //   712: astore          10
        //   714: aload           11
        //   716: astore          7
        //   718: aload           6
        //   720: astore          9
        //   722: aload           25
        //   724: aload_0        
        //   725: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //   728: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.getDownloader:()Lcom/lidroid/xutils/bitmap/download/Downloader;
        //   731: aload_1        
        //   732: aload           11
        //   734: aload_3        
        //   735: invokevirtual   com/lidroid/xutils/bitmap/download/Downloader.downloadToStream:(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J
        //   738: putfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.expiryTimestamp:J
        //   741: aload           11
        //   743: astore          8
        //   745: aload           6
        //   747: astore          10
        //   749: aload           11
        //   751: astore          7
        //   753: aload           6
        //   755: astore          9
        //   757: aload           25
        //   759: getfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.expiryTimestamp:J
        //   762: lstore          4
        //   764: lload           4
        //   766: lconst_0       
        //   767: lcmp           
        //   768: ifge            857
        //   771: aload           11
        //   773: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   776: aload           6
        //   778: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   781: aconst_null    
        //   782: areturn        
        //   783: astore          10
        //   785: aload           8
        //   787: astore          7
        //   789: aload           9
        //   791: astore          6
        //   793: aload           10
        //   795: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   798: aload           10
        //   800: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   803: goto            669
        //   806: astore_1       
        //   807: aload           24
        //   809: monitorexit    
        //   810: aload           7
        //   812: astore          8
        //   814: aload           6
        //   816: astore          10
        //   818: aload           6
        //   820: astore          9
        //   822: aload_1        
        //   823: athrow         
        //   824: astore_1       
        //   825: aload           10
        //   827: astore          6
        //   829: aload           8
        //   831: astore          7
        //   833: aload           6
        //   835: astore          9
        //   837: aload_1        
        //   838: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   841: aload_1        
        //   842: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   845: aload           8
        //   847: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   850: aload           6
        //   852: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   855: aconst_null    
        //   856: areturn        
        //   857: aload           11
        //   859: astore          8
        //   861: aload           6
        //   863: astore          10
        //   865: aload           11
        //   867: astore          7
        //   869: aload           6
        //   871: astore          9
        //   873: aload           25
        //   875: aload           11
        //   877: checkcast       Ljava/io/ByteArrayOutputStream;
        //   880: invokevirtual   java/io/ByteArrayOutputStream.toByteArray:()[B
        //   883: putfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.data:[B
        //   886: aload           11
        //   888: astore          8
        //   890: aload           6
        //   892: astore          10
        //   894: aload           11
        //   896: astore          7
        //   898: aload           6
        //   900: astore          9
        //   902: aload_0        
        //   903: aload           25
        //   905: aload_2        
        //   906: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache.decodeBitmapMeta:(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
        //   909: astore          12
        //   911: aload           11
        //   913: astore_3       
        //   914: aload           12
        //   916: astore          11
        //   918: aload           11
        //   920: astore          7
        //   922: aload           11
        //   924: ifnull          982
        //   927: aload_3        
        //   928: astore          8
        //   930: aload           6
        //   932: astore          10
        //   934: aload_3        
        //   935: astore          7
        //   937: aload           6
        //   939: astore          9
        //   941: aload_0        
        //   942: aload_1        
        //   943: aload_2        
        //   944: aload           11
        //   946: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache.rotateBitmapIfNeeded:(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
        //   949: astore          11
        //   951: aload_3        
        //   952: astore          8
        //   954: aload           6
        //   956: astore          10
        //   958: aload_3        
        //   959: astore          7
        //   961: aload           6
        //   963: astore          9
        //   965: aload_0        
        //   966: aload_1        
        //   967: aload_2        
        //   968: aload           11
        //   970: aload           25
        //   972: getfield        com/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta.expiryTimestamp:J
        //   975: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache.addBitmapToMemoryCache:(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;J)V
        //   978: aload           11
        //   980: astore          7
        //   982: aload_3        
        //   983: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   986: aload           6
        //   988: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   991: aload           7
        //   993: areturn        
        //   994: astore_1       
        //   995: aload           9
        //   997: astore          6
        //   999: aload           7
        //  1001: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //  1004: aload           6
        //  1006: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //  1009: aload_1        
        //  1010: athrow         
        //  1011: astore_1       
        //  1012: goto            999
        //  1015: astore_1       
        //  1016: aload           7
        //  1018: astore          8
        //  1020: goto            829
        //  1023: aload           7
        //  1025: astore_3       
        //  1026: goto            918
        //  1029: aconst_null    
        //  1030: astore          7
        //  1032: aload           24
        //  1034: astore          11
        //  1036: goto            692
        //    Signature:
        //  (Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<*>;)Landroid/graphics/Bitmap;
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  72     82     824    829    Ljava/lang/Throwable;
        //  72     82     994    999    Any
        //  98     104    824    829    Ljava/lang/Throwable;
        //  98     104    994    999    Any
        //  120    123    824    829    Ljava/lang/Throwable;
        //  120    123    994    999    Any
        //  131    138    806    824    Any
        //  146    152    806    824    Any
        //  189    199    783    806    Ljava/lang/Throwable;
        //  189    199    806    824    Any
        //  232    242    783    806    Ljava/lang/Throwable;
        //  232    242    806    824    Any
        //  275    283    783    806    Ljava/lang/Throwable;
        //  275    283    806    824    Any
        //  303    322    783    806    Ljava/lang/Throwable;
        //  303    322    806    824    Any
        //  342    352    783    806    Ljava/lang/Throwable;
        //  342    352    806    824    Any
        //  372    377    783    806    Ljava/lang/Throwable;
        //  372    377    806    824    Any
        //  385    388    806    824    Any
        //  408    415    418    423    Ljava/lang/Throwable;
        //  408    415    806    824    Any
        //  443    453    783    806    Ljava/lang/Throwable;
        //  443    453    806    824    Any
        //  473    478    783    806    Ljava/lang/Throwable;
        //  473    478    806    824    Any
        //  498    508    783    806    Ljava/lang/Throwable;
        //  498    508    806    824    Any
        //  545    556    783    806    Ljava/lang/Throwable;
        //  545    556    806    824    Any
        //  576    585    783    806    Ljava/lang/Throwable;
        //  576    585    806    824    Any
        //  622    628    783    806    Ljava/lang/Throwable;
        //  622    628    806    824    Any
        //  648    657    783    806    Ljava/lang/Throwable;
        //  648    657    806    824    Any
        //  677    680    806    824    Any
        //  697    706    1015   1023   Ljava/lang/Throwable;
        //  697    706    1011   1015   Any
        //  722    741    824    829    Ljava/lang/Throwable;
        //  722    741    994    999    Any
        //  757    764    824    829    Ljava/lang/Throwable;
        //  757    764    994    999    Any
        //  793    803    806    824    Any
        //  807    810    806    824    Any
        //  822    824    824    829    Ljava/lang/Throwable;
        //  822    824    994    999    Any
        //  837    845    994    999    Any
        //  873    886    824    829    Ljava/lang/Throwable;
        //  873    886    994    999    Any
        //  902    911    824    829    Ljava/lang/Throwable;
        //  902    911    994    999    Any
        //  941    951    824    829    Ljava/lang/Throwable;
        //  941    951    994    999    Any
        //  965    978    824    829    Ljava/lang/Throwable;
        //  965    978    994    999    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0829:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2596)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:757)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:655)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:532)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:499)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:141)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:130)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.buildAst(JavaLanguage.java:71)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at us.deathmarine.luyten.FileSaver.doSaveJarDecompiled(FileSaver.java:191)
        //     at us.deathmarine.luyten.FileSaver.access$300(FileSaver.java:46)
        //     at us.deathmarine.luyten.FileSaver$4.run(FileSaver.java:112)
        //     at java.lang.Thread.run(Unknown Source)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    public void flush() {
        synchronized (this.mDiskCacheLock) {
            if (this.mDiskLruCache == null) {
                return;
            }
            try {
                this.mDiskLruCache.flush();
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
            }
        }
    }
    
    public File getBitmapFileFromDiskCache(final String s) {
        if (this.mDiskLruCache != null) {
            return this.mDiskLruCache.getCacheFile(s, 0);
        }
        return null;
    }
    
    public Bitmap getBitmapFromDiskCache(final String p0, final BitmapDisplayConfig p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: ifnull          14
        //     4: aload_0        
        //     5: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //     8: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.isDiskCacheEnabled:()Z
        //    11: ifne            16
        //    14: aconst_null    
        //    15: areturn        
        //    16: aload_0        
        //    17: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskCacheLock:Ljava/lang/Object;
        //    20: astore          7
        //    22: aload           7
        //    24: monitorenter   
        //    25: aload_0        
        //    26: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.isDiskCacheReadied:Z
        //    29: ifeq            157
        //    32: aload_0        
        //    33: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //    36: astore_3       
        //    37: aload_3        
        //    38: ifnull          219
        //    41: aconst_null    
        //    42: astore          4
        //    44: aconst_null    
        //    45: astore_3       
        //    46: aload_0        
        //    47: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //    50: aload_1        
        //    51: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.get:(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
        //    54: astore          5
        //    56: aload           5
        //    58: ifnull          232
        //    61: aload_2        
        //    62: ifnull          79
        //    65: aload           5
        //    67: astore_3       
        //    68: aload           5
        //    70: astore          4
        //    72: aload_2        
        //    73: invokevirtual   com/lidroid/xutils/bitmap/BitmapDisplayConfig.isShowOriginal:()Z
        //    76: ifeq            171
        //    79: aload           5
        //    81: astore_3       
        //    82: aload           5
        //    84: astore          4
        //    86: aload           5
        //    88: iconst_0       
        //    89: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Snapshot.getInputStream:(I)Ljava/io/FileInputStream;
        //    92: invokevirtual   java/io/FileInputStream.getFD:()Ljava/io/FileDescriptor;
        //    95: invokestatic    com/lidroid/xutils/bitmap/core/BitmapDecoder.decodeFileDescriptor:(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;
        //    98: astore          6
        //   100: aload           5
        //   102: astore_3       
        //   103: aload           5
        //   105: astore          4
        //   107: aload_0        
        //   108: aload_1        
        //   109: aload_2        
        //   110: aload           6
        //   112: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache.rotateBitmapIfNeeded:(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
        //   115: astore          6
        //   117: aload           5
        //   119: astore_3       
        //   120: aload           5
        //   122: astore          4
        //   124: aload_0        
        //   125: aload_1        
        //   126: aload_2        
        //   127: aload           6
        //   129: aload_0        
        //   130: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   133: aload_1        
        //   134: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.getExpiryTimestamp:(Ljava/lang/String;)J
        //   137: invokespecial   com/lidroid/xutils/bitmap/core/BitmapCache.addBitmapToMemoryCache:(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;J)V
        //   140: aload           5
        //   142: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   145: aload           7
        //   147: monitorexit    
        //   148: aload           6
        //   150: areturn        
        //   151: astore_1       
        //   152: aload           7
        //   154: monitorexit    
        //   155: aload_1        
        //   156: athrow         
        //   157: aload_0        
        //   158: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskCacheLock:Ljava/lang/Object;
        //   161: invokevirtual   java/lang/Object.wait:()V
        //   164: goto            25
        //   167: astore_3       
        //   168: goto            25
        //   171: aload           5
        //   173: astore_3       
        //   174: aload           5
        //   176: astore          4
        //   178: aload           5
        //   180: iconst_0       
        //   181: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Snapshot.getInputStream:(I)Ljava/io/FileInputStream;
        //   184: invokevirtual   java/io/FileInputStream.getFD:()Ljava/io/FileDescriptor;
        //   187: aload_2        
        //   188: invokevirtual   com/lidroid/xutils/bitmap/BitmapDisplayConfig.getBitmapMaxSize:()Lcom/lidroid/xutils/bitmap/core/BitmapSize;
        //   191: aload_2        
        //   192: invokevirtual   com/lidroid/xutils/bitmap/BitmapDisplayConfig.getBitmapConfig:()Landroid/graphics/Bitmap$Config;
        //   195: invokestatic    com/lidroid/xutils/bitmap/core/BitmapDecoder.decodeSampledBitmapFromDescriptor:(Ljava/io/FileDescriptor;Lcom/lidroid/xutils/bitmap/core/BitmapSize;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
        //   198: astore          6
        //   200: goto            100
        //   203: astore_1       
        //   204: aload_3        
        //   205: astore          4
        //   207: aload_1        
        //   208: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   211: aload_1        
        //   212: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   215: aload_3        
        //   216: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   219: aload           7
        //   221: monitorexit    
        //   222: aconst_null    
        //   223: areturn        
        //   224: astore_1       
        //   225: aload           4
        //   227: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   230: aload_1        
        //   231: athrow         
        //   232: aload           5
        //   234: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   237: goto            219
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  25     37     151    157    Any
        //  46     56     203    219    Ljava/lang/Throwable;
        //  46     56     224    232    Any
        //  72     79     203    219    Ljava/lang/Throwable;
        //  72     79     224    232    Any
        //  86     100    203    219    Ljava/lang/Throwable;
        //  86     100    224    232    Any
        //  107    117    203    219    Ljava/lang/Throwable;
        //  107    117    224    232    Any
        //  124    140    203    219    Ljava/lang/Throwable;
        //  124    140    224    232    Any
        //  140    148    151    157    Any
        //  152    155    151    157    Any
        //  157    164    167    171    Ljava/lang/Throwable;
        //  157    164    151    157    Any
        //  178    200    203    219    Ljava/lang/Throwable;
        //  178    200    224    232    Any
        //  207    215    224    232    Any
        //  215    219    151    157    Any
        //  219    222    151    157    Any
        //  225    232    151    157    Any
        //  232    237    151    157    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0079:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2596)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:757)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:655)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:532)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:499)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:141)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:130)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.buildAst(JavaLanguage.java:71)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at us.deathmarine.luyten.FileSaver.doSaveJarDecompiled(FileSaver.java:191)
        //     at us.deathmarine.luyten.FileSaver.access$300(FileSaver.java:46)
        //     at us.deathmarine.luyten.FileSaver$4.run(FileSaver.java:112)
        //     at java.lang.Thread.run(Unknown Source)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    public Bitmap getBitmapFromMemCache(final String s, final BitmapDisplayConfig bitmapDisplayConfig) {
        if (this.mMemoryCache != null && this.globalConfig.isMemoryCacheEnabled()) {
            String string;
            if (bitmapDisplayConfig == null) {
                string = null;
            }
            else {
                string = bitmapDisplayConfig.toString();
            }
            return this.mMemoryCache.get(new MemoryCacheKey(s, string, (MemoryCacheKey)null));
        }
        return null;
    }
    
    public void initDiskCache() {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //     4: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.isDiskCacheEnabled:()Z
        //     7: ifne            11
        //    10: return         
        //    11: aload_0        
        //    12: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskCacheLock:Ljava/lang/Object;
        //    15: astore          6
        //    17: aload           6
        //    19: monitorenter   
        //    20: aload_0        
        //    21: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //    24: ifnull          37
        //    27: aload_0        
        //    28: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //    31: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.isClosed:()Z
        //    34: ifeq            121
        //    37: new             Ljava/io/File;
        //    40: dup            
        //    41: aload_0        
        //    42: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //    45: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.getDiskCachePath:()Ljava/lang/String;
        //    48: invokespecial   java/io/File.<init>:(Ljava/lang/String;)V
        //    51: astore          7
        //    53: aload           7
        //    55: invokevirtual   java/io/File.exists:()Z
        //    58: ifne            67
        //    61: aload           7
        //    63: invokevirtual   java/io/File.mkdirs:()Z
        //    66: pop            
        //    67: aload           7
        //    69: invokestatic    com/lidroid/xutils/bitmap/BitmapCommonUtils.getAvailableSpace:(Ljava/io/File;)J
        //    72: lstore_2       
        //    73: aload_0        
        //    74: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //    77: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.getDiskCacheSize:()I
        //    80: istore_1       
        //    81: iload_1        
        //    82: i2l            
        //    83: lstore          4
        //    85: lload_2        
        //    86: lload           4
        //    88: lcmp           
        //    89: ifle            145
        //    92: lload           4
        //    94: lstore_2       
        //    95: aload_0        
        //    96: aload           7
        //    98: iconst_1       
        //    99: iconst_1       
        //   100: lload_2        
        //   101: invokestatic    com/lidroid/xutils/util/core/LruDiskCache.open:(Ljava/io/File;IIJ)Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   104: putfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   107: aload_0        
        //   108: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   111: aload_0        
        //   112: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
        //   115: invokevirtual   com/lidroid/xutils/bitmap/BitmapGlobalConfig.getDiskCacheFileNameGenerator:()Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;
        //   118: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache.setDiskCacheFileNameGenerator:(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V
        //   121: aload_0        
        //   122: iconst_1       
        //   123: putfield        com/lidroid/xutils/bitmap/core/BitmapCache.isDiskCacheReadied:Z
        //   126: aload_0        
        //   127: getfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskCacheLock:Ljava/lang/Object;
        //   130: invokevirtual   java/lang/Object.notifyAll:()V
        //   133: aload           6
        //   135: monitorexit    
        //   136: return         
        //   137: astore          7
        //   139: aload           6
        //   141: monitorexit    
        //   142: aload           7
        //   144: athrow         
        //   145: goto            95
        //   148: astore          7
        //   150: aload_0        
        //   151: aconst_null    
        //   152: putfield        com/lidroid/xutils/bitmap/core/BitmapCache.mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
        //   155: aload           7
        //   157: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   160: aload           7
        //   162: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   165: goto            121
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  20     37     137    145    Any
        //  37     67     137    145    Any
        //  67     81     137    145    Any
        //  95     121    148    168    Ljava/lang/Throwable;
        //  95     121    137    145    Any
        //  121    136    137    145    Any
        //  139    142    137    145    Any
        //  150    165    137    145    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0095:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2596)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:757)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:655)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:532)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:499)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:141)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:130)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.buildAst(JavaLanguage.java:71)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at us.deathmarine.luyten.FileSaver.doSaveJarDecompiled(FileSaver.java:191)
        //     at us.deathmarine.luyten.FileSaver.access$300(FileSaver.java:46)
        //     at us.deathmarine.luyten.FileSaver$4.run(FileSaver.java:112)
        //     at java.lang.Thread.run(Unknown Source)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    public void initMemoryCache() {
        if (!this.globalConfig.isMemoryCacheEnabled()) {
            return;
        }
        while (true) {
            if (this.mMemoryCache == null) {
                break Label_0022;
            }
            try {
                this.clearMemoryCache();
                this.mMemoryCache = new LruMemoryCache<MemoryCacheKey, Bitmap>(this.globalConfig.getMemoryCacheSize()) {
                    @Override
                    protected int sizeOf(final MemoryCacheKey memoryCacheKey, final Bitmap bitmap) {
                        if (bitmap == null) {
                            return 0;
                        }
                        return bitmap.getRowBytes() * bitmap.getHeight();
                    }
                };
            }
            catch (Throwable t) {
                continue;
            }
            break;
        }
    }
    
    public void setDiskCacheFileNameGenerator(final LruDiskCache.DiskCacheFileNameGenerator diskCacheFileNameGenerator) {
        if (this.mDiskLruCache != null && diskCacheFileNameGenerator != null) {
            this.mDiskLruCache.setDiskCacheFileNameGenerator(diskCacheFileNameGenerator);
        }
    }
    
    public void setDiskCacheSize(final int n) {
        if (this.mDiskLruCache != null) {
            this.mDiskLruCache.setMaxSize(n);
        }
    }
    
    public void setMemoryCacheSize(final int maxSize) {
        if (this.mMemoryCache != null) {
            this.mMemoryCache.setMaxSize(maxSize);
        }
    }
    
    private class BitmapMeta
    {
        public byte[] data;
        public long expiryTimestamp;
        public FileInputStream inputStream;
    }
    
    public class MemoryCacheKey
    {
        private String subKey;
        private String uri;
        
        private MemoryCacheKey(final String uri, final String subKey) {
            this.uri = uri;
            this.subKey = subKey;
        }
        
        @Override
        public boolean equals(final Object o) {
            if (this != o) {
                if (!(o instanceof MemoryCacheKey)) {
                    return false;
                }
                final MemoryCacheKey memoryCacheKey = (MemoryCacheKey)o;
                if (!this.uri.equals(memoryCacheKey.uri)) {
                    return false;
                }
                if (this.subKey != null && memoryCacheKey.subKey != null) {
                    return this.subKey.equals(memoryCacheKey.subKey);
                }
            }
            return true;
        }
        
        @Override
        public int hashCode() {
            return this.uri.hashCode();
        }
    }
}
