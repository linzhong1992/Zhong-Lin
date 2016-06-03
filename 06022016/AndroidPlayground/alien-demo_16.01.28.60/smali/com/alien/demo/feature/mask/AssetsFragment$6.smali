.class Lcom/alien/demo/feature/mask/AssetsFragment$6;
.super Ljava/lang/Object;
.source "AssetsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/AssetsFragment;->onActivityCreated(Landroid/os/Bundle;)V
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
    .line 110
    iput-object p1, p0, Lcom/alien/demo/feature/mask/AssetsFragment$6;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment$6;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # invokes: Lcom/alien/demo/feature/mask/AssetsFragment;->onClickClear(Landroid/view/View;)V
    invoke-static {v0, p1}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$100(Lcom/alien/demo/feature/mask/AssetsFragment;Landroid/view/View;)V

    .line 114
    return-void
.end method
