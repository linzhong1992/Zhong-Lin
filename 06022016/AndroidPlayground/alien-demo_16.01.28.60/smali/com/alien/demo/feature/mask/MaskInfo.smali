.class public Lcom/alien/demo/feature/mask/MaskInfo;
.super Ljava/lang/Object;
.source "MaskInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;
    }
.end annotation


# instance fields
.field private assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

.field private maskMode:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

.field private presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

.field private scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

.field private specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    sget-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SCAN:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->maskMode:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .line 63
    new-instance v0, Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-direct {v0}, Lcom/alien/demo/feature/mask/ScanInfo;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    .line 64
    new-instance v0, Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-direct {v0}, Lcom/alien/demo/feature/mask/SpecifyInfo;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    .line 65
    new-instance v0, Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-direct {v0}, Lcom/alien/demo/feature/mask/PresetsInfo;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    .line 66
    new-instance v0, Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-direct {v0}, Lcom/alien/demo/feature/mask/AssetsInfo;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    .line 67
    return-void
.end method


# virtual methods
.method public getAssetsInfo()Lcom/alien/demo/feature/mask/AssetsInfo;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    return-object v0
.end method

.method public getMaskMode()Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->maskMode:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    return-object v0
.end method

.method public getPresetsInfo()Lcom/alien/demo/feature/mask/PresetsInfo;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    return-object v0
.end method

.method public getScanInfo()Lcom/alien/demo/feature/mask/ScanInfo;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    return-object v0
.end method

.method public getSpecifyInfo()Lcom/alien/demo/feature/mask/SpecifyInfo;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskInfo;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    return-object v0
.end method

.method public setMaskMode(Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;)V
    .locals 0
    .param p1, "maskMode"    # Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/alien/demo/feature/mask/MaskInfo;->maskMode:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .line 43
    return-void
.end method
