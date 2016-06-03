.class Lcom/lamerman/FileDialog$1;
.super Ljava/lang/Object;
.source "FileDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lamerman/FileDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lamerman/FileDialog;


# direct methods
.method constructor <init>(Lcom/lamerman/FileDialog;)V
    .locals 0

    .prologue
    .line 116
    iput-object p1, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->selectedFile:Ljava/io/File;
    invoke-static {v0}, Lcom/lamerman/FileDialog;->access$000(Lcom/lamerman/FileDialog;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    invoke-virtual {v0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "RESULT_PATH"

    iget-object v2, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->selectedFile:Ljava/io/File;
    invoke-static {v2}, Lcom/lamerman/FileDialog;->access$000(Lcom/lamerman/FileDialog;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    iget-object v0, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    invoke-virtual {v2}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lamerman/FileDialog;->setResult(ILandroid/content/Intent;)V

    .line 123
    iget-object v0, p0, Lcom/lamerman/FileDialog$1;->this$0:Lcom/lamerman/FileDialog;

    invoke-virtual {v0}, Lcom/lamerman/FileDialog;->finish()V

    .line 125
    :cond_0
    return-void
.end method
