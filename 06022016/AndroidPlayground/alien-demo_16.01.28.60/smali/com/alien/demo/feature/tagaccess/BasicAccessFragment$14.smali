.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$14;
.super Ljava/lang/Object;
.source "BasicAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 362
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$14;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    iput-object p2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$14;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 365
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$14;->val$et:Landroid/widget/EditText;

    const v1, 0x7f020049

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 366
    return-void
.end method
