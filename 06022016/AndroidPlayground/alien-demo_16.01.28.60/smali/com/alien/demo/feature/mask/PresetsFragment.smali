.class public Lcom/alien/demo/feature/mask/PresetsFragment;
.super Lcom/alien/demo/uibase/BaseFragment;
.source "PresetsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;
    }
.end annotation


# static fields
.field private static final REQUEST_SELECT_FILE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AlienRFID-Mask Presets"


# instance fields
.field private adapPresets:Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;

.field private btnClear:Landroid/widget/Button;

.field private btnLoad:Landroid/widget/Button;

.field private btnOk:Landroid/widget/Button;

.field private context:Landroid/app/Activity;

.field private lvPresets:Landroid/widget/ListView;

.field private outputFilter:Lcom/alien/demo/rfid/TagMask;

.field private presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseFragment;-><init>()V

    .line 166
    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/mask/PresetsFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/PresetsFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/PresetsFragment;->onClickLoad(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/mask/PresetsFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/PresetsFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/PresetsFragment;->onClickOk(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/mask/PresetsFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/PresetsFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/PresetsFragment;->onClickClear(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/mask/PresetsFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/PresetsFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/mask/PresetsFragment;)Lcom/alien/demo/feature/mask/PresetsInfo;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/PresetsFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    return-object v0
.end method

.method private loadPreset(Landroid/net/Uri;)V
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 147
    iget-object v5, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v5}, Lcom/alien/demo/feature/mask/PresetsInfo;->getItems()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 149
    :try_start_0
    iget-object v5, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    .line 150
    .local v1, "in":Ljava/io/InputStream;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 151
    .local v4, "reader":Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 152
    .local v3, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 153
    const-string v5, "#"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 155
    invoke-static {v3}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->fromString(Ljava/lang/String;)Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;

    move-result-object v2

    .line 156
    .local v2, "item":Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    iget-object v5, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v5}, Lcom/alien/demo/feature/mask/PresetsInfo;->getItems()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 158
    .end local v1    # "in":Ljava/io/InputStream;
    .end local v2    # "item":Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "AlienRFID-Mask Presets"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error load preset files: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 161
    iget-object v5, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v6, 0x7f05004c

    invoke-static {v5, v6}, Lcom/alien/demo/uibase/UIHelper;->ToastMessage(Landroid/content/Context;I)V

    .line 163
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v5, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->adapPresets:Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;

    invoke-virtual {v5}, Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;->notifyDataSetChanged()V

    .line 164
    return-void
.end method

.method private onClickClear(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->lvPresets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo;->getSelectedItem()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 131
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/PresetsInfo;->setSelectedItem(I)V

    .line 132
    return-void
.end method

.method private onClickLoad(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 99
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 100
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 101
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 104
    :try_start_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/PresetsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f05004a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/alien/demo/feature/mask/PresetsFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    :goto_0
    return-void

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "ex":Landroid/content/ActivityNotFoundException;
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v3, 0x7f050049

    invoke-static {v2, v3}, Lcom/alien/demo/uibase/UIHelper;->ToastMessage(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method private onClickOk(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v7, -0x1

    .line 111
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/PresetsInfo;->getItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/PresetsInfo;->getSelectedItem()I

    move-result v2

    if-ltz v2, :cond_0

    .line 112
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/PresetsInfo;->getItems()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/PresetsInfo;->getSelectedItem()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;

    .line 113
    .local v1, "item":Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getBank()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/alien/demo/rfid/TagMask;->setMaskedBank(I)V

    .line 114
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getBank()I

    move-result v3

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getPtr()I

    move-result v4

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getLen()I

    move-result v5

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getData()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/alien/demo/rfid/TagMask;->setMaskInfo(IIILjava/lang/String;)Z

    .line 116
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 117
    .local v0, "data":Landroid/content/Intent;
    const-string v2, "filter_data"

    iget-object v3, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v3}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 118
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    iget-object v3, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v2, v7, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 126
    .end local v1    # "item":Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    :goto_0
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 127
    return-void

    .line 121
    .end local v0    # "data":Landroid/content/Intent;
    :cond_0
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->clearMask()V

    .line 122
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 123
    .restart local v0    # "data":Landroid/content/Intent;
    const-string v2, "filter_data"

    iget-object v3, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v3}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 124
    iget-object v2, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    iget-object v3, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v2, v7, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 55
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/PresetsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    .line 56
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    check-cast v0, Lcom/alien/demo/feature/mask/MaskInterface;

    invoke-interface {v0}, Lcom/alien/demo/feature/mask/MaskInterface;->getMaskInfo()Lcom/alien/demo/feature/mask/MaskInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/MaskInfo;->getPresetsInfo()Lcom/alien/demo/feature/mask/PresetsInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    .line 57
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/rfid/TagMask;->createFromString(Ljava/lang/String;)Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    .line 60
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->lvPresets:Landroid/widget/ListView;

    .line 62
    new-instance v0, Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v2, 0x7f030040

    iget-object v3, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/PresetsInfo;->getItems()Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;-><init>(Lcom/alien/demo/feature/mask/PresetsFragment;Landroid/content/Context;ILjava/util/List;)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->adapPresets:Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;

    .line 63
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->lvPresets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->adapPresets:Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 64
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->lvPresets:Landroid/widget/ListView;

    new-instance v1, Lcom/alien/demo/feature/mask/PresetsFragment$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/PresetsFragment$1;-><init>(Lcom/alien/demo/feature/mask/PresetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 70
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->lvPresets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo;->getSelectedItem()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 71
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->lvPresets:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo;->getSelectedItem()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 73
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d5

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->btnLoad:Landroid/widget/Button;

    .line 74
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->btnLoad:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/PresetsFragment$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/PresetsFragment$2;-><init>(Lcom/alien/demo/feature/mask/PresetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d6

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->btnOk:Landroid/widget/Button;

    .line 82
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->btnOk:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/PresetsFragment$3;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/PresetsFragment$3;-><init>(Lcom/alien/demo/feature/mask/PresetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d7

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->btnClear:Landroid/widget/Button;

    .line 90
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->btnClear:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/PresetsFragment$4;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/PresetsFragment$4;-><init>(Lcom/alien/demo/feature/mask/PresetsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 141
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 142
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/alien/demo/feature/mask/PresetsFragment;->loadPreset(Landroid/net/Uri;)V

    .line 144
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    const v0, 0x7f030034

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onPresetItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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
    .line 135
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;

    invoke-virtual {v0, p3}, Lcom/alien/demo/feature/mask/PresetsInfo;->setSelectedItem(I)V

    .line 136
    return-void
.end method
