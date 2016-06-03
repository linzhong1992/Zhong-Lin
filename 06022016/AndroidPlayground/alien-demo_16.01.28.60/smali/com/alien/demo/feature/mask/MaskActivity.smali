.class public Lcom/alien/demo/feature/mask/MaskActivity;
.super Lcom/alien/demo/uibase/BaseTabFragmentActivity;
.source "MaskActivity.java"

# interfaces
.implements Lcom/alien/demo/feature/mask/MaskInterface;


# instance fields
.field private maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

.field private ref:Lcom/alien/demo/data/ComplexPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getMaskInfo()Lcom/alien/demo/feature/mask/MaskInfo;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

    return-object v0
.end method

.method protected initViewPageData()V
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstFrg:Ljava/util/List;

    new-instance v1, Lcom/alien/demo/feature/mask/ScanFragment;

    invoke-direct {v1}, Lcom/alien/demo/feature/mask/ScanFragment;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstFrg:Ljava/util/List;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment;

    invoke-direct {v1}, Lcom/alien/demo/feature/mask/CustomFragment;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstFrg:Ljava/util/List;

    new-instance v1, Lcom/alien/demo/feature/mask/PresetsFragment;

    invoke-direct {v1}, Lcom/alien/demo/feature/mask/PresetsFragment;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstFrg:Ljava/util/List;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment;

    invoke-direct {v1}, Lcom/alien/demo/feature/mask/AssetsFragment;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstTitles:Ljava/util/List;

    const v1, 0x7f050047

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/mask/MaskActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstTitles:Ljava/util/List;

    const v1, 0x7f050048

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/mask/MaskActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstTitles:Ljava/util/List;

    const v1, 0x7f050046

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/mask/MaskActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->lstTitles:Ljava/util/List;

    const v1, 0x7f050045

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/mask/MaskActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    const-string v1, "mask_info"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/alien/demo/data/ComplexPreferences;->getComplexPreferences(Landroid/content/Context;Ljava/lang/String;I)Lcom/alien/demo/data/ComplexPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/alien/demo/feature/mask/MaskActivity;->ref:Lcom/alien/demo/data/ComplexPreferences;

    .line 30
    iget-object v1, p0, Lcom/alien/demo/feature/mask/MaskActivity;->ref:Lcom/alien/demo/data/ComplexPreferences;

    const-string v2, "mask_info"

    const-class v3, Lcom/alien/demo/feature/mask/MaskInfo;

    invoke-virtual {v1, v2, v3}, Lcom/alien/demo/data/ComplexPreferences;->getObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 31
    .local v0, "info":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 32
    check-cast v0, Lcom/alien/demo/feature/mask/MaskInfo;

    .end local v0    # "info":Ljava/lang/Object;
    iput-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

    .line 38
    :goto_0
    const v1, 0x7f03001e

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/mask/MaskActivity;->setContentView(I)V

    .line 39
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/MaskActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 41
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/MaskActivity;->initViewPageData()V

    .line 42
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/MaskActivity;->initViewPager()V

    .line 43
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/MaskActivity;->initTabs()V

    .line 44
    return-void

    .line 35
    .restart local v0    # "info":Ljava/lang/Object;
    :cond_0
    new-instance v1, Lcom/alien/demo/feature/mask/MaskInfo;

    invoke-direct {v1}, Lcom/alien/demo/feature/mask/MaskInfo;-><init>()V

    iput-object v1, p0, Lcom/alien/demo/feature/mask/MaskActivity;->maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/MaskActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0005

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 76
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 84
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 86
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 92
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 88
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/MaskActivity;->onBackPressed()V

    .line 89
    const/4 v1, 0x1

    goto :goto_0

    .line 86
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 48
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onPause()V

    .line 49
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->ref:Lcom/alien/demo/data/ComplexPreferences;

    const-string v1, "mask_info"

    iget-object v2, p0, Lcom/alien/demo/feature/mask/MaskActivity;->maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

    invoke-virtual {v0, v1, v2}, Lcom/alien/demo/data/ComplexPreferences;->putObject(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->ref:Lcom/alien/demo/data/ComplexPreferences;

    invoke-virtual {v0}, Lcom/alien/demo/data/ComplexPreferences;->commit()V

    .line 51
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onResume()V

    .line 22
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/MaskInfo;->getMaskMode()Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->getValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/MaskActivity;->selectFragment(I)V

    .line 23
    return-void
.end method

.method protected onTabChanged(I)V
    .locals 2
    .param p1, "tab"    # I

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onTabChanged(I)V

    .line 69
    iget-object v0, p0, Lcom/alien/demo/feature/mask/MaskActivity;->maskInfo:Lcom/alien/demo/feature/mask/MaskInfo;

    invoke-static {p1}, Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;->fromInt(I)Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/MaskInfo;->setMaskMode(Lcom/alien/demo/feature/mask/MaskInfo$MaskModeEnum;)V

    .line 70
    return-void
.end method
