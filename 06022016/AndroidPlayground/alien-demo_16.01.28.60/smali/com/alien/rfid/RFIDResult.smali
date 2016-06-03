.class public Lcom/alien/rfid/RFIDResult;
.super Ljava/lang/Object;


# instance fields
.field private a:Z

.field private b:Ljava/lang/Object;


# direct methods
.method constructor <init>(Z)V
    .locals 1
    .param p1, "success"    # Z

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/alien/rfid/RFIDResult;-><init>(ZLjava/lang/Object;)V

    return-void
.end method

.method constructor <init>(ZLjava/lang/Object;)V
    .locals 0
    .param p1, "success"    # Z
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/alien/rfid/RFIDResult;->a:Z

    iput-object p2, p0, Lcom/alien/rfid/RFIDResult;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/alien/rfid/RFIDResult;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public getError()I
    .locals 1

    iget-boolean v0, p0, Lcom/alien/rfid/RFIDResult;->a:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isSuccess()Z
    .locals 1

    iget-boolean v0, p0, Lcom/alien/rfid/RFIDResult;->a:Z

    return v0
.end method
