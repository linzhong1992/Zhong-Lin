.class Lcom/zebra/adc/decoder/BarCodeReader$Size;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zebra/adc/decoder/BarCodeReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Size"
.end annotation


# instance fields
.field public height:I

.field final synthetic this$0:Lcom/zebra/adc/decoder/BarCodeReader;

.field public width:I


# direct methods
.method public constructor <init>(Lcom/zebra/adc/decoder/BarCodeReader;II)V
    .locals 0
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->width:I

    iput p3, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->height:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    instance-of v1, p1, Lcom/zebra/adc/decoder/BarCodeReader$Size;

    if-nez v1, :cond_1

    .end local p1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    check-cast p1, Lcom/zebra/adc/decoder/BarCodeReader$Size;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->width:I

    iget v2, p1, Lcom/zebra/adc/decoder/BarCodeReader$Size;->width:I

    if-ne v1, v2, :cond_0

    iget v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->height:I

    iget v2, p1, Lcom/zebra/adc/decoder/BarCodeReader$Size;->height:I

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->width:I

    mul-int/lit16 v0, v0, 0x7fc9

    iget v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$Size;->height:I

    add-int/2addr v0, v1

    return v0
.end method
