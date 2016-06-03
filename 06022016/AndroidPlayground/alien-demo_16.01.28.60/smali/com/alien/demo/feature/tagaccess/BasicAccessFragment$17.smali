.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;
.super Ljava/lang/Object;
.source "BasicAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readAll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V
    .locals 0

    .prologue
    .line 573
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 577
    :try_start_0
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readEpc()Z
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$1000(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z

    move-result v1

    .line 578
    .local v1, "r1":Z
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readKPwd()Z
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$400(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z

    move-result v2

    .line 579
    .local v2, "r2":Z
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readAPwd()Z
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$700(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z

    move-result v3

    .line 580
    .local v3, "r3":Z
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readTid()Z
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$1300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z

    move-result v4

    .line 581
    .local v4, "r4":Z
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readUser()Z
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$1400(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z

    move-result v5

    .line 582
    .local v5, "r5":Z
    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    if-eqz v5, :cond_0

    .line 583
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V

    .line 589
    .end local v1    # "r1":Z
    .end local v2    # "r2":Z
    .end local v3    # "r3":Z
    .end local v4    # "r4":Z
    .end local v5    # "r5":Z
    :goto_0
    return-void

    .line 585
    .restart local v1    # "r1":Z
    .restart local v2    # "r2":Z
    .restart local v3    # "r3":Z
    .restart local v4    # "r4":Z
    .restart local v5    # "r5":Z
    :cond_0
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 586
    .end local v1    # "r1":Z
    .end local v2    # "r2":Z
    .end local v3    # "r3":Z
    .end local v4    # "r4":Z
    .end local v5    # "r5":Z
    :catch_0
    move-exception v0

    .line 587
    .local v0, "e":Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v6}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V

    goto :goto_0
.end method
