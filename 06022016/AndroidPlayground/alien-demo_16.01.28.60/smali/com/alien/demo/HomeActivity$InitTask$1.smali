.class Lcom/alien/demo/HomeActivity$InitTask$1;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/HomeActivity$InitTask;->onPostExecute(Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/alien/demo/HomeActivity$InitTask;


# direct methods
.method constructor <init>(Lcom/alien/demo/HomeActivity$InitTask;)V
    .locals 0

    .prologue
    .line 103
    iput-object p1, p0, Lcom/alien/demo/HomeActivity$InitTask$1;->this$1:Lcom/alien/demo/HomeActivity$InitTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 106
    const-wide/16 v0, 0xdac

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    :goto_0
    iget-object v0, p0, Lcom/alien/demo/HomeActivity$InitTask$1;->this$1:Lcom/alien/demo/HomeActivity$InitTask;

    iget-object v0, v0, Lcom/alien/demo/HomeActivity$InitTask;->this$0:Lcom/alien/demo/HomeActivity;

    invoke-virtual {v0}, Lcom/alien/demo/HomeActivity;->finish()V

    .line 108
    return-void

    .line 106
    :catch_0
    move-exception v0

    goto :goto_0
.end method
