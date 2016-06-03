.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3$1;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;)V
    .locals 0

    .prologue
    .line 125
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3$1;->this$1:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3$1;->this$1:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;

    iget-object v0, v0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->writeData()V
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$300(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    .line 129
    return-void
.end method
