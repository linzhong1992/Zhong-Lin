.class public Lcom/alien/demo/feature/geiger/GeigerActivity;
.super Landroid/app/Activity;
.source "GeigerActivity.java"

# interfaces
.implements Lcom/alien/rfid/RFIDCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
    }
.end annotation


# static fields
.field private static final INTERVAL_STATUS:J = 0x64L

.field private static final REQUEST_MASK:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AlienRFID-Geiger"

.field private static final TAG_TIME_OUT:J = 0x3e8L

.field private static scanner:Lcom/alien/demo/rfid/TagScanner;


# instance fields
.field private activity:Landroid/app/Activity;

.field private btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

.field private closing:Z

.field private currentRangeLevel:I

.field private handler:Landroid/os/Handler;

.field private progressBar:Landroid/widget/ProgressBar;

.field private ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

.field private tagEpc:Ljava/lang/String;

.field private tagLastSeen:J

.field private tagRange:I

.field private tagRssi:Ljava/lang/String;

.field private txtEpc:Landroid/widget/TextView;

.field private txtMaskEpc:Landroid/widget/TextView;

.field private txtRssi:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 29
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 47
    iput v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I

    .line 50
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagEpc:Ljava/lang/String;

    .line 51
    const-string v0, "0"

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRssi:Ljava/lang/String;

    .line 52
    iput v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I

    .line 53
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagLastSeen:J

    .line 58
    iput-boolean v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->closing:Z

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/geiger/GeigerActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagEpc:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/alien/demo/feature/geiger/GeigerActivity;)[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    return-object v0
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/geiger/GeigerActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRssi:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/geiger/GeigerActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I

    return v0
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtEpc:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtRssi:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$700(Lcom/alien/demo/feature/geiger/GeigerActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->closing:Z

    return v0
.end method

.method static synthetic access$800(Lcom/alien/demo/feature/geiger/GeigerActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->refreshDetection()V

    return-void
.end method

.method static synthetic access$900(Lcom/alien/demo/feature/geiger/GeigerActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;

    .prologue
    .line 29
    iget v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I

    return v0
.end method

.method static synthetic access$902(Lcom/alien/demo/feature/geiger/GeigerActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/geiger/GeigerActivity;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I

    return p1
.end method

.method private refreshDetection()V
    .locals 4

    .prologue
    .line 245
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagLastSeen:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const-string v0, "0"

    iget-object v1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtRssi:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 246
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->resetDetection()V

    .line 247
    :cond_0
    return-void
.end method

.method private refreshTagInfo()V
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 162
    return-void
.end method

.method private resetDetection()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 250
    const-string v0, ""

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagEpc:Ljava/lang/String;

    .line 251
    const-string v0, "0"

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRssi:Ljava/lang/String;

    .line 252
    iput v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I

    .line 253
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    iget v1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->pause()V

    .line 254
    iput v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I

    .line 255
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->refreshTagInfo()V

    .line 256
    return-void
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 205
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f05003b

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 207
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->startAnimation()V

    .line 208
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->scan()V

    .line 210
    :cond_0
    return-void
.end method

.method private startSoundFeedbackThread()V
    .locals 2

    .prologue
    .line 165
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/alien/demo/feature/geiger/GeigerActivity$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/geiger/GeigerActivity$2;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 192
    return-void
.end method

.method private stopSearch()V
    .locals 2

    .prologue
    .line 213
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f05003a

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 215
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->stopAnimation()V

    .line 216
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0, p0}, Lcom/alien/demo/rfid/TagScanner;->stop(Landroid/content/Context;)V

    .line 218
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->resetDetection()V

    .line 219
    return-void
.end method

.method private updateMask()V
    .locals 3

    .prologue
    .line 259
    sget-object v1, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagMask;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "maskEpc":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 261
    iget-object v1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtMaskEpc:Landroid/widget/TextView;

    const v2, 0x7f05003c

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 267
    :goto_0
    return-void

    .line 264
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtMaskEpc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 197
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 198
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/rfid/TagMask;->loadFromString(Ljava/lang/String;)V

    .line 199
    const-string v0, "AlienRFID-Geiger"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Set mask EPC: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->updateMask()V

    .line 202
    :cond_0
    return-void
.end method

.method public onClickMask(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 324
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/alien/demo/feature/mask/MaskActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 325
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "filter_data"

    sget-object v2, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 326
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/geiger/GeigerActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 327
    return-void
.end method

.method public onClickStartStopSearch(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 222
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 223
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->startSearch()V

    .line 227
    :goto_0
    return-void

    .line 225
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->stopSearch()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 105
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 106
    invoke-virtual {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 108
    iput-object p0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->activity:Landroid/app/Activity;

    .line 109
    const v0, 0x7f03001b

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->setContentView(I)V

    .line 110
    invoke-virtual {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 112
    const v0, 0x7f0c0075

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->progressBar:Landroid/widget/ProgressBar;

    .line 113
    const v0, 0x7f0c0072

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtMaskEpc:Landroid/widget/TextView;

    .line 114
    const v0, 0x7f0c0073

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtRssi:Landroid/widget/TextView;

    .line 115
    const v0, 0x7f0c0076

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->txtEpc:Landroid/widget/TextView;

    .line 116
    const v0, 0x7f0c0074

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/dd/processbutton/iml/ActionProcessButton;

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    .line 117
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    sget-object v1, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setMode(Lcom/dd/processbutton/iml/ActionProcessButton$Mode;)V

    .line 120
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    new-instance v1, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v3, v2}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;ILjava/lang/String;)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    const/16 v2, 0x1e

    const-string v3, "quietest_snd.mp3"

    invoke-direct {v1, p0, v2, v3}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;ILjava/lang/String;)V

    aput-object v1, v0, v4

    const/4 v1, 0x2

    new-instance v2, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    const/16 v3, 0x28

    const-string v4, "default_snd.mp3"

    invoke-direct {v2, p0, v3, v4}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;ILjava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    const/16 v3, 0x3c

    const-string v4, "loudest_snd.mp3"

    invoke-direct {v2, p0, v3, v4}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;ILjava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    const/16 v3, 0x64

    const-string v4, "success_snd.mp3"

    invoke-direct {v2, p0, v3, v4}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;ILjava/lang/String;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    .line 129
    new-instance v0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;

    invoke-direct {v0, p0}, Lcom/alien/demo/feature/geiger/GeigerActivity$1;-><init>(Lcom/alien/demo/feature/geiger/GeigerActivity;)V

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->handler:Landroid/os/Handler;

    .line 149
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {v0, p0}, Lcom/alien/demo/rfid/TagScanner;-><init>(Lcom/alien/rfid/RFIDCallback;)V

    sput-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    .line 157
    :goto_0
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->startSoundFeedbackThread()V

    .line 158
    return-void

    .line 153
    :cond_0
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0, p0}, Lcom/alien/demo/rfid/TagScanner;->setListener(Lcom/alien/rfid/RFIDCallback;)V

    .line 154
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->updateMask()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 303
    invoke-virtual {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 304
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 271
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 272
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->closing:Z

    .line 273
    sget-object v0, Lcom/alien/demo/feature/geiger/GeigerActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->stop()Z

    .line 274
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 284
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 285
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->startSearch()V

    .line 286
    const/4 v0, 0x1

    .line 288
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 293
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    .line 294
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->stopSearch()V

    .line 295
    const/4 v0, 0x1

    .line 297
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 312
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 314
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 320
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 316
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->onBackPressed()V

    .line 317
    const/4 v1, 0x1

    goto :goto_0

    .line 314
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 278
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 279
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->stopSearch()V

    .line 280
    return-void
.end method

.method public onTagRead(Lcom/alien/rfid/Tag;)V
    .locals 7
    .param p1, "tag"    # Lcom/alien/rfid/Tag;

    .prologue
    const/4 v6, 0x0

    .line 230
    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getRSSI()D

    move-result-wide v4

    invoke-static {v3, v4, v5}, Lcom/alien/demo/feature/geiger/TagProximator;->addData(Ljava/lang/String;D)F

    .line 232
    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/alien/demo/feature/geiger/TagProximator;->getProximity(Ljava/lang/String;)F

    move-result v3

    float-to-double v0, v3

    .line 233
    .local v0, "normalizeRssi":D
    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/alien/demo/feature/geiger/TagProximator;->getScaledProximity(Ljava/lang/String;)I

    move-result v2

    .line 235
    .local v2, "range":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagLastSeen:J

    .line 236
    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagEpc:Ljava/lang/String;

    .line 237
    const-string v3, "%1$,.1f"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRssi:Ljava/lang/String;

    .line 238
    const/16 v3, 0x64

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I

    .line 239
    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I

    .line 241
    invoke-direct {p0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->refreshTagInfo()V

    .line 242
    return-void
.end method
