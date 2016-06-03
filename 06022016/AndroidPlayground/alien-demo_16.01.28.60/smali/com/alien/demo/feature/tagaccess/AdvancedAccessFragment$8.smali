.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$8;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->writeData()V
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
    .line 219
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$8;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$8;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$500(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/EditText;

    move-result-object v0

    const v1, 0x7f02004a

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 223
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$8;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$500(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/EditText;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/uibase/UIHelper;->flashingView(Landroid/view/View;)V

    .line 224
    return-void
.end method
