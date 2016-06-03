.class public Lcom/alien/demo/data/LocalSettings;
.super Ljava/lang/Object;
.source "LocalSettings.java"


# static fields
.field private static debugMode:Z

.field private static showHiddenSetting:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method


# virtual methods
.method public isDebugMode()Z
    .locals 1

    .prologue
    .line 26
    sget-boolean v0, Lcom/alien/demo/data/LocalSettings;->debugMode:Z

    return v0
.end method

.method public isShowHiddenSetting()Z
    .locals 1

    .prologue
    .line 18
    sget-boolean v0, Lcom/alien/demo/data/LocalSettings;->showHiddenSetting:Z

    return v0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 30
    sput-boolean p1, Lcom/alien/demo/data/LocalSettings;->debugMode:Z

    .line 31
    return-void
.end method

.method public setShowHiddenSetting(Z)V
    .locals 0
    .param p1, "showHiddenSetting"    # Z

    .prologue
    .line 22
    sput-boolean p1, Lcom/alien/demo/data/LocalSettings;->showHiddenSetting:Z

    .line 23
    return-void
.end method
