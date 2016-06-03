.class Lcom/alien/demo/feature/setting/SettingsActivity$3;
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
    .line 108
    iput-object p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity$3;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

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
    .line 111
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$3;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    add-int/lit8 v1, p2, 0x1

    # setter for: Lcom/alien/demo/feature/setting/SettingsActivity;->power:I
    invoke-static {v0, v1}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$102(Lcom/alien/demo/feature/setting/SettingsActivity;I)I

    .line 112
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$3;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # getter for: Lcom/alien/demo/feature/setting/SettingsActivity;->txtPower:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$200(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$3;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # getter for: Lcom/alien/demo/feature/setting/SettingsActivity;->power:I
    invoke-static {v2}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$100(Lcom/alien/demo/feature/setting/SettingsActivity;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dBm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 117
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 121
    return-void
.end method
