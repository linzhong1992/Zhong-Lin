.class Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;
.super Landroid/widget/ArrayAdapter;
.source "PresetsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/mask/PresetsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PresetsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/PresetsFragment;


# direct methods
.method public constructor <init>(Lcom/alien/demo/feature/mask/PresetsFragment;Landroid/content/Context;ILjava/util/List;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "textViewResourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p4, "objects":Ljava/util/List;, "Ljava/util/List<Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;>;"
    iput-object p1, p0, Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    .line 169
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 170
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 174
    iget-object v4, p0, Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/PresetsFragment;->context:Landroid/app/Activity;
    invoke-static {v4}, Lcom/alien/demo/feature/mask/PresetsFragment;->access$300(Lcom/alien/demo/feature/mask/PresetsFragment;)Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 175
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f030040

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 177
    const v4, 0x7f0c00f3

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 178
    .local v3, "txtPresetName":Landroid/widget/TextView;
    const v4, 0x7f0c00f4

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 180
    .local v2, "txtPresetDetail":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/alien/demo/feature/mask/PresetsFragment$PresetsAdapter;->this$0:Lcom/alien/demo/feature/mask/PresetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/PresetsFragment;->presetsInfo:Lcom/alien/demo/feature/mask/PresetsInfo;
    invoke-static {v4}, Lcom/alien/demo/feature/mask/PresetsFragment;->access$400(Lcom/alien/demo/feature/mask/PresetsFragment;)Lcom/alien/demo/feature/mask/PresetsInfo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/alien/demo/feature/mask/PresetsInfo;->getItems()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;

    .line 181
    .local v1, "item":Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;
    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/alien/demo/Constants$Bank;->NAMES:[Ljava/lang/String;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getBank()I

    move-result v6

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getPtr()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getLen()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/PresetsInfo$PresetItem;->getData()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    return-object p2
.end method
