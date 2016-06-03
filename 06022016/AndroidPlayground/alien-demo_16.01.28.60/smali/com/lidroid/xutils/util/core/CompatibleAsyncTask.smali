.class public abstract Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
.super Ljava/lang/Object;
.source "CompatibleAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$AsyncTaskResult;,
        Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;,
        Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;,
        Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;,
        Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status:[I = null

.field private static final CORE_POOL_SIZE:I = 0x5

.field private static final KEEP_ALIVE:I = 0x1

.field private static final MAXIMUM_POOL_SIZE:I = 0x80

.field private static final MESSAGE_POST_PROGRESS:I = 0x2

.field private static final MESSAGE_POST_RESULT:I = 0x1

.field public static final SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

.field public static final THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static volatile sDefaultExecutor:Ljava/util/concurrent/Executor;

.field private static final sHandler:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;

.field private static final sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private final mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mFuture:Ljava/util/concurrent/FutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/FutureTask",
            "<TResult;>;"
        }
    .end annotation
.end field

.field private volatile mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

.field private final mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mWorker:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable",
            "<TParams;TResult;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic $SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status()[I
    .locals 3

    .prologue
    .line 169
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->$SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->values()[Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->FINISHED:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->PENDING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->RUNNING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->$SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 174
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$1;

    invoke-direct {v0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$1;-><init>()V

    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 183
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    .line 182
    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;

    .line 189
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x5

    const/16 v3, 0x80

    const-wide/16 v4, 0x1

    .line 190
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v7, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v8, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 189
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 188
    sput-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 196
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;

    invoke-direct {v0, v9}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$SerialExecutor;)V

    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 201
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;

    invoke-direct {v0, v9}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;)V

    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sHandler:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;

    .line 203
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 274
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->PENDING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    .line 209
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 210
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 275
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mWorker:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;

    .line 285
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mWorker:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$3;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    .line 300
    return-void
.end method

.method static synthetic access$0(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 608
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->finish(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$1(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$2(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 309
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->postResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 302
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V

    return-void
.end method

.method public static execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 585
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 586
    return-void
.end method

.method private finish(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 609
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 610
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 614
    :goto_0
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->FINISHED:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    .line 615
    return-void

    .line 612
    :cond_0
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->onPostExecute(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static init()V
    .locals 1

    .prologue
    .line 261
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sHandler:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;

    invoke-virtual {v0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;->getLooper()Landroid/os/Looper;

    .line 262
    return-void
.end method

.method private postResult(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)TResult;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    const/4 v5, 0x1

    .line 311
    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sHandler:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;

    .line 312
    new-instance v2, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$AsyncTaskResult;

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-direct {v2, p0, v3}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$AsyncTaskResult;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;[Ljava/lang/Object;)V

    .line 311
    invoke-virtual {v1, v5, v2}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 313
    .local v0, "message":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 314
    return-object p1
.end method

.method private postResultIfNotInvoked(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    .line 304
    .local v0, "wasTaskInvoked":Z
    if-nez v0, :cond_0

    .line 305
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->postResult(Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    :cond_0
    return-void
.end method

.method public static setDefaultExecutor(Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p0, "exec"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 268
    sput-object p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    .line 269
    return-void
.end method


# virtual methods
.method public final cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 452
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 453
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method protected varargs abstract doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation
.end method

.method public final varargs execute([Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)",
            "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask",
            "<TParams;TProgress;TResult;>;"
        }
    .end annotation

    .prologue
    .line 517
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    move-result-object v0

    return-object v0
.end method

.method public final varargs executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
    .locals 2
    .param p1, "exec"    # Ljava/util/concurrent/Executor;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "[TParams;)",
            "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask",
            "<TParams;TProgress;TResult;>;"
        }
    .end annotation

    .prologue
    .line 552
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->PENDING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 553
    invoke-static {}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->$SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status()[I

    move-result-object v0

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    invoke-virtual {v1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 566
    :cond_0
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->RUNNING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    .line 568
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->onPreExecute()V

    .line 570
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mWorker:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;

    iput-object p2, v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;->mParams:[Ljava/lang/Object;

    .line 571
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 573
    return-object p0

    .line 555
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot execute task: the task is already running."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 558
    :pswitch_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot execute task: the task has already been executed (a task can be executed only once)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 553
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 469
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 490
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getStatus()Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;
    .locals 1

    .prologue
    .line 323
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mStatus:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    return-object v0
.end method

.method public final isCancelled()Z
    .locals 1

    .prologue
    .line 421
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method protected onCancelled()V
    .locals 0

    .prologue
    .line 409
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    return-void
.end method

.method protected onCancelled(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 393
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->onCancelled()V

    .line 394
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 364
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 349
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .param p1, "values"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 376
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    return-void
.end method

.method protected final varargs publishProgress([Ljava/lang/Object;)V
    .locals 3
    .param p1, "values"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 602
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 603
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->sHandler:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;

    const/4 v1, 0x2

    .line 604
    new-instance v2, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$AsyncTaskResult;

    invoke-direct {v2, p0, p1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$AsyncTaskResult;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;[Ljava/lang/Object;)V

    .line 603
    invoke-virtual {v0, v1, v2}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 604
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 606
    :cond_0
    return-void
.end method
