.class public Lcom/zebra/adc/decoder/a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zebra/adc/decoder/a$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;

.field private static c:Lcom/zebra/adc/decoder/a;


# instance fields
.field private b:Lcom/zebra/adc/decoder/BarCodeReader;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/zebra/adc/decoder/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zebra/adc/decoder/a;->a:Ljava/lang/String;

    const-string v0, "IAL"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "SDL"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    const-string v0, "barcodereader44"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    :goto_0
    const/4 v0, 0x0

    sput-object v0, Lcom/zebra/adc/decoder/a;->c:Lcom/zebra/adc/decoder/a;

    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_1

    const-string v0, "barcodereader43"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v0, "barcodereader"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    return-void
.end method

.method public static declared-synchronized a()Lcom/zebra/adc/decoder/a;
    .locals 2

    const-class v1, Lcom/zebra/adc/decoder/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/zebra/adc/decoder/a;->c:Lcom/zebra/adc/decoder/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/zebra/adc/decoder/a;

    invoke-direct {v0}, Lcom/zebra/adc/decoder/a;-><init>()V

    sput-object v0, Lcom/zebra/adc/decoder/a;->c:Lcom/zebra/adc/decoder/a;

    :cond_0
    sget-object v0, Lcom/zebra/adc/decoder/a;->c:Lcom/zebra/adc/decoder/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized a(Lcom/zebra/adc/decoder/a$a;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    new-instance v1, Lcom/zebra/adc/decoder/a$1;

    invoke-direct {v1, p0, p1}, Lcom/zebra/adc/decoder/a$1;-><init>(Lcom/zebra/adc/decoder/a;Lcom/zebra/adc/decoder/a$a;)V

    invoke-virtual {v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader;->setDecodeCallback(Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a(II)Z
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-virtual {v0, p1, p2}, Lcom/zebra/adc/decoder/BarCodeReader;->setParameter(II)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized a(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v1, v2, :cond_0

    invoke-static {p1}, Lcom/zebra/adc/decoder/BarCodeReader;->open(Landroid/content/Context;)Lcom/zebra/adc/decoder/BarCodeReader;

    move-result-object v1

    iput-object v1, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_1

    :goto_1
    monitor-exit p0

    return v0

    :cond_0
    :try_start_2
    invoke-static {}, Lcom/zebra/adc/decoder/BarCodeReader;->open()Lcom/zebra/adc/decoder/BarCodeReader;

    move-result-object v1

    iput-object v1, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_4
    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    const/16 v1, 0x2fd

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/zebra/adc/decoder/BarCodeReader;->setParameter(II)I

    sget-object v0, Lcom/zebra/adc/decoder/a;->a:Ljava/lang/String;

    const-string v1, "open() succ"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v0, 0x1

    goto :goto_1
.end method

.method public declared-synchronized b()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/zebra/adc/decoder/a;->a:Ljava/lang/String;

    const-string v1, "scan() ok"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-virtual {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->startDecode()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/a;->b:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-virtual {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->stopDecode()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
