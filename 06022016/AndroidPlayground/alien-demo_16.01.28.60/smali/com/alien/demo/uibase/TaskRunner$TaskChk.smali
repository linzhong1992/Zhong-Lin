.class public Lcom/alien/demo/uibase/TaskRunner$TaskChk;
.super Landroid/os/AsyncTask;
.source "TaskRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/uibase/TaskRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskChk"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field failMsg:Ljava/lang/String;

.field latch:Ljava/util/concurrent/CountDownLatch;

.field msg:Ljava/lang/String;

.field mypDialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "failMsg"    # Ljava/lang/String;
    .param p4, "latch"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 46
    iput-object p2, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->msg:Ljava/lang/String;

    .line 47
    iput-object p3, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->failMsg:Ljava/lang/String;

    .line 48
    iput-object p1, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->context:Landroid/content/Context;

    .line 49
    iput-object p4, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->latch:Ljava/util/concurrent/CountDownLatch;

    .line 50
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x0

    .line 55
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    .line 56
    iget-object v1, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v2

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    .line 64
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v2

    cmp-long v1, v2, v4

    if-nez v1, :cond_2

    const/4 v1, 0x1

    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 60
    :cond_1
    const-wide/16 v2, 0x64

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 64
    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    .line 61
    :catch_0
    move-exception v1

    goto :goto_2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 37
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 69
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 70
    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 71
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->failMsg:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->failMsg:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 74
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 37
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 78
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 79
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->mypDialog:Landroid/app/ProgressDialog;

    .line 80
    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 81
    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->mypDialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 83
    iget-object v0, p0, Lcom/alien/demo/uibase/TaskRunner$TaskChk;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 84
    return-void
.end method
