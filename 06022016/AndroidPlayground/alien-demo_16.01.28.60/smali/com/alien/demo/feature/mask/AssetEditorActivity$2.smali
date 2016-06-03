.class Lcom/alien/demo/feature/mask/AssetEditorActivity$2;
.super Ljava/lang/Object;
.source "AssetEditorActivity.java"

# interfaces
.implements Lcom/alien/barcode/BarcodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/AssetEditorActivity;->scanBarcode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity$2;->this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBarcodeRead(Ljava/lang/String;)V
    .locals 1
    .param p1, "barcode"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity$2;->this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;

    # getter for: Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->access$100(Lcom/alien/demo/feature/mask/AssetEditorActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 208
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity$2;->this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;

    invoke-static {v0}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V

    .line 209
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity$2;->this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;

    # invokes: Lcom/alien/demo/feature/mask/AssetEditorActivity;->nextFocus()V
    invoke-static {v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->access$200(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V

    .line 210
    return-void
.end method
