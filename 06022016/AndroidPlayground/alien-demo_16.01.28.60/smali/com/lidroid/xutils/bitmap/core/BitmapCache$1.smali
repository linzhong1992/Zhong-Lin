.class Lcom/lidroid/xutils/bitmap/core/BitmapCache$1;
.super Lcom/lidroid/xutils/util/core/LruMemoryCache;
.source "BitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lidroid/xutils/bitmap/core/BitmapCache;->initMemoryCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lidroid/xutils/util/core/LruMemoryCache",
        "<",
        "Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lidroid/xutils/bitmap/core/BitmapCache;


# direct methods
.method constructor <init>(Lcom/lidroid/xutils/bitmap/core/BitmapCache;I)V
    .locals 0
    .param p2, "$anonymous0"    # I

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/core/BitmapCache$1;->this$0:Lcom/lidroid/xutils/bitmap/core/BitmapCache;

    .line 69
    invoke-direct {p0, p2}, Lcom/lidroid/xutils/util/core/LruMemoryCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected sizeOf(Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;Landroid/graphics/Bitmap;)I
    .locals 2
    .param p1, "key"    # Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 76
    if-nez p2, :cond_0

    const/4 v0, 0x0

    .line 77
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    goto :goto_0
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;

    check-cast p2, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/lidroid/xutils/bitmap/core/BitmapCache$1;->sizeOf(Lcom/lidroid/xutils/bitmap/core/BitmapCache$MemoryCacheKey;Landroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method
