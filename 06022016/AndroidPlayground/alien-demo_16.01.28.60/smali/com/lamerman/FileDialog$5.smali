.class Lcom/lamerman/FileDialog$5;
.super Ljava/lang/Object;
.source "FileDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lamerman/FileDialog;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
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
    .line 324
    iput-object p1, p0, Lcom/lamerman/FileDialog$5;->this$0:Lcom/lamerman/FileDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 329
    return-void
.end method
