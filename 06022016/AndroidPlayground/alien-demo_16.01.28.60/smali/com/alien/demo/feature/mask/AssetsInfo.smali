.class public Lcom/alien/demo/feature/mask/AssetsInfo;
.super Ljava/lang/Object;
.source "AssetsInfo.java"


# instance fields
.field private selectedIndex:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Lcom/alien/demo/data/Asset;)V
    .locals 1
    .param p1, "asset"    # Lcom/alien/demo/data/Asset;

    .prologue
    .line 28
    invoke-static {}, Lcom/alien/demo/data/Assets;->getInstance()Lcom/alien/demo/data/Assets;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/alien/demo/data/Assets;->add(Lcom/alien/demo/data/Asset;)V

    .line 29
    return-void
.end method

.method public delete(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 32
    invoke-static {}, Lcom/alien/demo/data/Assets;->getInstance()Lcom/alien/demo/data/Assets;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/data/Assets;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public getAssets()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/data/Asset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 24
    invoke-static {}, Lcom/alien/demo/data/Assets;->getInstance()Lcom/alien/demo/data/Assets;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/data/Assets;->getList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedIndex()I
    .locals 1

    .prologue
    .line 16
    iget v0, p0, Lcom/alien/demo/feature/mask/AssetsInfo;->selectedIndex:I

    return v0
.end method

.method public save()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-static {}, Lcom/alien/demo/data/Assets;->getInstance()Lcom/alien/demo/data/Assets;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/data/Assets;->save()V

    .line 37
    return-void
.end method

.method public setSelectedIndex(I)V
    .locals 0
    .param p1, "selectedIndex"    # I

    .prologue
    .line 20
    iput p1, p0, Lcom/alien/demo/feature/mask/AssetsInfo;->selectedIndex:I

    .line 21
    return-void
.end method
