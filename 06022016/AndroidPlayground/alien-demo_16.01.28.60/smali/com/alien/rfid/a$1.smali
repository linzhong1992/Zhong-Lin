.class Lcom/alien/rfid/a$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/rfid/a;->inventory(Lcom/alien/rfid/RFIDCallback;Lcom/alien/rfid/Mask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/alien/rfid/RFIDReader;

.field final synthetic b:Lcom/alien/rfid/RFIDCallback;

.field final synthetic c:Lcom/alien/rfid/a;


# direct methods
.method constructor <init>(Lcom/alien/rfid/a;Lcom/alien/rfid/RFIDReader;Lcom/alien/rfid/RFIDCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    iput-object p2, p0, Lcom/alien/rfid/a$1;->a:Lcom/alien/rfid/RFIDReader;

    iput-object p3, p0, Lcom/alien/rfid/a$1;->b:Lcom/alien/rfid/RFIDCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v0}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/a;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v0}, Lcom/alien/rfid/a;->c(Lcom/alien/rfid/a;)Lcom/rscja/deviceapi/a;

    move-result-object v2

    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v0}, Lcom/alien/rfid/a;->b(Lcom/alien/rfid/a;)I

    move-result v0

    if-lez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    iget-object v3, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v3}, Lcom/alien/rfid/a;->b(Lcom/alien/rfid/a;)I

    move-result v3

    invoke-virtual {v2, v0, v3}, Lcom/rscja/deviceapi/a;->a(II)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/alien/rfid/ALRH450CusAPI$b;

    invoke-direct {v0}, Lcom/alien/rfid/ALRH450CusAPI$b;-><init>()V

    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v2}, Lcom/alien/rfid/a;->d(Lcom/alien/rfid/a;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v2}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/a;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v2}, Lcom/alien/rfid/a;->e(Lcom/alien/rfid/a;)Lcom/alien/rfid/ALRH450CusAPI;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/alien/rfid/ALRH450CusAPI;->b(Lcom/alien/rfid/ALRH450CusAPI$b;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Lcom/alien/rfid/Tag;

    iget-object v3, p0, Lcom/alien/rfid/a$1;->a:Lcom/alien/rfid/RFIDReader;

    iget-object v4, v0, Lcom/alien/rfid/ALRH450CusAPI$b;->a:Ljava/lang/String;

    iget-wide v6, v0, Lcom/alien/rfid/ALRH450CusAPI$b;->c:D

    invoke-direct {v2, v3, v4, v6, v7}, Lcom/alien/rfid/Tag;-><init>(Lcom/alien/rfid/RFIDReader;Ljava/lang/String;D)V

    iget-object v3, p0, Lcom/alien/rfid/a$1;->b:Lcom/alien/rfid/RFIDCallback;

    invoke-interface {v3, v2}, Lcom/alien/rfid/RFIDCallback;->onTagRead(Lcom/alien/rfid/Tag;)V

    :cond_1
    iget-object v2, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v2}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/a;)Z

    move-result v2

    if-nez v2, :cond_0

    :try_start_0
    iget-object v2, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v2}, Lcom/alien/rfid/a;->f(Lcom/alien/rfid/a;)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v0}, Lcom/alien/rfid/a;->c(Lcom/alien/rfid/a;)Lcom/rscja/deviceapi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rscja/deviceapi/a;->f()Z

    :cond_4
    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v0}, Lcom/alien/rfid/a;->g(Lcom/alien/rfid/a;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/a;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;

    iget-object v0, p0, Lcom/alien/rfid/a$1;->c:Lcom/alien/rfid/a;

    invoke-static {v0, v1}, Lcom/alien/rfid/a;->a(Lcom/alien/rfid/a;Z)Z

    return-void
.end method
