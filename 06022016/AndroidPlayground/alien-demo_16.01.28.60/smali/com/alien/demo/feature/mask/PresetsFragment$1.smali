.class Lcom/alien/demo/feature/mask/PresetsFragment$1;
.super Ljava/lang/Object;
.source "PresetsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
    .line 64
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsFragment$1;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "l"    # J
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
    .line 67
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment$1;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/demo/feature/mask/PresetsFragment;->onPresetItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 68
    return-void
.end method
