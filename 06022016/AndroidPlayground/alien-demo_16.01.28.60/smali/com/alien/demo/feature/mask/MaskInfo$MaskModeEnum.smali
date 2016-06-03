.class public final enum Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;
.super Ljava/lang/Enum;
.source "MaskInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/mask/MaskInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MaskModeEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

.field public static final enum ASSETS:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

.field public static final enum PRESET:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

.field public static final enum SCAN:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

.field public static final enum SPECIFY:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    const-string v1, "SCAN"

    invoke-direct {v0, v1, v2, v2}, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SCAN:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .line 9
    new-instance v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    const-string v1, "SPECIFY"

    invoke-direct {v0, v1, v3, v3}, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SPECIFY:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .line 10
    new-instance v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    const-string v1, "PRESET"

    invoke-direct {v0, v1, v4, v4}, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->PRESET:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .line 11
    new-instance v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    const-string v1, "ASSETS"

    invoke-direct {v0, v1, v5, v5}, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->ASSETS:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    .line 7
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    sget-object v1, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SCAN:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    aput-object v1, v0, v2

    sget-object v1, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SPECIFY:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    aput-object v1, v0, v3

    sget-object v1, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->PRESET:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    aput-object v1, v0, v4

    sget-object v1, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->ASSETS:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    aput-object v1, v0, v5

    sput-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->$VALUES:[Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

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
    iput p3, p0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->value:I

    .line 16
    return-void
.end method

.method public static fromInt(I)Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;
    .locals 1
    .param p0, "v"    # I

    .prologue
    .line 22
    packed-switch p0, :pswitch_data_0

    .line 26
    sget-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SCAN:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    :goto_0
    return-object v0

    .line 23
    :pswitch_0
    sget-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->SPECIFY:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    goto :goto_0

    .line 24
    :pswitch_1
    sget-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->PRESET:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    goto :goto_0

    .line 25
    :pswitch_2
    sget-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->ASSETS:Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    goto :goto_0

    .line 22
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 7
    const-class v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    return-object v0
.end method

.method public static values()[Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;
    .locals 1

    .prologue
    .line 7
    sget-object v0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->$VALUES:[Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    invoke-virtual {v0}, [Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 19
    iget v0, p0, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->value:I

    return v0
.end method
