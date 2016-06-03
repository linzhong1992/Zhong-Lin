.class public Lcom/alien/rfid/Mask;
.super Ljava/lang/Object;


# static fields
.field public static final NONE:Lcom/alien/rfid/Mask;


# instance fields
.field private a:Lcom/alien/rfid/Bank;

.field private b:I

.field private c:I

.field private d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    sget-object v0, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    const-string v1, ""

    invoke-static {v0, v2, v2, v1}, Lcom/alien/rfid/Mask;->a(Lcom/alien/rfid/Bank;IILjava/lang/String;)Lcom/alien/rfid/Mask;

    move-result-object v0

    sput-object v0, Lcom/alien/rfid/Mask;->NONE:Lcom/alien/rfid/Mask;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/alien/rfid/Bank;IILjava/lang/String;)V
    .locals 2
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "bitPointer"    # I
    .param p3, "bitLength"    # I
    .param p4, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x40

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-gez p2, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "bitPointer cannot be negative"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-gez p3, :cond_1

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "bitLength cannot be negative"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/16 v0, 0xff

    if-le p3, v0, :cond_2

    const/16 p3, 0xff

    :cond_2
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p4

    :cond_3
    iput-object p1, p0, Lcom/alien/rfid/Mask;->a:Lcom/alien/rfid/Bank;

    iput p2, p0, Lcom/alien/rfid/Mask;->b:I

    iput p3, p0, Lcom/alien/rfid/Mask;->c:I

    iput-object p4, p0, Lcom/alien/rfid/Mask;->d:Ljava/lang/String;

    return-void
.end method

.method private static a(Lcom/alien/rfid/Bank;IILjava/lang/String;)Lcom/alien/rfid/Mask;
    .locals 1

    new-instance v0, Lcom/alien/rfid/Mask;

    invoke-direct {v0}, Lcom/alien/rfid/Mask;-><init>()V

    iput-object p0, v0, Lcom/alien/rfid/Mask;->a:Lcom/alien/rfid/Bank;

    iput p1, v0, Lcom/alien/rfid/Mask;->b:I

    iput p2, v0, Lcom/alien/rfid/Mask;->c:I

    iput-object p3, v0, Lcom/alien/rfid/Mask;->d:Ljava/lang/String;

    return-object v0
.end method

.method public static maskEPC(Ljava/lang/String;)Lcom/alien/rfid/Mask;
    .locals 4
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    new-instance v0, Lcom/alien/rfid/Mask;

    sget-object v1, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    const/16 v2, 0x20

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/alien/rfid/Mask;-><init>(Lcom/alien/rfid/Bank;IILjava/lang/String;)V

    return-object v0
.end method

.method public static maskTID(Ljava/lang/String;)Lcom/alien/rfid/Mask;
    .locals 4
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    new-instance v0, Lcom/alien/rfid/Mask;

    sget-object v1, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/alien/rfid/Mask;-><init>(Lcom/alien/rfid/Bank;IILjava/lang/String;)V

    return-object v0
.end method

.method public static maskUser(Ljava/lang/String;)Lcom/alien/rfid/Mask;
    .locals 4
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    new-instance v0, Lcom/alien/rfid/Mask;

    sget-object v1, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/alien/rfid/Mask;-><init>(Lcom/alien/rfid/Bank;IILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getBank()Lcom/alien/rfid/Bank;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/Mask;->a:Lcom/alien/rfid/Bank;

    return-object v0
.end method

.method public getBitLength()I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/Mask;->c:I

    return v0
.end method

.method public getBitPointer()I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/Mask;->b:I

    return v0
.end method

.method public getData()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/Mask;->d:Ljava/lang/String;

    return-object v0
.end method

.method public setBank(Lcom/alien/rfid/Bank;)V
    .locals 0
    .param p1, "bank"    # Lcom/alien/rfid/Bank;

    .prologue
    iput-object p1, p0, Lcom/alien/rfid/Mask;->a:Lcom/alien/rfid/Bank;

    return-void
.end method

.method public setBitLength(I)V
    .locals 2
    .param p1, "bitLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    if-ltz p1, :cond_0

    const/16 v0, 0xff

    if-le p1, v0, :cond_1

    :cond_0
    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "bitLength must be 0..255"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iput p1, p0, Lcom/alien/rfid/Mask;->c:I

    return-void
.end method

.method public setBitPointer(I)V
    .locals 2
    .param p1, "bitPointer"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    .prologue
    if-gez p1, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "bitPointer cannot be negative"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput p1, p0, Lcom/alien/rfid/Mask;->b:I

    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/alien/rfid/Mask;->d:Ljava/lang/String;

    return-void
.end method
