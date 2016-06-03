.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2$1;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2$1;->this$1:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2$1;->this$1:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;

    iget-object v0, v0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->readData()V
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$200(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    .line 117
    return-void
.end method
