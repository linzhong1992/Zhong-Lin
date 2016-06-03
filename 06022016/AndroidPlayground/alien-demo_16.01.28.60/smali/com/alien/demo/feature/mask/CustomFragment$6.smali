.class Lcom/alien/demo/feature/mask/CustomFragment$6;
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
    .line 161
    iput-object p1, p0, Lcom/alien/demo/feature/mask/CustomFragment$6;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 173
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 164
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 168
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment$6;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    # invokes: Lcom/alien/demo/feature/mask/CustomFragment;->onArbitraryDataChanged(Ljava/lang/CharSequence;)V
    invoke-static {v0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->access$500(Lcom/alien/demo/feature/mask/CustomFragment;Ljava/lang/CharSequence;)V

    .line 169
    return-void
.end method
