.class public Lcom/alien/demo/feature/mask/ScanFragment;
.super Lcom/alien/demo/uibase/BaseFragment;
.source "ScanFragment.java"

# interfaces
.implements Lcom/alien/rfid/RFIDCallback;


# static fields
.field private static final DETECT_SOUND:Ljava/lang/String; = "detect_snd.mp3"

.field public static final FILTER_DATA:Ljava/lang/String; = "filter_data"

.field private static final TAG:Ljava/lang/String; = "AlienRFID-Mask Scan"

.field private static final TAG_COUNT:Ljava/lang/String; = "tagCount"

.field private static final TAG_EPC:Ljava/lang/String; = "tagEpc"

.field private static final TAG_LEN:Ljava/lang/String; = "tagLen"

.field private static final TAG_RSSI:Ljava/lang/String; = "tagRssi"


# instance fields
.field private btnClear:Landroid/widget/Button;

.field private btnOK:Landroid/widget/Button;

.field private btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

.field private context:Landroid/app/Activity;

.field private handler:Landroid/os/Handler;

.field private lvTags:Landroid/widget/ListView;

.field private outputFilter:Lcom/alien/demo/rfid/TagMask;

.field private scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

.field private scanner:Lcom/alien/demo/rfid/TagScanner;

.field private tagAdapter:Landroid/widget/SimpleAdapter;

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

.field private txtMask:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/mask/ScanFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/mask/ScanFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/ScanFragment;->updateMaskEpc(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/mask/ScanFragment;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/ScanFragment;->getTagIndex(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/mask/ScanFragment;)Landroid/widget/SimpleAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagAdapter:Landroid/widget/SimpleAdapter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/mask/ScanFragment;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/mask/ScanFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->playDetectSound()V

    return-void
.end method

.method static synthetic access$600(Lcom/alien/demo/feature/mask/ScanFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/ScanFragment;
    .param p1, "x1"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/ScanFragment;->updateTagInfo(I)V

    return-void
.end method

.method private addTag(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "epc"    # Ljava/lang/String;
    .param p2, "rssi"    # Ljava/lang/String;

    .prologue
    .line 281
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 286
    :goto_0
    return-void

    .line 283
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 284
    .local v0, "msg":Landroid/os/Message;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 285
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method private getTagIndex(Ljava/lang/String;)I
    .locals 6
    .param p1, "epc"    # Ljava/lang/String;

    .prologue
    .line 261
    const/4 v1, -0x1

    .line 262
    .local v1, "index":I
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    move v2, v1

    .line 277
    .end local v1    # "index":I
    .local v2, "index":I
    :goto_0
    return v2

    .line 266
    .end local v2    # "index":I
    .restart local v1    # "index":I
    :cond_1
    const-string v3, ""

    .line 267
    .local v3, "tagEpc":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v5, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_2

    .line 268
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 269
    .local v4, "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    check-cast v4, Ljava/util/HashMap;

    .line 270
    .restart local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "tagEpc"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "tagEpc":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 271
    .restart local v3    # "tagEpc":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 272
    move v1, v0

    .end local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    move v2, v1

    .line 277
    .end local v1    # "index":I
    .restart local v2    # "index":I
    goto :goto_0

    .line 267
    .end local v2    # "index":I
    .restart local v1    # "index":I
    .restart local v4    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private playDetectSound()V
    .locals 8

    .prologue
    .line 241
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 242
    .local v0, "mMediaPlayer":Landroid/media/MediaPlayer;
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "detect_snd.mp3"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 243
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 244
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 245
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 246
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 247
    new-instance v1, Lcom/alien/demo/feature/mask/ScanFragment$6;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/ScanFragment$6;-><init>(Lcom/alien/demo/feature/mask/ScanFragment;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .end local v0    # "mMediaPlayer":Landroid/media/MediaPlayer;
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :goto_0
    return-void

    .line 254
    :catch_0
    move-exception v7

    .line 255
    .local v7, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Mask Scan"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error play sound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private refreshMask()V
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/ScanInfo;->getMaskedEpc()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->txtMask:Landroid/widget/TextView;

    const v1, 0x7f050020

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 211
    :goto_0
    return-void

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->txtMask:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/ScanInfo;->getMaskedEpc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private startScan()V
    .locals 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f050041

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 178
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->startAnimation()V

    .line 179
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->scan()V

    .line 181
    :cond_0
    return-void
.end method

.method private startStopScan()V
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 193
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->startScan()V

    .line 198
    :goto_0
    return-void

    .line 196
    :cond_0
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->stopScan()V

    goto :goto_0
.end method

.method private stopScan()V
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v0}, Lcom/alien/demo/rfid/TagScanner;->isScanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    const v1, 0x7f050040

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setText(I)V

    .line 186
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->stopAnimation()V

    .line 187
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/rfid/TagScanner;->stop(Landroid/content/Context;)V

    .line 189
    :cond_0
    return-void
.end method

.method private updateMaskEpc(Ljava/lang/String;)V
    .locals 1
    .param p1, "mask"    # Ljava/lang/String;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v0, p1}, Lcom/alien/demo/feature/mask/ScanInfo;->setMaskedEpc(Ljava/lang/String;)V

    .line 215
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->refreshMask()V

    .line 216
    return-void
.end method

.method private updateTagInfo(I)V
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 170
    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 171
    .local v1, "visiblePosition":I
    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    sub-int v3, p1, v1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 172
    .local v0, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    invoke-interface {v2, p1, v0, v3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 173
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x4

    .line 77
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    .line 80
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    check-cast v0, Lcom/alien/demo/feature/mask/MaskInterface;

    invoke-interface {v0}, Lcom/alien/demo/feature/mask/MaskInterface;->getMaskInfo()Lcom/alien/demo/feature/mask/MaskInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/MaskInfo;->getScanInfo()Lcom/alien/demo/feature/mask/ScanInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    .line 81
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/ScanInfo;->getTagList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    .line 83
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00da

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/dd/processbutton/iml/ActionProcessButton;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    .line 84
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnStartStop:Lcom/dd/processbutton/iml/ActionProcessButton;

    new-instance v1, Lcom/alien/demo/feature/mask/ScanFragment$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/ScanFragment$1;-><init>(Lcom/alien/demo/feature/mask/ScanFragment;)V

    invoke-virtual {v0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00dc

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnClear:Landroid/widget/Button;

    .line 91
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnClear:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/ScanFragment$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/ScanFragment$2;-><init>(Lcom/alien/demo/feature/mask/ScanFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00db

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnOK:Landroid/widget/Button;

    .line 98
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->btnOK:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/ScanFragment$3;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/ScanFragment$3;-><init>(Lcom/alien/demo/feature/mask/ScanFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/rfid/TagMask;->createFromString(Ljava/lang/String;)Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    .line 106
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c0072

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->txtMask:Landroid/widget/TextView;

    .line 107
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->txtMask:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/ScanInfo;->getMaskedEpc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00e1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    .line 113
    new-instance v0, Landroid/widget/SimpleAdapter;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    const v3, 0x7f030037

    new-array v4, v7, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "tagEpc"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "tagLen"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "tagCount"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "tagRssi"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagAdapter:Landroid/widget/SimpleAdapter;

    .line 116
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 117
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->lvTags:Landroid/widget/ListView;

    new-instance v1, Lcom/alien/demo/feature/mask/ScanFragment$4;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/ScanFragment$4;-><init>(Lcom/alien/demo/feature/mask/ScanFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 128
    new-instance v0, Lcom/alien/demo/feature/mask/ScanFragment$5;

    invoke-direct {v0, p0}, Lcom/alien/demo/feature/mask/ScanFragment$5;-><init>(Lcom/alien/demo/feature/mask/ScanFragment;)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->handler:Landroid/os/Handler;

    .line 159
    new-instance v0, Lcom/alien/demo/rfid/TagScanner;

    invoke-direct {v0, p0}, Lcom/alien/demo/rfid/TagScanner;-><init>(Lcom/alien/rfid/RFIDCallback;)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanner:Lcom/alien/demo/rfid/TagScanner;

    .line 160
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->refreshMask()V

    .line 161
    return-void

    .line 113
    nop

    :array_0
    .array-data 4
        0x7f0c00e2
        0x7f0c00e4
        0x7f0c00e3
        0x7f0c00e5
    .end array-data
.end method

.method public onClickClear(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 219
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/alien/demo/feature/mask/ScanFragment;->updateMaskEpc(Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 221
    iget-object v0, p0, Lcom/alien/demo/feature/mask/ScanFragment;->tagAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 222
    return-void
.end method

.method public onClickOk(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    .line 225
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 226
    .local v0, "data":Landroid/content/Intent;
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v1, v5}, Lcom/alien/demo/rfid/TagMask;->setMaskedBank(I)V

    .line 227
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    const/16 v2, 0x20

    iget-object v3, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/ScanInfo;->getMaskedEpc()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    iget-object v4, p0, Lcom/alien/demo/feature/mask/ScanFragment;->scanInfo:Lcom/alien/demo/feature/mask/ScanInfo;

    invoke-virtual {v4}, Lcom/alien/demo/feature/mask/ScanInfo;->getMaskedEpc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v5, v2, v3, v4}, Lcom/alien/demo/rfid/TagMask;->setMaskInfo(IIILjava/lang/String;)Z

    .line 228
    const-string v1, "filter_data"

    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 229
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 230
    iget-object v1, p0, Lcom/alien/demo/feature/mask/ScanFragment;->context:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 231
    return-void
.end method

.method public onClickStartStopScan(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 201
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->startStopScan()V

    .line 202
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 72
    const v0, 0x7f030035

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)V
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 290
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 291
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->startScan()V

    .line 293
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/alien/demo/uibase/BaseFragment;->onKeyDown(ILandroid/view/KeyEvent;)V

    .line 294
    return-void
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)V
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 298
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    .line 299
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->stopScan()V

    .line 301
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/alien/demo/uibase/BaseFragment;->onKeyUp(ILandroid/view/KeyEvent;)V

    .line 302
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 165
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseFragment;->onPause()V

    .line 166
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/ScanFragment;->stopScan()V

    .line 167
    return-void
.end method

.method public onTagRead(Lcom/alien/rfid/Tag;)V
    .locals 6
    .param p1, "tag"    # Lcom/alien/rfid/Tag;

    .prologue
    .line 235
    const-string v1, "%1$,.1f"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getRSSI()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "tagRssi":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/alien/demo/feature/mask/ScanFragment;->addTag(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    return-void
.end method
