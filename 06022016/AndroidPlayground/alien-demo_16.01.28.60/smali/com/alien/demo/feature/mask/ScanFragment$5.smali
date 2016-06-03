.class Lcom/alien/demo/feature/mask/ScanFragment$5;
.super Landroid/os/Handler;
.source "ScanFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/ScanFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/ScanFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/ScanFragment;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v9, 0x1

    .line 131
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "@"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, "params":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v0, v2, v7

    .line 134
    .local v0, "epc":Ljava/lang/String;
    aget-object v4, v2, v9

    .line 135
    .local v4, "rssi":Ljava/lang/String;
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # invokes: Lcom/alien/demo/feature/mask/ScanFragment;->getTagIndex(Ljava/lang/String;)I
    invoke-static {v7, v0}, Lcom/alien/demo/feature/mask/ScanFragment;->access$200(Lcom/alien/demo/feature/mask/ScanFragment;Ljava/lang/String;)I

    move-result v1

    .line 137
    .local v1, "index":I
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 138
    .local v5, "tagInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "tagEpc"

    invoke-virtual {v5, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v7, "tagCount"

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-string v7, "tagRssi"

    invoke-virtual {v5, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const/4 v7, -0x1

    if-ne v1, v7, :cond_1

    .line 143
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$000(Lcom/alien/demo/feature/mask/ScanFragment;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$400(Lcom/alien/demo/feature/mask/ScanFragment;)Landroid/widget/ListView;

    move-result-object v7

    iget-object v8, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->tagAdapter:Landroid/widget/SimpleAdapter;
    invoke-static {v8}, Lcom/alien/demo/feature/mask/ScanFragment;->access$300(Lcom/alien/demo/feature/mask/ScanFragment;)Landroid/widget/SimpleAdapter;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 145
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # invokes: Lcom/alien/demo/feature/mask/ScanFragment;->playDetectSound()V
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$500(Lcom/alien/demo/feature/mask/ScanFragment;)V

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 147
    :cond_1
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$000(Lcom/alien/demo/feature/mask/ScanFragment;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string v8, "tagCount"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const/16 v8, 0xa

    invoke-static {v7, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    add-int/lit8 v6, v7, 0x1

    .line 148
    .local v6, "tagcount":I
    const-string v7, "tagCount"

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$000(Lcom/alien/demo/feature/mask/ScanFragment;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v1, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 150
    move v3, v1

    .line 151
    .local v3, "pos":I
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$400(Lcom/alien/demo/feature/mask/ScanFragment;)Landroid/widget/ListView;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v7

    if-lt v1, v7, :cond_0

    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # getter for: Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;
    invoke-static {v7}, Lcom/alien/demo/feature/mask/ScanFragment;->access$400(Lcom/alien/demo/feature/mask/ScanFragment;)Landroid/widget/ListView;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v7

    if-gt v1, v7, :cond_0

    .line 152
    iget-object v7, p0, Lcom/alien/demo/feature/mask/ScanFragment$5;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    # invokes: Lcom/alien/demo/feature/mask/ScanFragment;->updateTagInfo(I)V
    invoke-static {v7, v3}, Lcom/alien/demo/feature/mask/ScanFragment;->access$600(Lcom/alien/demo/feature/mask/ScanFragment;I)V

    goto :goto_0
.end method
