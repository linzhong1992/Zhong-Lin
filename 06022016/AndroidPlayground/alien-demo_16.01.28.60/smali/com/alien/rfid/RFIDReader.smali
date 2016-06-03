.class public abstract Lcom/alien/rfid/RFIDReader;
.super Ljava/lang/Object;


# instance fields
.field private a:Lcom/alien/rfid/Mask;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/alien/rfid/Mask;->NONE:Lcom/alien/rfid/Mask;

    iput-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    const-string v0, "00000000"

    iput-object v0, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public abstract close()V
.end method

.method public getAccessPwd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;
.end method

.method public getInfo()Ljava/util/Map;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Lcom/alien/rfid/RFIDInfo;->HARDWARE_VER:Lcom/alien/rfid/RFIDInfo;

    sget-object v2, Lcom/alien/rfid/RFIDInfo;->HARDWARE_VER:Lcom/alien/rfid/RFIDInfo;

    invoke-virtual {p0, v2}, Lcom/alien/rfid/RFIDReader;->getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/alien/rfid/RFIDInfo;->FIRMWARE_VER:Lcom/alien/rfid/RFIDInfo;

    sget-object v2, Lcom/alien/rfid/RFIDInfo;->FIRMWARE_VER:Lcom/alien/rfid/RFIDInfo;

    invoke-virtual {p0, v2}, Lcom/alien/rfid/RFIDReader;->getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getMask()Lcom/alien/rfid/Mask;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    return-object v0
.end method

.method public abstract getPower()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract getQ()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract getSession()Lcom/alien/rfid/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract getTarget()Lcom/alien/rfid/Target;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public inventory(Lcom/alien/rfid/RFIDCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/alien/rfid/RFIDCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    invoke-virtual {p0, p1, v0}, Lcom/alien/rfid/RFIDReader;->inventory(Lcom/alien/rfid/RFIDCallback;Lcom/alien/rfid/Mask;)V

    return-void
.end method

.method public abstract inventory(Lcom/alien/rfid/RFIDCallback;Lcom/alien/rfid/Mask;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract isRunning()Z
.end method

.method public kill(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 1
    .param p1, "killPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    invoke-virtual {p0, p1, v0}, Lcom/alien/rfid/RFIDReader;->kill(Ljava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract kill(Ljava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
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
    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    iget-object v1, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .locals 1
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "lockType"    # Lcom/alien/rfid/LockType;
    .param p3, "mask"    # Lcom/alien/rfid/Mask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 1
    .param p1, "fields"    # Lcom/alien/rfid/LockFields;
    .param p2, "lockType"    # Lcom/alien/rfid/LockType;
    .param p3, "accessPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/alien/rfid/RFIDReader;->lock(Lcom/alien/rfid/LockFields;Lcom/alien/rfid/LockType;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public read()Lcom/alien/rfid/RFIDResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    iget-object v0, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    invoke-virtual {p0, v0}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public read(Lcom/alien/rfid/Bank;II)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "wordCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v4, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    iget-object v5, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "wordCount"    # I
    .param p4, "mask"    # Lcom/alien/rfid/Mask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v5, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
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
    iget-object v4, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->read(Lcom/alien/rfid/Bank;IILcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract read(Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public setAccessPwd(Ljava/lang/String;)V
    .locals 0
    .param p1, "accessPwd"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    return-void
.end method

.method public setMask(Lcom/alien/rfid/Mask;)V
    .locals 0
    .param p1, "mask"    # Lcom/alien/rfid/Mask;

    .prologue
    iput-object p1, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    return-void
.end method

.method public abstract setPower(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract setQ(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract setSession(Lcom/alien/rfid/Session;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract setTarget(Lcom/alien/rfid/Target;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public abstract stop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
.end method

.method public write(Lcom/alien/rfid/Bank;ILjava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v4, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    iget-object v5, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;)Lcom/alien/rfid/RFIDResult;
    .locals 6
    .param p1, "bank"    # Lcom/alien/rfid/Bank;
    .param p2, "wordPointer"    # I
    .param p3, "data"    # Ljava/lang/String;
    .param p4, "mask"    # Lcom/alien/rfid/Mask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    iget-object v5, p0, Lcom/alien/rfid/RFIDReader;->b:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation
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
    iget-object v4, p0, Lcom/alien/rfid/RFIDReader;->a:Lcom/alien/rfid/Mask;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alien/rfid/RFIDReader;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Lcom/alien/rfid/Mask;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v0

    return-object v0
.end method
