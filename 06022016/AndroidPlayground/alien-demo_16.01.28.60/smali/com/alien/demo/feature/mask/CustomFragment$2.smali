.class Lcom/alien/demo/feature/mask/CustomFragment$2;
.super Ljava/lang/Object;
.source "CustomFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/CustomFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/CustomFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/CustomFragment;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/alien/demo/feature/mask/CustomFragment$2;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 110
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 101
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment$2;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    # invokes: Lcom/alien/demo/feature/mask/CustomFragment;->onStartWithEpcDataChanged(Ljava/lang/CharSequence;)V
    invoke-static {v0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->access$100(Lcom/alien/demo/feature/mask/CustomFragment;Ljava/lang/CharSequence;)V

    .line 106
    return-void
.end method
