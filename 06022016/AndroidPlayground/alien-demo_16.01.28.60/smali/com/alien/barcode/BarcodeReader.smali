.class public Lcom/alien/barcode/BarcodeReader;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/zebra/adc/decoder/a;

.field private static b:Lcom/alien/barcode/BarcodeCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/zebra/adc/decoder/a;->a()Lcom/zebra/adc/decoder/a;

    move-result-object v0

    sput-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    invoke-virtual {v0, p1}, Lcom/zebra/adc/decoder/a;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    const/16 v1, 0x144

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/zebra/adc/decoder/a;->a(II)Z

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    const/16 v1, 0x12c

    invoke-virtual {v0, v1, v3}, Lcom/zebra/adc/decoder/a;->a(II)Z

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    const/16 v1, 0x169

    invoke-virtual {v0, v1, v3}, Lcom/zebra/adc/decoder/a;->a(II)Z

    :cond_0
    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    new-instance v1, Lcom/alien/barcode/BarcodeReader$1;

    invoke-direct {v1, p0}, Lcom/alien/barcode/BarcodeReader$1;-><init>(Lcom/alien/barcode/BarcodeReader;)V

    invoke-virtual {v0, v1}, Lcom/zebra/adc/decoder/a;->a(Lcom/zebra/adc/decoder/a$a;)V

    return-void
.end method

.method static synthetic a()Lcom/alien/barcode/BarcodeCallback;
    .locals 1

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    return-object v0
.end method

.method static synthetic a(Lcom/alien/barcode/BarcodeCallback;)Lcom/alien/barcode/BarcodeCallback;
    .locals 0

    sput-object p0, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    return-object p0
.end method


# virtual methods
.method public isRunning()Z
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    if-nez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    sget-object v1, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public start(Lcom/alien/barcode/BarcodeCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/alien/barcode/BarcodeCallback;

    .prologue
    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v1, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    if-eqz v0, :cond_1

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    sput-object p1, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    invoke-virtual {v0}, Lcom/zebra/adc/decoder/a;->b()V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v1, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    if-nez v0, :cond_1

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    sget-object v0, Lcom/alien/barcode/BarcodeReader;->a:Lcom/zebra/adc/decoder/a;

    invoke-virtual {v0}, Lcom/zebra/adc/decoder/a;->c()V

    const/4 v0, 0x0

    sput-object v0, Lcom/alien/barcode/BarcodeReader;->b:Lcom/alien/barcode/BarcodeCallback;

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method
