.class public abstract Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;
.super Ljava/lang/Object;
.source "BitmapLoadCallBack.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/bitmap/callback/BitmapSetter",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDrawable(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/graphics/drawable/Drawable;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "container":Landroid/view/View;, "TT;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    invoke-interface {v0, p1}, Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;->getDrawable(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 110
    .end local p1    # "container":Landroid/view/View;, "TT;"
    :goto_0
    return-object v0

    .line 107
    .restart local p1    # "container":Landroid/view/View;, "TT;"
    :cond_0
    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 108
    check-cast p1, Landroid/widget/ImageView;

    .end local p1    # "container":Landroid/view/View;, "TT;"
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 110
    .restart local p1    # "container":Landroid/view/View;, "TT;"
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method public abstract onLoadCompleted(Landroid/view/View;Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;",
            "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadFrom;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onLoadFailed(Landroid/view/View;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ")V"
        }
    .end annotation
.end method

.method public onLoadStarted(Landroid/view/View;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)V
    .locals 0
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "container":Landroid/view/View;, "TT;"
    return-void
.end method

.method public onLoading(Landroid/view/View;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;JJ)V
    .locals 0
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .param p4, "total"    # J
    .param p6, "current"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;",
            "JJ)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "container":Landroid/view/View;, "TT;"
    return-void
.end method

.method public onPreLoad(Landroid/view/View;Ljava/lang/String;Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;)V
    .locals 0
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "config"    # Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/bitmap/BitmapDisplayConfig;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "container":Landroid/view/View;, "TT;"
    return-void
.end method

.method public setBitmap(Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "container":Landroid/view/View;, "TT;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    invoke-interface {v0, p1, p2}, Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;->setBitmap(Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 92
    .end local p1    # "container":Landroid/view/View;, "TT;"
    :goto_0
    return-void

    .line 87
    .restart local p1    # "container":Landroid/view/View;, "TT;"
    :cond_0
    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 88
    check-cast p1, Landroid/widget/ImageView;

    .end local p1    # "container":Landroid/view/View;, "TT;"
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 90
    .restart local p1    # "container":Landroid/view/View;, "TT;"
    :cond_1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public setBitmapSetter(Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lidroid/xutils/bitmap/callback/BitmapSetter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "bitmapSetter":Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;, "Lcom/lidroid/xutils/bitmap/callback/BitmapSetter<TT;>;"
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    .line 82
    return-void
.end method

.method public setDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/graphics/drawable/Drawable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;, "Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack<TT;>;"
    .local p1, "container":Landroid/view/View;, "TT;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/callback/BitmapLoadCallBack;->bitmapSetter:Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;

    invoke-interface {v0, p1, p2}, Lcom/lidroid/xutils/bitmap/callback/BitmapSetter;->setDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 102
    .end local p1    # "container":Landroid/view/View;, "TT;"
    :goto_0
    return-void

    .line 97
    .restart local p1    # "container":Landroid/view/View;, "TT;"
    :cond_0
    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 98
    check-cast p1, Landroid/widget/ImageView;

    .end local p1    # "container":Landroid/view/View;, "TT;"
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 100
    .restart local p1    # "container":Landroid/view/View;, "TT;"
    :cond_1
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method
