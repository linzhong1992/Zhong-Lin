.class Lcom/alien/demo/feature/inventory/InventoryActivity$2;
.super Landroid/os/Handler;
.source "InventoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/inventory/InventoryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/inventory/InventoryActivity;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 105
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$000(Lcom/alien/demo/feature/inventory/InventoryActivity;)Lcom/alien/demo/data/LocalSettings;

    move-result-object v5

    invoke-virtual {v5}, Lcom/alien/demo/data/LocalSettings;->isDebugMode()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 107
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$100(Lcom/alien/demo/feature/inventory/InventoryActivity;)I

    move-result v5

    const/16 v6, 0x32

    if-lt v5, v6, :cond_0

    .line 135
    :goto_0
    return-void

    .line 111
    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 112
    .local v0, "epc":Ljava/lang/String;
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # invokes: Lcom/alien/demo/feature/inventory/InventoryActivity;->getTagIndex(Ljava/lang/String;)I
    invoke-static {v5, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$200(Lcom/alien/demo/feature/inventory/InventoryActivity;Ljava/lang/String;)I

    move-result v1

    .line 114
    .local v1, "index":I
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 115
    .local v3, "tagInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "tagEpc"

    invoke-virtual {v3, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v5, "tagCount"

    const-string v6, "1"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const/4 v5, -0x1

    if-ne v1, v5, :cond_2

    .line 119
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$300(Lcom/alien/demo/feature/inventory/InventoryActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$500(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/widget/ListView;

    move-result-object v5

    iget-object v6, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->tagAdapter:Landroid/widget/SimpleAdapter;
    invoke-static {v6}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$400(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/widget/SimpleAdapter;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 121
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # operator++ for: Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$108(Lcom/alien/demo/feature/inventory/InventoryActivity;)I

    .line 122
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # operator++ for: Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$608(Lcom/alien/demo/feature/inventory/InventoryActivity;)I

    .line 123
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->context:Landroid/app/Activity;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$700(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V

    .line 134
    :cond_1
    :goto_1
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # invokes: Lcom/alien/demo/feature/inventory/InventoryActivity;->updateCounts()V
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$900(Lcom/alien/demo/feature/inventory/InventoryActivity;)V

    goto :goto_0

    .line 125
    :cond_2
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$300(Lcom/alien/demo/feature/inventory/InventoryActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string v6, "tagCount"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/16 v6, 0xa

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    add-int/lit8 v4, v5, 0x1

    .line 126
    .local v4, "tagcount":I
    const-string v5, "tagCount"

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$300(Lcom/alien/demo/feature/inventory/InventoryActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v1, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 128
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # operator++ for: Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$608(Lcom/alien/demo/feature/inventory/InventoryActivity;)I

    .line 129
    move v2, v1

    .line 130
    .local v2, "pos":I
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$500(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v5

    if-lt v1, v5, :cond_1

    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # getter for: Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;
    invoke-static {v5}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$500(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v5

    if-gt v1, v5, :cond_1

    .line 131
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;->this$0:Lcom/alien/demo/feature/inventory/InventoryActivity;

    # invokes: Lcom/alien/demo/feature/inventory/InventoryActivity;->updateTagInfo(I)V
    invoke-static {v5, v2}, Lcom/alien/demo/feature/inventory/InventoryActivity;->access$800(Lcom/alien/demo/feature/inventory/InventoryActivity;I)V

    goto :goto_1
.end method
