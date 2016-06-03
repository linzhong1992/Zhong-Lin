.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$3;
.super Ljava/lang/Object;
.source "BasicAccessFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->setupEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V
    .locals 0

    .prologue
    .line 130
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$3;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$3;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->clearAll()V
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$200(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    .line 134
    return-void
.end method
