.class Lcom/zebra/adc/decoder/BarCodeReader$Parameters;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zebra/adc/decoder/BarCodeReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Parameters"
.end annotation


# static fields
.field static final ANTIBANDING_50HZ:Ljava/lang/String; = "50hz"

.field static final ANTIBANDING_60HZ:Ljava/lang/String; = "60hz"

.field static final ANTIBANDING_AUTO:Ljava/lang/String; = "auto"

.field static final ANTIBANDING_OFF:Ljava/lang/String; = "off"

.field static final EFFECT_AQUA:Ljava/lang/String; = "aqua"

.field static final EFFECT_BLACKBOARD:Ljava/lang/String; = "blackboard"

.field static final EFFECT_MONO:Ljava/lang/String; = "mono"

.field static final EFFECT_NEGATIVE:Ljava/lang/String; = "negative"

.field static final EFFECT_NONE:Ljava/lang/String; = "none"

.field static final EFFECT_POSTERIZE:Ljava/lang/String; = "posterize"

.field static final EFFECT_SEPIA:Ljava/lang/String; = "sepia"

.field static final EFFECT_SOLARIZE:Ljava/lang/String; = "solarize"

.field static final EFFECT_WHITEBOARD:Ljava/lang/String; = "whiteboard"

.field static final FLASH_MODE_AUTO:Ljava/lang/String; = "auto"

.field static final FLASH_MODE_OFF:Ljava/lang/String; = "off"

.field static final FLASH_MODE_ON:Ljava/lang/String; = "on"

.field static final FLASH_MODE_RED_EYE:Ljava/lang/String; = "red-eye"

.field static final FLASH_MODE_TORCH:Ljava/lang/String; = "torch"

.field static final FOCUS_DISTANCE_FAR_INDEX:I = 0x2

.field static final FOCUS_DISTANCE_NEAR_INDEX:I = 0x0

.field static final FOCUS_DISTANCE_OPTIMAL_INDEX:I = 0x1

.field static final FOCUS_MODE_AUTO:Ljava/lang/String; = "auto"

.field static final FOCUS_MODE_CONTINUOUS_VIDEO:Ljava/lang/String; = "continuous-video"

.field static final FOCUS_MODE_EDOF:Ljava/lang/String; = "edof"

.field static final FOCUS_MODE_FIXED:Ljava/lang/String; = "fixed"

.field static final FOCUS_MODE_INFINITY:Ljava/lang/String; = "infinity"

.field static final FOCUS_MODE_MACRO:Ljava/lang/String; = "macro"

.field private static final KEY_ANTIBANDING:Ljava/lang/String; = "antibanding"

.field private static final KEY_EFFECT:Ljava/lang/String; = "effect"

.field private static final KEY_EXPOSURE_COMPENSATION:Ljava/lang/String; = "exposure-compensation"

.field private static final KEY_EXPOSURE_COMPENSATION_STEP:Ljava/lang/String; = "exposure-compensation-step"

.field private static final KEY_FLASH_MODE:Ljava/lang/String; = "flash-mode"

.field private static final KEY_FOCAL_LENGTH:Ljava/lang/String; = "focal-length"

.field private static final KEY_FOCUS_DISTANCES:Ljava/lang/String; = "focus-distances"

.field private static final KEY_FOCUS_MODE:Ljava/lang/String; = "focus-mode"

.field private static final KEY_GPS_ALTITUDE:Ljava/lang/String; = "gps-altitude"

.field private static final KEY_GPS_LATITUDE:Ljava/lang/String; = "gps-latitude"

.field private static final KEY_GPS_LONGITUDE:Ljava/lang/String; = "gps-longitude"

.field private static final KEY_GPS_PROCESSING_METHOD:Ljava/lang/String; = "gps-processing-method"

.field private static final KEY_GPS_TIMESTAMP:Ljava/lang/String; = "gps-timestamp"

.field private static final KEY_HORIZONTAL_VIEW_ANGLE:Ljava/lang/String; = "horizontal-view-angle"

.field private static final KEY_JPEG_QUALITY:Ljava/lang/String; = "jpeg-quality"

.field private static final KEY_JPEG_THUMBNAIL_HEIGHT:Ljava/lang/String; = "jpeg-thumbnail-height"

.field private static final KEY_JPEG_THUMBNAIL_QUALITY:Ljava/lang/String; = "jpeg-thumbnail-quality"

.field private static final KEY_JPEG_THUMBNAIL_SIZE:Ljava/lang/String; = "jpeg-thumbnail-size"

.field private static final KEY_JPEG_THUMBNAIL_WIDTH:Ljava/lang/String; = "jpeg-thumbnail-width"

.field private static final KEY_MAX_EXPOSURE_COMPENSATION:Ljava/lang/String; = "max-exposure-compensation"

.field private static final KEY_MAX_ZOOM:Ljava/lang/String; = "max-zoom"

.field private static final KEY_MIN_EXPOSURE_COMPENSATION:Ljava/lang/String; = "min-exposure-compensation"

.field private static final KEY_PICTURE_FORMAT:Ljava/lang/String; = "picture-format"

.field private static final KEY_PICTURE_SIZE:Ljava/lang/String; = "picture-size"

.field private static final KEY_PREVIEW_FORMAT:Ljava/lang/String; = "preview-format"

.field private static final KEY_PREVIEW_FPS_RANGE:Ljava/lang/String; = "preview-fps-range"

.field private static final KEY_PREVIEW_FRAME_RATE:Ljava/lang/String; = "preview-frame-rate"

.field private static final KEY_PREVIEW_SIZE:Ljava/lang/String; = "preview-size"

.field private static final KEY_ROTATION:Ljava/lang/String; = "rotation"

.field private static final KEY_SCENE_MODE:Ljava/lang/String; = "scene-mode"

.field private static final KEY_SMOOTH_ZOOM_SUPPORTED:Ljava/lang/String; = "smooth-zoom-supported"

.field private static final KEY_VERTICAL_VIEW_ANGLE:Ljava/lang/String; = "vertical-view-angle"

.field private static final KEY_WHITE_BALANCE:Ljava/lang/String; = "whitebalance"

.field private static final KEY_ZOOM:Ljava/lang/String; = "zoom"

.field private static final KEY_ZOOM_RATIOS:Ljava/lang/String; = "zoom-ratios"

.field private static final KEY_ZOOM_SUPPORTED:Ljava/lang/String; = "zoom-supported"

.field private static final PIXEL_FORMAT_JPEG:Ljava/lang/String; = "jpeg"

.field private static final PIXEL_FORMAT_RGB565:Ljava/lang/String; = "rgb565"

.field private static final PIXEL_FORMAT_YUV420SP:Ljava/lang/String; = "yuv420sp"

.field private static final PIXEL_FORMAT_YUV422I:Ljava/lang/String; = "yuv422i-yuyv"

.field private static final PIXEL_FORMAT_YUV422SP:Ljava/lang/String; = "yuv422sp"

.field static final PREVIEW_FPS_MAX_INDEX:I = 0x1

.field static final PREVIEW_FPS_MIN_INDEX:I = 0x0

.field static final SCENE_MODE_ACTION:Ljava/lang/String; = "action"

.field static final SCENE_MODE_AUTO:Ljava/lang/String; = "auto"

.field static final SCENE_MODE_BARCODE:Ljava/lang/String; = "barcode"

.field static final SCENE_MODE_BEACH:Ljava/lang/String; = "beach"

.field static final SCENE_MODE_CANDLELIGHT:Ljava/lang/String; = "candlelight"

.field static final SCENE_MODE_FIREWORKS:Ljava/lang/String; = "fireworks"

.field static final SCENE_MODE_LANDSCAPE:Ljava/lang/String; = "landscape"

.field static final SCENE_MODE_NIGHT:Ljava/lang/String; = "night"

.field static final SCENE_MODE_NIGHT_PORTRAIT:Ljava/lang/String; = "night-portrait"

.field static final SCENE_MODE_PARTY:Ljava/lang/String; = "party"

.field static final SCENE_MODE_PORTRAIT:Ljava/lang/String; = "portrait"

.field static final SCENE_MODE_SNOW:Ljava/lang/String; = "snow"

.field static final SCENE_MODE_SPORTS:Ljava/lang/String; = "sports"

.field static final SCENE_MODE_STEADYPHOTO:Ljava/lang/String; = "steadyphoto"

.field static final SCENE_MODE_SUNSET:Ljava/lang/String; = "sunset"

.field static final SCENE_MODE_THEATRE:Ljava/lang/String; = "theatre"

.field private static final SUPPORTED_VALUES_SUFFIX:Ljava/lang/String; = "-values"

.field private static final TRUE:Ljava/lang/String; = "true"

.field static final WHITE_BALANCE_AUTO:Ljava/lang/String; = "auto"

.field static final WHITE_BALANCE_CLOUDY_DAYLIGHT:Ljava/lang/String; = "cloudy-daylight"

.field static final WHITE_BALANCE_DAYLIGHT:Ljava/lang/String; = "daylight"

.field static final WHITE_BALANCE_FLUORESCENT:Ljava/lang/String; = "fluorescent"

.field static final WHITE_BALANCE_INCANDESCENT:Ljava/lang/String; = "incandescent"

.field static final WHITE_BALANCE_SHADE:Ljava/lang/String; = "shade"

.field static final WHITE_BALANCE_TWILIGHT:Ljava/lang/String; = "twilight"

.field static final WHITE_BALANCE_WARM_FLUORESCENT:Ljava/lang/String; = "warm-fluorescent"


# instance fields
.field private mMap:Ljava/util/HashMap;

.field final synthetic this$0:Lcom/zebra/adc/decoder/BarCodeReader;


# direct methods
.method private constructor <init>(Lcom/zebra/adc/decoder/BarCodeReader;)V
    .locals 1

    .prologue
    iput-object p1, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/zebra/adc/decoder/BarCodeReader;Lcom/zebra/adc/decoder/BarCodeReader$Parameters;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;-><init>(Lcom/zebra/adc/decoder/BarCodeReader;)V

    return-void
.end method

.method private getFloat(Ljava/lang/String;F)F
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # F

    .prologue
    :try_start_0
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    .end local p2    # "defaultValue":F
    :goto_0
    return p2

    .restart local p2    # "defaultValue":F
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private getInt(Ljava/lang/String;I)I
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    :try_start_0
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .restart local p2    # "defaultValue":I
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private pixelFormatForReaderFormat(Ljava/lang/String;)I
    .locals 2
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string v1, "yuv422sp"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v0, 0x10

    goto :goto_0

    :cond_2
    const-string v1, "yuv420sp"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v0, 0x11

    goto :goto_0

    :cond_3
    const-string v1, "yuv422i-yuyv"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v0, 0x14

    goto :goto_0

    :cond_4
    const-string v1, "rgb565"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x4

    goto :goto_0

    :cond_5
    const-string v1, "jpeg"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v0, 0x100

    goto :goto_0
.end method

.method private readerFormatForPixelFormat(I)Ljava/lang/String;
    .locals 1
    .param p1, "pixel_format"    # I

    .prologue
    sparse-switch p1, :sswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :sswitch_0
    const-string v0, "yuv422sp"

    goto :goto_0

    :sswitch_1
    const-string v0, "yuv420sp"

    goto :goto_0

    :sswitch_2
    const-string v0, "yuv422i-yuyv"

    goto :goto_0

    :sswitch_3
    const-string v0, "rgb565"

    goto :goto_0

    :sswitch_4
    const-string v0, "jpeg"

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_3
        0x10 -> :sswitch_0
        0x11 -> :sswitch_1
        0x14 -> :sswitch_2
        0x100 -> :sswitch_4
    .end sparse-switch
.end method

.method private split(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    if-nez p1, :cond_1

    const/4 v0, 0x0

    :cond_0
    return-object v0

    :cond_1
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v0, ","

    invoke-direct {v1, p1, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private splitFloat(Ljava/lang/String;[F)V
    .locals 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "output"    # [F

    .prologue
    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v0, ","

    invoke-direct {v2, p1, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v1, v0, 0x1

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    aput v3, p2, v0

    move v0, v1

    goto :goto_0
.end method

.method private splitInt(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v1, ","

    invoke-direct {v2, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private splitInt(Ljava/lang/String;[I)V
    .locals 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "output"    # [I

    .prologue
    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v0, ","

    invoke-direct {v2, p1, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v1, v0, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, p2, v0

    move v0, v1

    goto :goto_0
.end method

.method private splitRange(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x28

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x29

    if-eq v0, v1, :cond_1

    :cond_0
    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Invalid range list string="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x1

    :cond_2
    const/4 v1, 0x2

    new-array v4, v1, [I

    const-string v1, "),("

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    const/4 v5, -0x1

    if-ne v1, v5, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :cond_3
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v4}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitInt(Ljava/lang/String;[I)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v1, v4, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    move-object v0, v2

    goto :goto_0

    :cond_4
    move-object v0, v3

    goto :goto_0
.end method

.method private splitSize(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v1, ","

    invoke-direct {v2, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_2
    :goto_1
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_3
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->strToSize(Ljava/lang/String;)Lcom/zebra/adc/decoder/BarCodeReader$Size;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private strToSize(Ljava/lang/String;)Lcom/zebra/adc/decoder/BarCodeReader$Size;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    if-nez p1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    const/16 v1, 0x78

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader$Size;

    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, v3, v2, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Size;-><init>(Lcom/zebra/adc/decoder/BarCodeReader;II)V

    goto :goto_0

    :cond_1
    const-string v1, "BarCodeReader"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid size parameter string="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public dump()V
    .locals 5

    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "dump: size="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v2, "BarCodeReader"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "dump: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public flatten()Ljava/lang/String;
    .locals 4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ";"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getAntibanding()Ljava/lang/String;
    .locals 1

    const-string v0, "antibanding"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorEffect()Ljava/lang/String;
    .locals 1

    const-string v0, "effect"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureCompensation()I
    .locals 2

    const-string v0, "exposure-compensation"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getExposureCompensationStep()F
    .locals 2

    const-string v0, "exposure-compensation-step"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getFloat(Ljava/lang/String;F)F

    move-result v0

    return v0
.end method

.method public getFlashMode()Ljava/lang/String;
    .locals 1

    const-string v0, "flash-mode"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocalLength()F
    .locals 1

    const-string v0, "focal-length"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getFocusDistances([F)V
    .locals 2
    .param p1, "output"    # [F

    .prologue
    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "output must be an float array with three elements."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "focus-distances"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitFloat(Ljava/lang/String;[F)V

    return-void
.end method

.method public getFocusMode()Ljava/lang/String;
    .locals 1

    const-string v0, "focus-mode"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHorizontalViewAngle()F
    .locals 1

    const-string v0, "horizontal-view-angle"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    const-string v0, "jpeg-quality"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getJpegThumbnailQuality()I
    .locals 1

    const-string v0, "jpeg-thumbnail-quality"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getJpegThumbnailSize()Lcom/zebra/adc/decoder/BarCodeReader$Size;
    .locals 4

    new-instance v0, Lcom/zebra/adc/decoder/BarCodeReader$Size;

    iget-object v1, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->this$0:Lcom/zebra/adc/decoder/BarCodeReader;

    const-string v2, "jpeg-thumbnail-width"

    invoke-virtual {p0, v2}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "jpeg-thumbnail-height"

    invoke-virtual {p0, v3}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/zebra/adc/decoder/BarCodeReader$Size;-><init>(Lcom/zebra/adc/decoder/BarCodeReader;II)V

    return-object v0
.end method

.method public getMaxExposureCompensation()I
    .locals 2

    const-string v0, "max-exposure-compensation"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getMaxZoom()I
    .locals 2

    const-string v0, "max-zoom"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getMinExposureCompensation()I
    .locals 2

    const-string v0, "min-exposure-compensation"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getPictureFormat()I
    .locals 1

    const-string v0, "picture-format"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->pixelFormatForReaderFormat(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getPictureSize()Lcom/zebra/adc/decoder/BarCodeReader$Size;
    .locals 1

    const-string v0, "picture-size"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->strToSize(Ljava/lang/String;)Lcom/zebra/adc/decoder/BarCodeReader$Size;

    move-result-object v0

    return-object v0
.end method

.method public getPreviewFormat()I
    .locals 1

    const-string v0, "preview-format"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->pixelFormatForReaderFormat(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getPreviewFpsRange([I)V
    .locals 2
    .param p1, "range"    # [I

    .prologue
    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "range must be an array with two elements."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "preview-fps-range"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitInt(Ljava/lang/String;[I)V

    return-void
.end method

.method public getPreviewFrameRate()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "preview-frame-rate"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getPreviewSize()Lcom/zebra/adc/decoder/BarCodeReader$Size;
    .locals 1

    const-string v0, "preview-size"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->strToSize(Ljava/lang/String;)Lcom/zebra/adc/decoder/BarCodeReader$Size;

    move-result-object v0

    return-object v0
.end method

.method public getSceneMode()Ljava/lang/String;
    .locals 1

    const-string v0, "scene-mode"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedAntibanding()Ljava/util/List;
    .locals 1

    const-string v0, "antibanding-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedColorEffects()Ljava/util/List;
    .locals 1

    const-string v0, "effect-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedFlashModes()Ljava/util/List;
    .locals 1

    const-string v0, "flash-mode-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedFocusModes()Ljava/util/List;
    .locals 1

    const-string v0, "focus-mode-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedJpegThumbnailSizes()Ljava/util/List;
    .locals 1

    const-string v0, "jpeg-thumbnail-size-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitSize(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedPictureFormats()Ljava/util/List;
    .locals 3

    const-string v0, "picture-format-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->pixelFormatForReaderFormat(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getSupportedPictureSizes()Ljava/util/List;
    .locals 1

    const-string v0, "picture-size-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitSize(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedPreviewFormats()Ljava/util/List;
    .locals 3

    const-string v0, "preview-format-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->pixelFormatForReaderFormat(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getSupportedPreviewFpsRange()Ljava/util/List;
    .locals 1

    const-string v0, "preview-fps-range-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitRange(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedPreviewFrameRates()Ljava/util/List;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "preview-frame-rate-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitInt(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedPreviewSizes()Ljava/util/List;
    .locals 1

    const-string v0, "preview-size-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitSize(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedSceneModes()Ljava/util/List;
    .locals 1

    const-string v0, "scene-mode-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedWhiteBalance()Ljava/util/List;
    .locals 1

    const-string v0, "whitebalance-values"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->split(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getVerticalViewAngle()F
    .locals 1

    const-string v0, "vertical-view-angle"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getWhiteBalance()Ljava/lang/String;
    .locals 1

    const-string v0, "whitebalance"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getZoom()I
    .locals 2

    const-string v0, "zoom"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getZoomRatios()Ljava/util/List;
    .locals 1

    const-string v0, "zoom-ratios"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->splitInt(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public isSmoothZoomSupported()Z
    .locals 2

    const-string v0, "smooth-zoom-supported"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isZoomSupported()Z
    .locals 2

    const-string v0, "zoom-supported"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public removeGpsData()V
    .locals 1

    const-string v0, "gps-latitude"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->remove(Ljava/lang/String;)V

    const-string v0, "gps-longitude"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->remove(Ljava/lang/String;)V

    const-string v0, "gps-altitude"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->remove(Ljava/lang/String;)V

    const-string v0, "gps-timestamp"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->remove(Ljava/lang/String;)V

    const-string v0, "gps-processing-method"

    invoke-virtual {p0, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public set(Ljava/lang/String;I)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    const/4 v1, -0x1

    const/16 v0, 0x3d

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v1, :cond_1

    :cond_0
    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Key \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" contains invalid character (= or ;)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x3d

    const/16 v2, 0x3b

    const/4 v1, -0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v1, :cond_1

    :cond_0
    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Key \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" contains invalid character (= or ;)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v1, :cond_3

    :cond_2
    const-string v0, "BarCodeReader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Value \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" contains invalid character (= or ;)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setAntibanding(Ljava/lang/String;)V
    .locals 1
    .param p1, "antibanding"    # Ljava/lang/String;

    .prologue
    const-string v0, "antibanding"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setColorEffect(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "effect"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setExposureCompensation(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    const-string v0, "exposure-compensation"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public setFlashMode(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "flash-mode"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setFocusMode(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "focus-mode"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setGpsAltitude(D)V
    .locals 3
    .param p1, "altitude"    # D

    .prologue
    const-string v0, "gps-altitude"

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setGpsLatitude(D)V
    .locals 3
    .param p1, "latitude"    # D

    .prologue
    const-string v0, "gps-latitude"

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setGpsLongitude(D)V
    .locals 3
    .param p1, "longitude"    # D

    .prologue
    const-string v0, "gps-longitude"

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setGpsProcessingMethod(Ljava/lang/String;)V
    .locals 1
    .param p1, "processing_method"    # Ljava/lang/String;

    .prologue
    const-string v0, "gps-processing-method"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setGpsTimestamp(J)V
    .locals 3
    .param p1, "timestamp"    # J

    .prologue
    const-string v0, "gps-timestamp"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setJpegQuality(I)V
    .locals 1
    .param p1, "quality"    # I

    .prologue
    const-string v0, "jpeg-quality"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public setJpegThumbnailQuality(I)V
    .locals 1
    .param p1, "quality"    # I

    .prologue
    const-string v0, "jpeg-thumbnail-quality"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public setJpegThumbnailSize(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const-string v0, "jpeg-thumbnail-width"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    const-string v0, "jpeg-thumbnail-height"

    invoke-virtual {p0, v0, p2}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public setPictureFormat(I)V
    .locals 3
    .param p1, "pixel_format"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->readerFormatForPixelFormat(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid pixel_format="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const-string v1, "picture-format"

    invoke-virtual {p0, v1, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPictureSize(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "picture-size"

    invoke-virtual {p0, v1, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPreviewFormat(I)V
    .locals 3
    .param p1, "pixel_format"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->readerFormatForPixelFormat(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid pixel_format="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const-string v1, "preview-format"

    invoke-virtual {p0, v1, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPreviewFpsRange(II)V
    .locals 3
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    const-string v0, "preview-fps-range"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPreviewFrameRate(I)V
    .locals 1
    .param p1, "fps"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const-string v0, "preview-frame-rate"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public setPreviewSize(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "preview-size"

    invoke-virtual {p0, v1, v0}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setRotation(I)V
    .locals 3
    .param p1, "rotation"    # I

    .prologue
    if-eqz p1, :cond_0

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_0

    const/16 v0, 0xb4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_1

    :cond_0
    const-string v0, "rotation"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid rotation="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSceneMode(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "scene-mode"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setWhiteBalance(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "whitebalance"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setZoom(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    const-string v0, "zoom"

    invoke-virtual {p0, v0, p1}, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public unflatten(Ljava/lang/String;)V
    .locals 5
    .param p1, "flattened"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, ";"

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    iget-object v3, p0, Lcom/zebra/adc/decoder/BarCodeReader$Parameters;->mMap:Ljava/util/HashMap;

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
