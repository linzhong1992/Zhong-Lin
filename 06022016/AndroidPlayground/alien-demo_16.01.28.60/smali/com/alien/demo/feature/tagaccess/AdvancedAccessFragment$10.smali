.class Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;
.super Ljava/lang/Object;
.source "AdvancedAccessFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->lockField()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)V
    .locals 0

    .prologue
    .line 253
    iput-object p1, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 256
    packed-switch p2, :pswitch_data_0

    .line 302
    :goto_0
    return-void

    .line 260
    :pswitch_0
    :try_start_0
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockField:Landroid/widget/Spinner;
    invoke-static {v4}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$600(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/Spinner;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getField(Landroid/widget/Spinner;)Lcom/alien/rfid/LockFields;

    move-result-object v1

    .line 262
    .local v1, "fields":Lcom/alien/rfid/LockFields;
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->spLockType:Landroid/widget/Spinner;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$700(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/widget/Spinner;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    packed-switch v3, :pswitch_data_1

    .line 289
    :cond_0
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$100(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 291
    .end local v1    # "fields":Lcom/alien/rfid/LockFields;
    :catch_0
    move-exception v0

    .line 292
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "AlienRFID-Adv Access"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error lock field: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 294
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->context:Landroid/app/Activity;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$100(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V

    goto :goto_0

    .line 264
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "fields":Lcom/alien/rfid/LockFields;
    :pswitch_1
    :try_start_1
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$900(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Lcom/alien/demo/rfid/TagScanner;

    move-result-object v3

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;
    invoke-static {v4}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$800(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lcom/alien/demo/rfid/TagScanner;->lock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 265
    .local v2, "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_0

    .line 266
    new-instance v3, Lcom/alien/rfid/ReaderException;

    const-string v4, "Operation result is false"

    invoke-direct {v3, v4}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 270
    .end local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :pswitch_2
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$900(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Lcom/alien/demo/rfid/TagScanner;

    move-result-object v3

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;
    invoke-static {v4}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$800(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lcom/alien/demo/rfid/TagScanner;->unlock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 271
    .restart local v2    # "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_0

    .line 272
    new-instance v3, Lcom/alien/rfid/ReaderException;

    const-string v4, "Operation result is false"

    invoke-direct {v3, v4}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 276
    .end local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :pswitch_3
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$900(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Lcom/alien/demo/rfid/TagScanner;

    move-result-object v3

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;
    invoke-static {v4}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$800(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lcom/alien/demo/rfid/TagScanner;->permaLock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 277
    .restart local v2    # "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_0

    .line 278
    new-instance v3, Lcom/alien/rfid/ReaderException;

    const-string v4, "Operation result is false"

    invoke-direct {v3, v4}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 282
    .end local v2    # "result":Lcom/alien/rfid/RFIDResult;
    :pswitch_4
    iget-object v3, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # getter for: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;
    invoke-static {v3}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$900(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Lcom/alien/demo/rfid/TagScanner;

    move-result-object v3

    iget-object v4, p0, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment$10;->this$0:Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    # invokes: Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->getAccessPwd()Ljava/lang/String;
    invoke-static {v4}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->access$800(Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lcom/alien/demo/rfid/TagScanner;->permaUnlock(Lcom/alien/rfid/LockFields;Ljava/lang/String;)Lcom/alien/rfid/RFIDResult;

    move-result-object v2

    .line 283
    .restart local v2    # "result":Lcom/alien/rfid/RFIDResult;
    invoke-virtual {v2}, Lcom/alien/rfid/RFIDResult;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_0

    .line 284
    new-instance v3, Lcom/alien/rfid/ReaderException;

    const-string v4, "Operation result is false"

    invoke-direct {v3, v4}, Lcom/alien/rfid/ReaderException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 256
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch

    .line 262
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
