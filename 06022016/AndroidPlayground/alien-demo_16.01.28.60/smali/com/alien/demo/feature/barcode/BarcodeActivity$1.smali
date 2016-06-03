.class Lcom/alien/demo/feature/barcode/BarcodeActivity$1;
.super Ljava/lang/Object;
.source "BarcodeActivity.java"

# interfaces
.implements Lcom/alien/barcode/BarcodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/barcode/BarcodeActivity;->startScan()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/barcode/BarcodeActivity;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBarcodeRead(Ljava/lang/String;)V
    .locals 4
    .param p1, "barcode"    # Ljava/lang/String;

    .prologue
    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 64
    .local v0, "barcodeInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "barcodeNum"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$000(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v1, "barcodeValue"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$000(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeAdapter:Landroid/widget/SimpleAdapter;
    invoke-static {v1}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$100(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Landroid/widget/SimpleAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 69
    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->lvBarcodes:Landroid/widget/ListView;
    invoke-static {v1}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$200(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Landroid/widget/ListView;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->barcodeList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$000(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 71
    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    invoke-static {v1}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V

    .line 72
    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;
    invoke-static {v1}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$300(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Lcom/dd/processbutton/iml/ActionProcessButton;

    move-result-object v1

    const v2, 0x7f050031

    invoke-virtual {v1, v2}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 73
    iget-object v1, p0, Lcom/alien/demo/feature/barcode/BarcodeActivity$1;->this$0:Lcom/alien/demo/feature/barcode/BarcodeActivity;

    # getter for: Lcom/alien/demo/feature/barcode/BarcodeActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;
    invoke-static {v1}, Lcom/alien/demo/feature/barcode/BarcodeActivity;->access$300(Lcom/alien/demo/feature/barcode/BarcodeActivity;)Lcom/dd/processbutton/iml/ActionProcessButton;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->stopAnimation()V

    .line 74
    return-void
.end method
