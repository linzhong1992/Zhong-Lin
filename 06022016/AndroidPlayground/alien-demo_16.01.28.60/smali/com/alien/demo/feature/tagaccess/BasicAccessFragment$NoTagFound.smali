.class Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
.super Ljava/lang/Exception;
.source "BasicAccessFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NoTagFound"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Ljava/lang/String;)V
    .locals 0
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;->this$0:Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .line 64
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 65
    return-void
.end method
