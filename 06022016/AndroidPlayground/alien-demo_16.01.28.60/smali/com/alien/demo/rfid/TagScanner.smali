.class public Lcom/alien/demo/rfid/TagScanner;
.super Ljava/lang/Object;
.source "TagScanner.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Scanner"

.field private static reader:Lcom/alien/rfid/RFIDReader;


# instance fields
.field private filter:Lcom/alien/demo/rfid/TagMask;

.field private listener:Lcom/alien/rfid/RFIDCallback;


# direct methods
.method public constructor <init>(Lcom/alien/rfid/RFIDCallback;)V
    .locals 4
    .param p1, "listener"    # Lcom/alien/rfid/RFIDCallback;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v1, Lcom/alien/demo/rfid/TagMask;

    invoke-direct {v1}, Lcom/alien/demo/rfid/TagMask;-><init>()V

    iput-object v1, p0, Lcom/alien/demo/rfid/TagScanner;->filter:Lcom/alien/demo/rfid/TagMask;

    .line 54
    :try_start_0
    iput-object p1, p0, Lcom/alien/demo/rfid/TagScanner;->listener:Lcom/alien/rfid/RFIDCallback;

    .line 55
    invoke-static {}, Lcom/alien/demo/rfid/TagScanner;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Scanner"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error init reader: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static declared-synchronized deinit()V
    .locals 2

    .prologue
    .line 45
    const-class v1, Lcom/alien/demo/rfid/TagScanner;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 50
    :goto_0
    monitor-exit v1

    return-void

    .line 48
    :cond_0
    :try_start_1
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v0}, Lcom/alien/rfid/RFIDReader;->close()V

    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getMask()Lcom/alien/rfid/Mask;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 131
    iget-object v6, p0, Lcom/alien/demo/rfid/TagScanner;->filter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v6}, Lcom/alien/demo/rfid/TagMask;->getMaskInfos()[Lcom/alien/demo/rfid/TagMask$MaskInfo;

    move-result-object v4

    .line 132
    .local v4, "infos":[Lcom/alien/demo/rfid/TagMask$MaskInfo;
    iget-object v6, p0, Lcom/alien/demo/rfid/TagScanner;->filter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v6}, Lcom/alien/demo/rfid/TagMask;->getMaskedBank()I

    move-result v3

    .line 134
    .local v3, "filteredBank":I
    iget-object v6, p0, Lcom/alien/demo/rfid/TagScanner;->filter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v6}, Lcom/alien/demo/rfid/TagMask;->getMaskedBank()I

    move-result v6

    invoke-static {v6}, Lcom/alien/rfid/Bank;->fromValue(I)Lcom/alien/rfid/Bank;

    move-result-object v0

    .line 135
    .local v0, "bank":Lcom/alien/rfid/Bank;
    aget-object v6, v4, v3

    iget v2, v6, Lcom/alien/demo/rfid/TagMask$MaskInfo;->ptr:I

    .line 136
    .local v2, "bitOffset":I
    aget-object v6, v4, v3

    iget v1, v6, Lcom/alien/demo/rfid/TagMask$MaskInfo;->len:I

    .line 137
    .local v1, "bitLength":I
    aget-object v6, v4, v3

    iget-object v5, v6, Lcom/alien/demo/rfid/TagMask$MaskInfo;->data:Ljava/lang/String;

    .line 139
    .local v5, "pattern":Ljava/lang/String;
    new-instance v6, Lcom/alien/rfid/Mask;

    invoke-direct {v6, v0, v2, v1, v5}, Lcom/alien/rfid/Mask;-><init>(Lcom/alien/rfid/Bank;IILjava/lang/String;)V

    return-object v6
.end method

.method public static getRFIDReader()Lcom/alien/rfid/RFIDReader;
    .locals 4

    .prologue
    .line 69
    :try_start_0
    invoke-static {}, Lcom/alien/rfid/RFID;->open()Lcom/alien/rfid/RFIDReader;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-object v1

    .line 71
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 72
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Scanner"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error getting reader: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 75
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 38
    const-class v1, Lcom/alien/demo/rfid/TagScanner;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    if-nez v0, :cond_0

    .line 39
    invoke-static {}, Lcom/alien/rfid/RFID;->open()Lcom/alien/rfid/RFIDReader;

    move-result-object v0

    sput-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    .line 40
    const-string v0, "AlienRFID-Scanner"

    const-string v2, "Reader initialized successfully"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :cond_0
    monitor-exit v1

    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public getFilter()Lcom/alien/demo/rfid/TagMask;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/alien/demo/rfid/TagScanner;->filter:Lcom/alien/demo/rfid/TagMask;

    return-object v0
.end method

.method public isInitSuccess()Z
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isScanning()Z
    .locals 1

    .prologue
    .line 127
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v0}, Lcom/alien/rfid/RFIDReader;->isRunning()Z

    move-result v0

    return v0
.end method

.method public lock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 3
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 151
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/LockType;->LOCK:Lcom/alien/rfid/LockType;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2, p2}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public permaLock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 3
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 159
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/LockType;->PERMALOCK:Lcom/alien/rfid/LockType;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2, p2}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public permaUnlock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 3
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 163
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/LockType;->PERMAUNLOCK:Lcom/alien/rfid/LockType;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2, p2}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public read(Lcom/alien/rfid/Bank;IILjava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordOffset"    # I
    .param p3, "wordCount"    # I
    .param p4, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 143
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v4

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public scan()V
    .locals 4

    .prologue
    .line 84
    :try_start_0
    iget-object v1, p0, Lcom/alien/demo/rfid/TagScanner;->listener:Lcom/alien/rfid/RFIDCallback;

    if-eqz v1, :cond_0

    .line 85
    sget-object v1, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    iget-object v2, p0, Lcom/alien/demo/rfid/TagScanner;->listener:Lcom/alien/rfid/RFIDCallback;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/alien/rfid/RFIDReader;->inventory(Lcom/alien/rfid/RFIDCallback;Lcom/alien/rfid/Mask;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Scanner"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error when scanning tags: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public scanSingle()Lcom/alien/rfid/Tag;
    .locals 5

    .prologue
    .line 116
    :try_start_0
    sget-object v2, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 117
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/alien/rfid/Tag;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :goto_0
    return-object v2

    .line 119
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "AlienRFID-Scanner"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error when scanning single tag: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 123
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setDefaultAccessPassword(Ljava/lang/String;)V
    .locals 1
    .param p1, "accessPassword"    # Ljava/lang/String;

    .prologue
    .line 79
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v0, p1}, Lcom/alien/rfid/RFIDReader;->setAccessPwd(Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public setListener(Lcom/alien/rfid/RFIDCallback;)V
    .locals 0
    .param p1, "listener"    # Lcom/alien/rfid/RFIDCallback;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/alien/demo/rfid/TagScanner;->listener:Lcom/alien/rfid/RFIDCallback;

    .line 65
    return-void
.end method

.method public stop(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 106
    const-string v0, "Stop..."

    const-string v1, "Stop failed"

    new-instance v2, Lcom/alien/demo/rfid/TagScanner$1;

    invoke-direct {v2, p0}, Lcom/alien/demo/rfid/TagScanner$1;-><init>(Lcom/alien/demo/rfid/TagScanner;)V

    invoke-static {p1, v0, v1, v2}, Lcom/alien/demo/uibase/TaskRunner;->runTask(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 112
    return-void
.end method

.method public stop()Z
    .locals 4

    .prologue
    .line 95
    :try_start_0
    sget-object v1, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDReader;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    const/4 v1, 0x1

    .line 102
    :goto_0
    return v1

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Scanner"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error when stop tags: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 102
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public unlock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 3
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 155
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/LockType;->UNLOCK:Lcom/alien/rfid/LockType;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2, p2}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public write(Lcom/alien/rfid/Bank;ILjava/lang/String;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordOffset"    # I
    .param p3, "data"    # Ljava/lang/String;
    .param p4, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 147
    sget-object v0, Lcom/alien/demo/rfid/TagScanner;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/demo/rfid/TagScanner;->getMask()Lcom/alien/rfid/Mask;

    move-result-object v4

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method
