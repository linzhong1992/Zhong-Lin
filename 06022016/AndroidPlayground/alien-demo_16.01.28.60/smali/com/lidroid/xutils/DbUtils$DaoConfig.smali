.class public Lcom/lidroid/xutils/DbUtils$DaoConfig;
.super Ljava/lang/Object;
.source "DbUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/DbUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DaoConfig"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private dbDir:Ljava/lang/String;

.field private dbName:Ljava/lang/String;

.field private dbUpgradeListener:Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

.field private dbVersion:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 647
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 641
    const-string v0, "xUtils.db"

    iput-object v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbName:Ljava/lang/String;

    .line 642
    const/4 v0, 0x1

    iput v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbVersion:I

    .line 648
    iput-object p1, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->context:Landroid/content/Context;

    .line 649
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 652
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getDbDir()Ljava/lang/String;
    .locals 1

    .prologue
    .line 682
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbDir:Ljava/lang/String;

    return-object v0
.end method

.method public getDbName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 656
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbName:Ljava/lang/String;

    return-object v0
.end method

.method public getDbUpgradeListener()Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;
    .locals 1

    .prologue
    .line 674
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbUpgradeListener:Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

    return-object v0
.end method

.method public getDbVersion()I
    .locals 1

    .prologue
    .line 666
    iget v0, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbVersion:I

    return v0
.end method

.method public setDbDir(Ljava/lang/String;)V
    .locals 0
    .param p1, "dbDir"    # Ljava/lang/String;

    .prologue
    .line 691
    iput-object p1, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbDir:Ljava/lang/String;

    .line 692
    return-void
.end method

.method public setDbName(Ljava/lang/String;)V
    .locals 1
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 660
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 661
    iput-object p1, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbName:Ljava/lang/String;

    .line 663
    :cond_0
    return-void
.end method

.method public setDbUpgradeListener(Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;)V
    .locals 0
    .param p1, "dbUpgradeListener"    # Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

    .prologue
    .line 678
    iput-object p1, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbUpgradeListener:Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

    .line 679
    return-void
.end method

.method public setDbVersion(I)V
    .locals 0
    .param p1, "dbVersion"    # I

    .prologue
    .line 670
    iput p1, p0, Lcom/lidroid/xutils/DbUtils$DaoConfig;->dbVersion:I

    .line 671
    return-void
.end method
