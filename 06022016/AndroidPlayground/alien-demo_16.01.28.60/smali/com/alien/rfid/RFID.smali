.class public Lcom/alien/rfid/RFID;
.super Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static open()Lcom/alien/rfid/RFIDReader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    invoke-static {}, Lcom/alien/rfid/a;->a()Lcom/alien/rfid/RFIDReader;

    move-result-object v0

    return-object v0
.end method
