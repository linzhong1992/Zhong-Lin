.class public Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
.super Ljava/lang/Object;
.source "BitmapGlobalConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;
    }
.end annotation


# static fields
.field public static final MIN_DISK_CACHE_SIZE:I = 0xa00000

.field public static final MIN_MEMORY_CACHE_SIZE:I = 0x200000

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private _dirty_params_bitmapLoadExecutor:Z

.field private bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

.field private bitmapCacheListener:Lcom/lidroid/xutils/bitmap/BitmapCacheListener;

.field private bitmapLoadExecutor:Ljava/util/concurrent/ExecutorService;

.field private defaultCacheExpiry:J

.field private defaultConnectTimeout:I

.field private defaultReadTimeout:I

.field private diskCacheEnabled:Z

.field private diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

.field private diskCachePath:Ljava/lang/String;

.field private diskCacheSize:I

.field private downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

.field private mContext:Landroid/content/Context;

.field private memoryCacheEnabled:Z

.field private memoryCacheSize:I

.field private threadPoolSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$1;

    invoke-direct {v0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$1;-><init>()V

    sput-object v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "diskCachePath"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x3a98

    const/4 v1, 0x1

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/high16 v0, 0x400000

    iput v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheSize:I

    .line 44
    const/high16 v0, 0x3200000

    iput v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheSize:I

    .line 46
    iput-boolean v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheEnabled:Z

    .line 47
    iput-boolean v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheEnabled:Z

    .line 52
    const/4 v0, 0x5

    iput v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->threadPoolSize:I

    .line 53
    iput-boolean v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->_dirty_params_bitmapLoadExecutor:Z

    .line 56
    const-wide v0, 0x9a7ec800L

    iput-wide v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultCacheExpiry:J

    .line 57
    iput v2, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultConnectTimeout:I

    .line 58
    iput v2, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultReadTimeout:I

    .line 82
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_0
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->mContext:Landroid/content/Context;

    .line 84
    iput-object p2, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCachePath:Ljava/lang/String;

    .line 85
    invoke-direct {p0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->initBitmapCache()V

    .line 86
    return-void
.end method

.method static synthetic access$0(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;)Lcom/lidroid/xutils/bitmap/BitmapCacheListener;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCacheListener:Lcom/lidroid/xutils/bitmap/BitmapCacheListener;

    return-object v0
.end method

.method private getMemoryClass()I
    .locals 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->mContext:Landroid/content/Context;

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    return v0
.end method

.method private initBitmapCache()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 89
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    invoke-direct {v0, p0, v5}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 90
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    invoke-direct {v0, p0, v5}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 91
    return-void
.end method


# virtual methods
.method public clearCache()V
    .locals 4

    .prologue
    .line 356
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 357
    return-void
.end method

.method public clearCache(Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 368
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 369
    return-void
.end method

.method public clearDiskCache()V
    .locals 4

    .prologue
    .line 364
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 365
    return-void
.end method

.method public clearDiskCache(Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 376
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/16 v3, 0x9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 377
    return-void
.end method

.method public clearMemoryCache()V
    .locals 4

    .prologue
    .line 360
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 361
    return-void
.end method

.method public clearMemoryCache(Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 372
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/16 v3, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 373
    return-void
.end method

.method public closeCache()V
    .locals 4

    .prologue
    .line 384
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 385
    return-void
.end method

.method public flushCache()V
    .locals 4

    .prologue
    .line 380
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig$BitmapCacheManagementTask;->execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 381
    return-void
.end method

.method public getBitmapCache()Lcom/lidroid/xutils/bitmap/core/BitmapCache;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    if-nez v0, :cond_0

    .line 141
    new-instance v0, Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;-><init>(Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;)V

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    return-object v0
.end method

.method public getBitmapCacheListener()Lcom/lidroid/xutils/bitmap/BitmapCacheListener;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCacheListener:Lcom/lidroid/xutils/bitmap/BitmapCacheListener;

    return-object v0
.end method

.method public getBitmapLoadExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .prologue
    .line 199
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->_dirty_params_bitmapLoadExecutor:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapLoadExecutor:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_1

    .line 200
    :cond_0
    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getThreadPoolSize()I

    move-result v0

    sget-object v1, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapLoadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 201
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->_dirty_params_bitmapLoadExecutor:Z

    .line 203
    :cond_1
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapLoadExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public getDefaultCacheExpiry()J
    .locals 2

    .prologue
    .line 116
    iget-wide v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultCacheExpiry:J

    return-wide v0
.end method

.method public getDefaultConnectTimeout()I
    .locals 1

    .prologue
    .line 124
    iget v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultConnectTimeout:I

    return v0
.end method

.method public getDefaultReadTimeout()I
    .locals 1

    .prologue
    .line 132
    iget v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultReadTimeout:I

    return v0
.end method

.method public getDiskCacheFileNameGenerator()Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    return-object v0
.end method

.method public getDiskCachePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCachePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->mContext:Landroid/content/Context;

    const-string v1, "xBitmapCache"

    invoke-static {v0, v1}, Lcom/lidroid/xutils/bitmap/BitmapCommonUtils;->getDiskCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCachePath:Ljava/lang/String;

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCachePath:Ljava/lang/String;

    return-object v0
.end method

.method public getDiskCacheSize()I
    .locals 1

    .prologue
    .line 175
    iget v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheSize:I

    return v0
.end method

.method public getDownloader()Lcom/lidroid/xutils/bitmap/download/Downloader;
    .locals 4

    .prologue
    .line 101
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    if-nez v0, :cond_0

    .line 102
    new-instance v0, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;

    invoke-direct {v0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/download/Downloader;->setContext(Landroid/content/Context;)V

    .line 105
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDefaultCacheExpiry()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/lidroid/xutils/bitmap/download/Downloader;->setDefaultExpiry(J)V

    .line 106
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDefaultConnectTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/download/Downloader;->setDefaultConnectTimeout(I)V

    .line 107
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getDefaultReadTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/download/Downloader;->setDefaultReadTimeout(I)V

    .line 108
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    return-object v0
.end method

.method public getMemoryCacheSize()I
    .locals 1

    .prologue
    .line 147
    iget v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheSize:I

    return v0
.end method

.method public getThreadPoolSize()I
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->threadPoolSize:I

    return v0
.end method

.method public isDiskCacheEnabled()Z
    .locals 1

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheEnabled:Z

    return v0
.end method

.method public isMemoryCacheEnabled()Z
    .locals 1

    .prologue
    .line 207
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheEnabled:Z

    return v0
.end method

.method public setBitmapCacheListener(Lcom/lidroid/xutils/bitmap/BitmapCacheListener;)V
    .locals 0
    .param p1, "bitmapCacheListener"    # Lcom/lidroid/xutils/bitmap/BitmapCacheListener;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCacheListener:Lcom/lidroid/xutils/bitmap/BitmapCacheListener;

    .line 239
    return-void
.end method

.method public setDefaultCacheExpiry(J)V
    .locals 1
    .param p1, "defaultCacheExpiry"    # J

    .prologue
    .line 120
    iput-wide p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultCacheExpiry:J

    .line 121
    return-void
.end method

.method public setDefaultConnectTimeout(I)V
    .locals 0
    .param p1, "defaultConnectTimeout"    # I

    .prologue
    .line 128
    iput p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultConnectTimeout:I

    .line 129
    return-void
.end method

.method public setDefaultReadTimeout(I)V
    .locals 0
    .param p1, "defaultReadTimeout"    # I

    .prologue
    .line 136
    iput p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->defaultReadTimeout:I

    .line 137
    return-void
.end method

.method public setDiskCacheEnabled(Z)V
    .locals 0
    .param p1, "diskCacheEnabled"    # Z

    .prologue
    .line 219
    iput-boolean p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheEnabled:Z

    .line 220
    return-void
.end method

.method public setDiskCacheFileNameGenerator(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V
    .locals 1
    .param p1, "diskCacheFileNameGenerator"    # Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    .line 228
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->setDiskCacheFileNameGenerator(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V

    .line 231
    :cond_0
    return-void
.end method

.method public setDiskCacheSize(I)V
    .locals 2
    .param p1, "diskCacheSize"    # I

    .prologue
    .line 179
    const/high16 v0, 0xa00000

    if-lt p1, v0, :cond_0

    .line 180
    iput p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheSize:I

    .line 181
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    iget v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->diskCacheSize:I

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->setDiskCacheSize(I)V

    .line 185
    :cond_0
    return-void
.end method

.method public setDownloader(Lcom/lidroid/xutils/bitmap/download/Downloader;)V
    .locals 0
    .param p1, "downloader"    # Lcom/lidroid/xutils/bitmap/download/Downloader;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->downloader:Lcom/lidroid/xutils/bitmap/download/Downloader;

    .line 113
    return-void
.end method

.method public setMemCacheSizePercent(F)V
    .locals 2
    .param p1, "percent"    # F

    .prologue
    const/high16 v1, 0x44800000    # 1024.0f

    .line 165
    const v0, 0x3d4ccccd    # 0.05f

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    const v0, 0x3f4ccccd    # 0.8f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    .line 166
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "percent must be between 0.05 and 0.8 (inclusive)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_1
    invoke-direct {p0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getMemoryClass()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    mul-float/2addr v0, v1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheSize:I

    .line 169
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    if-eqz v0, :cond_2

    .line 170
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    iget v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheSize:I

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->setMemoryCacheSize(I)V

    .line 172
    :cond_2
    return-void
.end method

.method public setMemoryCacheEnabled(Z)V
    .locals 0
    .param p1, "memoryCacheEnabled"    # Z

    .prologue
    .line 211
    iput-boolean p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheEnabled:Z

    .line 212
    return-void
.end method

.method public setMemoryCacheSize(I)V
    .locals 2
    .param p1, "memoryCacheSize"    # I

    .prologue
    .line 151
    const/high16 v0, 0x200000

    if-lt p1, v0, :cond_1

    .line 152
    iput p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheSize:I

    .line 153
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->bitmapCache:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    iget v1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->memoryCacheSize:I

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->setMemoryCacheSize(I)V

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 157
    :cond_1
    const v0, 0x3e99999a    # 0.3f

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->setMemCacheSizePercent(F)V

    goto :goto_0
.end method

.method public setThreadPoolSize(I)V
    .locals 1
    .param p1, "threadPoolSize"    # I

    .prologue
    .line 192
    if-lez p1, :cond_0

    iget v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->threadPoolSize:I

    if-eq p1, v0, :cond_0

    .line 193
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->_dirty_params_bitmapLoadExecutor:Z

    .line 194
    iput p1, p0, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->threadPoolSize:I

    .line 196
    :cond_0
    return-void
.end method
