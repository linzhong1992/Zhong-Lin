.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;
.super Ljava/lang/Object;
.source "BasicAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;)V
    .locals 0

    .prologue
    .line 247
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;->this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 251
    :try_start_0
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;->this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    iget-object v1, v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$1100(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 261
    :goto_0
    return-void

    .line 254
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;->this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    iget-object v1, v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->writeEpc()Z
    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$1200(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 255
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;->this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    iget-object v1, v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 258
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;->this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    iget-object v1, v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V

    goto :goto_0

    .line 257
    .end local v0    # "e":Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9$1;->this$1:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    iget-object v1, v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V
    :try_end_1
    .catch Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
