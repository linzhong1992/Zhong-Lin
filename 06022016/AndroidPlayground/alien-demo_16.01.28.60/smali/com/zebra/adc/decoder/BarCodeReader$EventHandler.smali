.class Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zebra/adc/decoder/BarCodeReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EventHandler"
.end annotation


# instance fields
.field private mReader:Lcom/zebra/adc/decoder/BarCodeReader;

.field final synthetic this$0:Lcom/zebra/adc/decoder/BarCodeReader;


# direct methods
.method public constructor <init>(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader;Landroid/os/Looper;)V
    .locals 0
    .param p2, "rdr"    # Lcom/zebra/adc/decoder/BarCodeReader;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const v7, 0xffff

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-string v2, "BarCodeReader"

    const-string v3, "Event message: %X, arg1=%d, arg2=%d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    iget v5, p1, Landroid/os/Message;->arg1:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x2

    iget v6, p1, Landroid/os/Message;->arg2:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown message type "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    :sswitch_0
    return-void

    :sswitch_1
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v4, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v1, v2, v3, v0, v4}, Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;->onDecodeComplete(II[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v2

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v2, v1, v1, v0, v3}, Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;->onDecodeComplete(II[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto :goto_0

    :sswitch_3
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v2

    const/4 v3, -0x1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v4, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v2, v1, v3, v0, v4}, Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;->onDecodeComplete(II[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v2

    const/4 v3, -0x2

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v4, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v2, v1, v3, v0, v4}, Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;->onDecodeComplete(II[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v4, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v1, v2, v3, v0, v4}, Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;->onEvent(II[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :sswitch_6
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$1(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    iget v0, p1, Landroid/os/Message;->arg1:I

    and-int v2, v0, v7

    iget v0, p1, Landroid/os/Message;->arg1:I

    shr-int/lit8 v0, v0, 0x10

    and-int v3, v0, v7

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$1(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg2:I

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [B

    iget-object v5, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface/range {v0 .. v5}, Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;->onPictureTaken(III[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :cond_1
    const-string v0, "BarCodeReader"

    const-string v1, "BCRDR_MSG_COMPRESSED_IMAGE event with no snapshot callback"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$2(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    move-result-object v0

    if-eqz v0, :cond_2

    iget v0, p1, Landroid/os/Message;->arg1:I

    and-int v2, v0, v7

    iget v0, p1, Landroid/os/Message;->arg1:I

    shr-int/lit8 v0, v0, 0x10

    and-int v3, v0, v7

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$2(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg2:I

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [B

    iget-object v5, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface/range {v0 .. v5}, Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;->onVideoFrame(III[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :cond_2
    const-string v0, "BarCodeReader"

    const-string v1, "BCRDR_MSG_VIDEO_FRAME event with no video callback"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :sswitch_8
    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;
    invoke-static {v2}, Lcom/zebra/adc/decoder/BarCodeReader;->access$3(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;
    invoke-static {v2}, Lcom/zebra/adc/decoder/BarCodeReader;->access$3(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    move-result-object v2

    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mOneShot:Z
    invoke-static {v3}, Lcom/zebra/adc/decoder/BarCodeReader;->access$4(Lcom/zebra/adc/decoder/BarCodeReader;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader;->access$5(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;)V

    :cond_3
    :goto_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v2, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;->onPreviewFrame([BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :cond_4
    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mWithBuffer:Z
    invoke-static {v3}, Lcom/zebra/adc/decoder/BarCodeReader;->access$6(Lcom/zebra/adc/decoder/BarCodeReader;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # invokes: Lcom/zebra/adc/decoder/BarCodeReader;->setHasPreviewCallback(ZZ)V
    invoke-static {v3, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader;->access$7(Lcom/zebra/adc/decoder/BarCodeReader;ZZ)V

    goto :goto_1

    :sswitch_9
    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;
    invoke-static {v2}, Lcom/zebra/adc/decoder/BarCodeReader;->access$8(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;
    invoke-static {v2}, Lcom/zebra/adc/decoder/BarCodeReader;->access$8(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-nez v3, :cond_5

    move v0, v1

    :cond_5
    iget-object v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v2, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;->onAutoFocus(ZLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :sswitch_a
    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;
    invoke-static {v2}, Lcom/zebra/adc/decoder/BarCodeReader;->access$9(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;
    invoke-static {v2}, Lcom/zebra/adc/decoder/BarCodeReader;->access$9(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget v4, p1, Landroid/os/Message;->arg2:I

    if-eqz v4, :cond_6

    :goto_2
    iget-object v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v2, v3, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;->onZoomChange(IZLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :cond_6
    move v0, v1

    goto :goto_2

    :sswitch_b
    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$10(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$10(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v0, v1, v2}, Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;->onError(ILcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :sswitch_c
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    # getter for: Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    invoke-static {v0}, Lcom/zebra/adc/decoder/BarCodeReader;->access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    const/4 v3, -0x3

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v4, p0, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->mReader:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-interface {v1, v2, v3, v0, v4}, Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;->onDecodeComplete(II[BLcom/zebra/adc/decoder/BarCodeReader;)V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_b
        0x2 -> :sswitch_0
        0x4 -> :sswitch_9
        0x8 -> :sswitch_a
        0x10 -> :sswitch_8
        0x20 -> :sswitch_7
        0x100 -> :sswitch_6
        0x400 -> :sswitch_c
        0x10000 -> :sswitch_1
        0x20000 -> :sswitch_2
        0x40000 -> :sswitch_3
        0x80000 -> :sswitch_4
        0x100000 -> :sswitch_5
        0x200000 -> :sswitch_4
    .end sparse-switch
.end method
