.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;
.super Ljava/lang/Object;
.source "BasicAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

.field final synthetic val$data:Ljava/lang/String;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Landroid/widget/EditText;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 371
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    iput-object p2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->val$et:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->val$data:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->val$et:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->val$data:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 375
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->val$et:Landroid/widget/EditText;

    const v1, 0x7f02004a

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 376
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;->val$et:Landroid/widget/EditText;

    invoke-static {v0}, Lcom/alien/demo/uibase/UIHelper;->flashingView(Landroid/view/View;)V

    .line 377
    return-void
.end method
