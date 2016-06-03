.class public Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
.super Ljava/lang/Object;
.source "BitmapDisplayConfig.java"


# static fields
.field private static final TRANSPARENT_DRAWABLE:Landroid/graphics/drawable/Drawable;


# instance fields
.field private animation:Landroid/view/animation/Animation;

.field private autoRotation:Z

.field private bitmapConfig:Landroid/graphics/Bitmap$Config;

.field private bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

.field private loadFailedDrawable:Landroid/graphics/drawable/Drawable;

.field private loadingDrawable:Landroid/graphics/drawable/Drawable;

.field private showOriginal:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 35
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    sput-object v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->TRANSPARENT_DRAWABLE:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->autoRotation:Z

    .line 32
    iput-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->showOriginal:Z

    .line 33
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 38
    return-void
.end method


# virtual methods
.method public cloneNew()Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .locals 2

    .prologue
    .line 102
    new-instance v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;

    invoke-direct {v0}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;-><init>()V

    .line 103
    .local v0, "config":Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    iput-object v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    .line 104
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->animation:Landroid/view/animation/Animation;

    iput-object v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->animation:Landroid/view/animation/Animation;

    .line 105
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    .line 106
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadFailedDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadFailedDrawable:Landroid/graphics/drawable/Drawable;

    .line 107
    iget-boolean v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->autoRotation:Z

    iput-boolean v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->autoRotation:Z

    .line 108
    iget-boolean v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->showOriginal:Z

    iput-boolean v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->showOriginal:Z

    .line 109
    iget-object v1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 110
    return-object v0
.end method

.method public getAnimation()Landroid/view/animation/Animation;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->animation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method public getBitmapConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method public getBitmapMaxSize()Lcom/lidroid/xutils/bitmap/core/BitmapSize;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    if-nez v0, :cond_0

    sget-object v0, Lcom/lidroid/xutils/bitmap/core/BitmapSize;->ZERO:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    goto :goto_0
.end method

.method public getLoadFailedDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadFailedDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    sget-object v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->TRANSPARENT_DRAWABLE:Landroid/graphics/drawable/Drawable;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadFailedDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method public getLoadingDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    sget-object v0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->TRANSPARENT_DRAWABLE:Landroid/graphics/drawable/Drawable;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method public isAutoRotation()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->autoRotation:Z

    return v0
.end method

.method public isShowOriginal()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->showOriginal:Z

    return v0
.end method

.method public setAnimation(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->animation:Landroid/view/animation/Animation;

    .line 54
    return-void
.end method

.method public setAutoRotation(Z)V
    .locals 0
    .param p1, "autoRotation"    # Z

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->autoRotation:Z

    .line 78
    return-void
.end method

.method public setBitmapConfig(Landroid/graphics/Bitmap$Config;)V
    .locals 0
    .param p1, "bitmapConfig"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 94
    return-void
.end method

.method public setBitmapMaxSize(Lcom/lidroid/xutils/bitmap/core/BitmapSize;)V
    .locals 0
    .param p1, "bitmapMaxSize"    # Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    .line 46
    return-void
.end method

.method public setLoadFailedDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "loadFailedDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadFailedDrawable:Landroid/graphics/drawable/Drawable;

    .line 70
    return-void
.end method

.method public setLoadingDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "loadingDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    .line 62
    return-void
.end method

.method public setShowOriginal(Z)V
    .locals 0
    .param p1, "showOriginal"    # Z

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->showOriginal:Z

    .line 86
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->isShowOriginal()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;->bitmapMaxSize:Lcom/lidroid/xutils/bitmap/core/BitmapSize;

    invoke-virtual {v0}, Lcom/lidroid/xutils/bitmap/core/BitmapSize;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
