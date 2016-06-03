.class public Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
.super Lcom/alien/demo/uibase/BaseFragment;
.source "BasicAccessFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Basic Access"


# instance fields
.field private btnClearAll:Landroid/widget/Button;

.field private btnMask:Landroid/widget/Button;

.field private btnReadAPwd:Landroid/widget/ImageButton;

.field private btnReadAll:Landroid/widget/Button;

.field private btnReadEpc:Landroid/widget/ImageButton;

.field private btnReadKPwd:Landroid/widget/ImageButton;

.field private btnReadTid:Landroid/widget/ImageButton;

.field private btnReadUser:Landroid/widget/ImageButton;

.field private btnWriteAPwd:Landroid/widget/ImageButton;

.field private btnWriteEpc:Landroid/widget/ImageButton;

.field private btnWriteKPwd:Landroid/widget/ImageButton;

.field private btnWriteUser:Landroid/widget/ImageButton;

.field private context:Landroid/app/Activity;

.field private etAPwd:Landroid/widget/EditText;

.field private etEpc:Landroid/widget/EditText;

.field private etKPwd:Landroid/widget/EditText;

.field private etPassword:Landroid/widget/EditText;

.field private etTid:Landroid/widget/EditText;

.field private etUser:Landroid/widget/EditText;

.field private scanner:Lcom/alien/demo/rfid/TagScanner;

.field private tag:Lcom/alien/rfid/Tag;

.field private txtMaskEpc:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseFragment;-><init>()V

    .line 62
    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->configureMask()V

    return-void
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readAll()V

    return-void
.end method

.method static synthetic access$1000(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readEpc()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->writeEpc()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readTid()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readUser()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1500(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->writeUser()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->clearAll()V

    return-void
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readKPwd()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$600(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->writeKPwd()Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readAPwd()Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$900(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->writeAPwd()Z

    move-result v0

    return v0
.end method

.method private checkForTag()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 392
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    if-nez v0, :cond_0

    .line 393
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->scanSingle()Lcom/alien/rfid/Tag;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    .line 394
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    if-nez v0, :cond_0

    .line 395
    new-instance v0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;

    const-string v1, ""

    invoke-direct {v0, p0, v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Ljava/lang/String;)V

    throw v0

    .line 397
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->getAccessPwd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/rfid/TagScanner;->setDefaultAccessPassword(Ljava/lang/String;)V

    .line 398
    return-void
.end method

.method private clearAll()V
    .locals 2

    .prologue
    .line 594
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    .line 595
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 596
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 597
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 598
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etTid:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 599
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 600
    return-void
.end method

.method private configureMask()V
    .locals 3

    .prologue
    .line 333
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const-class v2, Lcom/alien/demo/feature/mask/MaskActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 334
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "filter_data"

    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 335
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 336
    return-void
.end method

.method private getAccessPwd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 348
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private markReadFieldError(Landroid/widget/EditText;)V
    .locals 2
    .param p1, "et"    # Landroid/widget/EditText;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$13;

    invoke-direct {v1, p0, p1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$13;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 359
    return-void
.end method

.method private markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
    .locals 2
    .param p1, "et"    # Landroid/widget/EditText;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 371
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;

    invoke-direct {v1, p0, p1, p2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$15;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 379
    return-void
.end method

.method private markWriteFieldError(Landroid/widget/EditText;)V
    .locals 2
    .param p1, "et"    # Landroid/widget/EditText;

    .prologue
    .line 362
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$14;

    invoke-direct {v1, p0, p1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$14;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 368
    return-void
.end method

.method private markWriteFieldSuccess(Landroid/widget/EditText;)V
    .locals 2
    .param p1, "et"    # Landroid/widget/EditText;

    .prologue
    .line 382
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$16;

    invoke-direct {v1, p0, p1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$16;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 389
    return-void
.end method

.method public static newInstance(Lcom/alien/demo/rfid/TagScanner;)Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    .locals 1
    .param p0, "scanner"    # Lcom/alien/demo/rfid/TagScanner;

    .prologue
    .line 69
    new-instance v0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    invoke-direct {v0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;-><init>()V

    .line 70
    .local v0, "ins":Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;
    iput-object p0, v0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    .line 71
    return-object v0
.end method

.method private readAPwd()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 442
    :try_start_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 443
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v2}, Lcom/alien/rfid/Tag;->readAccessPwd()Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 444
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_0

    .line 445
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    move v2, v3

    .line 454
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :goto_0
    return v2

    .line 448
    .restart local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_0
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v4, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 449
    const/4 v2, 0x1

    goto :goto_0

    .line 450
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v0

    .line 451
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    .line 452
    const-string v2, "AlienRFID-Basic Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error reading access password: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    move v2, v3

    .line 454
    goto :goto_0
.end method

.method private readAll()V
    .locals 3

    .prologue
    .line 573
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const-string v1, "Reading all fields..."

    new-instance v2, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;

    invoke-direct {v2, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$17;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-static {v0, v1, v2}, Lcom/alien/demo/uibase/TaskRunner;->runTask(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 591
    return-void
.end method

.method private readEpc()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    .line 482
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    .line 483
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 484
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v2}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound; {:try_start_0 .. :try_end_0} :catch_0

    .line 485
    const/4 v1, 0x1

    return v1

    .line 486
    :catch_0
    move-exception v0

    .line 487
    .local v0, "e":Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    .line 488
    const-string v1, "AlienRFID-Basic Access"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    invoke-virtual {v0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;->printStackTrace()V

    .line 490
    throw v0
.end method

.method private readKPwd()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 402
    :try_start_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 403
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v2}, Lcom/alien/rfid/Tag;->readKillPwd()Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 404
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_0

    .line 405
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    move v2, v3

    .line 414
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :goto_0
    return v2

    .line 408
    .restart local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_0
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v4, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 409
    const/4 v2, 0x1

    goto :goto_0

    .line 410
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v0

    .line 411
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    .line 412
    const-string v2, "AlienRFID-Basic Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error reading kill password: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    move v2, v3

    .line 414
    goto :goto_0
.end method

.method private readTid()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 517
    :try_start_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 518
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v2}, Lcom/alien/rfid/Tag;->readTID()Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 519
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_0

    .line 520
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etTid:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    move v2, v3

    .line 529
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :goto_0
    return v2

    .line 523
    .restart local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_0
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etTid:Landroid/widget/EditText;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v4, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 524
    const/4 v2, 0x1

    goto :goto_0

    .line 525
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v0

    .line 526
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etTid:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    .line 527
    const-string v2, "AlienRFID-Basic Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error reading tid: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    move v2, v3

    .line 529
    goto :goto_0
.end method

.method private readUser()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 535
    :try_start_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 536
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v2}, Lcom/alien/rfid/Tag;->readUser()Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 537
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_0

    .line 538
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    move v2, v3

    .line 548
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :goto_0
    return v2

    .line 542
    .restart local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_0
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v4, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldSuccess(Landroid/widget/EditText;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 543
    const/4 v2, 0x1

    goto :goto_0

    .line 544
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v0

    .line 545
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markReadFieldError(Landroid/widget/EditText;)V

    .line 546
    const-string v2, "AlienRFID-Basic Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error reading user: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    move v2, v3

    .line 548
    goto :goto_0
.end method

.method private setupEvents()V
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnMask:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$1;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadAll:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$2;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnClearAll:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$3;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$3;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadKPwd:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$4;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$4;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteKPwd:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$5;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$5;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadAPwd:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$6;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$6;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteAPwd:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$7;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$7;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadEpc:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$8;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$8;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 244
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteEpc:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$9;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadTid:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$10;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$10;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadUser:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$11;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$11;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 308
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteUser:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$12;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$12;-><init>(Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    return-void
.end method

.method private updateMask()V
    .locals 3

    .prologue
    .line 339
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagMask;->toString()Ljava/lang/String;

    move-result-object v0

    .line 340
    .local v0, "maskEpc":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 341
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->txtMaskEpc:Landroid/widget/TextView;

    const v2, 0x7f050020

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 345
    :goto_0
    return-void

    .line 343
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->txtMaskEpc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private writeAPwd()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 460
    :try_start_0
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 476
    :goto_0
    return v3

    .line 463
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 464
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 465
    .local v0, "data":Ljava/lang/String;
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v4, v0}, Lcom/alien/rfid/Tag;->writeAccessPwd(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 466
    .local v2, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v4

    if-nez v4, :cond_1

    .line 467
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 472
    .end local v0    # "data":Ljava/lang/String;
    .end local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v1

    .line 473
    .local v1, "e":Lcom/alien/rfid/ReaderException;
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V

    .line 474
    const-string v4, "AlienRFID-Basic Access"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error writing access password: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    invoke-virtual {v1}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    goto :goto_0

    .line 470
    .end local v1    # "e":Lcom/alien/rfid/ReaderException;
    .restart local v0    # "data":Ljava/lang/String;
    .restart local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldSuccess(Landroid/widget/EditText;)V
    :try_end_1
    .catch Lcom/alien/rfid/ReaderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 471
    const/4 v3, 0x1

    goto :goto_0
.end method

.method private writeEpc()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 496
    :try_start_0
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 511
    :goto_0
    return v2

    .line 499
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 500
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/alien/rfid/Tag;->writeEPC(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 501
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_1

    .line 502
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    invoke-direct {p0, v3}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 507
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v0

    .line 508
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    invoke-direct {p0, v3}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V

    .line 509
    const-string v3, "AlienRFID-Basic Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing epc: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    goto :goto_0

    .line 505
    .end local v0    # "e":Lcom/alien/rfid/ReaderException;
    .restart local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    invoke-direct {p0, v3}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldSuccess(Landroid/widget/EditText;)V
    :try_end_1
    .catch Lcom/alien/rfid/ReaderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 506
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private writeKPwd()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 420
    :try_start_0
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 436
    :goto_0
    return v3

    .line 423
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->checkForTag()V

    .line 424
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 425
    .local v0, "data":Ljava/lang/String;
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    invoke-virtual {v4, v0}, Lcom/alien/rfid/Tag;->writeKillPwd(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 426
    .local v2, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v4

    if-nez v4, :cond_1

    .line 427
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 432
    .end local v0    # "data":Ljava/lang/String;
    .end local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v1

    .line 433
    .local v1, "e":Lcom/alien/rfid/ReaderException;
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V

    .line 434
    const-string v4, "AlienRFID-Basic Access"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error writing kill password: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    invoke-virtual {v1}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    goto :goto_0

    .line 430
    .end local v1    # "e":Lcom/alien/rfid/ReaderException;
    .restart local v0    # "data":Ljava/lang/String;
    .restart local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldSuccess(Landroid/widget/EditText;)V
    :try_end_1
    .catch Lcom/alien/rfid/ReaderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 431
    const/4 v3, 0x1

    goto :goto_0
.end method

.method private writeUser()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/demo/feature/tagaccess/BasicAccessFragment$NoTagFound;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 554
    :try_start_0
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 568
    :goto_0
    return v2

    .line 557
    :cond_0
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->tag:Lcom/alien/rfid/Tag;

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/alien/rfid/Tag;->writeUser(Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v1

    .line 558
    .local v1, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v1}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_1

    .line 559
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-direct {p0, v3}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V
    :try_end_0
    .catch Lcom/alien/rfid/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 564
    .end local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :catch_0
    move-exception v0

    .line 565
    .local v0, "e":Lcom/alien/rfid/ReaderException;
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-direct {p0, v3}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldError(Landroid/widget/EditText;)V

    .line 566
    const-string v3, "AlienRFID-Basic Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing user: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    invoke-virtual {v0}, Lcom/alien/rfid/ReaderException;->printStackTrace()V

    goto :goto_0

    .line 562
    .end local v0    # "e":Lcom/alien/rfid/ReaderException;
    .restart local v1    # "result":Lcom/alien/rfid/RFIDResult;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    invoke-direct {p0, v3}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->markWriteFieldSuccess(Landroid/widget/EditText;)V
    :try_end_1
    .catch Lcom/alien/rfid/ReaderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 563
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 87
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 88
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    .line 89
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b6

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->txtMaskEpc:Landroid/widget/TextView;

    .line 91
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b5

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnMask:Landroid/widget/Button;

    .line 92
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b7

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadAll:Landroid/widget/Button;

    .line 93
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnClearAll:Landroid/widget/Button;

    .line 94
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00bb

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadKPwd:Landroid/widget/ImageButton;

    .line 95
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00bc

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteKPwd:Landroid/widget/ImageButton;

    .line 96
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00be

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadAPwd:Landroid/widget/ImageButton;

    .line 97
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00bf

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteAPwd:Landroid/widget/ImageButton;

    .line 98
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadEpc:Landroid/widget/ImageButton;

    .line 99
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteEpc:Landroid/widget/ImageButton;

    .line 100
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c4

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadTid:Landroid/widget/ImageButton;

    .line 101
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c6

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnReadUser:Landroid/widget/ImageButton;

    .line 102
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c7

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->btnWriteUser:Landroid/widget/ImageButton;

    .line 104
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b9

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etPassword:Landroid/widget/EditText;

    .line 105
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ba

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etKPwd:Landroid/widget/EditText;

    .line 106
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00bd

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etAPwd:Landroid/widget/EditText;

    .line 107
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etEpc:Landroid/widget/EditText;

    .line 108
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etTid:Landroid/widget/EditText;

    .line 109
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etTid:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 110
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c5

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->etUser:Landroid/widget/EditText;

    .line 112
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->setupEvents()V

    .line 113
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 604
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->context:Landroid/app/Activity;

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 605
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/rfid/TagMask;->loadFromString(Ljava/lang/String;)V

    .line 606
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->clearAll()V

    .line 607
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->updateMask()V

    .line 609
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 82
    const v0, 0x7f030032

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)V
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 613
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 614
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->readAll()V

    .line 618
    :goto_0
    return-void

    .line 617
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/alien/demo/uibase/BaseFragment;->onKeyDown(ILandroid/view/KeyEvent;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 76
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseFragment;->onResume()V

    .line 77
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->updateMask()V

    .line 78
    return-void
.end method
