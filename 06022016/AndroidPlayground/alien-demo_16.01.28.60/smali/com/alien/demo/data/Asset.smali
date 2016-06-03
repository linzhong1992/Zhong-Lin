.class public Lcom/alien/demo/data/Asset;
.super Ljava/lang/Object;
.source "Asset.java"


# instance fields
.field private barcode:Ljava/lang/String;

.field private bm:Landroid/graphics/Bitmap;

.field private epc:Ljava/lang/String;

.field private image:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/data/Asset;->epc:Ljava/lang/String;

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/data/Asset;->barcode:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "epc"    # Ljava/lang/String;
    .param p2, "barcode"    # Ljava/lang/String;
    .param p3, "base64image"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {p3, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/alien/demo/data/Asset;-><init>(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 25
    return-void

    .line 24
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 1
    .param p1, "epc"    # Ljava/lang/String;
    .param p2, "barcode"    # Ljava/lang/String;
    .param p3, "image"    # [B

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/data/Asset;->epc:Ljava/lang/String;

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/data/Asset;->barcode:Ljava/lang/String;

    .line 18
    iput-object p1, p0, Lcom/alien/demo/data/Asset;->epc:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/alien/demo/data/Asset;->barcode:Ljava/lang/String;

    .line 20
    invoke-virtual {p0, p3}, Lcom/alien/demo/data/Asset;->setImage([B)V

    .line 21
    return-void
.end method

.method public static loadFromString(Ljava/lang/String;)Lcom/alien/demo/data/Asset;
    .locals 6
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    const/4 v3, 0x1

    .line 94
    const-string v1, ","

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "strings":[Ljava/lang/String;
    new-instance v4, Lcom/alien/demo/data/Asset;

    array-length v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :goto_0
    array-length v2, v0

    if-le v2, v3, :cond_1

    aget-object v2, v0, v3

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    :goto_1
    array-length v3, v0

    if-le v3, v5, :cond_2

    aget-object v3, v0, v5

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-direct {v4, v1, v2, v3}, Lcom/alien/demo/data/Asset;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    :cond_0
    const-string v1, ""

    goto :goto_0

    :cond_1
    const-string v2, ""

    goto :goto_1

    :cond_2
    const-string v3, ""

    goto :goto_2
.end method


# virtual methods
.method public clearImage()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lcom/alien/demo/data/Asset;->bm:Landroid/graphics/Bitmap;

    .line 82
    iput-object v0, p0, Lcom/alien/demo/data/Asset;->image:[B

    .line 83
    return-void
.end method

.method public getBarcode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/data/Asset;->barcode:Ljava/lang/String;

    return-object v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/alien/demo/data/Asset;->bm:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getEpc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/data/Asset;->epc:Ljava/lang/String;

    return-object v0
.end method

.method public getImage()[B
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/alien/demo/data/Asset;->image:[B

    return-object v0
.end method

.method public getResizedBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 10
    .param p1, "bm"    # Landroid/graphics/Bitmap;
    .param p2, "newWidth"    # I
    .param p3, "newHeight"    # I

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 52
    .local v3, "width":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 53
    .local v4, "height":I
    int-to-float v0, p2

    int-to-float v2, v3

    div-float v9, v0, v2

    .line 54
    .local v9, "scaleWidth":F
    int-to-float v0, p3

    int-to-float v2, v4

    div-float v8, v0, v2

    .line 57
    .local v8, "scaleHeight":F
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 58
    .local v5, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v5, v9, v8}, Landroid/graphics/Matrix;->postScale(FF)Z

    move-object v0, p1

    move v2, v1

    move v6, v1

    .line 59
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 61
    .local v7, "resizedBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 62
    return-object v7
.end method

.method public setBarcode(Ljava/lang/String;)V
    .locals 0
    .param p1, "barcode"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/alien/demo/data/Asset;->barcode:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setEpc(Ljava/lang/String;)V
    .locals 0
    .param p1, "epc"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/alien/demo/data/Asset;->epc:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setImage(Ljava/lang/String;)V
    .locals 1
    .param p1, "base64image"    # Ljava/lang/String;

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/data/Asset;->image:[B

    .line 91
    return-void
.end method

.method public setImage([B)V
    .locals 6
    .param p1, "buf"    # [B

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 66
    if-nez p1, :cond_0

    .line 67
    iput-object v4, p0, Lcom/alien/demo/data/Asset;->image:[B

    .line 68
    iput-object v4, p0, Lcom/alien/demo/data/Asset;->bm:Landroid/graphics/Bitmap;

    .line 78
    :goto_0
    return-void

    .line 72
    :cond_0
    iput-object p1, p0, Lcom/alien/demo/data/Asset;->image:[B

    .line 73
    array-length v4, p1

    invoke-static {p1, v5, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 74
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 75
    .local v3, "width":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 76
    .local v1, "height":I
    if-ge v3, v1, :cond_1

    move v2, v3

    .line 77
    .local v2, "min":I
    :goto_1
    invoke-static {v0, v5, v5, v2, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lcom/alien/demo/data/Asset;->bm:Landroid/graphics/Bitmap;

    goto :goto_0

    .end local v2    # "min":I
    :cond_1
    move v2, v1

    .line 76
    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/alien/demo/data/Asset;->epc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/alien/demo/data/Asset;->barcode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/alien/demo/data/Asset;->image:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/alien/demo/data/Asset;->image:[B

    const/4 v2, 0x3

    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method
