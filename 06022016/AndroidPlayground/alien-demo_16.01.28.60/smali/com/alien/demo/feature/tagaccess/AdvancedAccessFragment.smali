.class public Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;
.super Lcom/alien/demo/uibase/BaseFragment;
.source "AdvancedAccessFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Adv Access"


# instance fields
.field private btnLock:Landroid/widget/ImageButton;

.field private btnMask:Landroid/widget/Button;

.field private btnRead:Landroid/widget/ImageButton;

.field private btnWrite:Landroid/widget/ImageButton;

.field private context:Landroid/app/Activity;

.field private etData:Landroid/widget/EditText;

.field private etPassword:Landroid/widget/EditText;

.field private etWordLen:Landroid/widget/EditText;

.field private etWordOffset:Landroid/widget/EditText;

.field private scanner:Lcom/alien/demo/rfid/TagScanner;

.field private spLockField:Landroid/widget/Spinner;

.field private spLockType:Landroid/widget/Spinner;

.field private spRWBank:Landroid/widget/Spinner;

.field private txtMaskEpc:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->configureMask()V

    return-void
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->readData()V

    return-void
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->writeData()V

    return-void
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnLock:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$600(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockField:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$700(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockType:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$800(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Lcom/alien/demo/rfid/TagScanner;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    return-object v0
.end method

.method private configureMask()V
    .locals 3

    .prologue
    .line 323
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const-class v2, Lcom/alien/demo/feature/mask/MaskActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 324
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "filter_data"

    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 326
    return-void
.end method

.method private getAccessPwd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Lcom/alien/demo/rfid/TagScanner;)Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;
    .locals 1
    .param p0, "scanner"    # Lcom/alien/demo/rfid/TagScanner;

    .prologue
    .line 60
    new-instance v0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    invoke-direct {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;-><init>()V

    .line 61
    .local v0, "ins":Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;
    iput-object p0, v0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    .line 62
    return-object v0
.end method

.method private readData()V
    .locals 9

    .prologue
    .line 159
    :try_start_0
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spRWBank:Landroid/widget/Spinner;

    invoke-virtual {v6}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v6

    invoke-static {v6}, Lcom/alien/rfid/Bank;->fromValue(I)Lcom/alien/rfid/Bank;

    move-result-object v0

    .line 161
    .local v0, "bank":Lcom/alien/rfid/Bank;
    const/4 v5, 0x0

    .line 162
    .local v5, "wordOffset":I
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etWordOffset:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, "sTemp":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 164
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 166
    :cond_0
    const/4 v4, 0x0

    .line 167
    .local v4, "wordLen":I
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etWordLen:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 168
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 169
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 171
    :cond_1
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v0, v5, v4, v7}, Lcom/alien/demo/rfid/TagScanner;->read(Lcom/alien/rfid/Bank;IILjava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 172
    .local v2, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v6

    if-nez v6, :cond_2

    .line 173
    new-instance v6, Lcom/alien/rfid/ReaderException;

    const-string v7, "Operation result is false"

    invoke-direct {v6, v7}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    .end local v0    # "bank":Lcom/alien/rfid/Bank;
    .end local v2    # "result":Lcom/alien/rfid/RFIDResult;
    .end local v3    # "sTemp":Ljava/lang/String;
    .end local v4    # "wordLen":I
    .end local v5    # "wordOffset":I
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    new-instance v7, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$7;

    invoke-direct {v7, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$7;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 193
    const-string v6, "AlienRFID-Adv Access"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error reading data: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 195
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    invoke-static {v6}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V

    .line 197
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 175
    .restart local v0    # "bank":Lcom/alien/rfid/Bank;
    .restart local v2    # "result":Lcom/alien/rfid/RFIDResult;
    .restart local v3    # "sTemp":Ljava/lang/String;
    .restart local v4    # "wordLen":I
    .restart local v5    # "wordOffset":I
    :cond_2
    :try_start_1
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    new-instance v7, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;

    invoke-direct {v7, p0, v2}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;Lcom/alien/rfid/RFIDResult;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 183
    iget-object v6, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    invoke-static {v6}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private setupEvents()V
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnMask:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$1;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnRead:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$2;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnWrite:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$3;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnLock:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$4;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$4;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockType:Landroid/widget/Spinner;

    new-instance v1, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$5;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$5;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 155
    return-void
.end method

.method private updateMask()V
    .locals 3

    .prologue
    .line 329
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagMask;->toString()Ljava/lang/String;

    move-result-object v0

    .line 330
    .local v0, "maskEpc":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 331
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->txtMaskEpc:Landroid/widget/TextView;

    const v2, 0x7f050020

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 336
    :goto_0
    return-void

    .line 334
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->txtMaskEpc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private writeData()V
    .locals 10

    .prologue
    .line 201
    :try_start_0
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spRWBank:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    invoke-static {v7}, Lcom/alien/rfid/Bank;->fromValue(I)Lcom/alien/rfid/Bank;

    move-result-object v0

    .line 203
    .local v0, "bank":Lcom/alien/rfid/Bank;
    const/4 v6, 0x0

    .line 204
    .local v6, "wordOffset":I
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etWordOffset:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 205
    .local v4, "sTemp":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 206
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 208
    :cond_0
    const/4 v5, 0x0

    .line 209
    .local v5, "wordLen":I
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etWordLen:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 210
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 211
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 213
    :cond_1
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 215
    .local v1, "data":Ljava/lang/String;
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v0, v6, v1, v8}, Lcom/alien/demo/rfid/TagScanner;->write(Lcom/alien/rfid/Bank;ILjava/lang/String;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v3

    .line 216
    .local v3, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v3}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v7

    if-nez v7, :cond_2

    .line 217
    new-instance v7, Lcom/alien/rfid/ReaderException;

    const-string v8, "Operation result is false"

    invoke-direct {v7, v8}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    .end local v0    # "bank":Lcom/alien/rfid/Bank;
    .end local v1    # "data":Ljava/lang/String;
    .end local v3    # "result":Lcom/alien/rfid/RFIDResult;
    .end local v4    # "sTemp":Ljava/lang/String;
    .end local v5    # "wordLen":I
    .end local v6    # "wordOffset":I
    :catch_0
    move-exception v2

    .line 229
    .local v2, "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    new-instance v8, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$9;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$9;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v7, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 235
    const-string v7, "AlienRFID-Adv Access"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error writing data: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 237
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    invoke-static {v7}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V

    .line 239
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 219
    .restart local v0    # "bank":Lcom/alien/rfid/Bank;
    .restart local v1    # "data":Ljava/lang/String;
    .restart local v3    # "result":Lcom/alien/rfid/RFIDResult;
    .restart local v4    # "sTemp":Ljava/lang/String;
    .restart local v5    # "wordLen":I
    .restart local v6    # "wordOffset":I
    :cond_2
    :try_start_1
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    new-instance v8, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$8;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$8;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    invoke-virtual {v7, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 226
    iget-object v7, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    invoke-static {v7}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method


# virtual methods
.method public getField(Landroid/widget/Spinner;)Lcom/alien/rfid/LockFields;
    .locals 3
    .param p1, "sp"    # Landroid/widget/Spinner;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/alien/rfid/ReaderException;
        }
    .end annotation

    .prologue
    .line 242
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    .line 243
    .local v0, "pos":I
    packed-switch v0, :pswitch_data_0

    .line 249
    new-instance v1, Lcom/alien/rfid/ReaderException;

    const-string v2, "Invalid field"

    invoke-direct {v1, v2}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 244
    :pswitch_0
    new-instance v1, Lcom/alien/rfid/LockFields;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/alien/rfid/LockFields;-><init>(I)V

    .line 247
    :goto_0
    return-object v1

    .line 245
    :pswitch_1
    new-instance v1, Lcom/alien/rfid/LockFields;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/alien/rfid/LockFields;-><init>(I)V

    goto :goto_0

    .line 246
    :pswitch_2
    new-instance v1, Lcom/alien/rfid/LockFields;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lcom/alien/rfid/LockFields;-><init>(I)V

    goto :goto_0

    .line 247
    :pswitch_3
    new-instance v1, Lcom/alien/rfid/LockFields;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lcom/alien/rfid/LockFields;-><init>(I)V

    goto :goto_0

    .line 243
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public lockField()V
    .locals 4

    .prologue
    .line 253
    new-instance v1, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;-><init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V

    .line 305
    .local v1, "dialogClickListener":Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 306
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f050022

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f05007d

    invoke-virtual {v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f050054

    invoke-virtual {v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 308
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 78
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 79
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    .line 81
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a4

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->txtMaskEpc:Landroid/widget/TextView;

    .line 82
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnMask:Landroid/widget/Button;

    .line 84
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a5

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etPassword:Landroid/widget/EditText;

    .line 86
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a6

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spRWBank:Landroid/widget/Spinner;

    .line 87
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spRWBank:Landroid/widget/Spinner;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 88
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a7

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etWordOffset:Landroid/widget/EditText;

    .line 89
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etWordLen:Landroid/widget/EditText;

    .line 90
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00a9

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;

    .line 91
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00aa

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnRead:Landroid/widget/ImageButton;

    .line 92
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ab

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnWrite:Landroid/widget/ImageButton;

    .line 94
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ac

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockField:Landroid/widget/Spinner;

    .line 95
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockField:Landroid/widget/Spinner;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 96
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ad

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockType:Landroid/widget/Spinner;

    .line 97
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ae

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->btnLock:Landroid/widget/ImageButton;

    .line 99
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->setupEvents()V

    .line 100
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 316
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/rfid/TagMask;->loadFromString(Ljava/lang/String;)V

    .line 318
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->updateMask()V

    .line 320
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 73
    const v0, 0x7f030030

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
    .line 340
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 341
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->readData()V

    .line 345
    :goto_0
    return-void

    .line 344
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/alien/demo/uibase/BaseFragment;->onKeyDown(ILandroid/view/KeyEvent;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 67
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseFragment;->onResume()V

    .line 68
    invoke-direct {p0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->updateMask()V

    .line 69
    return-void
.end method
