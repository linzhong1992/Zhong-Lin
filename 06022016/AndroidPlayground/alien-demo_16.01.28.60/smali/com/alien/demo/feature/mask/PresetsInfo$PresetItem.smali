.class public Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
.super Ljava/lang/Object;
.source "PresetsInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/mask/PresetsInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PresetItem"
.end annotation


# instance fields
.field private bank:I

.field private data:Ljava/lang/String;

.field private len:I

.field private name:Ljava/lang/String;

.field private ptr:I


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->name:Ljava/lang/String;

    .line 23
    const/4 v0, 0x1

    iput v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->bank:I

    .line 24
    iput v1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->ptr:I

    .line 25
    iput v1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->len:I

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bank"    # I
    .param p3, "ptr"    # I
    .param p4, "len"    # I
    .param p5, "data"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->name:Ljava/lang/String;

    .line 31
    iput p2, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->bank:I

    .line 32
    iput p3, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->ptr:I

    .line 33
    iput p4, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->len:I

    .line 34
    iput-object p5, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    .locals 6
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 86
    new-instance v1, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;

    invoke-direct {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;-><init>()V

    .line 87
    .local v1, "item":Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    const-string v3, ","

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 88
    .local v2, "strings":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 89
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 90
    packed-switch v0, :pswitch_data_0

    .line 88
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 92
    :pswitch_0
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 93
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->setBank(I)V

    goto :goto_1

    .line 96
    :pswitch_1
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 97
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->setPtr(I)V

    goto :goto_1

    .line 100
    :pswitch_2
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 101
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->setLen(I)V

    goto :goto_1

    .line 104
    :pswitch_3
    aget-object v3, v2, v0

    const-string v4, " "

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 105
    aget-object v3, v2, v0

    invoke-virtual {v1, v3}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->setData(Ljava/lang/String;)V

    goto :goto_1

    .line 108
    :pswitch_4
    aget-object v3, v2, v0

    invoke-virtual {v1, v3}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->setName(Ljava/lang/String;)V

    goto :goto_1

    .line 112
    :cond_1
    return-object v1

    .line 90
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public getBank()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->bank:I

    return v0
.end method

.method public getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    return-object v0
.end method

.method public getLen()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->len:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 40
    :cond_1
    const-string v0, "Preset"

    .line 46
    :goto_0
    return-object v0

    .line 43
    :cond_2
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    goto :goto_0

    .line 46
    :cond_3
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPtr()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->ptr:I

    return v0
.end method

.method public setBank(I)V
    .locals 0
    .param p1, "bank"    # I

    .prologue
    .line 58
    iput p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->bank:I

    .line 59
    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->data:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setLen(I)V
    .locals 0
    .param p1, "len"    # I

    .prologue
    .line 74
    iput p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->len:I

    .line 75
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->name:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setPtr(I)V
    .locals 0
    .param p1, "ptr"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->ptr:I

    .line 67
    return-void
.end method
