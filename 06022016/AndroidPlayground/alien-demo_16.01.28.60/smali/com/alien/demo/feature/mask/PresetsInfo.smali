.class public Lcom/alien/demo/feature/mask/PresetsInfo;
.super Ljava/lang/Object;
.source "PresetsInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    }
.end annotation


# instance fields
.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;",
            ">;"
        }
    .end annotation
.end field

.field private selectedItem:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, 0x0

    iput v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo;->selectedItem:I

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo;->items:Ljava/util/ArrayList;

    .line 119
    return-void
.end method


# virtual methods
.method public getItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo;->items:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSelectedItem()I
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lcom/alien/demo/feature/mask/PresetsInfo;->selectedItem:I

    return v0
.end method

.method public setItems(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;>;"
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo;->items:Ljava/util/ArrayList;

    .line 135
    return-void
.end method

.method public setSelectedItem(I)V
    .locals 0
    .param p1, "selectedItem"    # I

    .prologue
    .line 126
    iput p1, p0, Lcom/alien/demo/feature/mask/PresetsInfo;->selectedItem:I

    .line 127
    return-void
.end method
