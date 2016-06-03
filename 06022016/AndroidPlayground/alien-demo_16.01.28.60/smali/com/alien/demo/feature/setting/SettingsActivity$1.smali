.class Lcom/alien/demo/feature/setting/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .line 63
    iput-object p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity$1;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 66
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$1;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    iget-object v0, v0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    invoke-virtual {v0, p2}, Lcom/alien/demo/data/LocalSettings;->setDebugMode(Z)V

    .line 67
    return-void
.end method
