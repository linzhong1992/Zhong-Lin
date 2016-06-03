.class Lcom/alien/demo/feature/mask/AssetEditorActivity$1;
.super Ljava/lang/Object;
.source "AssetEditorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/AssetEditorActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 78
    iput-object p1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity$1;->this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity$1;->this$0:Lcom/alien/demo/feature/mask/AssetEditorActivity;

    # invokes: Lcom/alien/demo/feature/mask/AssetEditorActivity;->selectPhoto()V
    invoke-static {v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->access$000(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V

    .line 82
    return-void
.end method
