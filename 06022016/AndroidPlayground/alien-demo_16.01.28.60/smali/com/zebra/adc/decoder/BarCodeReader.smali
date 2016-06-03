.class Lcom/zebra/adc/decoder/BarCodeReader;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;,
        Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;,
        Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;,
        Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;,
        Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;,
        Lcom/zebra/adc/decoder/BarCodeReader$ParamNum;,
        Lcom/zebra/adc/decoder/BarCodeReader$ParamVal;,
        Lcom/zebra/adc/decoder/BarCodeReader$Parameters;,
        Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;,
        Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;,
        Lcom/zebra/adc/decoder/BarCodeReader$PropertyNum;,
        Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;,
        Lcom/zebra/adc/decoder/BarCodeReader$Size;,
        Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;
    }
.end annotation


# static fields
.field static final BCRDR_ERROR_SERVER_DIED:I = 0x64

.field static final BCRDR_ERROR_UNKNOWN:I = 0x1

.field static final BCRDR_EVENT_MOTION_DETECTED:I = 0x6

.field static final BCRDR_EVENT_SCANNER_RESET:I = 0x7

.field static final BCRDR_EVENT_SCAN_MODE_CHANGED:I = 0x5

.field private static final BCRDR_MSG_ALL_MSGS:I = 0x3f03ff

.field private static final BCRDR_MSG_COMPRESSED_IMAGE:I = 0x100

.field private static final BCRDR_MSG_DECODE_CANCELED:I = 0x40000

.field private static final BCRDR_MSG_DECODE_COMPLETE:I = 0x10000

.field private static final BCRDR_MSG_DECODE_ERROR:I = 0x80000

.field private static final BCRDR_MSG_DECODE_EVENT:I = 0x100000

.field private static final BCRDR_MSG_DECODE_TIMEOUT:I = 0x20000

.field private static final BCRDR_MSG_DEC_COUNT:I = 0x400

.field private static final BCRDR_MSG_ERROR:I = 0x1

.field private static final BCRDR_MSG_FOCUS:I = 0x4

.field private static final BCRDR_MSG_FRAME_ERROR:I = 0x200000

.field private static final BCRDR_MSG_LAST_DEC_IMAGE:I = 0x200

.field private static final BCRDR_MSG_POSTVIEW_FRAME:I = 0x40

.field private static final BCRDR_MSG_PREVIEW_FRAME:I = 0x10

.field private static final BCRDR_MSG_RAW_IMAGE:I = 0x80

.field private static final BCRDR_MSG_SHUTTER:I = 0x2

.field private static final BCRDR_MSG_VIDEO_FRAME:I = 0x20

.field private static final BCRDR_MSG_ZOOM:I = 0x8

.field static final BCR_ERROR:I = -0x1

.field static final BCR_SUCCESS:I = 0x0

.field private static final DECODE_MODE_PREVIEW:I = 0x1

.field private static final DECODE_MODE_VIDEO:I = 0x3

.field private static final DECODE_MODE_VIEWFINDER:I = 0x2

.field static final DECODE_STATUS_CANCELED:I = -0x1

.field static final DECODE_STATUS_ERROR:I = -0x2

.field static final DECODE_STATUS_MULTI_DEC_COUNT:I = -0x3

.field static final DECODE_STATUS_TIMEOUT:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BarCodeReader"


# instance fields
.field private mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

.field private mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

.field private mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

.field private mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

.field private mNativeContext:I

.field private mOneShot:Z

.field private mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

.field private mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

.field private mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

.field private mWithBuffer:Z

.field private mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;


# direct methods
.method constructor <init>(I)V
    .locals 2
    .param p1, "readerId"    # I

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    new-instance v1, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;-><init>(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader;->native_setup(Ljava/lang/Object;I)V

    return-void
.end method

.method constructor <init>(ILandroid/content/Context;)V
    .locals 2
    .param p1, "readerId"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    new-instance v1, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;-><init>(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v0, p1, p2}, Lcom/zebra/adc/decoder/BarCodeReader;->native_setup(Ljava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method static synthetic access$0(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    return-object v0
.end method

.method static synthetic access$1(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    return-object v0
.end method

.method static synthetic access$10(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    return-object v0
.end method

.method static synthetic access$2(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    return-object v0
.end method

.method static synthetic access$3(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    return-object v0
.end method

.method static synthetic access$4(Lcom/zebra/adc/decoder/BarCodeReader;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mOneShot:Z

    return v0
.end method

.method static synthetic access$5(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    return-void
.end method

.method static synthetic access$6(Lcom/zebra/adc/decoder/BarCodeReader;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mWithBuffer:Z

    return v0
.end method

.method static synthetic access$7(Lcom/zebra/adc/decoder/BarCodeReader;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/zebra/adc/decoder/BarCodeReader;->setHasPreviewCallback(ZZ)V

    return-void
.end method

.method static synthetic access$8(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    return-object v0
.end method

.method static synthetic access$9(Lcom/zebra/adc/decoder/BarCodeReader;)Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;
    .locals 1

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    return-object v0
.end method

.method static native getNumberOfReaders()I
.end method

.method static native getReaderInfo(ILcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;)V
.end method

.method private final native native_autoFocus()V
.end method

.method private final native native_cancelAutoFocus()V
.end method

.method private final native native_getParameters()Ljava/lang/String;
.end method

.method private final native native_release()V
.end method

.method private final native native_setParameters(Ljava/lang/String;)V
.end method

.method private final native native_setup(Ljava/lang/Object;I)V
.end method

.method private final native native_setup(Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method private final native native_startPreview(I)V
.end method

.method private final native native_takePicture()V
.end method

.method static open()Lcom/zebra/adc/decoder/BarCodeReader;
    .locals 6

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/zebra/adc/decoder/BarCodeReader;->getNumberOfReaders()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    new-instance v3, Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;

    invoke-direct {v3}, Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;-><init>()V

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    :goto_1
    return-object v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_0
    invoke-static {v1, v3}, Lcom/zebra/adc/decoder/BarCodeReader;->getReaderInfo(ILcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;)V

    iget v4, v3, Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;->facing:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader;-><init>(I)V

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method static open(I)Lcom/zebra/adc/decoder/BarCodeReader;
    .locals 1
    .param p0, "readerId"    # I

    .prologue
    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {v0, p0}, Lcom/zebra/adc/decoder/BarCodeReader;-><init>(I)V

    return-object v0
.end method

.method static open(ILandroid/content/Context;)Lcom/zebra/adc/decoder/BarCodeReader;
    .locals 1
    .param p0, "readerId"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {v0, p0, p1}, Lcom/zebra/adc/decoder/BarCodeReader;-><init>(ILandroid/content/Context;)V

    return-object v0
.end method

.method static open(Landroid/content/Context;)Lcom/zebra/adc/decoder/BarCodeReader;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/zebra/adc/decoder/BarCodeReader;->getNumberOfReaders()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    new-instance v3, Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;

    invoke-direct {v3}, Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;-><init>()V

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    :goto_1
    return-object v0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_0
    invoke-static {v1, v3}, Lcom/zebra/adc/decoder/BarCodeReader;->getReaderInfo(ILcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;)V

    iget v4, v3, Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;->facing:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {v0, v1, p0}, Lcom/zebra/adc/decoder/BarCodeReader;-><init>(ILandroid/content/Context;)V

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 2
    .param p0, "reader_ref"    # Ljava/lang/Object;
    .param p1, "what"    # I
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "obj"    # Ljava/lang/Object;

    .prologue
    check-cast p0, Ljava/lang/ref/WeakReference;

    .end local p0    # "reader_ref":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zebra/adc/decoder/BarCodeReader;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-object v0, v0, Lcom/zebra/adc/decoder/BarCodeReader;->mEventHandler:Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;

    invoke-virtual {v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$EventHandler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method private final native setHasPreviewCallback(ZZ)V
.end method

.method private final native setNumParameter(II)I
.end method

.method private final native setPreviewDisplay(Landroid/view/Surface;)V
.end method

.method private final native setStrParameter(ILjava/lang/String;)I
.end method


# virtual methods
.method public final native FWUpdate(Ljava/lang/String;ZZ)I
.end method

.method public final native addCallbackBuffer([B)V
.end method

.method public final autoFocus(Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;)V
    .locals 0
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    invoke-direct {p0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_autoFocus()V

    return-void
.end method

.method public final cancelAutoFocus()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mAutoFocusCallback:Lcom/zebra/adc/decoder/BarCodeReader$AutoFocusCallback;

    invoke-direct {p0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_cancelAutoFocus()V

    return-void
.end method

.method public final native disableAllCodeTypes()V
.end method

.method public final native enableAllCodeTypes()V
.end method

.method protected finalize()V
    .locals 0

    invoke-direct {p0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_release()V

    return-void
.end method

.method public final native getDecodeCount()I
.end method

.method public final native getLastDecImage()[B
.end method

.method public final native getNumParameter(I)I
.end method

.method public final native getNumProperty(I)I
.end method

.method public getParameters()Lcom/zebra/adc/decoder/BarCodeReader$Parameters;
    .locals 2

    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;-><init>(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader$Parameters;)V

    invoke-direct {p0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_getParameters()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->unflatten(Ljava/lang/String;)V

    return-object v0
.end method

.method public final native getStrParameter(I)Ljava/lang/String;
.end method

.method public final native getStrProperty(I)Ljava/lang/String;
.end method

.method public final native lock()V
.end method

.method public final native previewEnabled()Z
.end method

.method public final native reconnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final release()V
    .locals 0

    invoke-direct {p0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_release()V

    return-void
.end method

.method public final native setAutoFocusDelay(II)V
.end method

.method public final setDecodeCallback(Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;)V
    .locals 0
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mDecodeCallback:Lcom/zebra/adc/decoder/BarCodeReader$DecodeCallback;

    return-void
.end method

.method public final native setDefaultParameters()V
.end method

.method public final native setDisplayOrientation(I)V
.end method

.method public final setErrorCallback(Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;)V
    .locals 0
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mErrorCallback:Lcom/zebra/adc/decoder/BarCodeReader$ErrorCallback;

    return-void
.end method

.method public final setOneShotPreviewCallback(Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    iput-boolean v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mOneShot:Z

    iput-boolean v1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mWithBuffer:Z

    if-eqz p1, :cond_0

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader;->setHasPreviewCallback(ZZ)V

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public final setParameter(II)I
    .locals 1
    .param p1, "paramNum"    # I
    .param p2, "paramVal"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/zebra/adc/decoder/BarCodeReader;->setNumParameter(II)I

    move-result v0

    return v0
.end method

.method public final setParameter(ILjava/lang/String;)I
    .locals 1
    .param p1, "paramNum"    # I
    .param p2, "paramVal"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/zebra/adc/decoder/BarCodeReader;->setStrParameter(ILjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setParameters(Lcom/zebra/adc/decoder/BarCodeReader$Parameters;)V
    .locals 1
    .param p1, "params"    # Lcom/zebra/adc/decoder/BarCodeReader$Parameters;

    .prologue
    invoke-virtual {p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->flatten()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_setParameters(Ljava/lang/String;)V

    return-void
.end method

.method public final setPreviewCallbackWithBuffer(Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mPreviewCallback:Lcom/zebra/adc/decoder/BarCodeReader$PreviewCallback;

    iput-boolean v0, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mOneShot:Z

    iput-boolean v1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mWithBuffer:Z

    if-eqz p1, :cond_0

    move v0, v1

    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader;->setHasPreviewCallback(ZZ)V

    return-void
.end method

.method public final setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader;->setPreviewDisplay(Landroid/view/Surface;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader;->setPreviewDisplay(Landroid/view/Surface;)V

    goto :goto_0
.end method

.method public final setZoomChangeListener(Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mZoomListener:Lcom/zebra/adc/decoder/BarCodeReader$OnZoomChangeListener;

    return-void
.end method

.method public final native startDecode()V
.end method

.method public final native startHandsFreeDecode(I)I
.end method

.method public final startPreview()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_startPreview(I)V

    return-void
.end method

.method public final native startSmoothZoom(I)V
.end method

.method public final startVideoCapture(Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;)V
    .locals 1
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_startPreview(I)V

    return-void
.end method

.method public final startViewFinder(Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;)V
    .locals 1
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mVideoCallback:Lcom/zebra/adc/decoder/BarCodeReader$VideoCallback;

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_startPreview(I)V

    return-void
.end method

.method public final native stopDecode()V
.end method

.method public final native stopPreview()V
.end method

.method public final native stopSmoothZoom()V
.end method

.method public final takePicture(Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;)V
    .locals 1
    .param p1, "cb"    # Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader;->mSnapshotCallback:Lcom/zebra/adc/decoder/BarCodeReader$PictureCallback;

    :try_start_0
    invoke-direct {p0}, Lcom/zebra/adc/decoder/BarCodeReader;->native_takePicture()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final native unlock()V
.end method
