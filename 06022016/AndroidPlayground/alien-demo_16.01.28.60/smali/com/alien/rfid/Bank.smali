.class public final enum Lcom/alien/rfid/Bank;
.super Ljava/lang/Enum;


# static fields
.field public static final enum EPC:Lcom/alien/rfid/Bank;

.field public static final enum RESERVED:Lcom/alien/rfid/Bank;

.field public static final enum TID:Lcom/alien/rfid/Bank;

.field public static final enum USER:Lcom/alien/rfid/Bank;

.field private static final synthetic b:[Lcom/alien/rfid/Bank;


# instance fields
.field private a:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/alien/rfid/Bank;

    const-string v1, "RESERVED"

    invoke-direct {v0, v1, v2, v2}, Lcom/alien/rfid/Bank;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    new-instance v0, Lcom/alien/rfid/Bank;

    const-string v1, "EPC"

    invoke-direct {v0, v1, v3, v3}, Lcom/alien/rfid/Bank;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    new-instance v0, Lcom/alien/rfid/Bank;

    const-string v1, "TID"

    invoke-direct {v0, v1, v4, v4}, Lcom/alien/rfid/Bank;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    new-instance v0, Lcom/alien/rfid/Bank;

    const-string v1, "USER"

    invoke-direct {v0, v1, v5, v5}, Lcom/alien/rfid/Bank;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/alien/rfid/Bank;

    sget-object v1, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    aput-object v1, v0, v2

    sget-object v1, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    aput-object v1, v0, v3

    sget-object v1, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    aput-object v1, v0, v4

    sget-object v1, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    aput-object v1, v0, v5

    sput-object v0, Lcom/alien/rfid/Bank;->b:[Lcom/alien/rfid/Bank;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/alien/rfid/Bank;->a:I

    return-void
.end method

.method public static fromValue(I)Lcom/alien/rfid/Bank;
    .locals 2
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    packed-switch p0, :pswitch_data_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Invalid Memory Bank value"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    sget-object v0, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    :goto_0
    return-object v0

    :pswitch_1
    sget-object v0, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alien/rfid/Bank;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const-class v0, Lcom/alien/rfid/Bank;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/alien/rfid/Bank;

    return-object v0
.end method

.method public static values()[Lcom/alien/rfid/Bank;
    .locals 1

    sget-object v0, Lcom/alien/rfid/Bank;->b:[Lcom/alien/rfid/Bank;

    invoke-virtual {v0}, [Lcom/alien/rfid/Bank;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/alien/rfid/Bank;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/Bank;->a:I

    return v0
.end method
