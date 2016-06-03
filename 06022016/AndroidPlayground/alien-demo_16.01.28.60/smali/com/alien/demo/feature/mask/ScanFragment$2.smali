.class Lcom/alien/demo/feature/mask/ScanFragment$2;
.super Ljava/lang/Object;
.source "ScanFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/ScanFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/ScanFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/ScanFragment;)V
    .locals 0

    .prologue
    .line 91
    iput-object p1, p0, Lcom/alien/demo/feature/mask/ScanFragment$2;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment$2;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    invoke-virtual {v0, p1}, Lcom/alien/demo/feature/mask/ScanFragment;->onClickClear(Landroid/view/View;)V

    .line 95
    return-void
.end method
