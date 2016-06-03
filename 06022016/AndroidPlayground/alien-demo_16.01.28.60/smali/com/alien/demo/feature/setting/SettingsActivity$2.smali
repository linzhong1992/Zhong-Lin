.class Lcom/alien/demo/feature/setting/SettingsActivity$2;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/setting/SettingsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastTouch:J

.field final synthetic this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

.field touchCount:I


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/setting/SettingsActivity;)V
    .locals 2

    .prologue
    .line 73
    iput-object p1, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->lastTouch:J

    .line 75
    const/4 v0, 0x0

    iput v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->touchCount:I

    return-void
.end method

.method private showHideSettings()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 78
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    iget-object v2, v0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    iget-object v0, v0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    invoke-virtual {v0}, Lcom/alien/demo/data/LocalSettings;->isShowHiddenSetting()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Lcom/alien/demo/data/LocalSettings;->setShowHiddenSetting(Z)V

    .line 79
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    iget-object v0, v0, Lcom/alien/demo/feature/setting/SettingsActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    invoke-virtual {v0}, Lcom/alien/demo/data/LocalSettings;->isShowHiddenSetting()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # getter for: Lcom/alien/demo/feature/setting/SettingsActivity;->localSettingsView:Landroid/view/View;
    invoke-static {v0}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$000(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 83
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 78
    goto :goto_0

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->this$0:Lcom/alien/demo/feature/setting/SettingsActivity;

    # getter for: Lcom/alien/demo/feature/setting/SettingsActivity;->localSettingsView:Landroid/view/View;
    invoke-static {v0}, Lcom/alien/demo/feature/setting/SettingsActivity;->access$000(Lcom/alien/demo/feature/setting/SettingsActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x0

    .line 87
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 88
    .local v0, "time":J
    iget-wide v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->lastTouch:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 89
    iput-wide v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->lastTouch:J

    .line 90
    const/4 v2, 0x1

    iput v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->touchCount:I

    .line 103
    :cond_0
    :goto_0
    return v6

    .line 94
    :cond_1
    iput-wide v0, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->lastTouch:J

    .line 95
    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->touchCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->touchCount:I

    .line 98
    iget v2, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->touchCount:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_0

    .line 99
    invoke-direct {p0}, Lcom/alien/demo/feature/setting/SettingsActivity$2;->showHideSettings()V

    .line 100
    iput v6, p0, Lcom/alien/demo/feature/setting/SettingsActivity$2;->touchCount:I

    goto :goto_0
.end method
