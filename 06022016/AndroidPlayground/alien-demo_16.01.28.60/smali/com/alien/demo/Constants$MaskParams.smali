.class public Lcom/alien/demo/Constants$MaskParams;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MaskParams"
.end annotation


# static fields
.field public static final ASSET_DATA:Ljava/lang/String; = "asset_data"

.field public static final FILTER_DATA:Ljava/lang/String; = "filter_data"

.field public static final LOCAL_SETTINGS:Ljava/lang/String; = "local_settings"

.field public static final MASK_INFO:Ljava/lang/String; = "mask_info"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
