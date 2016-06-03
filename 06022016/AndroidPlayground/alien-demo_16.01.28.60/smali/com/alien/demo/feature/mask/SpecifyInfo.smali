.class public Lcom/alien/demo/feature/mask/SpecifyInfo;
.super Ljava/lang/Object;
.source "SpecifyInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;
    }
.end annotation


# instance fields
.field private arbitraryBank:I

.field private arbitraryData:Ljava/lang/String;

.field private arbitraryLen:I

.field private arbitraryPtr:I

.field private epcStartWithData:Ljava/lang/String;

.field private specifyMode:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    sget-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->specifyMode:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    .line 88
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->epcStartWithData:Ljava/lang/String;

    .line 89
    const/4 v0, 0x1

    iput v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryBank:I

    .line 90
    iput v1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryPtr:I

    .line 91
    iput v1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryLen:I

    .line 92
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryData:Ljava/lang/String;

    .line 93
    return-void
.end method


# virtual methods
.method public getArbitraryBank()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryBank:I

    return v0
.end method

.method public getArbitraryData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryData:Ljava/lang/String;

    return-object v0
.end method

.method public getArbitraryLen()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryLen:I

    return v0
.end method

.method public getArbitraryPtr()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryPtr:I

    return v0
.end method

.method public getEpcStartWithData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->epcStartWithData:Ljava/lang/String;

    return-object v0
.end method

.method public getSpecifyMode()Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->specifyMode:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    return-object v0
.end method

.method public setArbitraryBank(I)V
    .locals 0
    .param p1, "arbitraryBank"    # I

    .prologue
    .line 59
    iput p1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryBank:I

    .line 60
    return-void
.end method

.method public setArbitraryData(Ljava/lang/String;)V
    .locals 0
    .param p1, "arbitraryData"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryData:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setArbitraryLen(I)V
    .locals 0
    .param p1, "arbitraryLen"    # I

    .prologue
    .line 75
    iput p1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryLen:I

    .line 76
    return-void
.end method

.method public setArbitraryPtr(I)V
    .locals 0
    .param p1, "arbitraryPtr"    # I

    .prologue
    .line 67
    iput p1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->arbitraryPtr:I

    .line 68
    return-void
.end method

.method public setEpcStartWithData(Ljava/lang/String;)V
    .locals 0
    .param p1, "epcStartWithData"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->epcStartWithData:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public setSpecifyMode(Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;)V
    .locals 0
    .param p1, "specifyMode"    # Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/alien/demo/feature/mask/SpecifyInfo;->specifyMode:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    .line 44
    return-void
.end method
