.class public Lcom/alien/demo/uibase/NoScrollViewPager;
.super Lcom/alien/demo/uibase/LazyViewPager;
.source "NoScrollViewPager.java"


# instance fields
.field private noScroll:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager;-><init>(Landroid/content/Context;)V

    .line 12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alien/demo/uibase/NoScrollViewPager;->noScroll:Z

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/alien/demo/uibase/LazyViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alien/demo/uibase/NoScrollViewPager;->noScroll:Z

    .line 17
    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "arg0"    # Landroid/view/MotionEvent;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/alien/demo/uibase/NoScrollViewPager;->noScroll:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    .line 46
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "arg0"    # Landroid/view/MotionEvent;

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/alien/demo/uibase/NoScrollViewPager;->noScroll:Z

    if-eqz v0, :cond_0

    .line 36
    const/4 v0, 0x0

    .line 38
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public scrollTo(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 29
    invoke-super {p0, p1, p2}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 30
    return-void
.end method

.method public setCurrentItem(I)V
    .locals 0
    .param p1, "item"    # I

    .prologue
    .line 56
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItem(I)V

    .line 57
    return-void
.end method

.method public setCurrentItem(IZ)V
    .locals 0
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z

    .prologue
    .line 51
    invoke-super {p0, p1, p2}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItem(IZ)V

    .line 52
    return-void
.end method

.method public setNoScroll(Z)V
    .locals 0
    .param p1, "noScroll"    # Z

    .prologue
    .line 24
    iput-boolean p1, p0, Lcom/alien/demo/uibase/NoScrollViewPager;->noScroll:Z

    .line 25
    return-void
.end method
