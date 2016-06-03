.class Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
.super Ljava/lang/Object;
.source "GeigerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/feature/geiger/GeigerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RangeLevel"
.end annotation


# instance fields
.field mp:Landroid/media/MediaPlayer;

.field sound:Ljava/lang/String;

.field final synthetic this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

.field value:I


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/geiger/GeigerActivity;ILjava/lang/String;)V
    .locals 8
    .param p2, "value"    # I
    .param p3, "sound"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput p2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->value:I

    .line 67
    iput-object p3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->sound:Ljava/lang/String;

    .line 69
    if-nez p3, :cond_0

    .line 85
    :goto_0
    return-void

    .line 73
    :cond_0
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    .line 74
    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->activity:Landroid/app/Activity;
    invoke-static {p1}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$000(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 75
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 76
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 77
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 78
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :catch_0
    move-exception v7

    .line 81
    .local v7, "e":Ljava/lang/Exception;
    const-string v0, "AlienRFID-Geiger"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error play range audio : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method pause()V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 99
    :goto_0
    return-void

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    goto :goto_0
.end method

.method play()V
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 92
    :goto_0
    return-void

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0
.end method
