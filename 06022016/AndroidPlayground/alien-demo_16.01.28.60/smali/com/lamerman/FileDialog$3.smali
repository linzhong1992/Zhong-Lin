.class Lcom/lamerman/FileDialog$3;
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
    .line 155
    iput-object p1, p0, Lcom/lamerman/FileDialog$3;->this$0:Lcom/lamerman/FileDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/lamerman/FileDialog$3;->this$0:Lcom/lamerman/FileDialog;

    # invokes: Lcom/lamerman/FileDialog;->setSelectVisible(Landroid/view/View;)V
    invoke-static {v0, p1}, Lcom/lamerman/FileDialog;->access$300(Lcom/lamerman/FileDialog;Landroid/view/View;)V

    .line 160
    return-void
.end method
