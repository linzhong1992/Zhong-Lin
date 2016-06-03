.class Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;
.super Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;
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
        "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable",
        "<TParams;TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;


# direct methods
.method constructor <init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    .line 275
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;-><init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;)V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 277
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    # getter for: Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->access$1(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 279
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 281
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;->this$0:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$2;->mParams:[Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    # invokes: Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->postResult(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;->access$2(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
