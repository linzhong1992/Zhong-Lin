.class public Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "AsyncDrawable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Landroid/graphics/drawable/Drawable;"
    }
.end annotation


# instance fields
.field private final baseDrawable:Landroid/graphics/drawable/Drawable;

.field private final bitmapLoadTaskReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)V
    .locals 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    .local p2, "bitmapWorkerTask":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<TT;>;"
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 22
    if-nez p1, :cond_0

    .line 23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "drawable may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_0
    if-nez p2, :cond_1

    .line 26
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitmapWorkerTask may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_1
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    .line 29
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->bitmapLoadTaskReference:Ljava/lang/ref/WeakReference;

    .line 30
    return-void
.end method


# virtual methods
.method public clearColorFilter()V
    .locals 1

    .prologue
    .line 108
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 109
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 38
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 39
    return-void
.end method

.method public getBitmapWorkerTask()Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->bitmapLoadTaskReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;

    return-object v0
.end method

.method public getChangingConfigurations()I
    .locals 1

    .prologue
    .line 73
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    return v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .prologue
    .line 173
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    return-object v0
.end method

.method public getCurrent()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 128
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 148
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 143
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    .prologue
    .line 158
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    .prologue
    .line 153
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 53
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 1
    .param p1, "padding"    # Landroid/graphics/Rect;

    .prologue
    .line 163
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v0

    return v0
.end method

.method public getState()[I
    .locals 1

    .prologue
    .line 123
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    return-object v0
.end method

.method public getTransparentRegion()Landroid/graphics/Region;
    .locals 1

    .prologue
    .line 138
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getTransparentRegion()Landroid/graphics/Region;

    move-result-object v0

    return-object v0
.end method

.method public invalidateSelf()V
    .locals 1

    .prologue
    .line 88
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 89
    return-void
.end method

.method public isStateful()Z
    .locals 1

    .prologue
    .line 113
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    return v0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 168
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .locals 2
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 93
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 94
    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 43
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 44
    return-void
.end method

.method public setBounds(IIII)V
    .locals 1
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 58
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 59
    return-void
.end method

.method public setBounds(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 63
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 64
    return-void
.end method

.method public setChangingConfigurations(I)V
    .locals 1
    .param p1, "configs"    # I

    .prologue
    .line 68
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 69
    return-void
.end method

.method public setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .locals 1
    .param p1, "color"    # I
    .param p2, "mode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 103
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 104
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 48
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 49
    return-void
.end method

.method public setDither(Z)V
    .locals 1
    .param p1, "dither"    # Z

    .prologue
    .line 78
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 79
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1
    .param p1, "filter"    # Z

    .prologue
    .line 83
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 84
    return-void
.end method

.method public setState([I)Z
    .locals 1
    .param p1, "stateSet"    # [I

    .prologue
    .line 118
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    return v0
.end method

.method public setVisible(ZZ)Z
    .locals 1
    .param p1, "visible"    # Z
    .param p2, "restart"    # Z

    .prologue
    .line 133
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    return v0
.end method

.method public unscheduleSelf(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 98
    .local p0, "this":Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;, "Lcom/lidroid/xutils/bitmap/core/AsyncDrawable<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/core/AsyncDrawable;->baseDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 99
    return-void
.end method
