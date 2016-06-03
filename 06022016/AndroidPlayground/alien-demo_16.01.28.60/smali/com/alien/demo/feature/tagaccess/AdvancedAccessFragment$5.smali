.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$5;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->setupEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V
    .locals 0

    .prologue
    .line 141
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$5;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "selectedItemView"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
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
    .line 144
    .local p1, "parentView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    if-eqz p3, :cond_0

    const/4 v0, 0x2

    if-ne p3, v0, :cond_1

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$5;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnLock:Landroid/widget/ImageButton;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$400(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/ImageButton;

    move-result-object v0

    const v1, 0x7f020054

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 150
    :goto_0
    return-void

    .line 148
    :cond_1
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$5;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnLock:Landroid/widget/ImageButton;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$400(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/ImageButton;

    move-result-object v0

    const v1, 0x7f020053

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
