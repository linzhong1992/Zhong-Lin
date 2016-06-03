.class public Lcom/alien/demo/uibase/TaskRunner;
.super Ljava/lang/Object;
.source "TaskRunner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/uibase/TaskRunner$TaskChk;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static runTask(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/alien/demo/uibase/TaskRunner;->runTask(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 17
    return-void
.end method

.method public static runTask(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "failMsg"    # Ljava/lang/String;
    .param p3, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 20
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 21
    .local v0, "latchStop":Ljava/util/concurrent/CountDownLatch;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/alien/demo/uibase/TaskRunner$1;

    invoke-direct {v2, p3, v0}, Lcom/alien/demo/uibase/TaskRunner$1;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 30
    const-wide/16 v2, 0x1f4

    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 31
    new-instance v1, Lcom/alien/demo/uibase/TaskRunner$TaskChk;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/alien/demo/uibase/TaskRunner$TaskChk;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :cond_0
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v1

    goto :goto_0
.end method
