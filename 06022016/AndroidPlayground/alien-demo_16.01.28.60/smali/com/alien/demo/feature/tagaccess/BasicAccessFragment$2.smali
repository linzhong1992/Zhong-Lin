.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$2;
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
    .line 123
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$2;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$2;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readAll()V
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->access$100(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    .line 127
    return-void
.end method
