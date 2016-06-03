.class Lcom/alien/demo/feature/mask/CustomFragment$1;
.super Ljava/lang/Object;
.source "CustomFragment.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


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
    .line 87
    iput-object p1, p0, Lcom/alien/demo/feature/mask/CustomFragment$1;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 1
    .param p1, "radioGroup"    # Landroid/widget/RadioGroup;
    .param p2, "i"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment$1;->this$0:Lcom/alien/demo/feature/mask/CustomFragment;

    # invokes: Lcom/alien/demo/feature/mask/CustomFragment;->onSpecifyGroupChanged(Landroid/widget/RadioGroup;I)V
    invoke-static {v0, p1, p2}, Lcom/alien/demo/feature/mask/CustomFragment;->access$000(Lcom/alien/demo/feature/mask/CustomFragment;Landroid/widget/RadioGroup;I)V

    .line 91
    return-void
.end method
