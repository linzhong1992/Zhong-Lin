.class public Lcom/rscja/deviceapi/a;
.super Lcom/rscja/deviceapi/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rscja/deviceapi/a$a;,
        Lcom/rscja/deviceapi/a$b;
    }
.end annotation


# static fields
.field private static c:Lcom/rscja/deviceapi/a;


# instance fields
.field protected a:Lcom/rscja/deviceapi/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/rscja/deviceapi/a;->c:Lcom/rscja/deviceapi/a;

    return-void
.end method

.method private constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/rscja/deviceapi/exception/a;
        }
    .end annotation

    invoke-direct {p0}, Lcom/rscja/deviceapi/b;-><init>()V

    invoke-static {}, Lcom/rscja/deviceapi/c;->b()Lcom/rscja/deviceapi/c;

    move-result-object v0

    iput-object v0, p0, Lcom/rscja/deviceapi/a;->a:Lcom/rscja/deviceapi/c;

    return-void
.end method

.method public static declared-synchronized b()Lcom/rscja/deviceapi/a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/rscja/deviceapi/exception/a;
        }
    .end annotation

    const-class v1, Lcom/rscja/deviceapi/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/rscja/deviceapi/a;->c:Lcom/rscja/deviceapi/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/rscja/deviceapi/a;

    invoke-direct {v0}, Lcom/rscja/deviceapi/a;-><init>()V

    sput-object v0, Lcom/rscja/deviceapi/a;->c:Lcom/rscja/deviceapi/a;

    :cond_0
    sget-object v0, Lcom/rscja/deviceapi/a;->c:Lcom/rscja/deviceapi/a;
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
.method protected a()Lcom/rscja/deviceapi/DeviceAPI;
    .locals 1

    invoke-static {}, Lcom/rscja/deviceapi/DeviceAPI;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized a(Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;)Ljava/lang/String;
    .locals 8

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lcom/rscja/deviceapi/a$b;->a(Lcom/rscja/deviceapi/a$b;)B

    move-result v0

    invoke-static {p2}, Lcom/rscja/deviceapi/a$b;->a(Lcom/rscja/deviceapi/a$b;)B

    move-result v1

    invoke-static {p3}, Lcom/rscja/deviceapi/a$b;->a(Lcom/rscja/deviceapi/a$b;)B

    move-result v2

    invoke-static {p4}, Lcom/rscja/deviceapi/a$b;->a(Lcom/rscja/deviceapi/a$b;)B

    move-result v3

    invoke-static {p5}, Lcom/rscja/deviceapi/a$b;->a(Lcom/rscja/deviceapi/a$b;)B

    move-result v4

    const/4 v5, 0x3

    new-array v5, v5, [B

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-byte v7, v5, v6

    const/4 v6, 0x1

    const/4 v7, 0x0

    aput-byte v7, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x0

    aput-byte v7, v5, v6

    const/4 v6, 0x1

    if-ne v0, v6, :cond_0

    const/4 v0, 0x0

    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0xc

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    const/4 v0, 0x1

    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0x2

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    :goto_0
    const/4 v0, 0x1

    if-ne v1, v0, :cond_4

    const/4 v0, 0x0

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit16 v1, v1, 0x80

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    :goto_1
    const/4 v0, 0x1

    if-ne v2, v0, :cond_8

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit16 v1, v1, 0xc0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x20

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    :goto_2
    const/4 v0, 0x1

    if-ne v3, v0, :cond_c

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x30

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    :goto_3
    const/4 v0, 0x1

    if-ne v4, v0, :cond_10

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0xc

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x2

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    :goto_4
    array-length v0, v5

    invoke-static {v5, v0}, Lcom/rscja/utility/a;->a([BI)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v6, 0x2

    if-ne v0, v6, :cond_1

    const/4 v0, 0x0

    :try_start_1
    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0xc

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    const/4 v0, 0x1

    aget-byte v6, v5, v0

    int-to-byte v6, v6

    aput-byte v6, v5, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    const/4 v6, 0x3

    if-ne v0, v6, :cond_2

    const/4 v0, 0x0

    :try_start_2
    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0xc

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    const/4 v0, 0x1

    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0x3

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    goto :goto_0

    :cond_2
    const/4 v6, 0x4

    if-ne v0, v6, :cond_3

    const/4 v0, 0x0

    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0xc

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    const/4 v0, 0x1

    aget-byte v6, v5, v0

    or-int/lit8 v6, v6, 0x1

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    goto/16 :goto_0

    :cond_3
    const/4 v0, 0x0

    aget-byte v6, v5, v0

    and-int/lit8 v6, v6, 0x3

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    const/4 v0, 0x1

    aget-byte v6, v5, v0

    and-int/lit16 v6, v6, 0xfc

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    goto/16 :goto_0

    :cond_4
    const/4 v0, 0x2

    if-ne v1, v0, :cond_5

    const/4 v0, 0x0

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_1

    :cond_5
    const/4 v0, 0x3

    if-ne v1, v0, :cond_6

    const/4 v0, 0x0

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit16 v1, v1, 0xc0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_1

    :cond_6
    const/4 v0, 0x4

    if-ne v1, v0, :cond_7

    const/4 v0, 0x0

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x40

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_1

    :cond_7
    const/4 v0, 0x0

    aget-byte v1, v5, v0

    and-int/lit8 v1, v1, 0xc

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    and-int/lit8 v1, v1, 0x3f

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_1

    :cond_8
    const/4 v0, 0x2

    if-ne v2, v0, :cond_9

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit16 v1, v1, 0xc0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_2

    :cond_9
    const/4 v0, 0x3

    if-ne v2, v0, :cond_a

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit16 v1, v1, 0xc0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x30

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_2

    :cond_a
    const/4 v0, 0x4

    if-ne v2, v0, :cond_b

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit16 v1, v1, 0xc0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x10

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_2

    :cond_b
    const/4 v0, 0x1

    aget-byte v1, v5, v0

    and-int/lit8 v1, v1, 0x3f

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    and-int/lit16 v1, v1, 0xcf

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_2

    :cond_c
    const/4 v0, 0x2

    if-ne v3, v0, :cond_d

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x30

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_3

    :cond_d
    const/4 v0, 0x3

    if-ne v3, v0, :cond_e

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x30

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0xc

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_3

    :cond_e
    const/4 v0, 0x4

    if-ne v3, v0, :cond_f

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x30

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x4

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_3

    :cond_f
    const/4 v0, 0x1

    aget-byte v1, v5, v0

    and-int/lit16 v1, v1, 0xcf

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    and-int/lit16 v1, v1, 0xf3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_3

    :cond_10
    const/4 v0, 0x2

    if-ne v4, v0, :cond_11

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0xc

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_4

    :cond_11
    const/4 v0, 0x3

    if-ne v4, v0, :cond_12

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0xc

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_4

    :cond_12
    const/4 v0, 0x4

    if-ne v4, v0, :cond_13

    const/4 v0, 0x1

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0xc

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    or-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    goto/16 :goto_4

    :cond_13
    const/4 v0, 0x1

    aget-byte v1, v5, v0

    and-int/lit16 v1, v1, 0xf3

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    const/4 v0, 0x2

    aget-byte v1, v5, v0

    and-int/lit16 v1, v1, 0xfc

    int-to-byte v1, v1

    aput-byte v1, v5, v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_4
.end method

.method public declared-synchronized a(I)Z
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v0

    int-to-char v1, p1

    invoke-virtual {v0, v1}, Lcom/rscja/deviceapi/DeviceAPI;->UHFSetPower(C)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v1, "RFIDWithUHF"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "setPower() err :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(II)Z
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v0

    int-to-char v1, p1

    int-to-char v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/rscja/deviceapi/DeviceAPI;->UHFInventory_EX(CC)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v1, "RFIDWithUHF"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "startInventory() err :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c()Z
    .locals 4

    const/4 v0, 0x1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v1

    iget-object v2, p0, Lcom/rscja/deviceapi/a;->a:Lcom/rscja/deviceapi/c;

    invoke-virtual {v2}, Lcom/rscja/deviceapi/c;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/rscja/deviceapi/DeviceAPI;->UHFInit(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v1

    iget-object v2, p0, Lcom/rscja/deviceapi/a;->a:Lcom/rscja/deviceapi/c;

    invoke-virtual {v2}, Lcom/rscja/deviceapi/c;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/rscja/deviceapi/DeviceAPI;->UHFOpenAndConnect(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/rscja/deviceapi/a;->a(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v0, "RFIDWithUHF"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "init() err UHFOpenAndConnect result:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const-string v0, "RFIDWithUHF"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "init() err UHFInit result:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized d()Z
    .locals 5

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rscja/deviceapi/DeviceAPI;->UHFCloseAndDisconnect()V

    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v1

    iget-object v2, p0, Lcom/rscja/deviceapi/a;->a:Lcom/rscja/deviceapi/c;

    invoke-virtual {v2}, Lcom/rscja/deviceapi/c;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/rscja/deviceapi/DeviceAPI;->UHFFree(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rscja/deviceapi/a;->a(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v2, "RFIDWithUHF"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "free() err UHFFree result:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized e()I
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rscja/deviceapi/DeviceAPI;->UHFGetPower()[C

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    aget-char v1, v0, v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    aget-char v0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v1, "RFIDWithUHF"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getPower() err :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    aget-char v0, v0, v3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, -0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized f()Z
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/rscja/deviceapi/a;->a()Lcom/rscja/deviceapi/DeviceAPI;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rscja/deviceapi/DeviceAPI;->UHFStopGet()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v1, "RFIDWithUHF"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "stopInventory() err :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
