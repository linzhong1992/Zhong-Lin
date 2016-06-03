.class public Lcom/alien/demo/HomeActivity$InitTask;
.super Landroid/os/AsyncTask;
.source "HomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/HomeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InitTask"
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
.field errorMsg:Ljava/lang/String;

.field mypDialog:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/alien/demo/HomeActivity;


# direct methods
.method public constructor <init>(Lcom/alien/demo/HomeActivity;)V
    .locals 1

    .prologue
    .line 76
    iput-object p1, p0, Lcom/alien/demo/HomeActivity$InitTask;->this$0:Lcom/alien/demo/HomeActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->errorMsg:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 4
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 83
    :try_start_0
    invoke-static {}, Lcom/alien/demo/rfid/TagScanner;->init()V

    .line 84
    invoke-static {}, Lcom/alien/demo/data/Assets;->init()V

    .line 85
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 91
    :goto_0
    return-object v1

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->getMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/alien/demo/HomeActivity$InitTask;->errorMsg:Ljava/lang/String;

    .line 89
    const-string v1, "AlienRFID-Home"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Application init error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    .line 91
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 76
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/alien/demo/HomeActivity$InitTask;->doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 97
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 99
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 100
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->this$0:Lcom/alien/demo/HomeActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Initialization failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/HomeActivity$InitTask;->errorMsg:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 103
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/alien/demo/HomeActivity$InitTask$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/HomeActivity$InitTask$1;-><init>(Lcom/alien/demo/HomeActivity$InitTask;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 111
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 76
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/alien/demo/HomeActivity$InitTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 115
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 117
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/alien/demo/HomeActivity$InitTask;->this$0:Lcom/alien/demo/HomeActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->mypDialog:Landroid/app/ProgressDialog;

    .line 118
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 119
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->mypDialog:Landroid/app/ProgressDialog;

    const-string v1, "Initializing..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 120
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 121
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 122
    return-void
.end method
