.class public Lcom/lidroid/xutils/bitmap/core/BitmapCache;
.super Ljava/lang/Object;
.source "BitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;,
        Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    }
.end annotation


# instance fields
.field private final DISK_CACHE_INDEX:I

.field private globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

.field private isDiskCacheReadied:Z

.field private final mDiskCacheLock:Ljava/lang/Object;

.field private mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

.field private mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/util/core/LruMemoryCache",
            "<",
            "Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;)V
    .locals 2
    .param p1, "globalConfig"    # Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    .prologue
    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->DISK_CACHE_INDEX:I

    .line 40
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    .line 41
    iput-boolean v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->isDiskCacheReadied:Z

    .line 51
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "globalConfig may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    .line 53
    return-void
.end method

.method private addBitmapToMemoryCache(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;J)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .param p3, "bitmap"    # Landroid/graphics/Bitmap;
    .param p4, "expiryTimestamp"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 214
    if-eqz p1, :cond_0

    if-eqz p3, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->isMemoryCacheEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    if-eqz v1, :cond_0

    .line 215
    new-instance v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;

    if-nez p2, :cond_1

    move-object v1, v2

    :goto_0
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;-><init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Ljava/lang/String;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;)V

    .line 216
    .local v0, "key":Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v1, v0, p3, p4, p5}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->put(Ljava/lang/Object;Ljava/lang/Object;J)Ljava/lang/Object;

    .line 218
    .end local v0    # "key":Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    :cond_0
    return-void

    .line 215
    :cond_1
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private decodeBitmapMeta(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "bitmapMeta"    # Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;
    .param p2, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    if-nez p1, :cond_1

    const/4 v0, 0x0

    .line 414
    :cond_0
    :goto_0
    return-object v0

    .line 394
    :cond_1
    const/4 v0, 0x0

    .line 395
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v1, p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->inputStream:Ljava/io/FileInputStream;

    if-eqz v1, :cond_4

    .line 396
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->isShowOriginal()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 397
    :cond_2
    iget-object v1, p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->inputStream:Ljava/io/FileInputStream;

    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-static {v1}, Lcom/lidroid/xutils/bitmap/core/BitmapDecoder;->decodeFileDescriptor(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 398
    goto :goto_0

    .line 400
    :cond_3
    iget-object v1, p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->inputStream:Ljava/io/FileInputStream;

    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    .line 401
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getBitmapMaxSize()Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    move-result-object v2

    .line 402
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    .line 399
    invoke-static {v1, v2, v3}, Lcom/lidroid/xutils/bitmap/core/BitmapDecoder;->decodeSampledBitmapFromDescriptor(Ljava/io/FileDescriptor;Lcom/lidroid/xutils/bitmap/core/BitmapSize;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 404
    goto :goto_0

    :cond_4
    iget-object v1, p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->data:[B

    if-eqz v1, :cond_0

    .line 405
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->isShowOriginal()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 406
    :cond_5
    iget-object v1, p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->data:[B

    invoke-static {v1}, Lcom/lidroid/xutils/bitmap/core/BitmapDecoder;->decodeByteArray([B)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 407
    goto :goto_0

    .line 409
    :cond_6
    iget-object v1, p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->data:[B

    .line 410
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getBitmapMaxSize()Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    move-result-object v2

    .line 411
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    .line 408
    invoke-static {v1, v2, v3}, Lcom/lidroid/xutils/bitmap/core/BitmapDecoder;->decodeSampledBitmapFromByteArray([BLcom/lidroid/xutils/bitmap/core/BitmapSize;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method private rotateBitmapIfNeeded(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 14
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .param p3, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 418
    move-object/from16 v12, p3

    .line 419
    .local v12, "result":Landroid/graphics/Bitmap;
    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->isAutoRotation()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->getBitmapFileFromDiskCache(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 421
    .local v8, "bitmapFile":Ljava/io/File;
    if-eqz v8, :cond_0

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 422
    const/4 v10, 0x0

    .line 424
    .local v10, "exif":Landroid/media/ExifInterface;
    :try_start_0
    new-instance v10, Landroid/media/ExifInterface;

    .end local v10    # "exif":Landroid/media/ExifInterface;
    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 428
    .restart local v10    # "exif":Landroid/media/ExifInterface;
    const-string v0, "Orientation"

    const/4 v1, 0x0

    invoke-virtual {v10, v0, v1}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v11

    .line 429
    .local v11, "orientation":I
    const/4 v7, 0x0

    .line 430
    .local v7, "angle":I
    packed-switch v11, :pswitch_data_0

    .line 441
    :pswitch_0
    const/4 v7, 0x0

    .line 444
    :goto_0
    if-eqz v7, :cond_0

    .line 445
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 446
    .local v5, "m":Landroid/graphics/Matrix;
    int-to-float v0, v7

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 447
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object/from16 v0, p3

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 448
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->recycle()V

    .line 449
    const/16 p3, 0x0

    .end local v5    # "m":Landroid/graphics/Matrix;
    .end local v7    # "angle":I
    .end local v8    # "bitmapFile":Ljava/io/File;
    .end local v10    # "exif":Landroid/media/ExifInterface;
    .end local v11    # "orientation":I
    :cond_0
    move-object v13, v12

    .line 453
    .end local v12    # "result":Landroid/graphics/Bitmap;
    .local v13, "result":Landroid/graphics/Bitmap;
    :goto_1
    return-object v13

    .line 425
    .end local v13    # "result":Landroid/graphics/Bitmap;
    .restart local v8    # "bitmapFile":Ljava/io/File;
    .restart local v12    # "result":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v9

    .local v9, "e":Ljava/lang/Throwable;
    move-object v13, v12

    .line 426
    .end local v12    # "result":Landroid/graphics/Bitmap;
    .restart local v13    # "result":Landroid/graphics/Bitmap;
    goto :goto_1

    .line 432
    .end local v9    # "e":Ljava/lang/Throwable;
    .end local v13    # "result":Landroid/graphics/Bitmap;
    .restart local v7    # "angle":I
    .restart local v10    # "exif":Landroid/media/ExifInterface;
    .restart local v11    # "orientation":I
    .restart local v12    # "result":Landroid/graphics/Bitmap;
    :pswitch_1
    const/16 v7, 0x5a

    .line 433
    goto :goto_0

    .line 435
    :pswitch_2
    const/16 v7, 0xb4

    .line 436
    goto :goto_0

    .line 438
    :pswitch_3
    const/16 v7, 0x10e

    .line 439
    goto :goto_0

    .line 430
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public clearCache()V
    .locals 0

    .prologue
    .line 299
    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->clearMemoryCache()V

    .line 300
    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->clearDiskCache()V

    .line 301
    return-void
.end method

.method public clearCache(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 326
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->clearMemoryCache(Ljava/lang/String;)V

    .line 327
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->clearDiskCache(Ljava/lang/String;)V

    .line 328
    return-void
.end method

.method public clearDiskCache()V
    .locals 3

    .prologue
    .line 310
    iget-object v2, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 311
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 313
    :try_start_1
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->delete()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 317
    :goto_0
    const/4 v1, 0x0

    :try_start_2
    iput-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    .line 318
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->isDiskCacheReadied:Z

    .line 310
    :cond_0
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 321
    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->initDiskCache()V

    .line 322
    return-void

    .line 314
    :catch_0
    move-exception v0

    .line 315
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 310
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public clearDiskCache(Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 340
    iget-object v2, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 341
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 343
    :try_start_1
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->remove(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 340
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 349
    return-void

    .line 344
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 340
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public clearMemoryCache()V
    .locals 1

    .prologue
    .line 304
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v0}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->evictAll()V

    .line 307
    :cond_0
    return-void
.end method

.method public clearMemoryCache(Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 331
    new-instance v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;

    invoke-direct {v0, p0, p1, v1, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;-><init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Ljava/lang/String;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;)V

    .line 332
    .local v0, "key":Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    if-eqz v1, :cond_0

    .line 333
    :goto_0
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v1, v0}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 337
    :cond_0
    return-void

    .line 334
    :cond_1
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v1, v0}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public close()V
    .locals 3

    .prologue
    .line 372
    iget-object v2, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 373
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 375
    :try_start_1
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 376
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->close()V

    .line 377
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 372
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 384
    return-void

    .line 379
    :catch_0
    move-exception v0

    .line 380
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 372
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public downloadBitmap(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)Landroid/graphics/Bitmap;
    .locals 18
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;",
            "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask",
            "<*>;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .prologue
    .line 134
    .local p3, "task":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<*>;"
    new-instance v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v4}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;-><init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;)V

    .line 136
    .local v10, "bitmapMeta":Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;
    const/4 v13, 0x0

    .line 137
    .local v13, "outputStream":Ljava/io/OutputStream;
    const/4 v15, 0x0

    .line 141
    .local v15, "snapshot":Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    const/4 v7, 0x0

    .line 143
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v4}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->isDiskCacheEnabled()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 144
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 146
    :goto_0
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->isDiskCacheReadied:Z

    if-eqz v4, :cond_0

    .line 153
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_3

    .line 155
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->get(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;

    move-result-object v15

    .line 156
    if-nez v15, :cond_2

    .line 157
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->edit(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v12

    .line 158
    .local v12, "editor":Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    if-eqz v12, :cond_2

    .line 159
    const/4 v4, 0x0

    invoke-virtual {v12, v4}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v13

    .line 160
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v4}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDownloader()Lcom/lidroid/xutils/bitmap/download/Downloader;

    move-result-object v4

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v4, v0, v13, v1}, Lcom/lidroid/xutils/bitmap/download/Downloader;->downloadToStream(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J

    move-result-wide v8

    iput-wide v8, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->expiryTimestamp:J

    .line 161
    iget-wide v8, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->expiryTimestamp:J

    const-wide/16 v16, 0x0

    cmp-long v4, v8, v16

    if-gez v4, :cond_1

    .line 162
    invoke-virtual {v12}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->abort()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 163
    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 206
    invoke-static {v13}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    invoke-static {v15}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    const/4 v7, 0x0

    .line 210
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .end local v12    # "editor":Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    :goto_1
    return-object v7

    .line 148
    .restart local v7    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 149
    :catch_0
    move-exception v4

    goto :goto_0

    .line 165
    .restart local v12    # "editor":Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    :cond_1
    :try_start_5
    iget-wide v8, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->expiryTimestamp:J

    invoke-virtual {v12, v8, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->setEntryExpiryTimestamp(J)V

    .line 166
    invoke-virtual {v12}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->commit()V

    .line 168
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->get(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;

    move-result-object v15

    .line 171
    .end local v12    # "editor":Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    :cond_2
    if-eqz v15, :cond_3

    .line 172
    const/4 v4, 0x0

    invoke-virtual {v15, v4}, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->getInputStream(I)Ljava/io/FileInputStream;

    move-result-object v4

    iput-object v4, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->inputStream:Ljava/io/FileInputStream;

    .line 173
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v10, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->decodeBitmapMeta(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 174
    if-nez v7, :cond_3

    .line 175
    const/4 v4, 0x0

    iput-object v4, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->inputStream:Ljava/io/FileInputStream;

    .line 176
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->remove(Ljava/lang/String;)Z
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 144
    :cond_3
    :goto_2
    :try_start_6
    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-object v14, v13

    .line 187
    .end local v13    # "outputStream":Ljava/io/OutputStream;
    .local v14, "outputStream":Ljava/io/OutputStream;
    :goto_3
    if-nez v7, :cond_6

    .line 188
    :try_start_7
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 189
    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v13    # "outputStream":Ljava/io/OutputStream;
    :try_start_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v4}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDownloader()Lcom/lidroid/xutils/bitmap/download/Downloader;

    move-result-object v4

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v4, v0, v13, v1}, Lcom/lidroid/xutils/bitmap/download/Downloader;->downloadToStream(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J

    move-result-wide v4

    iput-wide v4, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->expiryTimestamp:J

    .line 190
    iget-wide v4, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->expiryTimestamp:J
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    const-wide/16 v8, 0x0

    cmp-long v4, v4, v8

    if-gez v4, :cond_4

    .line 206
    invoke-static {v13}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    invoke-static {v15}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 191
    const/4 v7, 0x0

    goto :goto_1

    .line 179
    :catch_1
    move-exception v11

    .line 180
    .local v11, "e":Ljava/lang/Throwable;
    :try_start_9
    invoke-virtual {v11}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v11}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 144
    .end local v11    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :try_start_a
    throw v4
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 203
    :catch_2
    move-exception v11

    .line 204
    .restart local v11    # "e":Ljava/lang/Throwable;
    :goto_4
    :try_start_b
    invoke-virtual {v11}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v11}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 206
    invoke-static {v13}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    invoke-static {v15}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 210
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 193
    .end local v11    # "e":Ljava/lang/Throwable;
    :cond_4
    :try_start_c
    move-object v0, v13

    check-cast v0, Ljava/io/ByteArrayOutputStream;

    move-object v4, v0

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    iput-object v4, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->data:[B

    .line 194
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v10, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->decodeBitmapMeta(Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 198
    :goto_5
    if-eqz v7, :cond_5

    .line 199
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v7}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->rotateBitmapIfNeeded(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 200
    iget-wide v8, v10, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->expiryTimestamp:J

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    invoke-direct/range {v4 .. v9}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->addBitmapToMemoryCache(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;J)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 206
    :cond_5
    invoke-static {v13}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    invoke-static {v15}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_1

    .line 205
    :catchall_1
    move-exception v4

    .line 206
    :goto_6
    invoke-static {v13}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    invoke-static {v15}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 208
    throw v4

    .line 205
    .end local v13    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    :catchall_2
    move-exception v4

    move-object v13, v14

    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v13    # "outputStream":Ljava/io/OutputStream;
    goto :goto_6

    .line 203
    .end local v13    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    :catch_3
    move-exception v11

    move-object v13, v14

    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v13    # "outputStream":Ljava/io/OutputStream;
    goto :goto_4

    .end local v13    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    :cond_6
    move-object v13, v14

    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v13    # "outputStream":Ljava/io/OutputStream;
    goto :goto_5

    :cond_7
    move-object v14, v13

    .end local v13    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    goto/16 :goto_3
.end method

.method public flush()V
    .locals 3

    .prologue
    .line 356
    iget-object v2, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 357
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 359
    :try_start_1
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->flush()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 356
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 365
    return-void

    .line 360
    :catch_0
    move-exception v0

    .line 361
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 356
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getBitmapFileFromDiskCache(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->getCacheFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    .line 245
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBitmapFromDiskCache(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
    .locals 10
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    .prologue
    const/4 v8, 0x0

    .line 256
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->isDiskCacheEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move-object v3, v8

    .line 290
    :goto_0
    return-object v3

    .line 257
    :cond_1
    iget-object v9, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v9

    .line 258
    :goto_1
    :try_start_0
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->isDiskCacheReadied:Z

    if-eqz v0, :cond_3

    .line 264
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_5

    .line 265
    const/4 v7, 0x0

    .line 267
    .local v7, "snapshot":Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    :try_start_1
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->get(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;

    move-result-object v7

    .line 268
    if-eqz v7, :cond_6

    .line 269
    const/4 v3, 0x0

    .line 270
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->isShowOriginal()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 272
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->getInputStream(I)Ljava/io/FileInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    .line 271
    invoke-static {v0}, Lcom/lidroid/xutils/bitmap/core/BitmapDecoder;->decodeFileDescriptor(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 280
    :goto_2
    invoke-direct {p0, p1, p2, v3}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->rotateBitmapIfNeeded(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 281
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->getExpiryTimestamp(Ljava/lang/String;)J

    move-result-wide v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->addBitmapToMemoryCache(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Landroid/graphics/Bitmap;J)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 287
    :try_start_2
    invoke-static {v7}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 282
    monitor-exit v9

    goto :goto_0

    .line 257
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    .end local v7    # "snapshot":Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 260
    :cond_3
    :try_start_3
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 261
    :catch_0
    move-exception v0

    goto :goto_1

    .line 275
    .restart local v3    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v7    # "snapshot":Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    :cond_4
    const/4 v0, 0x0

    :try_start_4
    invoke-virtual {v7, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->getInputStream(I)Ljava/io/FileInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    .line 276
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getBitmapMaxSize()Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    move-result-object v1

    .line 277
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    .line 274
    invoke-static {v0, v1, v2}, Lcom/lidroid/xutils/bitmap/core/BitmapDecoder;->decodeSampledBitmapFromDescriptor(Ljava/io/FileDescriptor;Lcom/lidroid/xutils/bitmap/core/BitmapSize;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v3

    goto :goto_2

    .line 284
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    :catch_1
    move-exception v6

    .line 285
    .local v6, "e":Ljava/lang/Throwable;
    :try_start_5
    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 287
    :try_start_6
    invoke-static {v7}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 288
    .end local v6    # "e":Ljava/lang/Throwable;
    .end local v7    # "snapshot":Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    :cond_5
    :goto_3
    monitor-exit v9

    move-object v3, v8

    .line 290
    goto :goto_0

    .line 286
    .restart local v7    # "snapshot":Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    :catchall_1
    move-exception v0

    .line 287
    invoke-static {v7}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 288
    throw v0

    .line 287
    :cond_6
    invoke-static {v7}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method

.method public getBitmapFromMemCache(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    .prologue
    const/4 v2, 0x0

    .line 228
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->isMemoryCacheEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 229
    new-instance v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;

    if-nez p2, :cond_0

    move-object v1, v2

    :goto_0
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;-><init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Ljava/lang/String;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;)V

    .line 230
    .local v0, "key":Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v1, v0}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 232
    .end local v0    # "key":Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    :goto_1
    return-object v1

    .line 229
    :cond_0
    invoke-virtual {p2}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    .line 232
    goto :goto_1
.end method

.method public initDiskCache()V
    .locals 9

    .prologue
    .line 89
    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v6}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->isDiskCacheEnabled()Z

    move-result v6

    if-nez v6, :cond_0

    .line 112
    :goto_0
    return-void

    .line 92
    :cond_0
    iget-object v7, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v7

    .line 93
    :try_start_0
    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v6}, Lcom/lidroid/xutils/util/core/LruDiskCache;->isClosed()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 94
    :cond_1
    new-instance v2, Ljava/io/File;

    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v6}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDiskCachePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 95
    .local v2, "diskCacheDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 96
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 98
    :cond_2
    invoke-static {v2}, Lcom/lidroid/xutils/bitmap/BitmapCommonUtils;->getAvailableSpace(Ljava/io/File;)J

    move-result-wide v0

    .line 99
    .local v0, "availableSpace":J
    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v6}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDiskCacheSize()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    int-to-long v4, v6

    .line 100
    .local v4, "diskCacheSize":J
    cmp-long v6, v0, v4

    if-lez v6, :cond_4

    .line 102
    :goto_1
    const/4 v6, 0x1

    const/4 v8, 0x1

    :try_start_1
    invoke-static {v2, v6, v8, v4, v5}, Lcom/lidroid/xutils/util/core/LruDiskCache;->open(Ljava/io/File;IIJ)Lcom/lidroid/xutils/util/core/LruDiskCache;

    move-result-object v6

    iput-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    .line 103
    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    iget-object v8, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v8}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDiskCacheFileNameGenerator()Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/lidroid/xutils/util/core/LruDiskCache;->setDiskCacheFileNameGenerator(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    .end local v0    # "availableSpace":J
    .end local v2    # "diskCacheDir":Ljava/io/File;
    .end local v4    # "diskCacheSize":J
    :cond_3
    :goto_2
    const/4 v6, 0x1

    :try_start_2
    iput-boolean v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->isDiskCacheReadied:Z

    .line 110
    iget-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    .line 92
    monitor-exit v7

    goto :goto_0

    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v6

    .restart local v0    # "availableSpace":J
    .restart local v2    # "diskCacheDir":Ljava/io/File;
    .restart local v4    # "diskCacheSize":J
    :cond_4
    move-wide v4, v0

    .line 100
    goto :goto_1

    .line 104
    :catch_0
    move-exception v3

    .line 105
    .local v3, "e":Ljava/lang/Throwable;
    const/4 v6, 0x0

    :try_start_3
    iput-object v6, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    .line 106
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v3}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2
.end method

.method public initMemoryCache()V
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->isMemoryCacheEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 80
    :goto_0
    return-void

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    if-eqz v0, :cond_1

    .line 65
    :try_start_0
    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->clearMemoryCache()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :cond_1
    :goto_1
    new-instance v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache$1;

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    invoke-virtual {v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getMemoryCacheSize()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$1;-><init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;I)V

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    goto :goto_0

    .line 66
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public setDiskCacheFileNameGenerator(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V
    .locals 1
    .param p1, "diskCacheFileNameGenerator"    # Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 128
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->setDiskCacheFileNameGenerator(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V

    .line 130
    :cond_0
    return-void
.end method

.method public setDiskCacheSize(I)V
    .locals 4
    .param p1, "maxSize"    # I

    .prologue
    .line 121
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mDiskLruCache:Lcom/lidroid/xutils/util/core/LruDiskCache;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->setMaxSize(J)V

    .line 124
    :cond_0
    return-void
.end method

.method public setMemoryCacheSize(I)V
    .locals 1
    .param p1, "maxSize"    # I

    .prologue
    .line 115
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->setMaxSize(I)V

    .line 118
    :cond_0
    return-void
.end method
