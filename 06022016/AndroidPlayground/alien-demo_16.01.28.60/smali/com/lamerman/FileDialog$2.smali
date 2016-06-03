.class Lcom/lamerman/FileDialog$2;
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
    .line 129
    iput-object p1, p0, Lcom/lamerman/FileDialog$2;->this$0:Lcom/lamerman/FileDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/lamerman/FileDialog$2;->this$0:Lcom/lamerman/FileDialog;

    # invokes: Lcom/lamerman/FileDialog;->setCreateVisible(Landroid/view/View;)V
    invoke-static {v0, p1}, Lcom/lamerman/FileDialog;->access$100(Lcom/lamerman/FileDialog;Landroid/view/View;)V

    .line 135
    iget-object v0, p0, Lcom/lamerman/FileDialog$2;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->mFileName:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/lamerman/FileDialog;->access$200(Lcom/lamerman/FileDialog;)Landroid/widget/EditText;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 136
    iget-object v0, p0, Lcom/lamerman/FileDialog$2;->this$0:Lcom/lamerman/FileDialog;

    # getter for: Lcom/lamerman/FileDialog;->mFileName:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/lamerman/FileDialog;->access$200(Lcom/lamerman/FileDialog;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 137
    return-void
.end method
