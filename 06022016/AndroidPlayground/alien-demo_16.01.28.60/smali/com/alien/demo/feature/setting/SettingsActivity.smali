.class public Lcom/alien/demo/feature/setting/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Settings"


# instance fields
.field private chkDebugMode:Landroid/widget/CheckBox;

.field localSettings:Lcom/alien/demo/data/LocalSettings;

.field private localSettingsView:Landroid/view/View;

.field private power:I

.field private qvalue:I

.field private reader:Lcom/alien/rfid/RFIDReader;

.field private session:I

.field private skPower:Landroid/widget/SeekBar;

.field private skQvalue:Landroid/widget/SeekBar;

.field private spSession:Landroid/widget/Spinner;

.field private spTarget:Landroid/widget/Spinner;

.field private target:I

.field private txtDeviceInfo:Landroid/widget/TextView;

.field private txtPower:Landroid/widget/TextView;

.field private txtQValue:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettingsView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/setting/SettingsActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;

    .prologue
    .line 29
    iget v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->power:I

    return v0
.end method

.method static synthetic access$102(Lcom/alien/demo/feature/setting/SettingsActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->power:I

    return p1
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtPower:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$302(Lcom/alien/demo/feature/setting/SettingsActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->session:I

    return p1
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/setting/SettingsActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;

    .prologue
    .line 29
    iget v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I

    return v0
.end method

.method static synthetic access$402(Lcom/alien/demo/feature/setting/SettingsActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I

    return p1
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtQValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$602(Lcom/alien/demo/feature/setting/SettingsActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/setting/SettingsActivity;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->target:I

    return p1
.end method

.method private loadReaderSetting()V
    .locals 4

    .prologue
    .line 185
    :try_start_0
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->chkDebugMode:Landroid/widget/CheckBox;

    iget-object v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    invoke-virtual {v2}, Lcom/alien/demo/data/LocalSettings;->isDebugMode()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 187
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDReader;->getQ()I

    move-result v1

    iput v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I

    .line 188
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDReader;->getSession()Lcom/alien/rfid/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Session;->getValue()I

    move-result v1

    iput v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->session:I

    .line 189
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDReader;->getPower()I

    move-result v1

    iput v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->power:I

    .line 190
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    invoke-virtual {v1}, Lcom/alien/rfid/RFIDReader;->getTarget()Lcom/alien/rfid/Target;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/rfid/Target;->getValue()I

    move-result v1

    iput v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->target:I

    .line 192
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->skPower:Landroid/widget/SeekBar;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->power:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 193
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->skQvalue:Landroid/widget/SeekBar;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 194
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->spSession:Landroid/widget/Spinner;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->session:I

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 195
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->spTarget:Landroid/widget/Spinner;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->target:I

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    :goto_0
    return-void

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Settings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error loading reader settings: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private resetSetting()V
    .locals 4

    .prologue
    .line 249
    :try_start_0
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setQ(I)V

    .line 250
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v2, Lcom/alien/rfid/Session;->S1:Lcom/alien/rfid/Session;

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setSession(Lcom/alien/rfid/Session;)V

    .line 251
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v2, Lcom/alien/rfid/Target;->A:Lcom/alien/rfid/Target;

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setTarget(Lcom/alien/rfid/Target;)V

    .line 252
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    const/16 v2, 0x1e

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setPower(I)V

    .line 254
    invoke-direct {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->loadReaderSetting()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    :goto_0
    return-void

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Settings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reset reader settings: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private saveReaderSetting()V
    .locals 4

    .prologue
    .line 204
    :try_start_0
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setQ(I)V

    .line 205
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->session:I

    invoke-static {v2}, Lcom/alien/rfid/Session;->fromValue(I)Lcom/alien/rfid/Session;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setSession(Lcom/alien/rfid/Session;)V

    .line 206
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->power:I

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setPower(I)V

    .line 207
    iget-object v1, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->target:I

    invoke-static {v2}, Lcom/alien/rfid/Target;->fromValue(I)Lcom/alien/rfid/Target;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/alien/rfid/RFIDReader;->setTarget(Lcom/alien/rfid/Target;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    :goto_0
    return-void

    .line 208
    :catch_0
    move-exception v0

    .line 209
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Settings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error saving reader settings: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onClickCancel(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 244
    invoke-virtual {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->finish()V

    .line 245
    return-void
.end method

.method public onClickReset(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 263
    invoke-direct {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->resetSetting()V

    .line 264
    return-void
.end method

.method public onClickSave(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 239
    invoke-direct {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->saveReaderSetting()V

    .line 240
    invoke-virtual {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->finish()V

    .line 241
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const v7, 0x7f03001f

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->setContentView(I)V

    .line 57
    invoke-virtual {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 58
    invoke-virtual {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v7

    const/16 v8, 0x80

    invoke-virtual {v7, v8}, Landroid/view/Window;->addFlags(I)V

    .line 60
    new-instance v7, Lcom/alien/demo/data/LocalSettings;

    invoke-direct {v7}, Lcom/alien/demo/data/LocalSettings;-><init>()V

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    .line 61
    const v7, 0x7f0c0088

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettingsView:Landroid/view/View;

    .line 62
    const v7, 0x7f0c0089

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/CheckBox;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->chkDebugMode:Landroid/widget/CheckBox;

    .line 63
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->chkDebugMode:Landroid/widget/CheckBox;

    new-instance v8, Lcom/alien/demo/feature/setting/SettingsActivity$1;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/setting/SettingsActivity$1;-><init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 70
    const v7, 0x7f0c0083

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtPower:Landroid/widget/TextView;

    .line 71
    const v7, 0x7f0c0086

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtQValue:Landroid/widget/TextView;

    .line 72
    const v7, 0x7f0c008a

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtDeviceInfo:Landroid/widget/TextView;

    .line 73
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtDeviceInfo:Landroid/widget/TextView;

    new-instance v8, Lcom/alien/demo/feature/setting/SettingsActivity$2;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/setting/SettingsActivity$2;-><init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 107
    const v7, 0x7f0c0082

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/SeekBar;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->skPower:Landroid/widget/SeekBar;

    .line 108
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->skPower:Landroid/widget/SeekBar;

    new-instance v8, Lcom/alien/demo/feature/setting/SettingsActivity$3;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/setting/SettingsActivity$3;-><init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 123
    const v7, 0x7f0c0084

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/Spinner;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->spSession:Landroid/widget/Spinner;

    .line 124
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->spSession:Landroid/widget/Spinner;

    new-instance v8, Lcom/alien/demo/feature/setting/SettingsActivity$4;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/setting/SettingsActivity$4;-><init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 134
    const v7, 0x7f0c0085

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/SeekBar;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->skQvalue:Landroid/widget/SeekBar;

    .line 135
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->skQvalue:Landroid/widget/SeekBar;

    new-instance v8, Lcom/alien/demo/feature/setting/SettingsActivity$5;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/setting/SettingsActivity$5;-><init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 150
    const v7, 0x7f0c0087

    invoke-virtual {p0, v7}, Lcom/alien/demo/feature/setting/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/Spinner;

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->spTarget:Landroid/widget/Spinner;

    .line 151
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->spTarget:Landroid/widget/Spinner;

    new-instance v8, Lcom/alien/demo/feature/setting/SettingsActivity$6;

    invoke-direct {v8, p0}, Lcom/alien/demo/feature/setting/SettingsActivity$6;-><init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 162
    invoke-static {}, Lcom/alien/demo/rfid/TagScanner;->getRFIDReader()Lcom/alien/rfid/RFIDReader;

    move-result-object v7

    iput-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    .line 163
    new-instance v1, Lcom/alien/common/DeviceInfo;

    invoke-direct {v1, p0}, Lcom/alien/common/DeviceInfo;-><init>(Landroid/content/Context;)V

    .line 164
    .local v1, "deviceInfo":Lcom/alien/common/DeviceInfo;
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v8, Lcom/alien/rfid/RFIDInfo;->HARDWARE_VER:Lcom/alien/rfid/RFIDInfo;

    invoke-virtual {v7, v8}, Lcom/alien/rfid/RFIDReader;->getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "hwVersion":Ljava/lang/String;
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v8, Lcom/alien/rfid/RFIDInfo;->FIRMWARE_VER:Lcom/alien/rfid/RFIDInfo;

    invoke-virtual {v7, v8}, Lcom/alien/rfid/RFIDReader;->getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;

    move-result-object v2

    .line 166
    .local v2, "fwVersion":Ljava/lang/String;
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v8, Lcom/alien/rfid/RFIDInfo;->MODULE_ID:Lcom/alien/rfid/RFIDInfo;

    invoke-virtual {v7, v8}, Lcom/alien/rfid/RFIDReader;->getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;

    move-result-object v5

    .line 167
    .local v5, "moduleId":Ljava/lang/String;
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->reader:Lcom/alien/rfid/RFIDReader;

    sget-object v8, Lcom/alien/rfid/RFIDInfo;->REGION:Lcom/alien/rfid/RFIDInfo;

    invoke-virtual {v7, v8}, Lcom/alien/rfid/RFIDReader;->getInfo(Lcom/alien/rfid/RFIDInfo;)Ljava/lang/String;

    move-result-object v6

    .line 168
    .local v6, "region":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/alien/common/DeviceInfo;->getDeviceID()Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "deviceId":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Hardware Version: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v3, :cond_0

    .end local v3    # "hwVersion":Ljava/lang/String;
    :goto_0
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Firmware Version: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v2, :cond_1

    .end local v2    # "fwVersion":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Module ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v5, :cond_2

    .end local v5    # "moduleId":Ljava/lang/String;
    :goto_2
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Region: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v6, :cond_3

    .end local v6    # "region":Ljava/lang/String;
    :goto_3
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "API Version: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "1.0.2"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Device ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 177
    .local v4, "info":Ljava/lang/String;
    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->txtDeviceInfo:Landroid/widget/TextView;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    invoke-direct {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->loadReaderSetting()V

    .line 180
    iget-object v8, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettingsView:Landroid/view/View;

    iget-object v7, p0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    invoke-virtual {v7}, Lcom/alien/demo/data/LocalSettings;->isShowHiddenSetting()Z

    move-result v7

    if-eqz v7, :cond_4

    const/4 v7, 0x0

    :goto_4
    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V

    .line 181
    return-void

    .line 170
    .end local v4    # "info":Ljava/lang/String;
    .restart local v2    # "fwVersion":Ljava/lang/String;
    .restart local v3    # "hwVersion":Ljava/lang/String;
    .restart local v5    # "moduleId":Ljava/lang/String;
    .restart local v6    # "region":Ljava/lang/String;
    :cond_0
    const-string v3, ""

    goto :goto_0

    .end local v3    # "hwVersion":Ljava/lang/String;
    :cond_1
    const-string v2, ""

    goto :goto_1

    .end local v2    # "fwVersion":Ljava/lang/String;
    :cond_2
    const-string v5, ""

    goto :goto_2

    .end local v5    # "moduleId":Ljava/lang/String;
    :cond_3
    const-string v6, ""

    goto :goto_3

    .line 180
    .end local v6    # "region":Ljava/lang/String;
    .restart local v4    # "info":Ljava/lang/String;
    :cond_4
    const/4 v7, 0x4

    goto :goto_4
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 217
    invoke-virtual {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0006

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 218
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 226
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 228
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 235
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 230
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/setting/SettingsActivity;->onBackPressed()V

    .line 231
    const/4 v1, 0x1

    goto :goto_0

    .line 228
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method
