.class public final enum Lcom/alien/rfid/Target;
.super Ljava/lang/Enum;


# static fields
.field public static final enum A:Lcom/alien/rfid/Target;

.field public static final enum B:Lcom/alien/rfid/Target;

.field private static final synthetic b:[Lcom/alien/rfid/Target;


# instance fields
.field private a:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/alien/rfid/Target;

    const-string v1, "A"

    invoke-direct {v0, v1, v2, v2}, Lcom/alien/rfid/Target;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/Target;->A:Lcom/alien/rfid/Target;

    new-instance v0, Lcom/alien/rfid/Target;

    const-string v1, "B"

    invoke-direct {v0, v1, v3, v3}, Lcom/alien/rfid/Target;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/Target;->B:Lcom/alien/rfid/Target;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/alien/rfid/Target;

    sget-object v1, Lcom/alien/rfid/Target;->A:Lcom/alien/rfid/Target;

    aput-object v1, v0, v2

    sget-object v1, Lcom/alien/rfid/Target;->B:Lcom/alien/rfid/Target;

    aput-object v1, v0, v3

    sput-object v0, Lcom/alien/rfid/Target;->b:[Lcom/alien/rfid/Target;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/alien/rfid/Target;->a:I

    return-void
.end method

.method public static fromValue(I)Lcom/alien/rfid/Target;
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

    const-string v1, "Invalid Target value"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    sget-object v0, Lcom/alien/rfid/Target;->A:Lcom/alien/rfid/Target;

    :goto_0
    return-object v0

    :pswitch_1
    sget-object v0, Lcom/alien/rfid/Target;->B:Lcom/alien/rfid/Target;

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alien/rfid/Target;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const-class v0, Lcom/alien/rfid/Target;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/alien/rfid/Target;

    return-object v0
.end method

.method public static values()[Lcom/alien/rfid/Target;
    .locals 1

    sget-object v0, Lcom/alien/rfid/Target;->b:[Lcom/alien/rfid/Target;

    invoke-virtual {v0}, [Lcom/alien/rfid/Target;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/alien/rfid/Target;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/Target;->a:I

    return v0
.end method
