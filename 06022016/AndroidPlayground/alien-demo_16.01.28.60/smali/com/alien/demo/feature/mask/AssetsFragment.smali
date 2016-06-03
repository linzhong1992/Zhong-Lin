.class public Lcom/alien/demo/feature/mask/AssetsFragment;
.super Lcom/alien/demo/uibase/BaseFragment;
.source "AssetsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Assets Tab"


# instance fields
.field private adapAssets:Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

.field private assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

.field private btnAdd:Landroid/widget/ImageButton;

.field private btnClear:Landroid/widget/Button;

.field private btnDelete:Landroid/widget/ImageButton;

.field private btnEdit:Landroid/widget/ImageButton;

.field private btnOk:Landroid/widget/Button;

.field private context:Landroid/app/Activity;

.field private lvAssets:Landroid/widget/ListView;

.field private outputFilter:Lcom/alien/demo/rfid/TagMask;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseFragment;-><init>()V

    .line 211
    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/mask/AssetsFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetsFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/AssetsFragment;->onClickOk(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/mask/AssetsFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetsFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/AssetsFragment;->onClickClear(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsInfo;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetsFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    return-object v0
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetsFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->adapAssets:Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/mask/AssetsFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetsFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    return-object v0
.end method

.method private onClickClear(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->lvAssets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 139
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/AssetsInfo;->setSelectedIndex(I)V

    .line 140
    return-void
.end method

.method private onClickOk(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v7, -0x1

    .line 119
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v2

    if-ltz v2, :cond_0

    .line 120
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    .line 121
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    sget-object v3, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    invoke-virtual {v3}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/alien/demo/rfid/TagMask;->setMaskedBank(I)V

    .line 122
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    sget-object v3, Lcom/alien/rfid/Bank;->EPC:Lcom/alien/rfid/Bank;

    invoke-virtual {v3}, Lcom/alien/rfid/Bank;->getValue()I

    move-result v3

    const/16 v4, 0x20

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    mul-int/lit8 v5, v5, 0x4

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/alien/demo/rfid/TagMask;->setMaskInfo(IIILjava/lang/String;)Z

    .line 124
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 125
    .local v1, "data":Landroid/content/Intent;
    const-string v2, "filter_data"

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v3}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 126
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v2, v7, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 134
    .end local v0    # "asset":Lcom/alien/demo/data/Asset;
    :goto_0
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 135
    return-void

    .line 129
    .end local v1    # "data":Landroid/content/Intent;
    :cond_0
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->clearMask()V

    .line 130
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 131
    .restart local v1    # "data":Landroid/content/Intent;
    const-string v2, "filter_data"

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v3}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v2, v7, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 57
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 59
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    .line 60
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    check-cast v0, Lcom/alien/demo/feature/mask/MaskInterface;

    invoke-interface {v0}, Lcom/alien/demo/feature/mask/MaskInterface;->getMaskInfo()Lcom/alien/demo/feature/mask/MaskInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/MaskInfo;->getAssetsInfo()Lcom/alien/demo/feature/mask/AssetsInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    .line 61
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/rfid/TagMask;->createFromString(Ljava/lang/String;)Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    .line 64
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b4

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->lvAssets:Landroid/widget/ListView;

    .line 66
    new-instance v0, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v2, 0x7f030021

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;Landroid/content/Context;ILjava/util/List;)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->adapAssets:Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

    .line 67
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->lvAssets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->adapAssets:Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 68
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->lvAssets:Landroid/widget/ListView;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$1;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 74
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->lvAssets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 75
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->lvAssets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 77
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnAdd:Landroid/widget/ImageButton;

    .line 78
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnAdd:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$2;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnEdit:Landroid/widget/ImageButton;

    .line 86
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnEdit:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment$3;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$3;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnDelete:Landroid/widget/ImageButton;

    .line 94
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnDelete:Landroid/widget/ImageButton;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment$4;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$4;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00af

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnOk:Landroid/widget/Button;

    .line 102
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnOk:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment$5;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$5;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00b0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnClear:Landroid/widget/Button;

    .line 110
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->btnClear:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetsFragment$6;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$6;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 145
    const/4 v2, 0x4

    if-ne p1, v2, :cond_0

    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    .line 146
    const-string v2, "asset_data"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/alien/demo/data/Asset;->loadFromString(Ljava/lang/String;)Lcom/alien/demo/data/Asset;

    move-result-object v0

    .line 148
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    :try_start_0
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2, v0}, Lcom/alien/demo/feature/mask/AssetsInfo;->add(Lcom/alien/demo/data/Asset;)V

    .line 149
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->save()V

    .line 150
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->adapAssets:Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    .end local v0    # "asset":Lcom/alien/demo/data/Asset;
    :cond_0
    :goto_0
    return-void

    .line 152
    .restart local v0    # "asset":Lcom/alien/demo/data/Asset;
    :catch_0
    move-exception v1

    .line 153
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "AlienRFID-Assets Tab"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error adding asset: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onAssetItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "l"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v0, p3}, Lcom/alien/demo/feature/mask/AssetsInfo;->setSelectedIndex(I)V

    .line 209
    return-void
.end method

.method public onClickAdd(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 160
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const-class v2, Lcom/alien/demo/feature/mask/AssetEditorActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 161
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/mask/AssetsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 162
    return-void
.end method

.method public onClickDelete(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 174
    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v3

    if-ltz v3, :cond_0

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v3

    iget-object v4, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v4}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 176
    new-instance v2, Lcom/alien/demo/feature/mask/AssetsFragment$7;

    invoke-direct {v2, p0}, Lcom/alien/demo/feature/mask/AssetsFragment$7;-><init>(Lcom/alien/demo/feature/mask/AssetsFragment;)V

    .line 200
    .local v2, "dialogClickListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v4}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    .line 201
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    invoke-direct {v1, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 202
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050021

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f05007d

    invoke-virtual {v3, v4, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f050054

    invoke-virtual {v3, v4, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 205
    .end local v0    # "asset":Lcom/alien/demo/data/Asset;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "dialogClickListener":Landroid/content/DialogInterface$OnClickListener;
    :cond_0
    return-void
.end method

.method public onClickEdit(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 165
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v2

    if-ltz v2, :cond_0

    .line 166
    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/AssetsInfo;->getSelectedIndex()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    .line 167
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;

    const-class v3, Lcom/alien/demo/feature/mask/AssetEditorActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 168
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "asset_data"

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 169
    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lcom/alien/demo/feature/mask/AssetsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 171
    .end local v0    # "asset":Lcom/alien/demo/data/Asset;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    const v0, 0x7f030031

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
