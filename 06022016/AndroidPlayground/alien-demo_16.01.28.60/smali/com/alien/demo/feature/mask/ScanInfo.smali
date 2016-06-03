.class public Lcom/alien/demo/feature/mask/ScanInfo;
.super Ljava/lang/Object;
.source "ScanInfo.java"


# instance fields
.field private maskedEpc:Ljava/lang/String;

.field private tagList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanInfo;->maskedEpc:Ljava/lang/String;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanInfo;->tagList:Ljava/util/ArrayList;

    .line 32
    return-void
.end method


# virtual methods
.method public getMaskedEpc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanInfo;->maskedEpc:Ljava/lang/String;

    return-object v0
.end method

.method public getTagList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanInfo;->tagList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public setMaskedEpc(Ljava/lang/String;)V
    .locals 0
    .param p1, "maskedEpc"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/alien/demo/feature/mask/ScanInfo;->maskedEpc:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setTagList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "tagList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/alien/demo/feature/mask/ScanInfo;->tagList:Ljava/util/ArrayList;

    .line 27
    return-void
.end method
