.class public Lcom/alien/rfid/RFIDBusyException;
.super Lcom/alien/rfid/ReaderException;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    return-void
.end method
