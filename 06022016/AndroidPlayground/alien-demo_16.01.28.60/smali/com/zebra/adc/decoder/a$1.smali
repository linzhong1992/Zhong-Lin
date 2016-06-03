.class Lcom/zebra/adc/decoder/a$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zebra/adc/decoder/a;->a(Lcom/zebra/adc/decoder/a$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zebra/adc/decoder/a;

.field private final synthetic b:Lcom/zebra/adc/decoder/a$a;


# direct methods
.method constructor <init>(Lcom/zebra/adc/decoder/a;Lcom/zebra/adc/decoder/a$a;)V
    .locals 0

    iput-object p1, p0, Lcom/zebra/adc/decoder/a$1;->a:Lcom/zebra/adc/decoder/a;

    iput-object p2, p0, Lcom/zebra/adc/decoder/a$1;->b:Lcom/zebra/adc/decoder/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDecodeComplete(II[BLcom/zebra/adc/decoder/BarCodeReader;)V
    .locals 1
    .param p1, "symbology"    # I
    .param p2, "length"    # I
    .param p3, "data"    # [B

    .prologue
    const/4 v0, -0x3

    if-ne p2, v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/zebra/adc/decoder/a$1;->b:Lcom/zebra/adc/decoder/a$a;

    invoke-interface {v0, p1, p2, p3}, Lcom/zebra/adc/decoder/a$a;->a(II[B)V

    goto :goto_0
.end method

.method public onEvent(II[BLcom/zebra/adc/decoder/BarCodeReader;)V
    .locals 0

    return-void
.end method
