.class Lcom/alien/rfid/a;
.super Lcom/alien/rfid/RFIDReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/rfid/a$2;
    }
.end annotation


# static fields
.field private static h:Lcom/alien/rfid/a;


# instance fields
.field private a:I

.field private b:I

.field private c:Lcom/rscja/deviceapi/a;

.field private d:Lcom/alien/rfid/ALRH450CusAPI;

.field private e:Z

.field private f:Z

.field private g:Ljava/util/concurrent/CountDownLatch;

.field private i:Landroid/net/LocalServerSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/alien/rfid/a;->h:Lcom/alien/rfid/a;

    return-void
.end method

.method private constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/alien/rfid/RFIDReader;-><init>()V

    const/16 v0, 0xa

    iput v0, p0, Lcom/alien/rfid/a;->a:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/alien/rfid/a;->b:I

    invoke-direct {p0}, Lcom/alien/rfid/a;->d()V

    return-void
.end method

.method public static declared-synchronized a()Lcom/alien/rfid/RFIDReader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    const-class v1, Lcom/alien/rfid/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/alien/rfid/a;->h:Lcom/alien/rfid/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/alien/rfid/a;

    invoke-direct {v0}, Lcom/alien/rfid/a;-><init>()V

    sput-object v0, Lcom/alien/rfid/a;->h:Lcom/alien/rfid/a;

    :cond_0
    sget-object v0, Lcom/alien/rfid/a;->h:Lcom/alien/rfid/a;

    invoke-direct {v0}, Lcom/alien/rfid/a;->d()V

    sget-object v0, Lcom/alien/rfid/a;->h:Lcom/alien/rfid/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private declared-synchronized a(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/Mask;Ljava/lang/String;Lcom/rscja/deviceapi/a$b;)Lcom/alien/rfid/RFIDResult;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v1

    if-gt v0, v1, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Mask data is shorter than the bit length"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    invoke-direct {p0, p1, p4}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/LockFields;Lcom/rscja/deviceapi/a$b;)Ljava/lang/String;

    move-result-object v6

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBank()Lcom/alien/rfid/Bank;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v2

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBitPointer()I

    move-result v3

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v5

    move-object v1, p3

    invoke-virtual/range {v0 .. v6}, Lcom/alien/rfid/ALRH450CusAPI;->lockUnlockFields(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;)I

    move-result v0

    new-instance v1, Lcom/alien/rfid/RFIDResult;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-direct {v1, v0}, Lcom/alien/rfid/RFIDResult;-><init>(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private declared-synchronized a(Lcom/alien/rfid/Bank;)Lcom/rscja/deviceapi/a$a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/InvalidParamException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    if-ne p1, v0, :cond_0

    sget-object v0, Lcom/rscja/deviceapi/a$a;->b:Lcom/rscja/deviceapi/a$a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    sget-object v0, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/rscja/deviceapi/a$a;->c:Lcom/rscja/deviceapi/a$a;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    if-ne p1, v0, :cond_2

    sget-object v0, Lcom/rscja/deviceapi/a$a;->a:Lcom/rscja/deviceapi/a$a;

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    if-ne p1, v0, :cond_3

    sget-object v0, Lcom/rscja/deviceapi/a$a;->d:Lcom/rscja/deviceapi/a$a;

    goto :goto_0

    :cond_3
    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Invalid Memory Bank"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized a(Lcom/alien/rfid/LockFields;Lcom/rscja/deviceapi/a$b;)Ljava/lang/String;
    .locals 6

    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    sget-object v2, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    sget-object v3, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    sget-object v4, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    sget-object v5, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    invoke-virtual {p1}, Lcom/alien/rfid/LockFields;->getFieldBitmap()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    move-object v1, p2

    :cond_0
    invoke-virtual {p1}, Lcom/alien/rfid/LockFields;->getFieldBitmap()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    move-object v2, p2

    :cond_1
    invoke-virtual {p1}, Lcom/alien/rfid/LockFields;->getFieldBitmap()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_2

    move-object v3, p2

    :cond_2
    invoke-virtual {p1}, Lcom/alien/rfid/LockFields;->getFieldBitmap()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_3

    move-object v5, p2

    :cond_3
    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    invoke-virtual/range {v0 .. v5}, Lcom/rscja/deviceapi/a;->a(Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;Lcom/rscja/deviceapi/a$b;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic a(Lcom/alien/rfid/a;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iput-object p1, p0, Lcom/alien/rfid/a;->g:Ljava/util/concurrent/CountDownLatch;

    return-object p1
.end method

.method private declared-synchronized a(Lcom/alien/rfid/Mask;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    const/4 v0, 0x0

    monitor-enter p0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/4 v2, 0x0

    const-string v3, ""

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/alien/rfid/ALRH450CusAPI;->setFilter(IILjava/lang/String;I)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {p1}, Lcom/alien/rfid/Mask;->getBank()Lcom/alien/rfid/Bank;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v1

    invoke-virtual {p1}, Lcom/alien/rfid/Mask;->getBitPointer()I

    move-result v2

    invoke-virtual {p1}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/alien/rfid/ALRH450CusAPI;->setFilter(IILjava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error setting mask"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    monitor-exit p0

    return-void
.end method

.method static synthetic a(Lcom/alien/rfid/a;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/alien/rfid/a;->f:Z

    return v0
.end method

.method static synthetic a(Lcom/alien/rfid/a;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/alien/rfid/a;->e:Z

    return p1
.end method

.method static synthetic b(Lcom/alien/rfid/a;)I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/a;->b:I

    return v0
.end method

.method private b()V
    .locals 2

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->setInvMaxTry(I)V

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->setInvReadWaitTime(I)V

    return-void
.end method

.method static synthetic c(Lcom/alien/rfid/a;)Lcom/rscja/deviceapi/a;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    return-object v0
.end method

.method private c()V
    .locals 2

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->setInvMaxTry(I)V

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->setInvReadWaitTime(I)V

    return-void
.end method

.method private declared-synchronized d()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    new-instance v0, Landroid/net/LocalServerSocket;

    const-string v1, "alienapi"

    invoke-direct {v0, v1}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/alien/rfid/a;->i:Landroid/net/LocalServerSocket;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI;

    invoke-direct {v0}, Lcom/alien/rfid/ALRH450CusAPI;-><init>()V

    iput-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-static {}, Lcom/rscja/deviceapi/a;->b()Lcom/rscja/deviceapi/a;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    invoke-virtual {v0}, Lcom/rscja/deviceapi/a;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    invoke-virtual {v0}, Lcom/rscja/deviceapi/a;->f()Z

    invoke-direct {p0}, Lcom/alien/rfid/a;->b()V

    const/16 v0, 0x8

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->getGen2Parameter([I)I

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error reading Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catch_0
    move-exception v0

    :try_start_3
    new-instance v1, Lcom/alien/rfid/ReaderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error initializing RFIDReaderH450: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :catch_1
    move-exception v0

    :try_start_4
    new-instance v0, Lcom/alien/rfid/RFIDBusyException;

    const-string v1, "RFID is in use by other process"

    invoke-direct {v0, v1}, Lcom/alien/rfid/RFIDBusyException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_2
    :try_start_5
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    sget-object v2, Lcom/alien/rfid/ALRH450CusAPI;->a:Lcom/alien/rfid/ALRH450CusAPI$a;

    invoke-virtual {v1, v0, v2}, Lcom/alien/rfid/ALRH450CusAPI;->a([ILcom/alien/rfid/ALRH450CusAPI$a;)I

    move-result v0

    iput v0, p0, Lcom/alien/rfid/a;->b:I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0
.end method

.method static synthetic d(Lcom/alien/rfid/a;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/alien/rfid/a;->e:Z

    return v0
.end method

.method static synthetic e(Lcom/alien/rfid/a;)Lcom/alien/rfid/ALRH450CusAPI;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    return-object v0
.end method

.method private e()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/alien/rfid/a;->e:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/alien/rfid/RFIDBusyException;

    const-string v1, "Reader is busy!"

    invoke-direct {v0, v1}, Lcom/alien/rfid/RFIDBusyException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method static synthetic f(Lcom/alien/rfid/a;)I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/a;->a:I

    return v0
.end method

.method static synthetic g(Lcom/alien/rfid/a;)Ljava/util/concurrent/CountDownLatch;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/a;->g:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/alien/rfid/a;->i:Landroid/net/LocalServerSocket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v0, p0, Lcom/alien/rfid/a;->i:Landroid/net/LocalServerSocket;

    invoke-virtual {v0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/alien/rfid/a;->i:Landroid/net/LocalServerSocket;

    :cond_0
    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    invoke-virtual {v0}, Lcom/rscja/deviceapi/a;->d()Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;
    .locals 6
    .param p1, "type"    # Lcom/alien/rfid/RFIDInfo;

    .prologue
    const/high16 v5, 0xff0000

    const v4, 0xff00

    const/4 v3, -0x1

    const/4 v0, 0x0

    sget-object v1, Lcom/alien/rfid/a$2;->a:[I

    invoke-virtual {p1}, Lcom/alien/rfid/RFIDInfo;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    return-object v0

    :pswitch_0
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1}, Lcom/alien/rfid/ALRH450CusAPI;->getHardwareVersion()I

    move-result v1

    if-eq v1, v3, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/lit16 v2, v1, 0xff

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int v2, v1, v4

    shr-int/lit8 v2, v2, 0x8

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/2addr v1, v5

    shr-int/lit8 v1, v1, 0x10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1}, Lcom/alien/rfid/ALRH450CusAPI;->getFirmwareVersion()I

    move-result v1

    if-eq v1, v3, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/lit16 v2, v1, 0xff

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int v2, v1, v4

    shr-int/lit8 v2, v2, 0x8

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/2addr v1, v5

    shr-int/lit8 v1, v1, 0x10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1}, Lcom/alien/rfid/ALRH450CusAPI;->getModuleId()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_3
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1}, Lcom/alien/rfid/ALRH450CusAPI;->getRegion()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "China 1"

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "China 2"

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "Europe"

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "USA"

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "Korea"

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "Japan"

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "Brazil"

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "WR1"

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x4 -> :sswitch_2
        0x8 -> :sswitch_3
        0x16 -> :sswitch_4
        0x32 -> :sswitch_5
        0x33 -> :sswitch_6
        0x34 -> :sswitch_7
    .end sparse-switch
.end method

.method public declared-synchronized getPower()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    invoke-virtual {v0}, Lcom/rscja/deviceapi/a;->e()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getQ()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/alien/rfid/a;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSession()Lcom/alien/rfid/Session;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    const/16 v0, 0x8

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->getGen2Parameter([I)I

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error reading Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    sget-object v2, Lcom/alien/rfid/ALRH450CusAPI;->d:Lcom/alien/rfid/ALRH450CusAPI$a;

    invoke-virtual {v1, v0, v2}, Lcom/alien/rfid/ALRH450CusAPI;->a([ILcom/alien/rfid/ALRH450CusAPI$a;)I

    move-result v0

    invoke-static {v0}, Lcom/alien/rfid/Session;->fromValue(I)Lcom/alien/rfid/Session;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized getTarget()Lcom/alien/rfid/Target;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    const/16 v0, 0x8

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->getGen2Parameter([I)I

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error reading Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    sget-object v2, Lcom/alien/rfid/ALRH450CusAPI;->e:Lcom/alien/rfid/ALRH450CusAPI$a;

    invoke-virtual {v1, v0, v2}, Lcom/alien/rfid/ALRH450CusAPI;->a([ILcom/alien/rfid/ALRH450CusAPI$a;)I

    move-result v0

    invoke-static {v0}, Lcom/alien/rfid/Target;->fromValue(I)Lcom/alien/rfid/Target;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized inventory(Lcom/alien/rfid/RFIDCallback;Lcom/alien/rfid/Mask;)V
    .locals 2
    .param p1, "callback"    # Lcom/alien/rfid/RFIDCallback;
    .param p2, "mask"    # Lcom/alien/rfid/Mask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "RFID is not initialized!"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/alien/rfid/a;->e:Z

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/alien/rfid/a;->g:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0, p2}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/Mask;)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/alien/rfid/a$1;

    invoke-direct {v1, p0, p0, p1}, Lcom/alien/rfid/a$1;-><init>(Lcom/alien/rfid/a;Lcom/alien/rfid/RFIDReader;Lcom/alien/rfid/RFIDCallback;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method

.method public isRunning()Z
    .locals 1

    iget-boolean v0, p0, Lcom/alien/rfid/a;->e:Z

    return v0
.end method

.method public declared-synchronized kill(Ljava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "killPassword"    # Ljava/lang/String;
    .param p2, "mask"    # Lcom/alien/rfid/Mask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Mask data is shorter than the bit length"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBank()Lcom/alien/rfid/Bank;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v2

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBitPointer()I

    move-result v3

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v5

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/ALRH450CusAPI;->killTag(Ljava/lang/String;IILjava/lang/String;I)I

    move-result v0

    new-instance v1, Lcom/alien/rfid/RFIDResult;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-direct {v1, v0}, Lcom/alien/rfid/RFIDResult;-><init>(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 2
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "lockType"    # Lcom/alien/rfid/LockType;
    .param p3, "mask"    # Lcom/alien/rfid/Mask;
    .param p4, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/alien/rfid/a$2;->b:[I

    invoke-virtual {p2}, Lcom/alien/rfid/LockType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Invalid lock type"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_0
    :try_start_1
    sget-object v0, Lcom/rscja/deviceapi/a$b;->b:Lcom/rscja/deviceapi/a$b;

    :goto_0
    invoke-direct {p0, p1, p3, p4, v0}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/Mask;Ljava/lang/String;Lcom/rscja/deviceapi/a$b;)Lcom/alien/rfid/RFIDResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :pswitch_1
    :try_start_2
    sget-object v0, Lcom/rscja/deviceapi/a$b;->c:Lcom/rscja/deviceapi/a$b;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/rscja/deviceapi/a$b;->d:Lcom/rscja/deviceapi/a$b;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lcom/rscja/deviceapi/a$b;->e:Lcom/rscja/deviceapi/a$b;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public declared-synchronized read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 9
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "wordCount"    # I
    .param p4, "mask"    # Lcom/alien/rfid/Mask;
    .param p5, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Mask data is shorter than the bit length"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/alien/rfid/a;->c()V

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBank()Lcom/alien/rfid/Bank;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v2

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBitPointer()I

    move-result v3

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v5

    invoke-virtual {p1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v6

    move-object v1, p5

    move v7, p2

    move v8, p3

    invoke-virtual/range {v0 .. v8}, Lcom/alien/rfid/ALRH450CusAPI;->readData(Ljava/lang/String;IILjava/lang/String;IIII)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_0
    new-instance v2, Lcom/alien/rfid/RFIDResult;

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-direct {v2, v0, v1}, Lcom/alien/rfid/RFIDResult;-><init>(ZLjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-direct {p0}, Lcom/alien/rfid/a;->b()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v2

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_3
    invoke-direct {p0}, Lcom/alien/rfid/a;->b()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_2
    move-object v1, v0

    goto :goto_0
.end method

.method public declared-synchronized read(Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .locals 8
    .param p1, "mask"    # Lcom/alien/rfid/Mask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    invoke-direct {p0, p1}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/Mask;)V

    new-instance v1, Lcom/alien/rfid/ALRH450CusAPI$b;

    invoke-direct {v1}, Lcom/alien/rfid/ALRH450CusAPI$b;-><init>()V

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->a(Lcom/alien/rfid/ALRH450CusAPI$b;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/alien/rfid/RFIDResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/alien/rfid/RFIDResult;-><init>(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lcom/alien/rfid/RFIDResult;

    const/4 v2, 0x1

    new-instance v3, Lcom/alien/rfid/Tag;

    iget-object v4, v1, Lcom/alien/rfid/ALRH450CusAPI$b;->a:Ljava/lang/String;

    iget-wide v6, v1, Lcom/alien/rfid/ALRH450CusAPI$b;->c:D

    invoke-direct {v3, p0, v4, v6, v7}, Lcom/alien/rfid/Tag;-><init>(Lcom/alien/rfid/RFIDReader;Ljava/lang/String;D)V

    invoke-direct {v0, v2, v3}, Lcom/alien/rfid/RFIDResult;-><init>(ZLjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPower(I)V
    .locals 2
    .param p1, "power"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    if-ltz p1, :cond_0

    const/16 v0, 0x1e

    if-le p1, v0, :cond_1

    :cond_0
    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Power value must be 1-30 dBm"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/alien/rfid/a;->c:Lcom/rscja/deviceapi/a;

    invoke-virtual {v0, p1}, Lcom/rscja/deviceapi/a;->a(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setQ(I)V
    .locals 3
    .param p1, "QValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    const/16 v0, 0xf

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    if-ltz p1, :cond_0

    if-le p1, v0, :cond_1

    :cond_0
    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Q value must be 0-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_1
    iput p1, p0, Lcom/alien/rfid/a;->b:I

    const/16 v0, 0x8

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->getGen2Parameter([I)I

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error reading Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    sget-object v2, Lcom/alien/rfid/ALRH450CusAPI;->a:Lcom/alien/rfid/ALRH450CusAPI$a;

    invoke-virtual {v1, v0, v2, p1}, Lcom/alien/rfid/ALRH450CusAPI;->a([ILcom/alien/rfid/ALRH450CusAPI$a;I)V

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->setGen2Parameter([I)I

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error setting Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setSession(Lcom/alien/rfid/Session;)V
    .locals 4
    .param p1, "session"    # Lcom/alien/rfid/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    const/16 v0, 0x8

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->getGen2Parameter([I)I

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error reading Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    sget-object v2, Lcom/alien/rfid/ALRH450CusAPI;->d:Lcom/alien/rfid/ALRH450CusAPI$a;

    invoke-virtual {p1}, Lcom/alien/rfid/Session;->getValue()I

    move-result v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/alien/rfid/ALRH450CusAPI;->a([ILcom/alien/rfid/ALRH450CusAPI$a;I)V

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->setGen2Parameter([I)I

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error setting Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setTarget(Lcom/alien/rfid/Target;)V
    .locals 4
    .param p1, "state"    # Lcom/alien/rfid/Target;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    const/16 v0, 0x8

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->getGen2Parameter([I)I

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error reading Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    sget-object v2, Lcom/alien/rfid/ALRH450CusAPI;->e:Lcom/alien/rfid/ALRH450CusAPI$a;

    invoke-virtual {p1}, Lcom/alien/rfid/Target;->getValue()I

    move-result v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/alien/rfid/ALRH450CusAPI;->a([ILcom/alien/rfid/ALRH450CusAPI$a;I)V

    iget-object v1, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {v1, v0}, Lcom/alien/rfid/ALRH450CusAPI;->setGen2Parameter([I)I

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "Error setting Gen2 params"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized stop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/alien/rfid/a;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/alien/rfid/a;->f:Z

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->enableInventory(Z)V

    iget-object v0, p0, Lcom/alien/rfid/a;->g:Ljava/util/concurrent/CountDownLatch;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_1
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/alien/rfid/a;->f:Z

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/alien/rfid/ALRH450CusAPI;->enableInventory(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public declared-synchronized write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 10
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "data"    # Ljava/lang/String;
    .param p4, "mask"    # Lcom/alien/rfid/Mask;
    .param p5, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/alien/rfid/a;->e()V

    invoke-direct {p0, p1}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/Bank;)Lcom/rscja/deviceapi/a$a;

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Mask data is shorter than the bit length!"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Data length must be in WORD units"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :try_start_2
    invoke-direct {p0}, Lcom/alien/rfid/a;->c()V

    iget-object v0, p0, Lcom/alien/rfid/a;->d:Lcom/alien/rfid/ALRH450CusAPI;

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBank()Lcom/alien/rfid/Bank;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v2

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBitPointer()I

    move-result v3

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p4}, Lcom/alien/rfid/Mask;->getBitLength()I

    move-result v5

    invoke-virtual {p1}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v6

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    div-int/lit8 v8, v1, 0x4

    move-object v1, p5

    move v7, p2

    move-object v9, p3

    invoke-virtual/range {v0 .. v9}, Lcom/alien/rfid/ALRH450CusAPI;->writeData(Ljava/lang/String;IILjava/lang/String;IIIILjava/lang/String;)I

    move-result v0

    new-instance v1, Lcom/alien/rfid/RFIDResult;

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    invoke-direct {v1, v0}, Lcom/alien/rfid/RFIDResult;-><init>(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    invoke-direct {p0}, Lcom/alien/rfid/a;->b()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object v1

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-direct {p0}, Lcom/alien/rfid/a;->b()V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method
