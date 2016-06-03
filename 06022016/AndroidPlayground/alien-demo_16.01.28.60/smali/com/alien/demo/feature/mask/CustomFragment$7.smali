.class Lcom/alien/demo/feature/mask/CustomFragment$7;
.super Ljava/lang/Object;
.source "CustomFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/CustomFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/CustomFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/CustomFragment;)V
    .locals 0

    .prologue
    .line 177
    iput-object p1, p0, Lcom/alien/demo/feature/mask/CustomFragment$7;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment$7;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    # invokes: Lcom/alien/demo/feature/mask/CustomFragment;->onClickOk(Landroid/view/View;)V
    invoke-static {v0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->access$600(Lcom/alien/demo/feature/mask/CustomFragment;Landroid/view/View;)V

    .line 181
    return-void
.end method
