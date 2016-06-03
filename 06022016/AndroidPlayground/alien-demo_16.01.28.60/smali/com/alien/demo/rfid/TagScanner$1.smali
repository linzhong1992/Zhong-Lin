.class Lcom/alien/demo/rfid/TagScanner$1;
.super Ljava/lang/Object;
.source "TagScanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/rfid/TagScanner;->stop(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/rfid/TagScanner;


# direct methods
.method constructor <init>(Lcom/alien/demo/rfid/TagScanner;)V
    .locals 0

    .prologue
    .line 106
    iput-object p1, p0, Lcom/alien/demo/rfid/TagScanner$1;->this$0:Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/alien/demo/rfid/TagScanner$1;->this$0:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->stop()Z

    .line 110
    return-void
.end method
