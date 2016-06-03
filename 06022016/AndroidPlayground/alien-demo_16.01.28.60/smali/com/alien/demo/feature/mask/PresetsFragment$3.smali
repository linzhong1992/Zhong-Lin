.class Lcom/alien/demo/feature/mask/PresetsFragment$3;
.super Ljava/lang/Object;
.source "PresetsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/PresetsFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/PresetsFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/PresetsFragment;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsFragment$3;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment$3;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    # invokes: Lcom/alien/demo/feature/mask/PresetsFragment;->onClickOk(Landroid/view/View;)V
    invoke-static {v0, p1}, Lcom/alien/demo/feature/mask/PresetsFragment;->access$100(Lcom/alien/demo/feature/mask/PresetsFragment;Landroid/view/View;)V

    .line 86
    return-void
.end method
