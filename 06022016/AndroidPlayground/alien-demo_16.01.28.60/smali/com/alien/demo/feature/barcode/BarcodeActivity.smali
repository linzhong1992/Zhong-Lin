.class public Lcom/alien/demo/feature/barcode/BarcodeActivity;
.super Landroid/app/Activity;
.source "BarcodeActivity.java"


# static fields
.field private static final BARCODE_NUM:Ljava/lang/String; = "barcodeNum"

.field private static final BARCODE_VALUE:Ljava/lang/String; = "barcodeValue"


# instance fields
.field private barcodeAdapter:Landroid/widget/SimpleAdapter;

.field private barcodeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private barcodeReader:Lcom/alien/barcode/BarcodeReader;

.field private btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

.field private lvBarcodes:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/barcode/BarcodeActivity;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Landroid/widget/SimpleAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/barcode/BarcodeActivity;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeAdapter:Landroid/widget/SimpleAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/barcode/BarcodeActivity;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->lvBarcodes:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Lcom/dd/processbutton/iml/ActionProcessButton;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/barcode/BarcodeActivity;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    return-object v0
.end method

.method private startScan()V
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    invoke-virtual {v0}, Lcom/alien/barcode/BarcodeReader;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    :goto_0
    return-void

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f050032

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 58
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->startAnimation()V

    .line 60
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    new-instance v1, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;-><init>(Lcom/alien/demo/feature/barcode/BarcodeActivity;)V

    invoke-virtual {v0, v1}, Lcom/alien/barcode/BarcodeReader;->start(Lcom/alien/barcode/BarcodeCallback;)V

    goto :goto_0
.end method


# virtual methods
.method public onClickClear(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 96
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 97
    return-void
.end method

.method public onClickStartStop(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    invoke-virtual {v0}, Lcom/alien/barcode/BarcodeReader;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    invoke-direct {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->startScan()V

    .line 92
    :goto_0
    return-void

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->stopScan()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 37
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    invoke-virtual {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 39
    const v0, 0x7f03001a

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->setContentView(I)V

    .line 40
    invoke-virtual {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 42
    const v0, 0x7f0c006f

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/dd/processbutton/iml/ActionProcessButton;

    iput-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;

    .line 45
    const v0, 0x7f0c0070

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->lvBarcodes:Landroid/widget/ListView;

    .line 46
    new-instance v0, Landroid/widget/SimpleAdapter;

    iget-object v2, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;

    const v3, 0x7f030022

    new-array v4, v7, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "barcodeNum"

    aput-object v5, v4, v1

    const-string v1, "barcodeValue"

    aput-object v1, v4, v6

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeAdapter:Landroid/widget/SimpleAdapter;

    .line 49
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->lvBarcodes:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 51
    new-instance v0, Lcom/alien/barcode/BarcodeReader;

    invoke-direct {v0, p0}, Lcom/alien/barcode/BarcodeReader;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    .line 52
    return-void

    .line 46
    :array_0
    .array-data 4
        0x7f0c008d
        0x7f0c008e
    .end array-data
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 101
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 102
    invoke-direct {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->startScan()V

    .line 103
    const/4 v0, 0x1

    .line 105
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
    .line 110
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    .line 111
    invoke-virtual {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->stopScan()V

    .line 112
    const/4 v0, 0x1

    .line 114
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
    .line 119
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 121
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 127
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 123
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->onBackPressed()V

    .line 124
    const/4 v1, 0x1

    goto :goto_0

    .line 121
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public declared-synchronized stopScan()V
    .locals 2

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    invoke-virtual {v0}, Lcom/alien/barcode/BarcodeReader;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    invoke-virtual {v0}, Lcom/alien/barcode/BarcodeReader;->stop()V

    .line 81
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f050031

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 82
    iget-object v0, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->stopAnimation()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    :cond_0
    monitor-exit p0

    return-void

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
