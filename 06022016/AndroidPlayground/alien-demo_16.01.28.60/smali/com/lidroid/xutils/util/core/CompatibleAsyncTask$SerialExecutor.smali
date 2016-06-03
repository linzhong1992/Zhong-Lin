.class Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;
.super Ljava/lang/Object;
.source "CompatibleAsyncTask.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SerialExecutor"
.end annotation


# instance fields
.field mActive:Ljava/lang/Runnable;

.field final mTasks:Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    new-instance v0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;

    invoke-direct {v0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->mTasks:Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;

    .line 212
    return-void
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;)V
    .locals 0

    .prologue
    .line 212
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 217
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->mTasks:Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;

    new-instance v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor$1;

    invoke-direct {v1, p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor$1;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 226
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->mActive:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    .line 227
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->scheduleNext()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    :cond_0
    monitor-exit p0

    return-void

    .line 217
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized scheduleNext()V
    .locals 2

    .prologue
    .line 232
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->mTasks:Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;

    invoke-virtual {v0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->mActive:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 233
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;->mActive:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    :cond_0
    monitor-exit p0

    return-void

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
