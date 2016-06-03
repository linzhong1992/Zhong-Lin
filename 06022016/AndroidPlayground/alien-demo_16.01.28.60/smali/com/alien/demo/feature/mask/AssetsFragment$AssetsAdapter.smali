.class Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;
.super Landroid/widget/ArrayAdapter;
.source "AssetsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/mask/AssetsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AssetsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/alien/demo/data/Asset;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/AssetsFragment;


# direct methods
.method public constructor <init>(Lcom/alien/demo/feature/mask/AssetsFragment;Landroid/content/Context;ILjava/util/List;)V
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
            "Lcom/alien/demo/data/Asset;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p4, "objects":Ljava/util/List;, "Ljava/util/List<Lcom/alien/demo/data/Asset;>;"
    iput-object p1, p0, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    .line 214
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 215
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 219
    iget-object v5, p0, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/AssetsFragment;->context:Landroid/app/Activity;
    invoke-static {v5}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$400(Lcom/alien/demo/feature/mask/AssetsFragment;)Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 220
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f030021

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 222
    const v5, 0x7f0c008b

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 223
    .local v4, "txtEpcId":Landroid/widget/TextView;
    const v5, 0x7f0c008c

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 224
    .local v3, "txtBarcode":Landroid/widget/TextView;
    const v5, 0x7f0c006e

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 226
    .local v2, "ivPhoto":Landroid/widget/ImageView;
    iget-object v5, p0, Lcom/alien/demo/feature/mask/AssetsFragment$AssetsAdapter;->this$0:Lcom/alien/demo/feature/mask/AssetsFragment;

    # getter for: Lcom/alien/demo/feature/mask/AssetsFragment;->assetsInfo:Lcom/alien/demo/feature/mask/AssetsInfo;
    invoke-static {v5}, Lcom/alien/demo/feature/mask/AssetsFragment;->access$200(Lcom/alien/demo/feature/mask/AssetsFragment;)Lcom/alien/demo/feature/mask/AssetsInfo;

    move-result-object v5

    invoke-virtual {v5}, Lcom/alien/demo/feature/mask/AssetsInfo;->getAssets()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    .line 227
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getBarcode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 231
    return-object p2
.end method
