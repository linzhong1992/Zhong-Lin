.class public Lcom/alien/rfid/Tag;
.super Ljava/lang/Object;


# instance fields
.field private a:Lcom/alien/rfid/RFIDReader;

.field private b:Ljava/lang/String;

.field private c:D


# direct methods
.method constructor <init>(Lcom/alien/rfid/RFIDReader;Ljava/lang/String;D)V
    .locals 1
    .param p1, "reader"    # Lcom/alien/rfid/RFIDReader;
    .param p2, "pcEPC"    # Ljava/lang/String;
    .param p3, "rssi"    # D

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    iput-object p2, p0, Lcom/alien/rfid/Tag;->b:Ljava/lang/String;

    iput-wide p3, p0, Lcom/alien/rfid/Tag;->c:D

    return-void
.end method

.method private a()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Lcom/alien/rfid/ReaderException;

    const-string v1, "epc is empty!!"

    invoke-direct {v0, v1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method private b()Lcom/alien/rfid/Mask;
    .locals 5

    :try_start_0
    invoke-virtual {p0}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v1

    new-instance v0, Lcom/alien/rfid/Mask;

    sget-object v2, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    const/16 v3, 0x20

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/alien/rfid/Mask;-><init>(Lcom/alien/rfid/Bank;IILjava/lang/String;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getEPC()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/alien/rfid/Tag;->b:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/alien/rfid/Tag;->b:Ljava/lang/String;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPC()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/alien/rfid/Tag;->b:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/alien/rfid/Tag;->b:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getRSSI()D
    .locals 2

    iget-wide v0, p0, Lcom/alien/rfid/Tag;->c:D

    return-wide v0
.end method

.method public kill(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 2
    .param p1, "killPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/alien/rfid/RFIDReader;->kill(Ljava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;)Lcom/alien/rfid/RFIDResult;
    .locals 2
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "lockType"    # Lcom/alien/rfid/LockType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 2
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "lockType"    # Lcom/alien/rfid/LockType;
    .param p3, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1, p3}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public read(Lcom/alien/rfid/Bank;II)Lcom/alien/rfid/RFIDResult;
    .locals 2
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "wordCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v1

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public read(Lcom/alien/rfid/Bank;IILjava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "wordCount"    # I
    .param p4, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v4

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public readAccessPwd()Lcom/alien/rfid/RFIDResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    const/4 v3, 0x2

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v2

    invoke-virtual {v0, v1, v3, v3, v2}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public readKillPwd()Lcom/alien/rfid/RFIDResult;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public readTID()Lcom/alien/rfid/RFIDResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    const/4 v2, 0x2

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "E2003411"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    const/4 v2, 0x5

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v1, "E2003412"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "E2003414"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    const/16 v2, 0xc

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    goto :goto_0

    :cond_3
    const-string v1, "E2003811"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    const/16 v2, 0x15

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    goto :goto_0

    :cond_4
    move v1, v2

    :goto_1
    iget-object v3, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v4, Lcom/alien/rfid/Bank;->TID:Lcom/alien/rfid/Bank;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v5

    invoke-virtual {v3, v4, v1, v2, v5}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v4

    if-nez v4, :cond_5

    new-instance v1, Lcom/alien/rfid/RFIDResult;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v0}, Lcom/alien/rfid/RFIDResult;-><init>(ZLjava/lang/Object;)V

    move-object v0, v1

    goto :goto_0

    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v1, 0x2

    move v1, v0

    move-object v0, v3

    goto :goto_1
.end method

.method public readUser()Lcom/alien/rfid/RFIDResult;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    const-string v0, ""

    move v1, v2

    :goto_0
    iget-object v3, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v4, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    const/4 v5, 0x2

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v6

    invoke-virtual {v3, v4, v1, v5, v6}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    new-instance v1, Lcom/alien/rfid/RFIDResult;

    if-eqz v2, :cond_1

    :goto_1
    invoke-direct {v1, v2, v0}, Lcom/alien/rfid/RFIDResult;-><init>(ZLjava/lang/Object;)V

    return-object v1

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v1, 0x2

    move v1, v0

    move-object v0, v3

    goto :goto_0
.end method

.method public write(Lcom/alien/rfid/Bank;ILjava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 2
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v1

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public write(Lcom/alien/rfid/Bank;ILjava/lang/String;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "data"    # Ljava/lang/String;
    .param p4, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v4

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public writeAccessPwd(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 4
    .param p1, "accessPwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    const/4 v2, 0x2

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public writeEPC(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 5
    .param p1, "EPC"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "EPC parameter value must be in WORD units."

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/alien/rfid/Tag;->getPC()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v2, v2, 0x4

    shl-int/lit8 v2, v2, 0x3

    and-int/lit8 v1, v1, 0x1

    or-int/2addr v1, v2

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    invoke-static {v1}, Lcom/rscja/utility/a;->a(B)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v2, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    const/4 v3, 0x1

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v2

    if-eqz v2, :cond_1

    iput-object v0, p0, Lcom/alien/rfid/Tag;->b:Ljava/lang/String;

    :cond_1
    return-object v1
.end method

.method public writeKillPwd(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 4
    .param p1, "killPwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    iget-object v0, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v1, Lcom/alien/rfid/Bank;->RESERVED:Lcom/alien/rfid/Bank;

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v3

    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public writeUser(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/alien/rfid/Tag;->a()V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    new-instance v0, Lcom/alien/rfid/InvalidParamException;

    const-string v1, "Invalid USER data. USER data must be word units"

    invoke-direct {v0, v1}, Lcom/alien/rfid/InvalidParamException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_3

    add-int/lit8 v1, v0, 0x8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v1, v2, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    :cond_1
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    div-int/lit8 v0, v0, 0x4

    iget-object v3, p0, Lcom/alien/rfid/Tag;->a:Lcom/alien/rfid/RFIDReader;

    sget-object v4, Lcom/alien/rfid/Bank;->USER:Lcom/alien/rfid/Bank;

    invoke-direct {p0}, Lcom/alien/rfid/Tag;->b()Lcom/alien/rfid/Mask;

    move-result-object v5

    invoke-virtual {v3, v4, v0, v2, v5}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_2

    :goto_1
    return-object v0

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    new-instance v0, Lcom/alien/rfid/RFIDResult;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/alien/rfid/RFIDResult;-><init>(Z)V

    goto :goto_1
.end method
