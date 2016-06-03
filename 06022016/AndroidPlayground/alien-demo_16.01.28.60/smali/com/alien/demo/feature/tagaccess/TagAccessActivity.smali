.class public Lcom/alien/demo/feature/tagaccess/TagAccessActivity;
.super Lcom/alien/demo/uibase/BaseTabFragmentActivity;
.source "TagAccessActivity.java"


# static fields
.field private static scanner:Lcom/alien/demo/rfid/TagScanner;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected initViewPageData()V
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->lstFrg:Ljava/util/List;

    sget-object v1, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;->newInstance(Lcom/alien/demo/rfid/TagScanner;)Lcom/alien/demo/feature/tagaccess/BasicAccessFragment;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->lstFrg:Ljava/util/List;

    sget-object v1, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-static {v1}, Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;->newInstance(Lcom/alien/demo/rfid/TagScanner;)Lcom/alien/demo/feature/tagaccess/AdvancedAccessFragment;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->lstTitles:Ljava/util/List;

    const v1, 0x7f05006e

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    iget-object v0, p0, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->lstTitles:Ljava/util/List;

    const v1, 0x7f05006d

    invoke-virtual {p0, v1}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 20
    const v0, 0x7f030020

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->setContentView(I)V

    .line 21
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 22
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 23
    sget-object v0, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Lcom/alien/demo/rfid/TagScanner;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/alien/demo/rfid/TagScanner;-><init>(Lcom/alien/rfid/RFIDCallback;)V

    sput-object v0, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->initViewPageData()V

    .line 26
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->initViewPager()V

    .line 27
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->initTabs()V

    .line 28
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0007

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 34
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 62
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 64
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 70
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 66
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;->onBackPressed()V

    .line 67
    const/4 v1, 0x1

    goto :goto_0

    .line 64
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 39
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onPause()V

    .line 40
    return-void
.end method

.method protected onTabChanged(I)V
    .locals 0
    .param p1, "tab"    # I

    .prologue
    .line 53
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onTabChanged(I)V

    .line 54
    return-void
.end method
