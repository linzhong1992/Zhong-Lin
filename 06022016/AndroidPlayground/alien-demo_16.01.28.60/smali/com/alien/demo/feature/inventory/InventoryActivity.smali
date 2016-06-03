.class public Lcom/alien/demo/feature/inventory/InventoryActivity;
.super Landroid/app/Activity;
.source "InventoryActivity.java"

# interfaces
.implements Lcom/alien/rfid/RFIDCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Inventory"

.field private static final TAG_COUNT:Ljava/lang/String; = "tagCount"

.field private static final TAG_EPC:Ljava/lang/String; = "tagEpc"

.field private static scanner:Lcom/alien/demo/rfid/TagScanner;


# instance fields
.field private btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

.field private context:Landroid/app/Activity;

.field private handler:Landroid/os/Handler;

.field private localSettings:Lcom/alien/demo/data/LocalSettings;

.field private lvTags:Landroid/widget/ListView;

.field private readCount:I

.field private startTime:J

.field private tagAdapter:Landroid/widget/SimpleAdapter;

.field private tagCount:I

.field private tagList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private txtMaskEpc:Landroid/widget/TextView;

.field private txtReadCount:Landroid/widget/TextView;

.field private txtTagCount:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 61
    iput v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    .line 62
    iput v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I

    .line 63
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->startTime:J

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/inventory/InventoryActivity;)Lcom/alien/demo/data/LocalSettings;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    return-object v0
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/inventory/InventoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    return v0
.end method

.method static synthetic access$108(Lcom/alien/demo/feature/inventory/InventoryActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    return v0
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/inventory/InventoryActivity;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getTagIndex(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/inventory/InventoryActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/widget/SimpleAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagAdapter:Landroid/widget/SimpleAdapter;

    return-object v0
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$608(Lcom/alien/demo/feature/inventory/InventoryActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I

    return v0
.end method

.method static synthetic access$700(Lcom/alien/demo/feature/inventory/InventoryActivity;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->context:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$800(Lcom/alien/demo/feature/inventory/InventoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/inventory/InventoryActivity;->updateTagInfo(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/alien/demo/feature/inventory/InventoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/inventory/InventoryActivity;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->updateCounts()V

    return-void
.end method

.method private addTag(Ljava/lang/String;)V
    .locals 2
    .param p1, "epc"    # Ljava/lang/String;

    .prologue
    .line 179
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 184
    :goto_0
    return-void

    .line 181
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 182
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 183
    iget-object v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method private getTagIndex(Ljava/lang/String;)I
    .locals 6
    .param p1, "epc"    # Ljava/lang/String;

    .prologue
    .line 147
    const/4 v1, -0x1

    .line 148
    .local v1, "index":I
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    move v2, v1

    .line 163
    .end local v1    # "index":I
    .local v2, "index":I
    :goto_0
    return v2

    .line 152
    .end local v2    # "index":I
    .restart local v1    # "index":I
    :cond_1
    const-string v3, ""

    .line 153
    .local v3, "tagEpc":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_2

    .line 154
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 155
    .local v4, "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    check-cast v4, Ljava/util/HashMap;

    .line 156
    .restart local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "tagEpc"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "tagEpc":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 157
    .restart local v3    # "tagEpc":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 158
    move v1, v0

    .end local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    move v2, v1

    .line 163
    .end local v1    # "index":I
    .restart local v2    # "index":I
    goto :goto_0

    .line 153
    .end local v2    # "index":I
    .restart local v1    # "index":I
    .restart local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private saveToFile(Ljava/lang/String;)V
    .locals 10
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const v9, 0x7f05004e

    .line 302
    :try_start_0
    new-instance v5, Ljava/io/OutputStreamWriter;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 303
    .local v5, "writer":Ljava/io/OutputStreamWriter;
    iget-object v6, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 304
    .local v4, "tagInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "tagEpc"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 305
    .local v2, "epc":Ljava/lang/String;
    const-string v6, "tagCount"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 306
    .local v0, "count":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\r\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 311
    .end local v0    # "count":Ljava/lang/String;
    .end local v2    # "epc":Ljava/lang/String;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "tagInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "writer":Ljava/io/OutputStreamWriter;
    :catch_0
    move-exception v1

    .line 312
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/alien/demo/uibase/UIHelper;->ToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 313
    const-string v6, "AlienRFID-Inventory"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error saving to file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 315
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f05004d

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/alien/demo/uibase/UIHelper;->ToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 317
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 308
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "writer":Ljava/io/OutputStreamWriter;
    :cond_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/OutputStreamWriter;->close()V

    .line 309
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f05004e

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/alien/demo/uibase/UIHelper;->ToastMessage(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 217
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 218
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f05006c

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 219
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->startAnimation()V

    .line 220
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->startTime:J

    .line 221
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->scan()V

    .line 223
    :cond_0
    return-void
.end method

.method private stopSearch()V
    .locals 2

    .prologue
    .line 226
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f05006b

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 228
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->stopAnimation()V

    .line 229
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0, p0}, Lcom/alien/demo/rfid/TagScanner;->stop(Landroid/content/Context;)V

    .line 231
    :cond_0
    return-void
.end method

.method private updateCounts()V
    .locals 12

    .prologue
    .line 258
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    invoke-virtual {v2}, Lcom/alien/demo/data/LocalSettings;->isDebugMode()Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    if-eqz v2, :cond_0

    .line 260
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->startTime:J

    sub-long v0, v2, v4

    .line 261
    .local v0, "duration":J
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtTagCount:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%.1f"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    long-to-double v8, v0

    const-wide v10, 0x408f400000000000L    # 1000.0

    div-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtReadCount:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .end local v0    # "duration":J
    :goto_0
    return-void

    .line 265
    :cond_0
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtTagCount:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtReadCount:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private updateMask()V
    .locals 3

    .prologue
    .line 248
    sget-object v1, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagMask;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "maskEpc":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtMaskEpc:Landroid/widget/TextView;

    const v2, 0x7f050020

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 255
    :goto_0
    return-void

    .line 253
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtMaskEpc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private updateTagInfo(I)V
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 167
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 168
    .local v1, "visiblePosition":I
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    sub-int v3, p1, v1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 169
    .local v0, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    invoke-interface {v2, p1, v0, v3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 170
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 273
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    if-ne p2, v2, :cond_1

    .line 274
    sget-object v1, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v1

    const-string v2, "filter_data"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/rfid/TagMask;->loadFromString(Ljava/lang/String;)V

    .line 275
    const-string v1, "AlienRFID-Inventory"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Set mask EPC: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v3}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v3

    invoke-virtual {v3}, Lcom/alien/demo/rfid/TagMask;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->updateMask()V

    .line 282
    :cond_0
    :goto_0
    return-void

    .line 278
    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    if-ne p2, v2, :cond_0

    .line 279
    const-string v1, "RESULT_PATH"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "filePath":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->saveToFile(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onClickClear(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 285
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->startTime:J

    .line 286
    const/4 v0, 0x0

    iput v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->readCount:I

    iput v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagCount:I

    .line 287
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 288
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 289
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->updateCounts()V

    .line 290
    return-void
.end method

.method public onClickMask(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 242
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/alien/demo/feature/mask/MaskActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 243
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "filter_data"

    sget-object v2, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagScanner;->getFilter()Lcom/alien/demo/rfid/TagMask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/inventory/InventoryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 245
    return-void
.end method

.method public onClickSave(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 293
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lamerman/FileDialog;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 294
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "START_PATH"

    const-string v2, "/sdcard"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 295
    const-string v1, "CAN_SELECT_DIR"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 297
    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/inventory/InventoryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 298
    return-void
.end method

.method public onClickStartStop(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 234
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 235
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->startSearch()V

    .line 239
    :goto_0
    return-void

    .line 237
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->stopSearch()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    .line 72
    iput-object p0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->context:Landroid/app/Activity;

    .line 73
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 74
    const v0, 0x7f03001d

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->setContentView(I)V

    .line 75
    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 76
    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 78
    new-instance v0, Lcom/alien/demo/data/LocalSettings;

    invoke-direct {v0}, Lcom/alien/demo/data/LocalSettings;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->localSettings:Lcom/alien/demo/data/LocalSettings;

    .line 80
    const v0, 0x7f0c007e

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtTagCount:Landroid/widget/TextView;

    .line 81
    const v0, 0x7f0c007f

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtReadCount:Landroid/widget/TextView;

    .line 82
    const v0, 0x7f0c0072

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->txtMaskEpc:Landroid/widget/TextView;

    .line 83
    const v0, 0x7f0c006f

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/dd/processbutton/iml/ActionProcessButton;

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    .line 85
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->context:Landroid/app/Activity;

    const v1, 0x7f0c0080

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    .line 88
    new-instance v0, Landroid/widget/SimpleAdapter;

    iget-object v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->context:Landroid/app/Activity;

    iget-object v2, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagList:Ljava/util/ArrayList;

    const v3, 0x7f030036

    new-array v4, v8, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "tagEpc"

    aput-object v6, v4, v5

    const-string v5, "tagCount"

    aput-object v5, v4, v7

    new-array v5, v8, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagAdapter:Landroid/widget/SimpleAdapter;

    .line 91
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->tagAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 92
    iget-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->lvTags:Landroid/widget/ListView;

    new-instance v1, Lcom/alien/demo/feature/inventory/InventoryActivity$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/inventory/InventoryActivity$1;-><init>(Lcom/alien/demo/feature/inventory/InventoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 102
    new-instance v0, Lcom/alien/demo/feature/inventory/InventoryActivity$2;

    invoke-direct {v0, p0}, Lcom/alien/demo/feature/inventory/InventoryActivity$2;-><init>(Lcom/alien/demo/feature/inventory/InventoryActivity;)V

    iput-object v0, p0, Lcom/alien/demo/feature/inventory/InventoryActivity;->handler:Landroid/os/Handler;

    .line 138
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    if-nez v0, :cond_1

    .line 139
    new-instance v0, Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {v0, p0}, Lcom/alien/demo/rfid/TagScanner;-><init>(Lcom/alien/rfid/RFIDCallback;)V

    sput-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    .line 143
    :goto_0
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->updateMask()V

    .line 144
    return-void

    .line 141
    :cond_1
    sget-object v0, Lcom/alien/demo/feature/inventory/InventoryActivity;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0, p0}, Lcom/alien/demo/rfid/TagScanner;->setListener(Lcom/alien/rfid/RFIDCallback;)V

    goto :goto_0

    .line 88
    nop

    :array_0
    .array-data 4
        0x7f0c00e2
        0x7f0c00e3
    .end array-data
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 190
    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0004

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 191
    const/4 v0, 0x1

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 321
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 322
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->startSearch()V

    .line 323
    const/4 v0, 0x1

    .line 325
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 330
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    .line 331
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->stopSearch()V

    .line 332
    const/4 v0, 0x1

    .line 334
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 199
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 201
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 207
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 203
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->onBackPressed()V

    .line 204
    const/4 v1, 0x1

    goto :goto_0

    .line 201
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 212
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 213
    invoke-direct {p0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->stopSearch()V

    .line 214
    return-void
.end method

.method public onTagRead(Lcom/alien/rfid/Tag;)V
    .locals 1
    .param p1, "tag"    # Lcom/alien/rfid/Tag;

    .prologue
    .line 175
    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/alien/demo/feature/inventory/InventoryActivity;->addTag(Ljava/lang/String;)V

    .line 176
    return-void
.end method
