.class public Lcom/alien/demo/rfid/TagMask$MaskInfo;
.super Ljava/lang/Object;
.source "TagMask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/rfid/TagMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MaskInfo"
.end annotation


# instance fields
.field data:Ljava/lang/String;

.field len:I

.field ptr:I

.field final synthetic this$0:Lcom/alien/demo/rfid/TagMask;


# direct methods
.method public constructor <init>(Lcom/alien/demo/rfid/TagMask;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 12
    iput-object p1, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->this$0:Lcom/alien/demo/rfid/TagMask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->ptr:I

    .line 14
    iput v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->len:I

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->data:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->ptr:I

    .line 19
    iput v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->len:I

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->data:Ljava/lang/String;

    .line 21
    return-void
.end method

.method public isNotSet()Z
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->data:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->ptr:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->len:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->data:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
