.class public Lcom/alien/demo/Constants$RfidFieldOffsets;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RfidFieldOffsets"
.end annotation


# static fields
.field public static final ACCESS_PASSWORD_WORD_OFFSET:I = 0x2

.field public static final EPC_ID_BIT_OFFSET:I = 0x20

.field public static final KILL_PASSWORD_WORD_OFFSET:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
