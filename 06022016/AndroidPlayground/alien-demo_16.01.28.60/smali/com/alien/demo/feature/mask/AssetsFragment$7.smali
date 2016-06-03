.class Lcom/alien/demo/feature/mask/AssetsFragment$7;
.super Ljava/lang/Object;
.source "AssetsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/AssetsFragment;->onClickDelete(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/AssetsFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V
    .locals 0

    .prologue
    .line 176
    iput-object p1, p0, Lcom/alien/demo/feature/mask/AssetsFragment$7;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 179
    packed-switch p2, :pswitch_data_0

    .line 197
    :goto_0
    return-void

    .line 183
    :pswitch_0
    :try_start_0
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment$7;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;
    invoke-static {v1}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$200(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsInfo;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment$7;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;
    invoke-static {v2}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$200(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->delete(I)V

    .line 184
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment$7;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;
    invoke-static {v1}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$200(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/AssetsInfo;->save()V

    .line 185
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment$7;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/AssetsFragment;->adapAssets:Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;
    invoke-static {v1}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$300(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Assets Tab"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error deleting asset: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 179
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method
