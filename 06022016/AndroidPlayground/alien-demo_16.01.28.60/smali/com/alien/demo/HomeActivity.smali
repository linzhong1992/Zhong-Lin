.class public Lcom/alien/demo/HomeActivity;
.super Landroid/app/Activity;
.source "HomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/HomeActivity$InitTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Home"


# instance fields
.field private txtModel:Landroid/widget/TextView;

.field private txtVersion:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 76
    return-void
.end method


# virtual methods
.method public onClickBarcode(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 142
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/alien/demo/feature/barcode/BarcodeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 143
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/alien/demo/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 144
    return-void
.end method

.method public onClickGeiger(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 137
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/alien/demo/feature/geiger/GeigerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 138
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/alien/demo/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 139
    return-void
.end method

.method public onClickInventory(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 127
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/alien/demo/feature/inventory/InventoryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 128
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/alien/demo/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 129
    return-void
.end method

.method public onClickTagAccess(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 132
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/alien/demo/feature/tagaccess/TagAccessActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 133
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/alien/demo/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 134
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const v1, 0x7f03001c

    invoke-virtual {p0, v1}, Lcom/alien/demo/HomeActivity;->setContentView(I)V

    .line 37
    invoke-virtual {p0}, Lcom/alien/demo/HomeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 38
    const v1, 0x7f0c007c

    invoke-virtual {p0, v1}, Lcom/alien/demo/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/alien/demo/HomeActivity;->txtModel:Landroid/widget/TextView;

    .line 39
    const v1, 0x7f0c007d

    invoke-virtual {p0, v1}, Lcom/alien/demo/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/alien/demo/HomeActivity;->txtVersion:Landroid/widget/TextView;

    .line 40
    iget-object v1, p0, Lcom/alien/demo/HomeActivity;->txtVersion:Landroid/widget/TextView;

    const-string v2, "v16.01.28.60"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    new-instance v0, Lcom/alien/common/DeviceInfo;

    invoke-direct {v0, p0}, Lcom/alien/common/DeviceInfo;-><init>(Landroid/content/Context;)V

    .line 42
    .local v0, "deviceInfo":Lcom/alien/common/DeviceInfo;
    iget-object v1, p0, Lcom/alien/demo/HomeActivity;->txtModel:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/alien/common/DeviceInfo;->getModel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    new-instance v1, Lcom/alien/demo/HomeActivity$InitTask;

    invoke-direct {v1, p0}, Lcom/alien/demo/HomeActivity$InitTask;-><init>(Lcom/alien/demo/HomeActivity;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/alien/demo/HomeActivity$InitTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 45
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/alien/demo/HomeActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 58
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 49
    invoke-static {}, Lcom/alien/demo/rfid/TagScanner;->deinit()V

    .line 50
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 51
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 66
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 68
    .local v0, "id":I
    const v2, 0x7f0c00f7

    if-ne v0, v2, :cond_0

    .line 69
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/alien/demo/feature/setting/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 70
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/alien/demo/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 73
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2
.end method
