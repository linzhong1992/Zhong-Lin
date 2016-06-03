.class Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;
.super Ljava/lang/Object;
.source "BitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/bitmap/core/BitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BitmapMeta"
.end annotation


# instance fields
.field public data:[B

.field public expiryTimestamp:J

.field public inputStream:Ljava/io/FileInputStream;

.field final synthetic this$0:Lcom/lidroid/xutils/bitmap/core/BitmapCache;


# direct methods
.method private constructor <init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;)V
    .locals 0

    .prologue
    .line 386
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;->this$0:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;)V
    .locals 0

    .prologue
    .line 386
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$BitmapMeta;-><init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;)V

    return-void
.end method
