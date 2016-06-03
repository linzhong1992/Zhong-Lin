.class Lcom/alien/rfid/ALRH450CusAPI;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/rfid/ALRH450CusAPI$b;,
        Lcom/alien/rfid/ALRH450CusAPI$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/alien/rfid/ALRH450CusAPI$a;

.field public static final b:Lcom/alien/rfid/ALRH450CusAPI$a;

.field public static final c:Lcom/alien/rfid/ALRH450CusAPI$a;

.field public static final d:Lcom/alien/rfid/ALRH450CusAPI$a;

.field public static final e:Lcom/alien/rfid/ALRH450CusAPI$a;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x6

    const/4 v3, 0x4

    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI$a;

    const/16 v1, 0xf0

    invoke-direct {v0, v4, v1, v3}, Lcom/alien/rfid/ALRH450CusAPI$a;-><init>(III)V

    sput-object v0, Lcom/alien/rfid/ALRH450CusAPI;->a:Lcom/alien/rfid/ALRH450CusAPI$a;

    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI$a;

    const/16 v1, 0xf

    const/4 v2, 0x0

    invoke-direct {v0, v4, v1, v2}, Lcom/alien/rfid/ALRH450CusAPI$a;-><init>(III)V

    sput-object v0, Lcom/alien/rfid/ALRH450CusAPI;->b:Lcom/alien/rfid/ALRH450CusAPI$a;

    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI$a;

    const/16 v1, 0xc0

    invoke-direct {v0, v3, v1, v4}, Lcom/alien/rfid/ALRH450CusAPI$a;-><init>(III)V

    sput-object v0, Lcom/alien/rfid/ALRH450CusAPI;->c:Lcom/alien/rfid/ALRH450CusAPI$a;

    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI$a;

    const/16 v1, 0x30

    invoke-direct {v0, v3, v1, v3}, Lcom/alien/rfid/ALRH450CusAPI$a;-><init>(III)V

    sput-object v0, Lcom/alien/rfid/ALRH450CusAPI;->d:Lcom/alien/rfid/ALRH450CusAPI$a;

    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI$a;

    const/16 v1, 0x8

    const/4 v2, 0x3

    invoke-direct {v0, v3, v1, v2}, Lcom/alien/rfid/ALRH450CusAPI$a;-><init>(III)V

    sput-object v0, Lcom/alien/rfid/ALRH450CusAPI;->e:Lcom/alien/rfid/ALRH450CusAPI$a;

    const-string v0, "aliencus"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([ILcom/alien/rfid/ALRH450CusAPI$a;)I
    .locals 2

    iget v0, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->a:I

    aget v0, p1, v0

    iget v1, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->b:I

    and-int/2addr v0, v1

    iget v1, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->c:I

    shr-int/2addr v0, v1

    return v0
.end method

.method public a([ILcom/alien/rfid/ALRH450CusAPI$a;I)V
    .locals 4

    iget v0, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->a:I

    aget v1, p1, v0

    const v2, 0xffff

    iget v3, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->b:I

    xor-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    and-int/2addr v1, v2

    aput v1, p1, v0

    iget v0, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->a:I

    aget v1, p1, v0

    iget v2, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->c:I

    shl-int v2, p3, v2

    iget v3, p2, Lcom/alien/rfid/ALRH450CusAPI$a;->b:I

    and-int/2addr v2, v3

    or-int/2addr v1, v2

    aput v1, p1, v0

    return-void
.end method

.method public a(Lcom/alien/rfid/ALRH450CusAPI$b;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/alien/rfid/ALRH450CusAPI;->singleInventory()[B

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/alien/rfid/ALRH450CusAPI;->a([BLcom/alien/rfid/ALRH450CusAPI$b;)Z

    move-result v0

    return v0
.end method

.method public a([BLcom/alien/rfid/ALRH450CusAPI$b;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    aget-byte v2, v1, v0

    and-int/lit16 v2, v2, 0xff

    ushr-int/lit8 v2, v2, 0x3

    mul-int/lit8 v3, v2, 0x2

    add-int/lit8 v3, v3, 0x2

    invoke-static {p1, v0, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    array-length v3, p1

    add-int/lit8 v3, v3, -0x3

    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    invoke-static {p1, v3, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    aget-byte v4, p1, v4

    array-length v5, v0

    invoke-static {v0, v5}, Lcom/rscja/utility/a;->a([BI)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p2, Lcom/alien/rfid/ALRH450CusAPI$b;->a:Ljava/lang/String;

    array-length v5, p1

    array-length v0, v0

    sub-int v0, v5, v0

    array-length v5, v3

    sub-int/2addr v0, v5

    add-int/lit8 v0, v0, -0x1

    const/16 v5, 0xc

    if-ne v0, v5, :cond_1

    mul-int/lit8 v0, v2, 0x2

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v2, v0, 0xc

    invoke-static {p1, v0, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    array-length v0, v1

    invoke-static {v1, v0}, Lcom/rscja/utility/a;->a([BI)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/alien/rfid/ALRH450CusAPI$b;->b:Ljava/lang/String;

    :cond_1
    iput v4, p2, Lcom/alien/rfid/ALRH450CusAPI$b;->d:I

    array-length v0, v3

    invoke-static {v3, v0}, Lcom/rscja/utility/a;->a([BI)Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x10000

    const/16 v2, 0x10

    invoke-static {v0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    sub-int v0, v1, v0

    int-to-float v0, v0

    neg-float v0, v0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    float-to-double v0, v0

    iput-wide v0, p2, Lcom/alien/rfid/ALRH450CusAPI$b;->c:D

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public b(Lcom/alien/rfid/ALRH450CusAPI$b;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/alien/rfid/ALRH450CusAPI;->invGetTagInfo()[B

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/alien/rfid/ALRH450CusAPI;->a([BLcom/alien/rfid/ALRH450CusAPI$b;)Z

    move-result v0

    return v0
.end method

.method public native enableInventory(Z)V
.end method

.method public native getFirmwareVersion()I
.end method

.method public native getGen2Parameter([I)I
.end method

.method public native getHardwareVersion()I
.end method

.method public native getModuleId()J
.end method

.method public native getRegion()I
.end method

.method public native invGetTagInfo()[B
.end method

.method public native killTag(Ljava/lang/String;IILjava/lang/String;I)I
.end method

.method public native lockUnlockFields(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;)I
.end method

.method public native readData(Ljava/lang/String;IILjava/lang/String;IIII)Ljava/lang/String;
.end method

.method public native setFilter(IILjava/lang/String;I)I
.end method

.method public native setGen2Parameter([I)I
.end method

.method public native setInvMaxTry(I)V
.end method

.method public native setInvReadWaitTime(I)V
.end method

.method public native singleInventory()[B
.end method

.method public native writeData(Ljava/lang/String;IILjava/lang/String;IIIILjava/lang/String;)I
.end method
