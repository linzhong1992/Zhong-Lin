.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$4;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 134
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$4;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$4;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    invoke-virtual {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->lockField()V

    .line 138
    return-void
.end method
