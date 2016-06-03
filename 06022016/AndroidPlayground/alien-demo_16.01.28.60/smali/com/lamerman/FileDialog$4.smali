.class Lcom/lamerman/FileDialog$4;
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
    .line 164
    iput-object p1, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->mFileName:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/lamerman/FileDialog;->access$200(Lcom/lamerman/FileDialog;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    invoke-virtual {v0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "RESULT_PATH"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;
    invoke-static {v3}, Lcom/lamerman/FileDialog;->access$400(Lcom/lamerman/FileDialog;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->mFileName:Landroid/widget/EditText;
    invoke-static {v3}, Lcom/lamerman/FileDialog;->access$200(Lcom/lamerman/FileDialog;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    iget-object v0, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    invoke-virtual {v2}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lamerman/FileDialog;->setResult(ILandroid/content/Intent;)V

    .line 171
    iget-object v0, p0, Lcom/lamerman/FileDialog$4;->this$0:Lcom/lamerman/FileDialog;

    invoke-virtual {v0}, Lcom/lamerman/FileDialog;->finish()V

    .line 173
    :cond_0
    return-void
.end method
