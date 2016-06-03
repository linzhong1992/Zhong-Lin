.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->readData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

.field final synthetic val$result:Lcom/alien/rfid/RFIDResult;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;Lcom/alien/rfid/RFIDResult;)V
    .locals 0

    .prologue
    .line 175
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    iput-object p2, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;->val$result:Lcom/alien/rfid/RFIDResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$500(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;->val$result:Lcom/alien/rfid/RFIDResult;

    invoke-virtual {v0}, Lcom/alien/rfid/RFIDResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 179
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$500(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/EditText;

    move-result-object v0

    const v1, 0x7f02004a

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 180
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$6;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->etData:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$500(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/EditText;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/uibase/UIHelper;->flashingView(Landroid/view/View;)V

    .line 181
    return-void
.end method
