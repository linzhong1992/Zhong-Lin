.class Lcom/alien/demo/feature/mask/ScanFragment$4;
.super Ljava/lang/Object;
.source "ScanFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
    .line 117
    iput-object p1, p0, Lcom/alien/demo/feature/mask/ScanFragment$4;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment$4;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/alien/demo/feature/mask/ScanFragment;->access$000(Lcom/alien/demo/feature/mask/ScanFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 123
    .local v0, "tagInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment$4;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    const-string v1, "tagEpc"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    # invokes: Lcom/alien/demo/feature/mask/ScanFragment;->updateMaskEpc(Ljava/lang/String;)V
    invoke-static {v2, v1}, Lcom/alien/demo/feature/mask/ScanFragment;->access$100(Lcom/alien/demo/feature/mask/ScanFragment;Ljava/lang/String;)V

    .line 124
    return-void
.end method
