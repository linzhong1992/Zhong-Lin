.class public Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;
.super Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
.source "BitmapUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/BitmapUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BitmapLoadTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final PROGRESS_LOADING:I = 0x1

.field private static final PROGRESS_LOAD_STARTED:I


# instance fields
.field private final callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final containerReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

.field private from:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;

.field final synthetic this$0:Lcom/lidroid/xutils/BitmapUtils;

.field private final uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/BitmapUtils;Landroid/view/View;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;)V
    .locals 2
    .param p3, "uri"    # Ljava/lang/String;
    .param p4, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;",
            "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 370
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    .local p2, "container":Landroid/view/View;, "TT;"
    .local p5, "callBack":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    iput-object p1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;-><init>()V

    .line 368
    sget-object v0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;->DISK_CACHE:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;

    iput-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->from:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;

    .line 371
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    if-eqz p4, :cond_0

    if-nez p5, :cond_1

    .line 372
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "args may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 375
    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->containerReference:Ljava/lang/ref/WeakReference;

    .line 376
    iput-object p5, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;

    .line 377
    iput-object p3, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    .line 378
    iput-object p4, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    .line 379
    return-void
.end method

.method static synthetic access$3(Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    const/4 v3, 0x0

    .line 384
    iget-object v1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->pauseTaskLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/lidroid/xutils/BitmapUtils;->access$0(Lcom/lidroid/xutils/BitmapUtils;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 385
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->pauseTask:Z
    invoke-static {v1}, Lcom/lidroid/xutils/BitmapUtils;->access$1(Lcom/lidroid/xutils/BitmapUtils;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 384
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    const/4 v0, 0x0

    .line 396
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 397
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->publishProgress([Ljava/lang/Object;)V

    .line 398
    iget-object v1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
    invoke-static {v1}, Lcom/lidroid/xutils/BitmapUtils;->access$2(Lcom/lidroid/xutils/BitmapUtils;)Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getBitmapCache()Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    iget-object v3, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    invoke-virtual {v1, v2, v3}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->getBitmapFromDiskCache(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 402
    :cond_1
    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 403
    iget-object v1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->globalConfig:Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;
    invoke-static {v1}, Lcom/lidroid/xutils/BitmapUtils;->access$2(Lcom/lidroid/xutils/BitmapUtils;)Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lidroid/xutils/bitmap/BitmapGlobalConfig;->getBitmapCache()Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    iget-object v3, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    invoke-virtual {v1, v2, v3, p0}, Lcom/lidroid/xutils/bitmap/core/BitmapCache;->downloadBitmap(Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 404
    sget-object v1, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;->URI:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;

    iput-object v1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->from:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;

    .line 407
    :cond_2
    return-object v0

    .line 387
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_3
    :try_start_1
    iget-object v1, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->pauseTaskLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/lidroid/xutils/BitmapUtils;->access$0(Lcom/lidroid/xutils/BitmapUtils;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 388
    :catch_0
    move-exception v1

    goto :goto_0

    .line 384
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->doInBackground([Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getTargetContainer()Landroid/view/View;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 465
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->containerReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 466
    .local v1, "container":Landroid/view/View;, "TT;"
    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;

    # invokes: Lcom/lidroid/xutils/BitmapUtils;->getBitmapTaskFromContainer(Landroid/view/View;Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;)Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;
    invoke-static {v1, v2}, Lcom/lidroid/xutils/BitmapUtils;->access$3(Landroid/view/View;Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;)Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;

    move-result-object v0

    .line 468
    .local v0, "bitmapWorkerTask":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    if-ne p0, v0, :cond_0

    .line 472
    .end local v1    # "container":Landroid/view/View;, "TT;"
    :goto_0
    return-object v1

    .restart local v1    # "container":Landroid/view/View;, "TT;"
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onCancelled(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 459
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->pauseTaskLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/lidroid/xutils/BitmapUtils;->access$0(Lcom/lidroid/xutils/BitmapUtils;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 460
    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->this$0:Lcom/lidroid/xutils/BitmapUtils;

    # getter for: Lcom/lidroid/xutils/BitmapUtils;->pauseTaskLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/lidroid/xutils/BitmapUtils;->access$0(Lcom/lidroid/xutils/BitmapUtils;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 459
    monitor-exit v1

    .line 462
    return-void

    .line 459
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->onCancelled(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 439
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;

    move-result-object v1

    .line 440
    .local v1, "container":Landroid/view/View;, "TT;"
    if-eqz v1, :cond_0

    .line 441
    if-eqz p1, :cond_1

    .line 442
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;

    .line 444
    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    .line 446
    iget-object v4, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    .line 447
    iget-object v5, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->from:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;

    move-object v3, p1

    .line 442
    invoke-virtual/range {v0 .. v5}, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->onLoadCompleted(Landroid/view/View;Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;)V

    .line 455
    :cond_0
    :goto_0
    return-void

    .line 449
    :cond_1
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;

    .line 451
    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    .line 452
    iget-object v3, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    invoke-virtual {v3}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->getLoadFailedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 449
    invoke-virtual {v0, v1, v2, v3}, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->onLoadFailed(Landroid/view/View;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 8
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    .line 419
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 435
    :cond_0
    :goto_0
    return-void

    .line 421
    :cond_1
    invoke-virtual {p0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;

    move-result-object v1

    .line 422
    .local v1, "container":Landroid/view/View;, "TT;"
    if-eqz v1, :cond_0

    .line 424
    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 426
    :pswitch_0
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;

    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    iget-object v3, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    invoke-virtual {v0, v1, v2, v3}, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->onLoadStarted(Landroid/view/View;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)V

    goto :goto_0

    .line 429
    :pswitch_1
    array-length v0, p1

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 430
    iget-object v0, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->callBack:Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;

    iget-object v2, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->uri:Ljava/lang/String;

    iget-object v3, p0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->displayConfig:Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    const/4 v4, 0x1

    aget-object v4, p1, v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/4 v6, 0x2

    aget-object v6, p1, v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual/range {v0 .. v7}, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->onLoading(Landroid/view/View;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;JJ)V

    goto :goto_0

    .line 424
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public updateProgress(JJ)V
    .locals 5
    .param p1, "total"    # J
    .param p3, "current"    # J

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    const/4 v3, 0x1

    .line 411
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->publishProgress([Ljava/lang/Object;)V

    .line 412
    return-void
.end method
