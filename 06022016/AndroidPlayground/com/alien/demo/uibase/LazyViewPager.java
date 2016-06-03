package com.alien.demo.uibase;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemClock;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.KeyEventCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class LazyViewPager
  extends ViewGroup
{
  private static final Comparator<ItemInfo> COMPARATOR = new Comparator()
  {
    public int compare(LazyViewPager.ItemInfo paramAnonymousItemInfo1, LazyViewPager.ItemInfo paramAnonymousItemInfo2)
    {
      return paramAnonymousItemInfo1.position - paramAnonymousItemInfo2.position;
    }
  };
  private static final boolean DEBUG = false;
  private static final int DEFAULT_OFFSCREEN_PAGES = 0;
  private static final int INVALID_POINTER = -1;
  private static final int MAX_SETTLE_DURATION = 600;
  public static final int SCROLL_STATE_DRAGGING = 1;
  public static final int SCROLL_STATE_IDLE = 0;
  public static final int SCROLL_STATE_SETTLING = 2;
  private static final String TAG = "LazyViewPager";
  private static final boolean USE_CACHE = false;
  private static final Interpolator sInterpolator = new Interpolator()
  {
    public float getInterpolation(float paramAnonymousFloat)
    {
      paramAnonymousFloat -= 1.0F;
      return paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat + 1.0F;
    }
  };
  private int mActivePointerId = -1;
  private PagerAdapter mAdapter;
  private float mBaseLineFlingVelocity;
  private int mChildHeightMeasureSpec;
  private int mChildWidthMeasureSpec;
  private int mCurItem;
  private long mFakeDragBeginTime;
  private boolean mFakeDragging;
  private boolean mFirstLayout = true;
  private float mFlingVelocityInfluence;
  private boolean mInLayout;
  private float mInitialMotionX;
  private boolean mIsBeingDragged;
  private boolean mIsUnableToDrag;
  private final ArrayList<ItemInfo> mItems = new ArrayList();
  private float mLastMotionX;
  private float mLastMotionY;
  private EdgeEffectCompat mLeftEdge;
  private Drawable mMarginDrawable;
  private int mMaximumVelocity;
  private int mMinimumVelocity;
  private PagerObserver mObserver;
  private int mOffscreenPageLimit = 0;
  private OnPageChangeListener mOnPageChangeListener;
  private int mPageMargin;
  private boolean mPopulatePending;
  private Parcelable mRestoredAdapterState = null;
  private ClassLoader mRestoredClassLoader = null;
  private int mRestoredCurItem = -1;
  private EdgeEffectCompat mRightEdge;
  private int mScrollState = 0;
  private Scroller mScroller;
  private boolean mScrolling;
  private boolean mScrollingCacheEnabled;
  private int mTouchSlop;
  private VelocityTracker mVelocityTracker;
  
  public LazyViewPager(Context paramContext)
  {
    super(paramContext);
    initViewPager();
  }
  
  public LazyViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initViewPager();
  }
  
  private void completeScroll()
  {
    boolean bool = this.mScrolling;
    if (bool)
    {
      setScrollingCacheEnabled(false);
      this.mScroller.abortAnimation();
      i = getScrollX();
      int j = getScrollY();
      int k = this.mScroller.getCurrX();
      int m = this.mScroller.getCurrY();
      if ((i != k) || (j != m)) {
        scrollTo(k, m);
      }
      setScrollState(0);
    }
    this.mPopulatePending = false;
    this.mScrolling = false;
    int i = 0;
    while (i < this.mItems.size())
    {
      ItemInfo localItemInfo = (ItemInfo)this.mItems.get(i);
      if (localItemInfo.scrolling)
      {
        bool = true;
        localItemInfo.scrolling = false;
      }
      i += 1;
    }
    if (bool) {
      populate();
    }
  }
  
  private void endDrag()
  {
    this.mIsBeingDragged = false;
    this.mIsUnableToDrag = false;
    if (this.mVelocityTracker != null)
    {
      this.mVelocityTracker.recycle();
      this.mVelocityTracker = null;
    }
  }
  
  private void onSecondaryPointerUp(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (MotionEventCompat.getPointerId(paramMotionEvent, i) == this.mActivePointerId) {
      if (i != 0) {
        break label56;
      }
    }
    label56:
    for (i = 1;; i = 0)
    {
      this.mLastMotionX = MotionEventCompat.getX(paramMotionEvent, i);
      this.mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      if (this.mVelocityTracker != null) {
        this.mVelocityTracker.clear();
      }
      return;
    }
  }
  
  private void recomputeScrollPosition(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramInt1 += paramInt3;
    if (paramInt2 > 0)
    {
      paramInt3 = getScrollX();
      paramInt2 += paramInt4;
      paramInt4 = paramInt3 / paramInt2;
      float f = paramInt3 % paramInt2 / paramInt2;
      paramInt2 = (int)((paramInt4 + f) * paramInt1);
      scrollTo(paramInt2, getScrollY());
      if (!this.mScroller.isFinished())
      {
        paramInt3 = this.mScroller.getDuration();
        paramInt4 = this.mScroller.timePassed();
        this.mScroller.startScroll(paramInt2, 0, this.mCurItem * paramInt1, 0, paramInt3 - paramInt4);
      }
    }
    do
    {
      return;
      paramInt1 = this.mCurItem * paramInt1;
    } while (paramInt1 == getScrollX());
    completeScroll();
    scrollTo(paramInt1, getScrollY());
  }
  
  private void setScrollState(int paramInt)
  {
    if (this.mScrollState == paramInt) {}
    do
    {
      return;
      this.mScrollState = paramInt;
    } while (this.mOnPageChangeListener == null);
    this.mOnPageChangeListener.onPageScrollStateChanged(paramInt);
  }
  
  private void setScrollingCacheEnabled(boolean paramBoolean)
  {
    if (this.mScrollingCacheEnabled != paramBoolean) {
      this.mScrollingCacheEnabled = paramBoolean;
    }
  }
  
  public void addFocusables(ArrayList<View> paramArrayList, int paramInt1, int paramInt2)
  {
    int j = paramArrayList.size();
    int k = getDescendantFocusability();
    if (k != 393216)
    {
      int i = 0;
      while (i < getChildCount())
      {
        View localView = getChildAt(i);
        if (localView.getVisibility() == 0)
        {
          ItemInfo localItemInfo = infoForChild(localView);
          if ((localItemInfo != null) && (localItemInfo.position == this.mCurItem)) {
            localView.addFocusables(paramArrayList, paramInt1, paramInt2);
          }
        }
        i += 1;
      }
    }
    if (((k == 262144) && (j != paramArrayList.size())) || (!isFocusable())) {}
    while ((((paramInt2 & 0x1) == 1) && (isInTouchMode()) && (!isFocusableInTouchMode())) || (paramArrayList == null)) {
      return;
    }
    paramArrayList.add(this);
  }
  
  void addNewItem(int paramInt1, int paramInt2)
  {
    ItemInfo localItemInfo = new ItemInfo();
    localItemInfo.position = paramInt1;
    localItemInfo.object = this.mAdapter.instantiateItem(this, paramInt1);
    if (paramInt2 < 0)
    {
      this.mItems.add(localItemInfo);
      return;
    }
    this.mItems.add(paramInt2, localItemInfo);
  }
  
  public void addTouchables(ArrayList<View> paramArrayList)
  {
    int i = 0;
    while (i < getChildCount())
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 0)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if ((localItemInfo != null) && (localItemInfo.position == this.mCurItem)) {
          localView.addTouchables(paramArrayList);
        }
      }
      i += 1;
    }
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    if (this.mInLayout)
    {
      addViewInLayout(paramView, paramInt, paramLayoutParams);
      paramView.measure(this.mChildWidthMeasureSpec, this.mChildHeightMeasureSpec);
      return;
    }
    super.addView(paramView, paramInt, paramLayoutParams);
  }
  
  public boolean arrowScroll(int paramInt)
  {
    View localView2 = findFocus();
    View localView1 = localView2;
    if (localView2 == this) {
      localView1 = null;
    }
    boolean bool = false;
    localView2 = FocusFinder.getInstance().findNextFocus(this, localView1, paramInt);
    if ((localView2 != null) && (localView2 != localView1)) {
      if (paramInt == 17) {
        if ((localView1 != null) && (localView2.getLeft() >= localView1.getLeft())) {
          bool = pageLeft();
        }
      }
    }
    for (;;)
    {
      if (bool) {
        playSoundEffect(SoundEffectConstants.getContantForFocusDirection(paramInt));
      }
      return bool;
      bool = localView2.requestFocus();
      continue;
      if (paramInt == 66) {
        if ((localView1 != null) && (localView2.getLeft() <= localView1.getLeft()))
        {
          bool = pageRight();
        }
        else
        {
          bool = localView2.requestFocus();
          continue;
          if ((paramInt == 17) || (paramInt == 1)) {
            bool = pageLeft();
          } else if ((paramInt == 66) || (paramInt == 2)) {
            bool = pageRight();
          }
        }
      }
    }
  }
  
  public boolean beginFakeDrag()
  {
    if (this.mIsBeingDragged) {
      return false;
    }
    this.mFakeDragging = true;
    setScrollState(1);
    this.mLastMotionX = 0.0F;
    this.mInitialMotionX = 0.0F;
    if (this.mVelocityTracker == null) {
      this.mVelocityTracker = VelocityTracker.obtain();
    }
    for (;;)
    {
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 0, 0.0F, 0.0F, 0);
      this.mVelocityTracker.addMovement(localMotionEvent);
      localMotionEvent.recycle();
      this.mFakeDragBeginTime = l;
      return true;
      this.mVelocityTracker.clear();
    }
  }
  
  protected boolean canScroll(View paramView, boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramView instanceof ViewGroup))
    {
      ViewGroup localViewGroup = (ViewGroup)paramView;
      int j = paramView.getScrollX();
      int k = paramView.getScrollY();
      int i = localViewGroup.getChildCount() - 1;
      while (i >= 0)
      {
        View localView = localViewGroup.getChildAt(i);
        if ((paramInt2 + j >= localView.getLeft()) && (paramInt2 + j < localView.getRight()) && (paramInt3 + k >= localView.getTop()) && (paramInt3 + k < localView.getBottom()) && (canScroll(localView, true, paramInt1, paramInt2 + j - localView.getLeft(), paramInt3 + k - localView.getTop()))) {
          return true;
        }
        i -= 1;
      }
    }
    return (paramBoolean) && (ViewCompat.canScrollHorizontally(paramView, -paramInt1));
  }
  
  public void computeScroll()
  {
    if ((!this.mScroller.isFinished()) && (this.mScroller.computeScrollOffset()))
    {
      int j = getScrollX();
      int k = getScrollY();
      int i = this.mScroller.getCurrX();
      int m = this.mScroller.getCurrY();
      if ((j != i) || (k != m)) {
        scrollTo(i, m);
      }
      if (this.mOnPageChangeListener != null)
      {
        j = getWidth() + this.mPageMargin;
        k = i / j;
        i %= j;
        float f = i / j;
        this.mOnPageChangeListener.onPageScrolled(k, f, i);
      }
      invalidate();
      return;
    }
    completeScroll();
  }
  
  void dataSetChanged()
  {
    int j;
    int i;
    int k;
    label34:
    ItemInfo localItemInfo;
    int i1;
    int m;
    int n;
    if ((this.mItems.size() < 3) && (this.mItems.size() < this.mAdapter.getCount()))
    {
      j = 1;
      i = -1;
      k = 0;
      if (k >= this.mItems.size()) {
        break label242;
      }
      localItemInfo = (ItemInfo)this.mItems.get(k);
      i1 = this.mAdapter.getItemPosition(localItemInfo.object);
      if (i1 != -1) {
        break label100;
      }
      m = i;
      n = k;
    }
    for (;;)
    {
      k = n + 1;
      i = m;
      break label34;
      j = 0;
      break;
      label100:
      if (i1 == -2)
      {
        this.mItems.remove(k);
        k -= 1;
        this.mAdapter.destroyItem(this, localItemInfo.position, localItemInfo.object);
        i1 = 1;
        n = k;
        j = i1;
        m = i;
        if (this.mCurItem == localItemInfo.position)
        {
          m = Math.max(0, Math.min(this.mCurItem, this.mAdapter.getCount() - 1));
          n = k;
          j = i1;
        }
      }
      else
      {
        n = k;
        m = i;
        if (localItemInfo.position != i1)
        {
          if (localItemInfo.position == this.mCurItem) {
            i = i1;
          }
          localItemInfo.position = i1;
          j = 1;
          n = k;
          m = i;
        }
      }
    }
    label242:
    Collections.sort(this.mItems, COMPARATOR);
    if (i >= 0)
    {
      setCurrentItemInternal(i, false, true);
      j = 1;
    }
    if (j != 0)
    {
      populate();
      requestLayout();
    }
  }
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    return (super.dispatchKeyEvent(paramKeyEvent)) || (executeKeyEvent(paramKeyEvent));
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 0)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if ((localItemInfo != null) && (localItemInfo.position == this.mCurItem) && (localView.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent))) {
          return true;
        }
      }
      i += 1;
    }
    return false;
  }
  
  float distanceInfluenceForSnapDuration(float paramFloat)
  {
    return (float)Math.sin((float)((paramFloat - 0.5F) * 0.4712389167638204D));
  }
  
  public void draw(Canvas paramCanvas)
  {
    int m = 1;
    super.draw(paramCanvas);
    int k = 0;
    int i = 0;
    int n = ViewCompat.getOverScrollMode(this);
    boolean bool;
    if ((n == 0) || ((n == 1) && (this.mAdapter != null) && (this.mAdapter.getCount() > 1)))
    {
      int j;
      if (!this.mLeftEdge.isFinished())
      {
        k = paramCanvas.save();
        i = getHeight() - getPaddingTop() - getPaddingBottom();
        paramCanvas.rotate(270.0F);
        paramCanvas.translate(-i + getPaddingTop(), 0.0F);
        this.mLeftEdge.setSize(i, getWidth());
        j = false | this.mLeftEdge.draw(paramCanvas);
        paramCanvas.restoreToCount(k);
      }
      k = j;
      if (!this.mRightEdge.isFinished())
      {
        n = paramCanvas.save();
        int i1 = getWidth();
        int i2 = getHeight();
        int i3 = getPaddingTop();
        int i4 = getPaddingBottom();
        k = m;
        if (this.mAdapter != null) {
          k = this.mAdapter.getCount();
        }
        paramCanvas.rotate(90.0F);
        paramCanvas.translate(-getPaddingTop(), -k * (this.mPageMargin + i1) + this.mPageMargin);
        this.mRightEdge.setSize(i2 - i3 - i4, i1);
        bool = j | this.mRightEdge.draw(paramCanvas);
        paramCanvas.restoreToCount(n);
      }
    }
    for (;;)
    {
      if (bool) {
        invalidate();
      }
      return;
      this.mLeftEdge.finish();
      this.mRightEdge.finish();
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    Drawable localDrawable = this.mMarginDrawable;
    if ((localDrawable != null) && (localDrawable.isStateful())) {
      localDrawable.setState(getDrawableState());
    }
  }
  
  public void endFakeDrag()
  {
    if (!this.mFakeDragging) {
      throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }
    VelocityTracker localVelocityTracker = this.mVelocityTracker;
    localVelocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
    int i = (int)VelocityTrackerCompat.getYVelocity(localVelocityTracker, this.mActivePointerId);
    this.mPopulatePending = true;
    if ((Math.abs(i) > this.mMinimumVelocity) || (Math.abs(this.mInitialMotionX - this.mLastMotionX) >= getWidth() / 3)) {
      if (this.mLastMotionX > this.mInitialMotionX) {
        setCurrentItemInternal(this.mCurItem - 1, true, true);
      }
    }
    for (;;)
    {
      endDrag();
      this.mFakeDragging = false;
      return;
      setCurrentItemInternal(this.mCurItem + 1, true, true);
      continue;
      setCurrentItemInternal(this.mCurItem, true, true);
    }
  }
  
  public boolean executeKeyEvent(KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent.getAction() == 0) {
      switch (paramKeyEvent.getKeyCode())
      {
      }
    }
    do
    {
      return false;
      return arrowScroll(17);
      return arrowScroll(66);
      if (KeyEventCompat.hasNoModifiers(paramKeyEvent)) {
        return arrowScroll(2);
      }
    } while (!KeyEventCompat.hasModifiers(paramKeyEvent, 1));
    return arrowScroll(1);
  }
  
  public void fakeDragBy(float paramFloat)
  {
    if (!this.mFakeDragging) {
      throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }
    this.mLastMotionX += paramFloat;
    float f1 = getScrollX() - paramFloat;
    int i = getWidth() + this.mPageMargin;
    paramFloat = Math.max(0, (this.mCurItem - 1) * i);
    float f2 = Math.min(this.mCurItem + 1, this.mAdapter.getCount() - 1) * i;
    if (f1 < paramFloat) {}
    for (;;)
    {
      this.mLastMotionX += paramFloat - (int)paramFloat;
      scrollTo((int)paramFloat, getScrollY());
      if (this.mOnPageChangeListener != null)
      {
        int j = (int)paramFloat / i;
        int k = (int)paramFloat % i;
        paramFloat = k / i;
        this.mOnPageChangeListener.onPageScrolled(j, paramFloat, k);
      }
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(this.mFakeDragBeginTime, l, 2, this.mLastMotionX, 0.0F, 0);
      this.mVelocityTracker.addMovement(localMotionEvent);
      localMotionEvent.recycle();
      return;
      paramFloat = f1;
      if (f1 > f2) {
        paramFloat = f2;
      }
    }
  }
  
  public PagerAdapter getAdapter()
  {
    return this.mAdapter;
  }
  
  public int getCurrentItem()
  {
    return this.mCurItem;
  }
  
  public int getOffscreenPageLimit()
  {
    return this.mOffscreenPageLimit;
  }
  
  public int getPageMargin()
  {
    return this.mPageMargin;
  }
  
  ItemInfo infoForAnyChild(View paramView)
  {
    for (;;)
    {
      ViewParent localViewParent = paramView.getParent();
      if (localViewParent == this) {
        break;
      }
      if ((localViewParent == null) || (!(localViewParent instanceof View))) {
        return null;
      }
      paramView = (View)localViewParent;
    }
    return infoForChild(paramView);
  }
  
  ItemInfo infoForChild(View paramView)
  {
    int i = 0;
    while (i < this.mItems.size())
    {
      ItemInfo localItemInfo = (ItemInfo)this.mItems.get(i);
      if (this.mAdapter.isViewFromObject(paramView, localItemInfo.object)) {
        return localItemInfo;
      }
      i += 1;
    }
    return null;
  }
  
  void initViewPager()
  {
    setWillNotDraw(false);
    setDescendantFocusability(262144);
    setFocusable(true);
    Context localContext = getContext();
    this.mScroller = new Scroller(localContext, sInterpolator);
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(localContext);
    this.mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(localViewConfiguration);
    this.mMinimumVelocity = localViewConfiguration.getScaledMinimumFlingVelocity();
    this.mMaximumVelocity = localViewConfiguration.getScaledMaximumFlingVelocity();
    this.mLeftEdge = new EdgeEffectCompat(localContext);
    this.mRightEdge = new EdgeEffectCompat(localContext);
    this.mBaseLineFlingVelocity = (2500.0F * localContext.getResources().getDisplayMetrics().density);
    this.mFlingVelocityInfluence = 0.4F;
  }
  
  public boolean isFakeDragging()
  {
    return this.mFakeDragging;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    this.mFirstLayout = true;
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if ((this.mPageMargin > 0) && (this.mMarginDrawable != null))
    {
      int i = getScrollX();
      int j = getWidth();
      int k = i % (this.mPageMargin + j);
      if (k != 0)
      {
        i = i - k + j;
        this.mMarginDrawable.setBounds(i, 0, this.mPageMargin + i, getHeight());
        this.mMarginDrawable.draw(paramCanvas);
      }
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction() & 0xFF;
    if ((i == 3) || (i == 1))
    {
      this.mIsBeingDragged = false;
      this.mIsUnableToDrag = false;
      this.mActivePointerId = -1;
      return false;
    }
    if (i != 0)
    {
      if (this.mIsBeingDragged) {
        return true;
      }
      if (this.mIsUnableToDrag) {
        return false;
      }
    }
    switch (i)
    {
    }
    for (;;)
    {
      return this.mIsBeingDragged;
      i = this.mActivePointerId;
      if (i != -1)
      {
        i = MotionEventCompat.findPointerIndex(paramMotionEvent, i);
        float f1 = MotionEventCompat.getX(paramMotionEvent, i);
        float f2 = f1 - this.mLastMotionX;
        float f3 = Math.abs(f2);
        float f4 = MotionEventCompat.getY(paramMotionEvent, i);
        float f5 = Math.abs(f4 - this.mLastMotionY);
        i = getScrollX();
        if (((f2 > 0.0F) && (i == 0)) || ((f2 < 0.0F) && (this.mAdapter != null) && (i >= (this.mAdapter.getCount() - 1) * getWidth() - 1))) {}
        while (canScroll(this, false, (int)f2, (int)f1, (int)f4))
        {
          this.mLastMotionX = f1;
          this.mInitialMotionX = f1;
          this.mLastMotionY = f4;
          return false;
        }
        if ((f3 > this.mTouchSlop) && (f3 > f5))
        {
          this.mIsBeingDragged = true;
          setScrollState(1);
          this.mLastMotionX = f1;
          setScrollingCacheEnabled(true);
        }
        else if (f5 > this.mTouchSlop)
        {
          this.mIsUnableToDrag = true;
          continue;
          f1 = paramMotionEvent.getX();
          this.mInitialMotionX = f1;
          this.mLastMotionX = f1;
          this.mLastMotionY = paramMotionEvent.getY();
          this.mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
          if (this.mScrollState == 2)
          {
            this.mIsBeingDragged = true;
            this.mIsUnableToDrag = false;
            setScrollState(1);
          }
          else
          {
            completeScroll();
            this.mIsBeingDragged = false;
            this.mIsUnableToDrag = false;
            continue;
            onSecondaryPointerUp(paramMotionEvent);
          }
        }
      }
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.mInLayout = true;
    populate();
    this.mInLayout = false;
    paramInt4 = getChildCount();
    paramInt2 = 0;
    while (paramInt2 < paramInt4)
    {
      View localView = getChildAt(paramInt2);
      if (localView.getVisibility() != 8)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if (localItemInfo != null)
        {
          int i = this.mPageMargin;
          int j = localItemInfo.position;
          i = getPaddingLeft() + (i + (paramInt3 - paramInt1)) * j;
          j = getPaddingTop();
          localView.layout(i, j, localView.getMeasuredWidth() + i, localView.getMeasuredHeight() + j);
        }
      }
      paramInt2 += 1;
    }
    this.mFirstLayout = false;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    setMeasuredDimension(getDefaultSize(0, paramInt1), getDefaultSize(0, paramInt2));
    this.mChildWidthMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth() - getPaddingLeft() - getPaddingRight(), 1073741824);
    this.mChildHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight() - getPaddingTop() - getPaddingBottom(), 1073741824);
    this.mInLayout = true;
    populate();
    this.mInLayout = false;
    paramInt2 = getChildCount();
    paramInt1 = 0;
    while (paramInt1 < paramInt2)
    {
      View localView = getChildAt(paramInt1);
      if (localView.getVisibility() != 8) {
        localView.measure(this.mChildWidthMeasureSpec, this.mChildHeightMeasureSpec);
      }
      paramInt1 += 1;
    }
  }
  
  protected boolean onRequestFocusInDescendants(int paramInt, Rect paramRect)
  {
    int j = getChildCount();
    int i;
    int k;
    if ((paramInt & 0x2) != 0)
    {
      i = 0;
      k = 1;
    }
    while (i != j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 0)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if ((localItemInfo != null) && (localItemInfo.position == this.mCurItem) && (localView.requestFocus(paramInt, paramRect)))
        {
          return true;
          i = j - 1;
          k = -1;
          j = -1;
          continue;
        }
      }
      i += k;
    }
    return false;
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if (!(paramParcelable instanceof SavedState))
    {
      super.onRestoreInstanceState(paramParcelable);
      return;
    }
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (this.mAdapter != null)
    {
      this.mAdapter.restoreState(paramParcelable.adapterState, paramParcelable.loader);
      setCurrentItemInternal(paramParcelable.position, false, true);
      return;
    }
    this.mRestoredCurItem = paramParcelable.position;
    this.mRestoredAdapterState = paramParcelable.adapterState;
    this.mRestoredClassLoader = paramParcelable.loader;
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    localSavedState.position = this.mCurItem;
    if (this.mAdapter != null) {
      localSavedState.adapterState = this.mAdapter.saveState();
    }
    return localSavedState;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (paramInt1 != paramInt3) {
      recomputeScrollPosition(paramInt1, paramInt3, this.mPageMargin, this.mPageMargin);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.mFakeDragging) {
      return true;
    }
    if ((paramMotionEvent.getAction() == 0) && (paramMotionEvent.getEdgeFlags() != 0)) {
      return false;
    }
    if ((this.mAdapter == null) || (this.mAdapter.getCount() == 0)) {
      return false;
    }
    if (this.mVelocityTracker == null) {
      this.mVelocityTracker = VelocityTracker.obtain();
    }
    this.mVelocityTracker.addMovement(paramMotionEvent);
    int i = paramMotionEvent.getAction();
    boolean bool4 = false;
    boolean bool5 = false;
    boolean bool3 = false;
    boolean bool2 = false;
    boolean bool1 = bool2;
    switch (i & 0xFF)
    {
    default: 
      bool1 = bool2;
    }
    for (;;)
    {
      if (bool1) {
        invalidate();
      }
      return true;
      completeScroll();
      float f1 = paramMotionEvent.getX();
      this.mInitialMotionX = f1;
      this.mLastMotionX = f1;
      this.mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
      bool1 = bool2;
      continue;
      float f2;
      float f3;
      if (!this.mIsBeingDragged)
      {
        i = MotionEventCompat.findPointerIndex(paramMotionEvent, this.mActivePointerId);
        f1 = MotionEventCompat.getX(paramMotionEvent, i);
        f2 = Math.abs(f1 - this.mLastMotionX);
        f3 = Math.abs(MotionEventCompat.getY(paramMotionEvent, i) - this.mLastMotionY);
        if ((f2 > this.mTouchSlop) && (f2 > f3))
        {
          this.mIsBeingDragged = true;
          this.mLastMotionX = f1;
          setScrollState(1);
          setScrollingCacheEnabled(true);
        }
      }
      bool1 = bool2;
      if (this.mIsBeingDragged)
      {
        f1 = MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, this.mActivePointerId));
        f2 = this.mLastMotionX;
        this.mLastMotionX = f1;
        f2 = getScrollX() + (f2 - f1);
        int j = getWidth();
        i = j + this.mPageMargin;
        int k = this.mAdapter.getCount() - 1;
        f1 = Math.max(0, (this.mCurItem - 1) * i);
        f3 = Math.min(this.mCurItem + 1, k) * i;
        if (f2 < f1)
        {
          bool2 = bool4;
          if (f1 == 0.0F)
          {
            f2 = -f2;
            bool2 = this.mLeftEdge.onPull(f2 / j);
          }
        }
        for (;;)
        {
          this.mLastMotionX += f1 - (int)f1;
          scrollTo((int)f1, getScrollY());
          bool1 = bool2;
          if (this.mOnPageChangeListener == null) {
            break;
          }
          j = (int)f1 / i;
          k = (int)f1 % i;
          f1 = k / i;
          this.mOnPageChangeListener.onPageScrolled(j, f1, k);
          bool1 = bool2;
          break;
          bool2 = bool5;
          f1 = f2;
          if (f2 > f3)
          {
            bool2 = bool3;
            if (f3 == k * i) {
              bool2 = this.mRightEdge.onPull((f2 - f3) / j);
            }
            f1 = f3;
          }
        }
        bool1 = bool2;
        if (this.mIsBeingDragged)
        {
          paramMotionEvent = this.mVelocityTracker;
          paramMotionEvent.computeCurrentVelocity(1000, this.mMaximumVelocity);
          j = (int)VelocityTrackerCompat.getXVelocity(paramMotionEvent, this.mActivePointerId);
          this.mPopulatePending = true;
          i = getWidth();
          k = this.mPageMargin;
          i = getScrollX() / (i + k);
          if (j > 0) {}
          for (;;)
          {
            setCurrentItemInternal(i, true, true, j);
            this.mActivePointerId = -1;
            endDrag();
            bool1 = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
            break;
            i += 1;
          }
          bool1 = bool2;
          if (this.mIsBeingDragged)
          {
            setCurrentItemInternal(this.mCurItem, true, true);
            this.mActivePointerId = -1;
            endDrag();
            bool1 = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
            continue;
            i = MotionEventCompat.getActionIndex(paramMotionEvent);
            this.mLastMotionX = MotionEventCompat.getX(paramMotionEvent, i);
            this.mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
            bool1 = bool2;
            continue;
            onSecondaryPointerUp(paramMotionEvent);
            this.mLastMotionX = MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, this.mActivePointerId));
            bool1 = bool2;
          }
        }
      }
    }
  }
  
  boolean pageLeft()
  {
    if (this.mCurItem > 0)
    {
      setCurrentItem(this.mCurItem - 1, true);
      return true;
    }
    return false;
  }
  
  boolean pageRight()
  {
    if ((this.mAdapter != null) && (this.mCurItem < this.mAdapter.getCount() - 1))
    {
      setCurrentItem(this.mCurItem + 1, true);
      return true;
    }
    return false;
  }
  
  void populate()
  {
    if (this.mAdapter == null) {
      break label7;
    }
    label7:
    label322:
    label328:
    label333:
    label405:
    label521:
    label530:
    label536:
    label540:
    for (;;)
    {
      return;
      if ((!this.mPopulatePending) && (getWindowToken() != null))
      {
        this.mAdapter.startUpdate(this);
        int i = this.mOffscreenPageLimit;
        int n = Math.max(0, this.mCurItem - i);
        int i1 = Math.min(this.mAdapter.getCount() - 1, this.mCurItem + i);
        int k = -1;
        i = 0;
        if (i < this.mItems.size())
        {
          localObject1 = (ItemInfo)this.mItems.get(i);
          if (((((ItemInfo)localObject1).position < n) || (((ItemInfo)localObject1).position > i1)) && (!((ItemInfo)localObject1).scrolling))
          {
            this.mItems.remove(i);
            j = i - 1;
            this.mAdapter.destroyItem(this, ((ItemInfo)localObject1).position, ((ItemInfo)localObject1).object);
          }
          do
          {
            do
            {
              k = ((ItemInfo)localObject1).position;
              i = j + 1;
              break;
              j = i;
            } while (k >= i1);
            j = i;
          } while (((ItemInfo)localObject1).position <= n);
          int j = k + 1;
          k = i;
          int m = j;
          if (j < n)
          {
            m = n;
            k = i;
          }
          for (;;)
          {
            j = k;
            if (m > i1) {
              break;
            }
            j = k;
            if (m >= ((ItemInfo)localObject1).position) {
              break;
            }
            addNewItem(m, k);
            m += 1;
            k += 1;
          }
        }
        if (this.mItems.size() > 0)
        {
          i = ((ItemInfo)this.mItems.get(this.mItems.size() - 1)).position;
          if (i >= i1) {
            break label328;
          }
          i += 1;
          if (i <= n) {
            break label322;
          }
        }
        for (;;)
        {
          if (i > i1) {
            break label328;
          }
          addNewItem(i, -1);
          i += 1;
          continue;
          i = -1;
          break;
          i = n;
        }
        Object localObject2 = null;
        i = 0;
        Object localObject1 = localObject2;
        if (i < this.mItems.size())
        {
          if (((ItemInfo)this.mItems.get(i)).position == this.mCurItem) {
            localObject1 = (ItemInfo)this.mItems.get(i);
          }
        }
        else
        {
          localObject2 = this.mAdapter;
          i = this.mCurItem;
          if (localObject1 == null) {
            break label530;
          }
          localObject1 = ((ItemInfo)localObject1).object;
          ((PagerAdapter)localObject2).setPrimaryItem(this, i, localObject1);
          this.mAdapter.finishUpdate(this);
          if (!hasFocus()) {
            break;
          }
          localObject1 = findFocus();
          if (localObject1 == null) {
            break label536;
          }
        }
        for (localObject1 = infoForAnyChild((View)localObject1);; localObject1 = null)
        {
          if ((localObject1 != null) && (((ItemInfo)localObject1).position == this.mCurItem)) {
            break label540;
          }
          i = 0;
          for (;;)
          {
            if (i >= getChildCount()) {
              break label521;
            }
            localObject1 = getChildAt(i);
            localObject2 = infoForChild((View)localObject1);
            if ((localObject2 != null) && (((ItemInfo)localObject2).position == this.mCurItem) && (((View)localObject1).requestFocus(2))) {
              break;
            }
            i += 1;
          }
          break label7;
          i += 1;
          break label333;
          localObject1 = null;
          break label405;
        }
      }
    }
  }
  
  public void setAdapter(PagerAdapter paramPagerAdapter)
  {
    if (this.mAdapter != null)
    {
      this.mAdapter.unregisterDataSetObserver(this.mObserver);
      this.mAdapter.startUpdate(this);
      int i = 0;
      while (i < this.mItems.size())
      {
        ItemInfo localItemInfo = (ItemInfo)this.mItems.get(i);
        this.mAdapter.destroyItem(this, localItemInfo.position, localItemInfo.object);
        i += 1;
      }
      this.mAdapter.finishUpdate(this);
      this.mItems.clear();
      removeAllViews();
      this.mCurItem = 0;
      scrollTo(0, 0);
    }
    this.mAdapter = paramPagerAdapter;
    if (this.mAdapter != null)
    {
      if (this.mObserver == null) {
        this.mObserver = new PagerObserver(null);
      }
      this.mAdapter.registerDataSetObserver(this.mObserver);
      this.mPopulatePending = false;
      if (this.mRestoredCurItem >= 0)
      {
        this.mAdapter.restoreState(this.mRestoredAdapterState, this.mRestoredClassLoader);
        setCurrentItemInternal(this.mRestoredCurItem, false, true);
        this.mRestoredCurItem = -1;
        this.mRestoredAdapterState = null;
        this.mRestoredClassLoader = null;
      }
    }
    else
    {
      return;
    }
    populate();
  }
  
  public void setCurrentItem(int paramInt)
  {
    this.mPopulatePending = false;
    if (!this.mFirstLayout) {}
    for (boolean bool = true;; bool = false)
    {
      setCurrentItemInternal(paramInt, bool, false);
      return;
    }
  }
  
  public void setCurrentItem(int paramInt, boolean paramBoolean)
  {
    this.mPopulatePending = false;
    setCurrentItemInternal(paramInt, paramBoolean, false);
  }
  
  void setCurrentItemInternal(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    setCurrentItemInternal(paramInt, paramBoolean1, paramBoolean2, 0);
  }
  
  void setCurrentItemInternal(int paramInt1, boolean paramBoolean1, boolean paramBoolean2, int paramInt2)
  {
    int j = 1;
    if ((this.mAdapter == null) || (this.mAdapter.getCount() <= 0))
    {
      setScrollingCacheEnabled(false);
      return;
    }
    if ((!paramBoolean2) && (this.mCurItem == paramInt1) && (this.mItems.size() != 0))
    {
      setScrollingCacheEnabled(false);
      return;
    }
    int i;
    if (paramInt1 < 0) {
      i = 0;
    }
    for (;;)
    {
      paramInt1 = this.mOffscreenPageLimit;
      if ((i <= this.mCurItem + paramInt1) && (i >= this.mCurItem - paramInt1)) {
        break;
      }
      paramInt1 = 0;
      while (paramInt1 < this.mItems.size())
      {
        ((ItemInfo)this.mItems.get(paramInt1)).scrolling = true;
        paramInt1 += 1;
      }
      i = paramInt1;
      if (paramInt1 >= this.mAdapter.getCount()) {
        i = this.mAdapter.getCount() - 1;
      }
    }
    if (this.mCurItem != i) {}
    for (paramInt1 = j;; paramInt1 = 0)
    {
      this.mCurItem = i;
      populate();
      j = (getWidth() + this.mPageMargin) * i;
      if (!paramBoolean1) {
        break label228;
      }
      smoothScrollTo(j, 0, paramInt2);
      if ((paramInt1 == 0) || (this.mOnPageChangeListener == null)) {
        break;
      }
      this.mOnPageChangeListener.onPageSelected(i);
      return;
    }
    label228:
    if ((paramInt1 != 0) && (this.mOnPageChangeListener != null)) {
      this.mOnPageChangeListener.onPageSelected(i);
    }
    completeScroll();
    scrollTo(j, 0);
  }
  
  public void setOffscreenPageLimit(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 0)
    {
      Log.w("LazyViewPager", "Requested offscreen page limit " + paramInt + " too small; defaulting to " + 0);
      i = 0;
    }
    if (i != this.mOffscreenPageLimit)
    {
      this.mOffscreenPageLimit = i;
      populate();
    }
  }
  
  public void setOnPageChangeListener(OnPageChangeListener paramOnPageChangeListener)
  {
    this.mOnPageChangeListener = paramOnPageChangeListener;
  }
  
  public void setPageMargin(int paramInt)
  {
    int i = this.mPageMargin;
    this.mPageMargin = paramInt;
    int j = getWidth();
    recomputeScrollPosition(j, j, paramInt, i);
    requestLayout();
  }
  
  public void setPageMarginDrawable(int paramInt)
  {
    setPageMarginDrawable(getContext().getResources().getDrawable(paramInt));
  }
  
  public void setPageMarginDrawable(Drawable paramDrawable)
  {
    this.mMarginDrawable = paramDrawable;
    if (paramDrawable != null) {
      refreshDrawableState();
    }
    if (paramDrawable == null) {}
    for (boolean bool = true;; bool = false)
    {
      setWillNotDraw(bool);
      invalidate();
      return;
    }
  }
  
  void smoothScrollTo(int paramInt1, int paramInt2)
  {
    smoothScrollTo(paramInt1, paramInt2, 0);
  }
  
  void smoothScrollTo(int paramInt1, int paramInt2, int paramInt3)
  {
    if (getChildCount() == 0)
    {
      setScrollingCacheEnabled(false);
      return;
    }
    int i = getScrollX();
    int j = getScrollY();
    int k = paramInt1 - i;
    paramInt2 -= j;
    if ((k == 0) && (paramInt2 == 0))
    {
      completeScroll();
      setScrollState(0);
      return;
    }
    setScrollingCacheEnabled(true);
    this.mScrolling = true;
    setScrollState(2);
    paramInt1 = (int)(100.0F * (Math.abs(k) / (getWidth() + this.mPageMargin)));
    paramInt3 = Math.abs(paramInt3);
    if (paramInt3 > 0) {
      paramInt1 = (int)(paramInt1 + paramInt1 / (paramInt3 / this.mBaseLineFlingVelocity) * this.mFlingVelocityInfluence);
    }
    for (;;)
    {
      paramInt1 = Math.min(paramInt1, 600);
      this.mScroller.startScroll(i, j, k, paramInt2, paramInt1);
      invalidate();
      return;
      paramInt1 += 100;
    }
  }
  
  protected boolean verifyDrawable(Drawable paramDrawable)
  {
    return (super.verifyDrawable(paramDrawable)) || (paramDrawable == this.mMarginDrawable);
  }
  
  static class ItemInfo
  {
    Object object;
    int position;
    boolean scrolling;
  }
  
  public static abstract interface OnPageChangeListener
  {
    public abstract void onPageScrollStateChanged(int paramInt);
    
    public abstract void onPageScrolled(int paramInt1, float paramFloat, int paramInt2);
    
    public abstract void onPageSelected(int paramInt);
  }
  
  private class PagerObserver
    extends DataSetObserver
  {
    private PagerObserver() {}
    
    public void onChanged()
    {
      LazyViewPager.this.dataSetChanged();
    }
    
    public void onInvalidated()
    {
      LazyViewPager.this.dataSetChanged();
    }
  }
  
  public static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks()
    {
      public LazyViewPager.SavedState createFromParcel(Parcel paramAnonymousParcel, ClassLoader paramAnonymousClassLoader)
      {
        return new LazyViewPager.SavedState(paramAnonymousParcel, paramAnonymousClassLoader);
      }
      
      public LazyViewPager.SavedState[] newArray(int paramAnonymousInt)
      {
        return new LazyViewPager.SavedState[paramAnonymousInt];
      }
    });
    Parcelable adapterState;
    ClassLoader loader;
    int position;
    
    SavedState(Parcel paramParcel, ClassLoader paramClassLoader)
    {
      super();
      ClassLoader localClassLoader = paramClassLoader;
      if (paramClassLoader == null) {
        localClassLoader = getClass().getClassLoader();
      }
      this.position = paramParcel.readInt();
      this.adapterState = paramParcel.readParcelable(localClassLoader);
      this.loader = localClassLoader;
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(this.position);
      paramParcel.writeParcelable(this.adapterState, paramInt);
    }
  }
  
  public static class SimpleOnPageChangeListener
    implements LazyViewPager.OnPageChangeListener
  {
    public void onPageScrollStateChanged(int paramInt) {}
    
    public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2) {}
    
    public void onPageSelected(int paramInt) {}
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\uibase\LazyViewPager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */