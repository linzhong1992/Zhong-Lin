.class public Lcom/alien/demo/Constants$Requests;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Requests"
.end annotation


# static fields
.field public static final REQUEST_ASSET:I = 0x4

.field public static final REQUEST_FILE:I = 0x2

.field public static final REQUEST_MASK:I = 0x1

.field public static final REQUEST_PHOTO:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
