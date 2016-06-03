.class Lcom/alien/barcode/BarcodeReader$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/zebra/adc/decoder/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/barcode/BarcodeReader;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/alien/barcode/BarcodeReader;


# direct methods
.method constructor <init>(Lcom/alien/barcode/BarcodeReader;)V
    .locals 0

    iput-object p1, p0, Lcom/alien/barcode/BarcodeReader$1;->a:Lcom/alien/barcode/BarcodeReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(II[B)V
    .locals 3

    if-lez p2, :cond_0

    if-eqz p3, :cond_0

    if-lez p2, :cond_0

    invoke-static {}, Lcom/alien/barcode/BarcodeReader;->a()Lcom/alien/barcode/BarcodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/alien/barcode/BarcodeReader;->a()Lcom/alien/barcode/BarcodeCallback;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    invoke-static {p3, p2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-interface {v0, v1}, Lcom/alien/barcode/BarcodeCallback;->onBarcodeRead(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/alien/barcode/BarcodeReader;->a(Lcom/alien/barcode/BarcodeCallback;)Lcom/alien/barcode/BarcodeCallback;

    return-void
.end method
