.class Lcom/alien/demo/feature/setting/SettingsActivity$5;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/setting/SettingsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/setting/SettingsActivity;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity$5;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 138
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$5;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # setter for: Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I
    invoke-static {v0, p2}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$402(Lcom/alien/demo/feature/setting/SettingsActivity;I)I

    .line 139
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$5;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # getter for: Lcom/alien/demo/feature/setting/SettingsActivity;->txtQValue:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$500(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$5;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # getter for: Lcom/alien/demo/feature/setting/SettingsActivity;->qvalue:I
    invoke-static {v2}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$400(Lcom/alien/demo/feature/setting/SettingsActivity;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 144
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 148
    return-void
.end method
