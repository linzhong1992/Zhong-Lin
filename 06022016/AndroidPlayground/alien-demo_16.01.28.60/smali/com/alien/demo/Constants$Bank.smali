.class public Lcom/alien/demo/Constants$Bank;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bank"
.end annotation


# static fields
.field public static final EPC:I = 0x1

.field public static final NAMES:[Ljava/lang/String;

.field public static final RESERVED:I = 0x0

.field public static final TID:I = 0x2

.field public static final USER:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 13
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "RESERVED"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "EPC"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "TID"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "USER"

    aput-object v2, v0, v1

    sput-object v0, Lcom/alien/demo/Constants$Bank;->NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
