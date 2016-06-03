.class public Lcom/alien/demo/rfid/TagMask;
.super Ljava/lang/Object;
.source "TagMask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/rfid/TagMask$MaskInfo;
    }
.end annotation


# instance fields
.field private final FIELD_SEP:Ljava/lang/String;

.field private maskedBank:I

.field private masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, ","

    iput-object v0, p0, Lcom/alien/demo/rfid/TagMask;->FIELD_SEP:Ljava/lang/String;

    .line 34
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/alien/demo/rfid/TagMask$MaskInfo;

    const/4 v1, 0x0

    new-instance v2, Lcom/alien/demo/rfid/TagMask$MaskInfo;

    invoke-direct {v2, p0}, Lcom/alien/demo/rfid/TagMask$MaskInfo;-><init>(Lcom/alien/demo/rfid/TagMask;)V

    aput-object v2, v0, v1

    new-instance v1, Lcom/alien/demo/rfid/TagMask$MaskInfo;

    invoke-direct {v1, p0}, Lcom/alien/demo/rfid/TagMask$MaskInfo;-><init>(Lcom/alien/demo/rfid/TagMask;)V

    aput-object v1, v0, v3

    const/4 v1, 0x2

    new-instance v2, Lcom/alien/demo/rfid/TagMask$MaskInfo;

    invoke-direct {v2, p0}, Lcom/alien/demo/rfid/TagMask$MaskInfo;-><init>(Lcom/alien/demo/rfid/TagMask;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/alien/demo/rfid/TagMask$MaskInfo;

    invoke-direct {v2, p0}, Lcom/alien/demo/rfid/TagMask$MaskInfo;-><init>(Lcom/alien/demo/rfid/TagMask;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/alien/demo/rfid/TagMask;->masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    .line 36
    iput v3, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    .line 52
    return-void
.end method

.method public static createFromString(Ljava/lang/String;)Lcom/alien/demo/rfid/TagMask;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 81
    new-instance v0, Lcom/alien/demo/rfid/TagMask;

    invoke-direct {v0}, Lcom/alien/demo/rfid/TagMask;-><init>()V

    .line 82
    .local v0, "mask":Lcom/alien/demo/rfid/TagMask;
    invoke-virtual {v0, p0}, Lcom/alien/demo/rfid/TagMask;->loadFromString(Ljava/lang/String;)V

    .line 83
    return-object v0
.end method


# virtual methods
.method public clearMask()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 43
    const/4 v0, 0x1

    iput v0, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    .line 44
    iget v0, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    const-string v1, ""

    invoke-virtual {p0, v0, v2, v2, v1}, Lcom/alien/demo/rfid/TagMask;->setMaskInfo(IIILjava/lang/String;)Z

    .line 45
    return-void
.end method

.method public convertToString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaskInfos()[Lcom/alien/demo/rfid/TagMask$MaskInfo;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/alien/demo/rfid/TagMask;->masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    return-object v0
.end method

.method public getMaskedBank()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    return v0
.end method

.method public loadFromString(Ljava/lang/String;)V
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 75
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    const-class v2, Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v1, p1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/rfid/TagMask;

    .line 76
    .local v0, "obj":Lcom/alien/demo/rfid/TagMask;
    iget v1, v0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    iput v1, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    .line 77
    iget-object v1, v0, Lcom/alien/demo/rfid/TagMask;->masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    iput-object v1, p0, Lcom/alien/demo/rfid/TagMask;->masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    .line 78
    return-void
.end method

.method public setMaskInfo(IIILjava/lang/String;)Z
    .locals 2
    .param p1, "bank"    # I
    .param p2, "bitOffset"    # I
    .param p3, "bitLen"    # I
    .param p4, "data"    # Ljava/lang/String;

    .prologue
    .line 56
    if-nez p1, :cond_0

    const/4 v1, 0x0

    .line 63
    :goto_0
    return v1

    .line 58
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/rfid/TagMask;->masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    aget-object v0, v1, p1

    .line 59
    .local v0, "mask":Lcom/alien/demo/rfid/TagMask$MaskInfo;
    iput p2, v0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->ptr:I

    .line 60
    iput p3, v0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->len:I

    .line 61
    iput-object p4, v0, Lcom/alien/demo/rfid/TagMask$MaskInfo;->data:Ljava/lang/String;

    .line 63
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public setMaskedBank(I)V
    .locals 0
    .param p1, "bank"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    .line 40
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 88
    iget-object v1, p0, Lcom/alien/demo/rfid/TagMask;->masks:[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    iget v2, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    aget-object v0, v1, v2

    .line 89
    .local v0, "info":Lcom/alien/demo/rfid/TagMask$MaskInfo;
    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagMask$MaskInfo;->isNotSet()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 90
    const-string v1, ""

    .line 92
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/alien/demo/Constants$Bank;->NAMES:[Ljava/lang/String;

    iget v3, p0, Lcom/alien/demo/rfid/TagMask;->maskedBank:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagMask$MaskInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
