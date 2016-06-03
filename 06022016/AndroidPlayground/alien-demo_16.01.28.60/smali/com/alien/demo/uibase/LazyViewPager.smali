.class public Lcom/alien/demo/uibase/LazyViewPager;
.super Landroid/view/ViewGroup;
.source "LazyViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;,
        Lcom/alien/demo/uibase/LazyViewPager$SavedState;,
        Lcom/alien/demo/uibase/LazyViewPager$SimpleOnPageChangeListener;,
        Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;,
        Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    }
.end annotation


# static fields
.field private static final COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field private static final DEFAULT_OFFSCREEN_PAGES:I = 0x0

.field private static final INVALID_POINTER:I = -0x1

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "LazyViewPager"

.field private static final USE_CACHE:Z

.field private static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mActivePointerId:I

.field private mAdapter:Landroid/support/v4/view/PagerAdapter;

.field private mBaseLineFlingVelocity:F

.field private mChildHeightMeasureSpec:I

.field private mChildWidthMeasureSpec:I

.field private mCurItem:I

.field private mFakeDragBeginTime:J

.field private mFakeDragging:Z

.field private mFirstLayout:Z

.field private mFlingVelocityInfluence:F

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mIsBeingDragged:Z

.field private mIsUnableToDrag:Z

.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mMarginDrawable:Landroid/graphics/drawable/Drawable;

.field private mMaximumVelocity:I

.field private mMinimumVelocity:I

.field private mObserver:Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;

.field private mOffscreenPageLimit:I

.field private mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

.field private mPageMargin:I

.field private mPopulatePending:Z

.field private mRestoredAdapterState:Landroid/os/Parcelable;

.field private mRestoredClassLoader:Ljava/lang/ClassLoader;

.field private mRestoredCurItem:I

.field private mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mScrollState:I

.field private mScroller:Landroid/widget/Scroller;

.field private mScrolling:Z

.field private mScrollingCacheEnabled:Z

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lcom/alien/demo/uibase/LazyViewPager$1;

    invoke-direct {v0}, Lcom/alien/demo/uibase/LazyViewPager$1;-><init>()V

    sput-object v0, Lcom/alien/demo/uibase/LazyViewPager;->COMPARATOR:Ljava/util/Comparator;

    .line 71
    new-instance v0, Lcom/alien/demo/uibase/LazyViewPager$2;

    invoke-direct {v0}, Lcom/alien/demo/uibase/LazyViewPager$2;-><init>()V

    sput-object v0, Lcom/alien/demo/uibase/LazyViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 220
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    .line 84
    iput v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredCurItem:I

    .line 85
    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 86
    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 101
    iput v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    .line 116
    iput v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFirstLayout:Z

    .line 158
    iput v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollState:I

    .line 221
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->initViewPager()V

    .line 222
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 225
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    .line 84
    iput v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredCurItem:I

    .line 85
    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 86
    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 101
    iput v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    .line 116
    iput v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFirstLayout:Z

    .line 158
    iput v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollState:I

    .line 226
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->initViewPager()V

    .line 227
    return-void
.end method

.method private completeScroll()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 953
    iget-boolean v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrolling:Z

    .line 954
    .local v2, "needPopulate":Z
    if-eqz v2, :cond_2

    .line 956
    invoke-direct {p0, v8}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    .line 957
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->abortAnimation()V

    .line 958
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v3

    .line 959
    .local v3, "oldX":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v4

    .line 960
    .local v4, "oldY":I
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->getCurrX()I

    move-result v5

    .line 961
    .local v5, "x":I
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->getCurrY()I

    move-result v6

    .line 962
    .local v6, "y":I
    if-ne v3, v5, :cond_0

    if-eq v4, v6, :cond_1

    .line 963
    :cond_0
    invoke-virtual {p0, v5, v6}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 965
    :cond_1
    invoke-direct {p0, v8}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    .line 967
    .end local v3    # "oldX":I
    .end local v4    # "oldY":I
    .end local v5    # "x":I
    .end local v6    # "y":I
    :cond_2
    iput-boolean v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    .line 968
    iput-boolean v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrolling:Z

    .line 969
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v0, v7, :cond_4

    .line 970
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .line 971
    .local v1, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    iget-boolean v7, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->scrolling:Z

    if-eqz v7, :cond_3

    .line 972
    const/4 v2, 0x1

    .line 973
    iput-boolean v8, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->scrolling:Z

    .line 969
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 976
    .end local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_4
    if-eqz v2, :cond_5

    .line 977
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    .line 979
    :cond_5
    return-void
.end method

.method private endDrag()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1450
    iput-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    .line 1451
    iput-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mIsUnableToDrag:Z

    .line 1453
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    .line 1454
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1455
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1457
    :cond_0
    return-void
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .locals 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1435
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v2

    .line 1436
    .local v2, "pointerIndex":I
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 1437
    .local v1, "pointerId":I
    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    if-ne v1, v3, :cond_0

    .line 1440
    if-nez v2, :cond_1

    const/4 v0, 0x1

    .line 1441
    .local v0, "newPointerIndex":I
    :goto_0
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1442
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 1443
    iget-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_0

    .line 1444
    iget-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 1447
    .end local v0    # "newPointerIndex":I
    :cond_0
    return-void

    .line 1440
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private recomputeScrollPosition(IIII)V
    .locals 11
    .param p1, "width"    # I
    .param p2, "oldWidth"    # I
    .param p3, "margin"    # I
    .param p4, "oldMargin"    # I

    .prologue
    const/4 v2, 0x0

    .line 870
    add-int v10, p1, p3

    .line 871
    .local v10, "widthWithMargin":I
    if-lez p2, :cond_1

    .line 872
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v7

    .line 873
    .local v7, "oldScrollPos":I
    add-int v8, p2, p4

    .line 874
    .local v8, "oldwwm":I
    div-int v6, v7, v8

    .line 875
    .local v6, "oldScrollItem":I
    rem-int v0, v7, v8

    int-to-float v0, v0

    int-to-float v3, v8

    div-float v9, v0, v3

    .line 876
    .local v9, "scrollOffset":F
    int-to-float v0, v6

    add-float/2addr v0, v9

    int-to-float v3, v10

    mul-float/2addr v0, v3

    float-to-int v1, v0

    .line 877
    .local v1, "scrollPos":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 878
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 880
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getDuration()I

    move-result v0

    iget-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->timePassed()I

    move-result v3

    sub-int v5, v0, v3

    .line 881
    .local v5, "newDuration":I
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    mul-int/2addr v3, v10

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 890
    .end local v5    # "newDuration":I
    .end local v6    # "oldScrollItem":I
    .end local v7    # "oldScrollPos":I
    .end local v8    # "oldwwm":I
    .end local v9    # "scrollOffset":F
    :cond_0
    :goto_0
    return-void

    .line 884
    .end local v1    # "scrollPos":I
    :cond_1
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    mul-int v1, v0, v10

    .line 885
    .restart local v1    # "scrollPos":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v0

    if-eq v1, v0, :cond_0

    .line 886
    invoke-direct {p0}, Lcom/alien/demo/uibase/LazyViewPager;->completeScroll()V

    .line 887
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    goto :goto_0
.end method

.method private setScrollState(I)V
    .locals 1
    .param p1, "newState"    # I

    .prologue
    .line 248
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollState:I

    if-ne v0, p1, :cond_1

    .line 256
    :cond_0
    :goto_0
    return-void

    .line 252
    :cond_1
    iput p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollState:I

    .line 253
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    if-eqz v0, :cond_0

    .line 254
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    goto :goto_0
.end method

.method private setScrollingCacheEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 1460
    iget-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollingCacheEnabled:Z

    if-eq v0, p1, :cond_0

    .line 1461
    iput-boolean p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollingCacheEnabled:Z

    .line 1472
    :cond_0
    return-void
.end method


# virtual methods
.method public addFocusables(Ljava/util/ArrayList;II)V
    .locals 7
    .param p2, "direction"    # I
    .param p3, "focusableMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 1604
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 1606
    .local v2, "focusableCount":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getDescendantFocusability()I

    move-result v1

    .line 1608
    .local v1, "descendantFocusability":I
    const/high16 v5, 0x60000

    if-eq v1, v5, :cond_1

    .line 1609
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 1610
    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1611
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_0

    .line 1612
    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v4

    .line 1613
    .local v4, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    if-eqz v4, :cond_0

    iget v5, v4, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v5, v6, :cond_0

    .line 1614
    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 1609
    .end local v4    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1624
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "i":I
    :cond_1
    const/high16 v5, 0x40000

    if-ne v1, v5, :cond_2

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v2, v5, :cond_3

    .line 1630
    :cond_2
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->isFocusable()Z

    move-result v5

    if-nez v5, :cond_4

    .line 1641
    :cond_3
    :goto_1
    return-void

    .line 1633
    :cond_4
    and-int/lit8 v5, p3, 0x1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_5

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->isInTouchMode()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->isFocusableInTouchMode()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1637
    :cond_5
    if-eqz p1, :cond_3

    .line 1638
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method addNewItem(II)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "index"    # I

    .prologue
    .line 539
    new-instance v0, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    invoke-direct {v0}, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;-><init>()V

    .line 540
    .local v0, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    iput p1, v0, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    .line 541
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0, p1}, Landroid/support/v4/view/PagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    .line 542
    if-gez p2, :cond_0

    .line 543
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 547
    :goto_0
    return-void

    .line 545
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method public addTouchables(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1651
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 1652
    invoke-virtual {p0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1653
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_0

    .line 1654
    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v2

    .line 1655
    .local v2, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    if-eqz v2, :cond_0

    iget v3, v2, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v3, v4, :cond_0

    .line 1656
    invoke-virtual {v0, p1}, Landroid/view/View;->addTouchables(Ljava/util/ArrayList;)V

    .line 1651
    .end local v2    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1660
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 783
    iget-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInLayout:Z

    if-eqz v0, :cond_0

    .line 784
    invoke-virtual {p0, p1, p2, p3}, Lcom/alien/demo/uibase/LazyViewPager;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 785
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mChildWidthMeasureSpec:I

    iget v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mChildHeightMeasureSpec:I

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->measure(II)V

    .line 797
    :goto_0
    return-void

    .line 787
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public arrowScroll(I)Z
    .locals 6
    .param p1, "direction"    # I

    .prologue
    const/16 v5, 0x42

    const/16 v4, 0x11

    .line 1545
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->findFocus()Landroid/view/View;

    move-result-object v0

    .line 1546
    .local v0, "currentFocused":Landroid/view/View;
    if-ne v0, p0, :cond_0

    const/4 v0, 0x0

    .line 1548
    :cond_0
    const/4 v1, 0x0

    .line 1550
    .local v1, "handled":Z
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v3

    invoke-virtual {v3, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    .line 1552
    .local v2, "nextFocused":Landroid/view/View;
    if-eqz v2, :cond_6

    if-eq v2, v0, :cond_6

    .line 1553
    if-ne p1, v4, :cond_4

    .line 1556
    if-eqz v0, :cond_3

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 1557
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->pageLeft()Z

    move-result v1

    .line 1577
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 1578
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->playSoundEffect(I)V

    .line 1580
    :cond_2
    return v1

    .line 1559
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    goto :goto_0

    .line 1561
    :cond_4
    if-ne p1, v5, :cond_1

    .line 1564
    if-eqz v0, :cond_5

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v4

    if-gt v3, v4, :cond_5

    .line 1565
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->pageRight()Z

    move-result v1

    goto :goto_0

    .line 1567
    :cond_5
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    goto :goto_0

    .line 1570
    :cond_6
    if-eq p1, v4, :cond_7

    const/4 v3, 0x1

    if-ne p1, v3, :cond_8

    .line 1572
    :cond_7
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->pageLeft()Z

    move-result v1

    goto :goto_0

    .line 1573
    :cond_8
    if-eq p1, v5, :cond_9

    const/4 v3, 0x2

    if-ne p1, v3, :cond_1

    .line 1575
    :cond_9
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->pageRight()Z

    move-result v1

    goto :goto_0
.end method

.method public beginFakeDrag()Z
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 1327
    iget-boolean v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    if-eqz v2, :cond_0

    .line 1343
    :goto_0
    return v4

    .line 1330
    :cond_0
    iput-boolean v9, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragging:Z

    .line 1331
    invoke-direct {p0, v9}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    .line 1332
    iput v5, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    iput v5, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInitialMotionX:F

    .line 1333
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v2, :cond_1

    .line 1334
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1338
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .local v0, "time":J
    move-wide v2, v0

    move v6, v5

    move v7, v4

    .line 1339
    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .line 1340
    .local v8, "ev":Landroid/view/MotionEvent;
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v8}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1341
    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    .line 1342
    iput-wide v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragBeginTime:J

    move v4, v9

    .line 1343
    goto :goto_0

    .line 1336
    .end local v0    # "time":J
    .end local v8    # "ev":Landroid/view/MotionEvent;
    :cond_1
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2}, Landroid/view/VelocityTracker;->clear()V

    goto :goto_1
.end method

.method protected canScroll(Landroid/view/View;ZIII)Z
    .locals 11
    .param p1, "v"    # Landroid/view/View;
    .param p2, "checkV"    # Z
    .param p3, "dx"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I

    .prologue
    .line 1486
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    move-object v7, p1

    .line 1487
    check-cast v7, Landroid/view/ViewGroup;

    .line 1488
    .local v7, "group":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v9

    .line 1489
    .local v9, "scrollX":I
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v10

    .line 1490
    .local v10, "scrollY":I
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    .line 1492
    .local v6, "count":I
    add-int/lit8 v8, v6, -0x1

    .local v8, "i":I
    :goto_0
    if-ltz v8, :cond_1

    .line 1495
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1496
    .local v1, "child":Landroid/view/View;
    add-int v0, p4, v9

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v2

    if-lt v0, v2, :cond_0

    add-int v0, p4, v9

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v2

    if-ge v0, v2, :cond_0

    add-int v0, p5, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    if-lt v0, v2, :cond_0

    add-int v0, p5, v10

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v2

    if-ge v0, v2, :cond_0

    const/4 v2, 0x1

    add-int v0, p4, v9

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int v4, v0, v3

    add-int v0, p5, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int v5, v0, v3

    move-object v0, p0

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/alien/demo/uibase/LazyViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1500
    const/4 v0, 0x1

    .line 1505
    .end local v1    # "child":Landroid/view/View;
    .end local v6    # "count":I
    .end local v7    # "group":Landroid/view/ViewGroup;
    .end local v8    # "i":I
    .end local v9    # "scrollX":I
    .end local v10    # "scrollY":I
    :goto_1
    return v0

    .line 1492
    .restart local v1    # "child":Landroid/view/View;
    .restart local v6    # "count":I
    .restart local v7    # "group":Landroid/view/ViewGroup;
    .restart local v8    # "i":I
    .restart local v9    # "scrollX":I
    .restart local v10    # "scrollY":I
    :cond_0
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 1505
    .end local v1    # "child":Landroid/view/View;
    .end local v6    # "count":I
    .end local v7    # "group":Landroid/view/ViewGroup;
    .end local v8    # "i":I
    .end local v9    # "scrollX":I
    .end local v10    # "scrollY":I
    :cond_1
    if-eqz p2, :cond_2

    neg-int v0, p3

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public computeScroll()V
    .locals 10

    .prologue
    .line 922
    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->isFinished()Z

    move-result v8

    if-nez v8, :cond_3

    .line 923
    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 925
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v2

    .line 926
    .local v2, "oldX":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v3

    .line 927
    .local v3, "oldY":I
    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrX()I

    move-result v6

    .line 928
    .local v6, "x":I
    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrY()I

    move-result v7

    .line 930
    .local v7, "y":I
    if-ne v2, v6, :cond_0

    if-eq v3, v7, :cond_1

    .line 931
    :cond_0
    invoke-virtual {p0, v6, v7}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 934
    :cond_1
    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    if-eqz v8, :cond_2

    .line 935
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v8

    iget v9, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int v5, v8, v9

    .line 936
    .local v5, "widthWithMargin":I
    div-int v4, v6, v5

    .line 937
    .local v4, "position":I
    rem-int v1, v6, v5

    .line 938
    .local v1, "offsetPixels":I
    int-to-float v8, v1

    int-to-float v9, v5

    div-float v0, v8, v9

    .line 939
    .local v0, "offset":F
    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    invoke-interface {v8, v4, v0, v1}, Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 943
    .end local v0    # "offset":F
    .end local v1    # "offsetPixels":I
    .end local v4    # "position":I
    .end local v5    # "widthWithMargin":I
    :cond_2
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->invalidate()V

    .line 950
    .end local v2    # "oldX":I
    .end local v3    # "oldY":I
    .end local v6    # "x":I
    .end local v7    # "y":I
    :goto_0
    return-void

    .line 949
    :cond_3
    invoke-direct {p0}, Lcom/alien/demo/uibase/LazyViewPager;->completeScroll()V

    goto :goto_0
.end method

.method dataSetChanged()V
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 552
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x3

    if-ge v7, v8, :cond_1

    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v8

    if-ge v7, v8, :cond_1

    move v2, v5

    .line 553
    .local v2, "needPopulate":Z
    :goto_0
    const/4 v3, -0x1

    .line 555
    .local v3, "newCurrItem":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v0, v7, :cond_5

    .line 556
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .line 557
    .local v1, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v8, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v7, v8}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v4

    .line 559
    .local v4, "newPos":I
    const/4 v7, -0x1

    if-ne v4, v7, :cond_2

    .line 555
    :cond_0
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .end local v2    # "needPopulate":Z
    .end local v3    # "newCurrItem":I
    .end local v4    # "newPos":I
    :cond_1
    move v2, v6

    .line 552
    goto :goto_0

    .line 563
    .restart local v0    # "i":I
    .restart local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .restart local v2    # "needPopulate":Z
    .restart local v3    # "newCurrItem":I
    .restart local v4    # "newPos":I
    :cond_2
    const/4 v7, -0x2

    if-ne v4, v7, :cond_3

    .line 564
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 565
    add-int/lit8 v0, v0, -0x1

    .line 566
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v8, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget-object v9, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v7, p0, v8, v9}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 567
    const/4 v2, 0x1

    .line 569
    iget v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    iget v8, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    if-ne v7, v8, :cond_0

    .line 571
    iget v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    iget-object v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v3

    goto :goto_2

    .line 576
    :cond_3
    iget v7, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    if-eq v7, v4, :cond_0

    .line 577
    iget v7, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v7, v8, :cond_4

    .line 579
    move v3, v4

    .line 582
    :cond_4
    iput v4, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    .line 583
    const/4 v2, 0x1

    goto :goto_2

    .line 587
    .end local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .end local v4    # "newPos":I
    :cond_5
    iget-object v7, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    sget-object v8, Lcom/alien/demo/uibase/LazyViewPager;->COMPARATOR:Ljava/util/Comparator;

    invoke-static {v7, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 589
    if-ltz v3, :cond_6

    .line 591
    invoke-virtual {p0, v3, v6, v5}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    .line 592
    const/4 v2, 0x1

    .line 594
    :cond_6
    if-eqz v2, :cond_7

    .line 595
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    .line 596
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->requestLayout()V

    .line 598
    :cond_7
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1511
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 1702
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v1

    .line 1703
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 1704
    invoke-virtual {p0, v2}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1705
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_0

    .line 1706
    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v3

    .line 1707
    .local v3, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    if-eqz v3, :cond_0

    iget v4, v3, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v5, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v4, v5, :cond_0

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1709
    const/4 v4, 0x1

    .line 1714
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :goto_1
    return v4

    .line 1703
    .restart local v0    # "child":Landroid/view/View;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1714
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method distanceInfluenceForSnapDuration(F)F
    .locals 4
    .param p1, "f"    # F

    .prologue
    .line 481
    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    .line 482
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 483
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x1

    .line 1250
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 1251
    const/4 v2, 0x0

    .line 1253
    .local v2, "needsInvalidate":Z
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v3

    .line 1254
    .local v3, "overScrollMode":I
    if-eqz v3, :cond_0

    if-ne v3, v1, :cond_5

    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v6, :cond_5

    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v6}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v6

    if-le v6, v1, :cond_5

    .line 1257
    :cond_0
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1258
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    .line 1259
    .local v4, "restoreCount":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingBottom()I

    move-result v7

    sub-int v0, v6, v7

    .line 1261
    .local v0, "height":I
    const/high16 v6, 0x43870000    # 270.0f

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->rotate(F)V

    .line 1262
    neg-int v6, v0

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingTop()I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    const/4 v7, 0x0

    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1263
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v7

    invoke-virtual {v6, v0, v7}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 1264
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v6

    or-int/2addr v2, v6

    .line 1265
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1267
    .end local v0    # "height":I
    .end local v4    # "restoreCount":I
    :cond_1
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1268
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    .line 1269
    .restart local v4    # "restoreCount":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v5

    .line 1270
    .local v5, "width":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingBottom()I

    move-result v7

    sub-int v0, v6, v7

    .line 1271
    .restart local v0    # "height":I
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v6}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    .line 1273
    .local v1, "itemCount":I
    :cond_2
    const/high16 v6, 0x42b40000    # 90.0f

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->rotate(F)V

    .line 1274
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingTop()I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    neg-int v7, v1

    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v8, v5

    mul-int/2addr v7, v8

    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1276
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6, v0, v5}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 1277
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v6

    or-int/2addr v2, v6

    .line 1278
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1285
    .end local v0    # "height":I
    .end local v1    # "itemCount":I
    .end local v4    # "restoreCount":I
    .end local v5    # "width":I
    :cond_3
    :goto_0
    if-eqz v2, :cond_4

    .line 1287
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->invalidate()V

    .line 1289
    :cond_4
    return-void

    .line 1281
    :cond_5
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    .line 1282
    iget-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    goto :goto_0
.end method

.method protected drawableStateChanged()V
    .locals 2

    .prologue
    .line 469
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 470
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 471
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 472
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 474
    :cond_0
    return-void
.end method

.method public endFakeDrag()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1353
    iget-boolean v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragging:Z

    if-nez v2, :cond_0

    .line 1354
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1357
    :cond_0
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1358
    .local v1, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v2, 0x3e8

    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMaximumVelocity:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 1359
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    invoke-static {v1, v2}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v2

    float-to-int v0, v2

    .line 1361
    .local v0, "initialVelocity":I
    iput-boolean v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    .line 1362
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMinimumVelocity:I

    if-gt v2, v3, :cond_1

    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInitialMotionX:F

    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x3

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_3

    .line 1364
    :cond_1
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInitialMotionX:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 1365
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2, v4, v4}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    .line 1372
    :goto_0
    invoke-direct {p0}, Lcom/alien/demo/uibase/LazyViewPager;->endDrag()V

    .line 1374
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragging:Z

    .line 1375
    return-void

    .line 1367
    :cond_2
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2, v4, v4}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_0

    .line 1370
    :cond_3
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    invoke-virtual {p0, v2, v4, v4}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_0
.end method

.method public executeKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x1

    .line 1523
    const/4 v0, 0x0

    .line 1524
    .local v0, "handled":Z
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 1525
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 1541
    :cond_0
    :goto_0
    return v0

    .line 1527
    :sswitch_0
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->arrowScroll(I)Z

    move-result v0

    .line 1528
    goto :goto_0

    .line 1530
    :sswitch_1
    const/16 v1, 0x42

    invoke-virtual {p0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->arrowScroll(I)Z

    move-result v0

    .line 1531
    goto :goto_0

    .line 1533
    :sswitch_2
    invoke-static {p1}, Landroid/support/v4/view/KeyEventCompat;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1534
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_0

    .line 1535
    :cond_1
    invoke-static {p1, v2}, Landroid/support/v4/view/KeyEventCompat;->hasModifiers(Landroid/view/KeyEvent;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1536
    invoke-virtual {p0, v2}, Lcom/alien/demo/uibase/LazyViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_0

    .line 1525
    nop

    :sswitch_data_0
    .sparse-switch
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x3d -> :sswitch_2
    .end sparse-switch
.end method

.method public fakeDragBy(F)V
    .locals 19
    .param p1, "xOffset"    # F

    .prologue
    .line 1385
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragging:Z

    if-nez v2, :cond_0

    .line 1386
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1389
    :cond_0
    move-object/from16 v0, p0

    iget v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    add-float v2, v2, p1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1390
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    sub-float v16, v2, p1

    .line 1391
    .local v16, "scrollX":F
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v17

    .line 1392
    .local v17, "width":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int v18, v17, v2

    .line 1394
    .local v18, "widthWithMargin":I
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget v3, v0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/lit8 v3, v3, -0x1

    mul-int v3, v3, v18

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v11, v2

    .line 1395
    .local v11, "leftBound":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    mul-int v2, v2, v18

    int-to-float v15, v2

    .line 1397
    .local v15, "rightBound":F
    cmpg-float v2, v16, v11

    if-gez v2, :cond_3

    .line 1398
    move/from16 v16, v11

    .line 1403
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    move/from16 v0, v16

    float-to-int v3, v0

    int-to-float v3, v3

    sub-float v3, v16, v3

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1404
    move/from16 v0, v16

    float-to-int v2, v0

    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 1405
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    if-eqz v2, :cond_2

    .line 1406
    move/from16 v0, v16

    float-to-int v2, v0

    div-int v12, v2, v18

    .line 1407
    .local v12, "position":I
    move/from16 v0, v16

    float-to-int v2, v0

    rem-int v14, v2, v18

    .line 1408
    .local v14, "positionOffsetPixels":I
    int-to-float v2, v14

    move/from16 v0, v18

    int-to-float v3, v0

    div-float v13, v2, v3

    .line 1409
    .local v13, "positionOffset":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    invoke-interface {v2, v12, v13, v14}, Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1414
    .end local v12    # "position":I
    .end local v13    # "positionOffset":F
    .end local v14    # "positionOffsetPixels":I
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 1415
    .local v4, "time":J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragBeginTime:J

    const/4 v6, 0x2

    move-object/from16 v0, p0

    iget v7, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .line 1417
    .local v10, "ev":Landroid/view/MotionEvent;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v10}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1418
    invoke-virtual {v10}, Landroid/view/MotionEvent;->recycle()V

    .line 1419
    return-void

    .line 1399
    .end local v4    # "time":J
    .end local v10    # "ev":Landroid/view/MotionEvent;
    :cond_3
    cmpl-float v2, v16, v15

    if-lez v2, :cond_1

    .line 1400
    move/from16 v16, v15

    goto :goto_0
.end method

.method public getAdapter()Landroid/support/v4/view/PagerAdapter;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method public getCurrentItem()I
    .locals 1

    .prologue
    .line 321
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    return v0
.end method

.method public getOffscreenPageLimit()I
    .locals 1

    .prologue
    .line 382
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    return v0
.end method

.method public getPageMargin()I
    .locals 1

    .prologue
    .line 438
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    return v0
.end method

.method infoForAnyChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .locals 2
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 811
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .local v0, "parent":Landroid/view/ViewParent;
    if-eq v0, p0, :cond_2

    .line 812
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/view/View;

    if-nez v1, :cond_1

    .line 813
    :cond_0
    const/4 v1, 0x0

    .line 817
    :goto_1
    return-object v1

    :cond_1
    move-object p1, v0

    .line 815
    check-cast p1, Landroid/view/View;

    goto :goto_0

    .line 817
    :cond_2
    invoke-virtual {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v1

    goto :goto_1
.end method

.method infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .locals 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 800
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 801
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .line 802
    .local v1, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Landroid/support/v4/view/PagerAdapter;->isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 806
    .end local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :goto_1
    return-object v1

    .line 800
    .restart local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 806
    .end local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method initViewPager()V
    .locals 5

    .prologue
    .line 230
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->setWillNotDraw(Z)V

    .line 231
    const/high16 v3, 0x40000

    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->setDescendantFocusability(I)V

    .line 232
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->setFocusable(Z)V

    .line 233
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 234
    .local v1, "context":Landroid/content/Context;
    new-instance v3, Landroid/widget/Scroller;

    sget-object v4, Lcom/alien/demo/uibase/LazyViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v3, v1, v4}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    .line 235
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 236
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-static {v0}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mTouchSlop:I

    .line 237
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMinimumVelocity:I

    .line 238
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMaximumVelocity:I

    .line 239
    new-instance v3, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v3, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 240
    new-instance v3, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v3, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 242
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v2, v3, Landroid/util/DisplayMetrics;->density:F

    .line 243
    .local v2, "density":F
    const v3, 0x451c4000    # 2500.0f

    mul-float/2addr v3, v2

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mBaseLineFlingVelocity:F

    .line 244
    const v3, 0x3ecccccd    # 0.4f

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFlingVelocityInfluence:F

    .line 245
    return-void
.end method

.method public isFakeDragging()Z
    .locals 1

    .prologue
    .line 1431
    iget-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragging:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 822
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 823
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFirstLayout:Z

    .line 824
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1293
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 1296
    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_0

    .line 1297
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v2

    .line 1298
    .local v2, "scrollX":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v3

    .line 1299
    .local v3, "width":I
    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v4, v3

    rem-int v1, v2, v4

    .line 1300
    .local v1, "offset":I
    if-eqz v1, :cond_0

    .line 1302
    sub-int v4, v2, v1

    add-int v0, v4, v3

    .line 1303
    .local v0, "left":I
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v5, 0x0

    iget v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v6, v0

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getHeight()I

    move-result v7

    invoke-virtual {v4, v0, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1304
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1307
    .end local v0    # "left":I
    .end local v1    # "offset":I
    .end local v2    # "scrollX":I
    .end local v3    # "width":I
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 17
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 989
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v7, v1, 0xff

    .line 992
    .local v7, "action":I
    const/4 v1, 0x3

    if-eq v7, v1, :cond_0

    const/4 v1, 0x1

    if-ne v7, v1, :cond_1

    .line 995
    :cond_0
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    .line 996
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsUnableToDrag:Z

    .line 997
    const/4 v1, -0x1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 998
    const/4 v1, 0x0

    .line 1102
    :goto_0
    return v1

    .line 1003
    :cond_1
    if-eqz v7, :cond_3

    .line 1004
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    if-eqz v1, :cond_2

    .line 1006
    const/4 v1, 0x1

    goto :goto_0

    .line 1008
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsUnableToDrag:Z

    if-eqz v1, :cond_3

    .line 1010
    const/4 v1, 0x0

    goto :goto_0

    .line 1014
    :cond_3
    sparse-switch v7, :sswitch_data_0

    .line 1102
    :cond_4
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    goto :goto_0

    .line 1025
    :sswitch_0
    move-object/from16 v0, p0

    iget v8, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 1026
    .local v8, "activePointerId":I
    const/4 v1, -0x1

    if-eq v8, v1, :cond_4

    .line 1031
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v11

    .line 1032
    .local v11, "pointerIndex":I
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v13

    .line 1033
    .local v13, "x":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    sub-float v10, v13, v1

    .line 1034
    .local v10, "dx":F
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v14

    .line 1035
    .local v14, "xDiff":F
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v15

    .line 1036
    .local v15, "y":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionY:F

    sub-float v1, v15, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 1037
    .local v16, "yDiff":F
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v12

    .line 1038
    .local v12, "scrollX":I
    const/4 v1, 0x0

    cmpl-float v1, v10, v1

    if-lez v1, :cond_5

    if-eqz v12, :cond_6

    :cond_5
    const/4 v1, 0x0

    cmpg-float v1, v10, v1

    if-gez v1, :cond_7

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_7

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v2

    mul-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    if-lt v12, v1, :cond_7

    :cond_6
    const/4 v9, 0x1

    .line 1042
    .local v9, "atEdge":Z
    :goto_2
    const/4 v3, 0x0

    float-to-int v4, v10

    float-to-int v5, v13

    float-to-int v6, v15

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    invoke-virtual/range {v1 .. v6}, Lcom/alien/demo/uibase/LazyViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1044
    move-object/from16 v0, p0

    iput v13, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    move-object/from16 v0, p0

    iput v13, v0, Lcom/alien/demo/uibase/LazyViewPager;->mInitialMotionX:F

    .line 1045
    move-object/from16 v0, p0

    iput v15, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionY:F

    .line 1046
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 1038
    .end local v9    # "atEdge":Z
    :cond_7
    const/4 v9, 0x0

    goto :goto_2

    .line 1048
    .restart local v9    # "atEdge":Z
    :cond_8
    move-object/from16 v0, p0

    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mTouchSlop:I

    int-to-float v1, v1

    cmpl-float v1, v14, v1

    if-lez v1, :cond_9

    cmpl-float v1, v14, v16

    if-lez v1, :cond_9

    .line 1050
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    .line 1051
    const/4 v1, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    .line 1052
    move-object/from16 v0, p0

    iput v13, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1053
    const/4 v1, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    goto/16 :goto_1

    .line 1055
    :cond_9
    move-object/from16 v0, p0

    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mTouchSlop:I

    int-to-float v1, v1

    cmpl-float v1, v16, v1

    if-lez v1, :cond_4

    .line 1061
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsUnableToDrag:Z

    goto/16 :goto_1

    .line 1072
    .end local v8    # "activePointerId":I
    .end local v9    # "atEdge":Z
    .end local v10    # "dx":F
    .end local v11    # "pointerIndex":I
    .end local v12    # "scrollX":I
    .end local v13    # "x":F
    .end local v14    # "xDiff":F
    .end local v15    # "y":F
    .end local v16    # "yDiff":F
    :sswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mInitialMotionX:F

    move-object/from16 v0, p0

    iput v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1073
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionY:F

    .line 1074
    const/4 v1, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 1076
    move-object/from16 v0, p0

    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mScrollState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_a

    .line 1078
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    .line 1079
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsUnableToDrag:Z

    .line 1080
    const/4 v1, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    goto/16 :goto_1

    .line 1082
    :cond_a
    invoke-direct/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->completeScroll()V

    .line 1083
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    .line 1084
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsUnableToDrag:Z

    goto/16 :goto_1

    .line 1094
    :sswitch_2
    invoke-direct/range {p0 .. p1}, Lcom/alien/demo/uibase/LazyViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 1014
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x2 -> :sswitch_0
        0x6 -> :sswitch_2
    .end sparse-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 894
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInLayout:Z

    .line 895
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    .line 896
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInLayout:Z

    .line 898
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v3

    .line 899
    .local v3, "count":I
    sub-int v7, p4, p2

    .line 901
    .local v7, "width":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 902
    invoke-virtual {p0, v4}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 904
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_0

    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v5

    .local v5, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    if-eqz v5, :cond_0

    .line 905
    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v8, v7

    iget v9, v5, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    mul-int v6, v8, v9

    .line 906
    .local v6, "loff":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingLeft()I

    move-result v8

    add-int v1, v8, v6

    .line 907
    .local v1, "childLeft":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingTop()I

    move-result v2

    .line 911
    .local v2, "childTop":I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v8, v1

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    add-int/2addr v9, v2

    invoke-virtual {v0, v1, v2, v8, v9}, Landroid/view/View;->layout(IIII)V

    .line 901
    .end local v1    # "childLeft":I
    .end local v2    # "childTop":I
    .end local v5    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .end local v6    # "loff":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 916
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFirstLayout:Z

    .line 917
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    const/4 v5, 0x0

    .line 833
    invoke-static {v5, p1}, Lcom/alien/demo/uibase/LazyViewPager;->getDefaultSize(II)I

    move-result v3

    invoke-static {v5, p2}, Lcom/alien/demo/uibase/LazyViewPager;->getDefaultSize(II)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/alien/demo/uibase/LazyViewPager;->setMeasuredDimension(II)V

    .line 837
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mChildWidthMeasureSpec:I

    .line 839
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    iput v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mChildHeightMeasureSpec:I

    .line 843
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInLayout:Z

    .line 844
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    .line 845
    iput-boolean v5, p0, Lcom/alien/demo/uibase/LazyViewPager;->mInLayout:Z

    .line 848
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v2

    .line 849
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 850
    invoke-virtual {p0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 851
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_0

    .line 854
    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mChildWidthMeasureSpec:I

    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mChildHeightMeasureSpec:I

    invoke-virtual {v0, v3, v4}, Landroid/view/View;->measure(II)V

    .line 849
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 857
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 9
    .param p1, "direction"    # I
    .param p2, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    .line 1671
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v1

    .line 1672
    .local v1, "count":I
    and-int/lit8 v7, p1, 0x2

    if-eqz v7, :cond_0

    .line 1673
    const/4 v6, 0x0

    .line 1674
    .local v6, "index":I
    const/4 v5, 0x1

    .line 1675
    .local v5, "increment":I
    move v2, v1

    .line 1681
    .local v2, "end":I
    :goto_0
    move v3, v6

    .local v3, "i":I
    :goto_1
    if-eq v3, v2, :cond_2

    .line 1682
    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1683
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-nez v7, :cond_1

    .line 1684
    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v4

    .line 1685
    .local v4, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    if-eqz v4, :cond_1

    iget v7, v4, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v7, v8, :cond_1

    .line 1686
    invoke-virtual {v0, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1687
    const/4 v7, 0x1

    .line 1692
    .end local v0    # "child":Landroid/view/View;
    .end local v4    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :goto_2
    return v7

    .line 1677
    .end local v2    # "end":I
    .end local v3    # "i":I
    .end local v5    # "increment":I
    .end local v6    # "index":I
    :cond_0
    add-int/lit8 v6, v1, -0x1

    .line 1678
    .restart local v6    # "index":I
    const/4 v5, -0x1

    .line 1679
    .restart local v5    # "increment":I
    const/4 v2, -0x1

    .restart local v2    # "end":I
    goto :goto_0

    .line 1681
    .restart local v0    # "child":Landroid/view/View;
    .restart local v3    # "i":I
    :cond_1
    add-int/2addr v3, v5

    goto :goto_1

    .line 1692
    .end local v0    # "child":Landroid/view/View;
    :cond_2
    const/4 v7, 0x0

    goto :goto_2
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 763
    instance-of v1, p1, Lcom/alien/demo/uibase/LazyViewPager$SavedState;

    if-nez v1, :cond_0

    .line 764
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 779
    :goto_0
    return-void

    :cond_0
    move-object v0, p1

    .line 768
    check-cast v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;

    .line 769
    .local v0, "ss":Lcom/alien/demo/uibase/LazyViewPager$SavedState;
    invoke-virtual {v0}, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 771
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_1

    .line 772
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iget-object v3, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 773
    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->position:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_0

    .line 775
    :cond_1
    iget v1, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->position:I

    iput v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredCurItem:I

    .line 776
    iget-object v1, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 777
    iget-object v1, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    iput-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    goto :goto_0
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 752
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 753
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;

    invoke-direct {v0, v1}, Lcom/alien/demo/uibase/LazyViewPager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 754
    .local v0, "ss":Lcom/alien/demo/uibase/LazyViewPager$SavedState;
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    iput v2, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->position:I

    .line 755
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_0

    .line 756
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->saveState()Landroid/os/Parcelable;

    move-result-object v2

    iput-object v2, v0, Lcom/alien/demo/uibase/LazyViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    .line 758
    :cond_0
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 861
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 864
    if-eq p1, p3, :cond_0

    .line 865
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    iget v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    invoke-direct {p0, p1, p3, v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->recomputeScrollPosition(IIII)V

    .line 867
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 32
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1107
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mFakeDragging:Z

    move/from16 v29, v0

    if-eqz v29, :cond_0

    .line 1111
    const/16 v29, 0x1

    .line 1245
    :goto_0
    return v29

    .line 1114
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v29

    if-nez v29, :cond_1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v29

    if-eqz v29, :cond_1

    .line 1117
    const/16 v29, 0x0

    goto :goto_0

    .line 1120
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v29, v0

    if-eqz v29, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v29

    if-nez v29, :cond_3

    .line 1122
    :cond_2
    const/16 v29, 0x0

    goto :goto_0

    .line 1125
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v29, v0

    if-nez v29, :cond_4

    .line 1126
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1128
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1130
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    .line 1131
    .local v4, "action":I
    const/4 v12, 0x0

    .line 1133
    .local v12, "needsInvalidate":Z
    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    packed-switch v29, :pswitch_data_0

    .line 1242
    :cond_5
    :goto_1
    :pswitch_0
    if-eqz v12, :cond_6

    .line 1243
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->invalidate()V

    .line 1245
    :cond_6
    const/16 v29, 0x1

    goto :goto_0

    .line 1139
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->completeScroll()V

    .line 1142
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v29

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mInitialMotionX:F

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1143
    const/16 v29, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v29

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    goto :goto_1

    .line 1147
    :pswitch_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    move/from16 v29, v0

    if-nez v29, :cond_7

    .line 1148
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    move/from16 v29, v0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v16

    .line 1149
    .local v16, "pointerIndex":I
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v25

    .line 1150
    .local v25, "x":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    move/from16 v29, v0

    sub-float v29, v25, v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Math;->abs(F)F

    move-result v26

    .line 1151
    .local v26, "xDiff":F
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v27

    .line 1152
    .local v27, "y":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionY:F

    move/from16 v29, v0

    sub-float v29, v27, v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Math;->abs(F)F

    move-result v28

    .line 1154
    .local v28, "yDiff":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mTouchSlop:I

    move/from16 v29, v0

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    cmpl-float v29, v26, v29

    if-lez v29, :cond_7

    cmpl-float v29, v26, v28

    if-lez v29, :cond_7

    .line 1156
    const/16 v29, 0x1

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    .line 1157
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1158
    const/16 v29, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    .line 1159
    const/16 v29, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    .line 1162
    .end local v16    # "pointerIndex":I
    .end local v25    # "x":F
    .end local v26    # "xDiff":F
    .end local v27    # "y":F
    .end local v28    # "yDiff":F
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    move/from16 v29, v0

    if-eqz v29, :cond_5

    .line 1164
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    move/from16 v29, v0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v5

    .line 1166
    .local v5, "activePointerIndex":I
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v25

    .line 1167
    .restart local v25    # "x":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    move/from16 v29, v0

    sub-float v7, v29, v25

    .line 1168
    .local v7, "deltaX":F
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1169
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v29

    move/from16 v0, v29

    int-to-float v14, v0

    .line 1170
    .local v14, "oldScrollX":F
    add-float v21, v14, v7

    .line 1171
    .local v21, "scrollX":F
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v23

    .line 1172
    .local v23, "width":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    move/from16 v29, v0

    add-int v24, v23, v29

    .line 1174
    .local v24, "widthWithMargin":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v29

    add-int/lit8 v10, v29, -0x1

    .line 1175
    .local v10, "lastItemIndex":I
    const/16 v29, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    move/from16 v30, v0

    add-int/lit8 v30, v30, -0x1

    mul-int v30, v30, v24

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->max(II)I

    move-result v29

    move/from16 v0, v29

    int-to-float v11, v0

    .line 1176
    .local v11, "leftBound":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    move/from16 v29, v0

    add-int/lit8 v29, v29, 0x1

    move/from16 v0, v29

    invoke-static {v0, v10}, Ljava/lang/Math;->min(II)I

    move-result v29

    mul-int v29, v29, v24

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v20, v0

    .line 1178
    .local v20, "rightBound":F
    cmpg-float v29, v21, v11

    if-gez v29, :cond_a

    .line 1179
    const/16 v29, 0x0

    cmpl-float v29, v11, v29

    if-nez v29, :cond_8

    .line 1180
    move/from16 v0, v21

    neg-float v15, v0

    .line 1181
    .local v15, "over":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v29, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v30, v0

    div-float v30, v15, v30

    invoke-virtual/range {v29 .. v30}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v12

    .line 1183
    .end local v15    # "over":F
    :cond_8
    move/from16 v21, v11

    .line 1192
    :cond_9
    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    move/from16 v29, v0

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    sub-float v30, v21, v30

    add-float v29, v29, v30

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1193
    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v29, v0

    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v30

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 1194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    move-object/from16 v29, v0

    if-eqz v29, :cond_5

    .line 1195
    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v29, v0

    div-int v17, v29, v24

    .line 1196
    .local v17, "position":I
    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v29, v0

    rem-int v19, v29, v24

    .line 1197
    .local v19, "positionOffsetPixels":I
    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v29, v0

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v30, v0

    div-float v18, v29, v30

    .line 1198
    .local v18, "positionOffset":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    goto/16 :goto_1

    .line 1184
    .end local v17    # "position":I
    .end local v18    # "positionOffset":F
    .end local v19    # "positionOffsetPixels":I
    :cond_a
    cmpl-float v29, v21, v20

    if-lez v29, :cond_9

    .line 1185
    mul-int v29, v10, v24

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    cmpl-float v29, v20, v29

    if-nez v29, :cond_b

    .line 1186
    sub-float v15, v21, v20

    .line 1187
    .restart local v15    # "over":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v29, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v30, v0

    div-float v30, v15, v30

    invoke-virtual/range {v29 .. v30}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v12

    .line 1189
    .end local v15    # "over":F
    :cond_b
    move/from16 v21, v20

    goto/16 :goto_2

    .line 1204
    .end local v5    # "activePointerIndex":I
    .end local v7    # "deltaX":F
    .end local v10    # "lastItemIndex":I
    .end local v11    # "leftBound":F
    .end local v14    # "oldScrollX":F
    .end local v20    # "rightBound":F
    .end local v21    # "scrollX":F
    .end local v23    # "width":I
    .end local v24    # "widthWithMargin":I
    .end local v25    # "x":F
    :pswitch_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    move/from16 v29, v0

    if-eqz v29, :cond_5

    .line 1205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v22, v0

    .line 1206
    .local v22, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v29, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mMaximumVelocity:I

    move/from16 v30, v0

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    move-object/from16 v0, v22

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 1207
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    move/from16 v29, v0

    move-object/from16 v0, v22

    move/from16 v1, v29

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v29

    move/from16 v0, v29

    float-to-int v9, v0

    .line 1209
    .local v9, "initialVelocity":I
    const/16 v29, 0x1

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    .line 1210
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v29

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    move/from16 v30, v0

    add-int v24, v29, v30

    .line 1211
    .restart local v24    # "widthWithMargin":I
    invoke-virtual/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v21

    .line 1212
    .local v21, "scrollX":I
    div-int v6, v21, v24

    .line 1213
    .local v6, "currentPage":I
    if-lez v9, :cond_c

    move v13, v6

    .line 1214
    .local v13, "nextPage":I
    :goto_3
    const/16 v29, 0x1

    const/16 v30, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v13, v1, v2, v9}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZI)V

    .line 1216
    const/16 v29, -0x1

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 1217
    invoke-direct/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->endDrag()V

    .line 1218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v30

    or-int v12, v29, v30

    .line 1219
    goto/16 :goto_1

    .line 1213
    .end local v13    # "nextPage":I
    :cond_c
    add-int/lit8 v13, v6, 0x1

    goto :goto_3

    .line 1222
    .end local v6    # "currentPage":I
    .end local v9    # "initialVelocity":I
    .end local v21    # "scrollX":I
    .end local v22    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v24    # "widthWithMargin":I
    :pswitch_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mIsBeingDragged:Z

    move/from16 v29, v0

    if-eqz v29, :cond_5

    .line 1223
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    move/from16 v29, v0

    const/16 v30, 0x1

    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-virtual {v0, v1, v2, v3}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    .line 1224
    const/16 v29, -0x1

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    .line 1225
    invoke-direct/range {p0 .. p0}, Lcom/alien/demo/uibase/LazyViewPager;->endDrag()V

    .line 1226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v30

    or-int v12, v29, v30

    goto/16 :goto_1

    .line 1230
    :pswitch_5
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v8

    .line 1231
    .local v8, "index":I
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v25

    .line 1232
    .restart local v25    # "x":F
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    .line 1233
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v29

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    goto/16 :goto_1

    .line 1237
    .end local v8    # "index":I
    .end local v25    # "x":F
    :pswitch_6
    invoke-direct/range {p0 .. p1}, Lcom/alien/demo/uibase/LazyViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 1238
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alien/demo/uibase/LazyViewPager;->mActivePointerId:I

    move/from16 v29, v0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v29

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v29

    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alien/demo/uibase/LazyViewPager;->mLastMotionX:F

    goto/16 :goto_1

    .line 1133
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method pageLeft()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1584
    iget v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-lez v1, :cond_0

    .line 1585
    iget v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItem(IZ)V

    .line 1588
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method pageRight()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 1592
    iget-object v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 1593
    iget v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItem(IZ)V

    .line 1596
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method populate()V
    .locals 15

    .prologue
    const/4 v11, 0x0

    const/4 v12, -0x1

    .line 601
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-nez v10, :cond_1

    .line 702
    :cond_0
    return-void

    .line 609
    :cond_1
    iget-boolean v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    if-nez v10, :cond_0

    .line 617
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWindowToken()Landroid/os/IBinder;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 621
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v10, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 623
    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    .line 624
    .local v8, "pageLimit":I
    const/4 v10, 0x0

    iget v13, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    sub-int/2addr v13, v8

    invoke-static {v10, v13}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 625
    .local v9, "startPos":I
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v10}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .line 626
    .local v0, "N":I
    add-int/lit8 v10, v0, -0x1

    iget v13, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/2addr v13, v8

    invoke-static {v10, v13}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 631
    .local v4, "endPos":I
    const/4 v7, -0x1

    .line 632
    .local v7, "lastPos":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v5, v10, :cond_6

    .line 633
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .line 634
    .local v6, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    iget v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    if-lt v10, v9, :cond_2

    iget v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    if-le v10, v4, :cond_4

    :cond_2
    iget-boolean v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->scrolling:Z

    if-nez v10, :cond_4

    .line 636
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 637
    add-int/lit8 v5, v5, -0x1

    .line 638
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v13, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget-object v14, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v10, p0, v13, v14}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 654
    :cond_3
    iget v7, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    .line 632
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 639
    :cond_4
    if-ge v7, v4, :cond_3

    iget v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    if-le v10, v9, :cond_3

    .line 643
    add-int/lit8 v7, v7, 0x1

    .line 644
    if-ge v7, v9, :cond_5

    .line 645
    move v7, v9

    .line 647
    :cond_5
    :goto_1
    if-gt v7, v4, :cond_3

    iget v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    if-ge v7, v10, :cond_3

    .line 649
    invoke-virtual {p0, v7, v5}, Lcom/alien/demo/uibase/LazyViewPager;->addNewItem(II)V

    .line 650
    add-int/lit8 v7, v7, 0x1

    .line 651
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 658
    .end local v6    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_6
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_7

    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v13, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    iget v7, v10, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    .line 659
    :goto_2
    if-ge v7, v4, :cond_9

    .line 660
    add-int/lit8 v7, v7, 0x1

    .line 661
    if-le v7, v9, :cond_8

    .line 662
    :goto_3
    if-gt v7, v4, :cond_9

    .line 664
    invoke-virtual {p0, v7, v12}, Lcom/alien/demo/uibase/LazyViewPager;->addNewItem(II)V

    .line 665
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_7
    move v7, v12

    .line 658
    goto :goto_2

    :cond_8
    move v7, v9

    .line 661
    goto :goto_3

    .line 676
    :cond_9
    const/4 v2, 0x0

    .line 677
    .local v2, "curItem":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    const/4 v5, 0x0

    :goto_4
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v5, v10, :cond_a

    .line 678
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    iget v10, v10, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v12, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v10, v12, :cond_d

    .line 679
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "curItem":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    check-cast v2, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .line 683
    .restart local v2    # "curItem":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_a
    iget-object v12, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v13, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-eqz v2, :cond_e

    iget-object v10, v2, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    :goto_5
    invoke-virtual {v12, p0, v13, v10}, Landroid/support/v4/view/PagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 685
    iget-object v10, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v10, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 687
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->hasFocus()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 688
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->findFocus()Landroid/view/View;

    move-result-object v3

    .line 689
    .local v3, "currentFocused":Landroid/view/View;
    if-eqz v3, :cond_f

    invoke-virtual {p0, v3}, Lcom/alien/demo/uibase/LazyViewPager;->infoForAnyChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v6

    .line 690
    .restart local v6    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :goto_6
    if-eqz v6, :cond_b

    iget v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v11, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-eq v10, v11, :cond_0

    .line 691
    :cond_b
    const/4 v5, 0x0

    :goto_7
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v10

    if-ge v5, v10, :cond_0

    .line 692
    invoke-virtual {p0, v5}, Lcom/alien/demo/uibase/LazyViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 693
    .local v1, "child":Landroid/view/View;
    invoke-virtual {p0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->infoForChild(Landroid/view/View;)Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    move-result-object v6

    .line 694
    if-eqz v6, :cond_c

    iget v10, v6, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v11, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v10, v11, :cond_c

    .line 695
    const/4 v10, 0x2

    invoke-virtual {v1, v10}, Landroid/view/View;->requestFocus(I)Z

    move-result v10

    if-nez v10, :cond_0

    .line 691
    :cond_c
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 677
    .end local v1    # "child":Landroid/view/View;
    .end local v3    # "currentFocused":Landroid/view/View;
    .end local v6    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_d
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_e
    move-object v10, v11

    .line 683
    goto :goto_5

    .restart local v3    # "currentFocused":Landroid/view/View;
    :cond_f
    move-object v6, v11

    .line 689
    goto :goto_6
.end method

.method public setAdapter(Landroid/support/v4/view/PagerAdapter;)V
    .locals 7
    .param p1, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 259
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_1

    .line 260
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mObserver:Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 261
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 262
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 263
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .line 264
    .local v1, "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v3, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget-object v4, v1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v2, p0, v3, v4}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 266
    .end local v1    # "ii":Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    :cond_0
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 267
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 268
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->removeAllViews()V

    .line 269
    iput v5, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    .line 270
    invoke-virtual {p0, v5, v5}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    .line 273
    .end local v0    # "i":I
    :cond_1
    iput-object p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 275
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_3

    .line 276
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mObserver:Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;

    if-nez v2, :cond_2

    .line 277
    new-instance v2, Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;

    invoke-direct {v2, p0, v6}, Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;-><init>(Lcom/alien/demo/uibase/LazyViewPager;Lcom/alien/demo/uibase/LazyViewPager$1;)V

    iput-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mObserver:Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;

    .line 279
    :cond_2
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mObserver:Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 280
    iput-boolean v5, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    .line 281
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredCurItem:I

    if-ltz v2, :cond_4

    .line 282
    iget-object v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v2, v3, v4}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 283
    iget v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredCurItem:I

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v5, v3}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    .line 284
    const/4 v2, -0x1

    iput v2, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredCurItem:I

    .line 285
    iput-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 286
    iput-object v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 291
    :cond_3
    :goto_1
    return-void

    .line 288
    :cond_4
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    goto :goto_1
.end method

.method public setCurrentItem(I)V
    .locals 2
    .param p1, "item"    # I

    .prologue
    const/4 v1, 0x0

    .line 305
    iput-boolean v1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    .line 306
    iget-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFirstLayout:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    .line 307
    return-void

    :cond_0
    move v0, v1

    .line 306
    goto :goto_0
.end method

.method public setCurrentItem(IZ)V
    .locals 1
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z

    .prologue
    const/4 v0, 0x0

    .line 316
    iput-boolean v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPopulatePending:Z

    .line 317
    invoke-virtual {p0, p1, p2, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZ)V

    .line 318
    return-void
.end method

.method setCurrentItemInternal(IZZ)V
    .locals 1
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z

    .prologue
    .line 325
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setCurrentItemInternal(IZZI)V

    .line 326
    return-void
.end method

.method setCurrentItemInternal(IZZI)V
    .locals 7
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z
    .param p4, "velocity"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 329
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v4}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    if-gtz v4, :cond_2

    .line 330
    :cond_0
    invoke-direct {p0, v5}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    .line 368
    :cond_1
    :goto_0
    return-void

    .line 333
    :cond_2
    if-nez p3, :cond_3

    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-ne v4, p1, :cond_3

    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_3

    .line 334
    invoke-direct {p0, v5}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_0

    .line 337
    :cond_3
    if-gez p1, :cond_6

    .line 338
    const/4 p1, 0x0

    .line 342
    :cond_4
    :goto_1
    iget v3, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    .line 343
    .local v3, "pageLimit":I
    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    add-int/2addr v4, v3

    if-gt p1, v4, :cond_5

    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    sub-int/2addr v4, v3

    if-ge p1, v4, :cond_7

    .line 347
    :cond_5
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_7

    .line 348
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    iput-boolean v1, v4, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->scrolling:Z

    .line 347
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 339
    .end local v2    # "i":I
    .end local v3    # "pageLimit":I
    :cond_6
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v4}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    if-lt p1, v4, :cond_4

    .line 340
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v4}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    add-int/lit8 p1, v4, -0x1

    goto :goto_1

    .line 352
    .restart local v3    # "pageLimit":I
    :cond_7
    iget v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    if-eq v4, p1, :cond_8

    .line 353
    .local v1, "dispatchSelected":Z
    :goto_3
    iput p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mCurItem:I

    .line 354
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    .line 355
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v4

    iget v6, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v4, v6

    mul-int v0, v4, p1

    .line 356
    .local v0, "destX":I
    if-eqz p2, :cond_9

    .line 357
    invoke-virtual {p0, v0, v5, p4}, Lcom/alien/demo/uibase/LazyViewPager;->smoothScrollTo(III)V

    .line 358
    if-eqz v1, :cond_1

    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    if-eqz v4, :cond_1

    .line 359
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    invoke-interface {v4, p1}, Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;->onPageSelected(I)V

    goto :goto_0

    .end local v0    # "destX":I
    .end local v1    # "dispatchSelected":Z
    :cond_8
    move v1, v5

    .line 352
    goto :goto_3

    .line 362
    .restart local v0    # "destX":I
    .restart local v1    # "dispatchSelected":Z
    :cond_9
    if-eqz v1, :cond_a

    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    if-eqz v4, :cond_a

    .line 363
    iget-object v4, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    invoke-interface {v4, p1}, Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 365
    :cond_a
    invoke-direct {p0}, Lcom/alien/demo/uibase/LazyViewPager;->completeScroll()V

    .line 366
    invoke-virtual {p0, v0, v5}, Lcom/alien/demo/uibase/LazyViewPager;->scrollTo(II)V

    goto :goto_0
.end method

.method public setOffscreenPageLimit(I)V
    .locals 3
    .param p1, "limit"    # I

    .prologue
    .line 403
    if-gez p1, :cond_0

    .line 404
    const-string v0, "LazyViewPager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested offscreen page limit "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " too small; defaulting to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    const/4 p1, 0x0

    .line 408
    :cond_0
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    if-eq p1, v0, :cond_1

    .line 409
    iput p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOffscreenPageLimit:I

    .line 410
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->populate()V

    .line 412
    :cond_1
    return-void
.end method

.method public setOnPageChangeListener(Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    .prologue
    .line 371
    iput-object p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mOnPageChangeListener:Lcom/alien/demo/uibase/LazyViewPager$OnPageChangeListener;

    .line 372
    return-void
.end method

.method public setPageMargin(I)V
    .locals 2
    .param p1, "marginPixels"    # I

    .prologue
    .line 423
    iget v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    .line 424
    .local v0, "oldMargin":I
    iput p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    .line 426
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v1

    .line 427
    .local v1, "width":I
    invoke-direct {p0, v1, v1, p1, v0}, Lcom/alien/demo/uibase/LazyViewPager;->recomputeScrollPosition(IIII)V

    .line 429
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->requestLayout()V

    .line 430
    return-void
.end method

.method public setPageMarginDrawable(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 459
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 460
    return-void
.end method

.method public setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 447
    iput-object p1, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 448
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->refreshDrawableState()V

    .line 449
    :cond_0
    if-nez p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setWillNotDraw(Z)V

    .line 450
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->invalidate()V

    .line 451
    return-void

    .line 449
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method smoothScrollTo(II)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 493
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/alien/demo/uibase/LazyViewPager;->smoothScrollTo(III)V

    .line 494
    return-void
.end method

.method smoothScrollTo(III)V
    .locals 10
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "velocity"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 504
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 506
    invoke-direct {p0, v7}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    .line 536
    :goto_0
    return-void

    .line 509
    :cond_0
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollX()I

    move-result v1

    .line 510
    .local v1, "sx":I
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getScrollY()I

    move-result v2

    .line 511
    .local v2, "sy":I
    sub-int v3, p1, v1

    .line 512
    .local v3, "dx":I
    sub-int v4, p2, v2

    .line 513
    .local v4, "dy":I
    if-nez v3, :cond_1

    if-nez v4, :cond_1

    .line 514
    invoke-direct {p0}, Lcom/alien/demo/uibase/LazyViewPager;->completeScroll()V

    .line 515
    invoke-direct {p0, v7}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    goto :goto_0

    .line 519
    :cond_1
    invoke-direct {p0, v8}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollingCacheEnabled(Z)V

    .line 520
    iput-boolean v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScrolling:Z

    .line 521
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/alien/demo/uibase/LazyViewPager;->setScrollState(I)V

    .line 523
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->getWidth()I

    move-result v7

    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mPageMargin:I

    add-int/2addr v7, v8

    int-to-float v7, v7

    div-float v6, v0, v7

    .line 524
    .local v6, "pageDelta":F
    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr v0, v6

    float-to-int v5, v0

    .line 526
    .local v5, "duration":I
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    .line 527
    if-lez p3, :cond_2

    .line 528
    int-to-float v0, v5

    int-to-float v7, v5

    int-to-float v8, p3

    iget v9, p0, Lcom/alien/demo/uibase/LazyViewPager;->mBaseLineFlingVelocity:F

    div-float/2addr v8, v9

    div-float/2addr v7, v8

    iget v8, p0, Lcom/alien/demo/uibase/LazyViewPager;->mFlingVelocityInfluence:F

    mul-float/2addr v7, v8

    add-float/2addr v0, v7

    float-to-int v5, v0

    .line 532
    :goto_1
    const/16 v0, 0x258

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 534
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 535
    invoke-virtual {p0}, Lcom/alien/demo/uibase/LazyViewPager;->invalidate()V

    goto :goto_0

    .line 530
    :cond_2
    add-int/lit8 v5, v5, 0x64

    goto :goto_1
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 464
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
