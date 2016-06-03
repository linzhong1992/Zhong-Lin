.class Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;
.super Ljava/util/concurrent/FutureTask;
.source "CompatibleAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask",
        "<TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;


# direct methods
.method constructor <init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/util/concurrent/Callable;)V
    .locals 0

    .prologue
    .line 1
    .local p2, "$anonymous0":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TResult;>;"
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 285
    invoke-direct {p0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-void
.end method


# virtual methods
.method protected done()V
    .locals 4

    .prologue
    .line 289
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;->get()Ljava/lang/Object;

    move-result-object v2

    # invokes: Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V
    invoke-static {v1, v2}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->access$3(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2

    .line 298
    :goto_0
    return-void

    .line 290
    :catch_0
    move-exception v0

    .line 291
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {v0}, Lcom/lidroid/xutils/util/LogUtils;->w(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 292
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 293
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "An error occured while executing doInBackground()"

    .line 294
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    .line 293
    invoke-direct {v1, v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 295
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v0

    .line 296
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    const/4 v2, 0x0

    # invokes: Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V
    invoke-static {v1, v2}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->access$3(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/lang/Object;)V

    goto :goto_0
.end method
