.class public final enum Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;
.super Ljava/lang/Enum;
.source "SpecifyInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/mask/SpecifyInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SpecifyModeEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

.field public static final enum ARBITRATY:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

.field public static final enum START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 10
    new-instance v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    const-string v1, "START_WITH_EPC"

    invoke-direct {v0, v1, v2, v2}, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    .line 11
    new-instance v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    const-string v1, "ARBITRATY"

    invoke-direct {v0, v1, v3, v3}, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->ARBITRATY:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    .line 9
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    sget-object v1, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    aput-object v1, v0, v2

    sget-object v1, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->ARBITRATY:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    aput-object v1, v0, v3

    sput-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->$VALUES:[Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    iput p3, p0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->value:I

    .line 16
    return-void
.end method

.method public static fromInt(I)Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;
    .locals 1
    .param p0, "v"    # I

    .prologue
    .line 23
    packed-switch p0, :pswitch_data_0

    .line 25
    sget-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    :goto_0
    return-object v0

    .line 24
    :pswitch_0
    sget-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->ARBITRATY:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    goto :goto_0

    .line 23
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    return-object v0
.end method

.method public static values()[Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;
    .locals 1

    .prologue
    .line 9
    sget-object v0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->$VALUES:[Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    invoke-virtual {v0}, [Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 19
    iget v0, p0, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->value:I

    return v0
.end method
