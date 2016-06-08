package com.alien.demo.uibase;

import android.view.animation.*;
import android.support.v4.widget.*;
import android.graphics.drawable.*;
import android.widget.*;
import android.content.*;
import java.util.*;
import android.view.accessibility.*;
import android.support.v4.view.*;
import android.graphics.*;
import android.database.*;
import android.util.*;
import android.view.*;
import android.os.*;
import android.support.v4.os.*;

public class LazyViewPager extends ViewGroup
{
    private static final Comparator<ItemInfo> COMPARATOR;
    private static final boolean DEBUG = false;
    private static final int DEFAULT_OFFSCREEN_PAGES = 0;
    private static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    private static final String TAG = "LazyViewPager";
    private static final boolean USE_CACHE = false;
    private static final Interpolator sInterpolator;
    private int mActivePointerId;
    private PagerAdapter mAdapter;
    private float mBaseLineFlingVelocity;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCurItem;
    private long mFakeDragBeginTime;
    private boolean mFakeDragging;
    private boolean mFirstLayout;
    private float mFlingVelocityInfluence;
    private boolean mInLayout;
    private float mInitialMotionX;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private final ArrayList<ItemInfo> mItems;
    private float mLastMotionX;
    private float mLastMotionY;
    private EdgeEffectCompat mLeftEdge;
    private Drawable mMarginDrawable;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private PagerObserver mObserver;
    private int mOffscreenPageLimit;
    private OnPageChangeListener mOnPageChangeListener;
    private int mPageMargin;
    private boolean mPopulatePending;
    private Parcelable mRestoredAdapterState;
    private ClassLoader mRestoredClassLoader;
    private int mRestoredCurItem;
    private EdgeEffectCompat mRightEdge;
    private int mScrollState;
    private Scroller mScroller;
    private boolean mScrolling;
    private boolean mScrollingCacheEnabled;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;
    
    static {
        COMPARATOR = new Comparator<ItemInfo>() {
            @Override
            public int compare(final ItemInfo itemInfo, final ItemInfo itemInfo2) {
                return itemInfo.position - itemInfo2.position;
            }
        };
        sInterpolator = (Interpolator)new Interpolator() {
            public float getInterpolation(float n) {
                --n;
                return n * n * n + 1.0f;
            }
        };
    }
    
    public LazyViewPager(final Context context) {
        super(context);
        this.mItems = new ArrayList<ItemInfo>();
        this.mRestoredCurItem = -1;
        this.mRestoredAdapterState = null;
        this.mRestoredClassLoader = null;
        this.mOffscreenPageLimit = 0;
        this.mActivePointerId = -1;
        this.mFirstLayout = true;
        this.mScrollState = 0;
        this.initViewPager();
    }
    
    public LazyViewPager(final Context context, final AttributeSet set) {
        super(context, set);
        this.mItems = new ArrayList<ItemInfo>();
        this.mRestoredCurItem = -1;
        this.mRestoredAdapterState = null;
        this.mRestoredClassLoader = null;
        this.mOffscreenPageLimit = 0;
        this.mActivePointerId = -1;
        this.mFirstLayout = true;
        this.mScrollState = 0;
        this.initViewPager();
    }
    
    private void completeScroll() {
        int mScrolling = this.mScrolling ? 1 : 0;
        if (mScrolling != 0) {
            this.setScrollingCacheEnabled(false);
            this.mScroller.abortAnimation();
            final int scrollX = this.getScrollX();
            final int scrollY = this.getScrollY();
            final int currX = this.mScroller.getCurrX();
            final int currY = this.mScroller.getCurrY();
            if (scrollX != currX || scrollY != currY) {
                this.scrollTo(currX, currY);
            }
            this.setScrollState(0);
        }
        this.mPopulatePending = false;
        this.mScrolling = false;
        for (int i = 0; i < this.mItems.size(); ++i) {
            final ItemInfo itemInfo = this.mItems.get(i);
            if (itemInfo.scrolling) {
                mScrolling = 1;
                itemInfo.scrolling = false;
            }
        }
        if (mScrolling != 0) {
            this.populate();
        }
    }
    
    private void endDrag() {
        this.mIsBeingDragged = false;
        this.mIsUnableToDrag = false;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }
    
    private void onSecondaryPointerUp(final MotionEvent motionEvent) {
        final int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (MotionEventCompat.getPointerId(motionEvent, actionIndex) == this.mActivePointerId) {
            int n;
            if (actionIndex == 0) {
                n = 1;
            }
            else {
                n = 0;
            }
            this.mLastMotionX = MotionEventCompat.getX(motionEvent, n);
            this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, n);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
        }
    }
    
    private void recomputeScrollPosition(int n, int n2, int n3, int timePassed) {
        n += n3;
        if (n2 > 0) {
            n3 = this.getScrollX();
            n2 += timePassed;
            timePassed = n3 / n2;
            n2 = (timePassed + n3 % n2 / n2) * n;
            this.scrollTo(n2, this.getScrollY());
            if (!this.mScroller.isFinished()) {
                n3 = this.mScroller.getDuration();
                timePassed = this.mScroller.timePassed();
                this.mScroller.startScroll(n2, 0, this.mCurItem * n, 0, n3 - timePassed);
            }
        }
        else {
            n *= this.mCurItem;
            if (n != this.getScrollX()) {
                this.completeScroll();
                this.scrollTo(n, this.getScrollY());
            }
        }
    }
    
    private void setScrollState(final int mScrollState) {
        if (this.mScrollState != mScrollState) {
            this.mScrollState = mScrollState;
            if (this.mOnPageChangeListener != null) {
                this.mOnPageChangeListener.onPageScrollStateChanged(mScrollState);
            }
        }
    }
    
    private void setScrollingCacheEnabled(final boolean mScrollingCacheEnabled) {
        if (this.mScrollingCacheEnabled != mScrollingCacheEnabled) {
            this.mScrollingCacheEnabled = mScrollingCacheEnabled;
        }
    }
    
    public void addFocusables(final ArrayList<View> list, final int n, final int n2) {
        final int size = list.size();
        final int descendantFocusability = this.getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i = 0; i < this.getChildCount(); ++i) {
                final View child = this.getChildAt(i);
                if (child.getVisibility() == 0) {
                    final ItemInfo infoForChild = this.infoForChild(child);
                    if (infoForChild != null && infoForChild.position == this.mCurItem) {
                        child.addFocusables((ArrayList)list, n, n2);
                    }
                }
            }
        }
        if ((descendantFocusability != 262144 || size == list.size()) && this.isFocusable() && ((n2 & 0x1) != 0x1 || !this.isInTouchMode() || this.isFocusableInTouchMode()) && list != null) {
            list.add((View)this);
        }
    }
    
    void addNewItem(final int position, final int n) {
        final ItemInfo itemInfo = new ItemInfo();
        itemInfo.position = position;
        itemInfo.object = this.mAdapter.instantiateItem(this, position);
        if (n < 0) {
            this.mItems.add(itemInfo);
            return;
        }
        this.mItems.add(n, itemInfo);
    }
    
    public void addTouchables(final ArrayList<View> list) {
        for (int i = 0; i < this.getChildCount(); ++i) {
            final View child = this.getChildAt(i);
            if (child.getVisibility() == 0) {
                final ItemInfo infoForChild = this.infoForChild(child);
                if (infoForChild != null && infoForChild.position == this.mCurItem) {
                    child.addTouchables((ArrayList)list);
                }
            }
        }
    }
    
    public void addView(final View view, final int n, final ViewGroup$LayoutParams viewGroup$LayoutParams) {
        if (this.mInLayout) {
            this.addViewInLayout(view, n, viewGroup$LayoutParams);
            view.measure(this.mChildWidthMeasureSpec, this.mChildHeightMeasureSpec);
            return;
        }
        super.addView(view, n, viewGroup$LayoutParams);
    }
    
    public boolean arrowScroll(final int n) {
        View focus;
        if ((focus = this.findFocus()) == this) {
            focus = null;
        }
        boolean b = false;
        final View nextFocus = FocusFinder.getInstance().findNextFocus((ViewGroup)this, focus, n);
        if (nextFocus != null && nextFocus != focus) {
            if (n == 17) {
                if (focus != null && nextFocus.getLeft() >= focus.getLeft()) {
                    b = this.pageLeft();
                }
                else {
                    b = nextFocus.requestFocus();
                }
            }
            else if (n == 66) {
                if (focus != null && nextFocus.getLeft() <= focus.getLeft()) {
                    b = this.pageRight();
                }
                else {
                    b = nextFocus.requestFocus();
                }
            }
        }
        else if (n == 17 || n == 1) {
            b = this.pageLeft();
        }
        else if (n == 66 || n == 2) {
            b = this.pageRight();
        }
        if (b) {
            this.playSoundEffect(SoundEffectConstants.getContantForFocusDirection(n));
        }
        return b;
    }
    
    public boolean beginFakeDrag() {
        if (this.mIsBeingDragged) {
            return false;
        }
        this.mFakeDragging = true;
        this.setScrollState(1);
        this.mLastMotionX = 0.0f;
        this.mInitialMotionX = 0.0f;
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        else {
            this.mVelocityTracker.clear();
        }
        final long uptimeMillis = SystemClock.uptimeMillis();
        final MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, 0.0f, 0.0f, 0);
        this.mVelocityTracker.addMovement(obtain);
        obtain.recycle();
        this.mFakeDragBeginTime = uptimeMillis;
        return true;
    }
    
    protected boolean canScroll(final View view, final boolean b, final int n, final int n2, final int n3) {
        if (view instanceof ViewGroup) {
            final ViewGroup viewGroup = (ViewGroup)view;
            final int scrollX = view.getScrollX();
            final int scrollY = view.getScrollY();
            for (int i = viewGroup.getChildCount() - 1; i >= 0; --i) {
                final View child = viewGroup.getChildAt(i);
                if (n2 + scrollX >= child.getLeft() && n2 + scrollX < child.getRight() && n3 + scrollY >= child.getTop() && n3 + scrollY < child.getBottom() && this.canScroll(child, true, n, n2 + scrollX - child.getLeft(), n3 + scrollY - child.getTop())) {
                    return true;
                }
            }
        }
        return b && ViewCompat.canScrollHorizontally(view, -n);
    }
    
    public void computeScroll() {
        if (!this.mScroller.isFinished() && this.mScroller.computeScrollOffset()) {
            final int scrollX = this.getScrollX();
            final int scrollY = this.getScrollY();
            final int currX = this.mScroller.getCurrX();
            final int currY = this.mScroller.getCurrY();
            if (scrollX != currX || scrollY != currY) {
                this.scrollTo(currX, currY);
            }
            if (this.mOnPageChangeListener != null) {
                final int n = this.getWidth() + this.mPageMargin;
                final int n2 = currX / n;
                final int n3 = currX % n;
                this.mOnPageChangeListener.onPageScrolled(n2, n3 / n, n3);
            }
            this.invalidate();
            return;
        }
        this.completeScroll();
    }
    
    void dataSetChanged() {
        boolean b = this.mItems.size() < 3 && this.mItems.size() < this.mAdapter.getCount();
        int n = -1;
        int max;
        int n2;
        for (int i = 0; i < this.mItems.size(); i = n2 + 1, n = max) {
            final ItemInfo itemInfo = this.mItems.get(i);
            final int itemPosition = this.mAdapter.getItemPosition(itemInfo.object);
            if (itemPosition == -1) {
                max = n;
                n2 = i;
            }
            else if (itemPosition == -2) {
                this.mItems.remove(i);
                final int n3 = i - 1;
                this.mAdapter.destroyItem(this, itemInfo.position, itemInfo.object);
                final boolean b2 = true;
                n2 = n3;
                b = b2;
                max = n;
                if (this.mCurItem == itemInfo.position) {
                    max = Math.max(0, Math.min(this.mCurItem, this.mAdapter.getCount() - 1));
                    n2 = n3;
                    b = b2;
                }
            }
            else {
                n2 = i;
                max = n;
                if (itemInfo.position != itemPosition) {
                    if (itemInfo.position == this.mCurItem) {
                        n = itemPosition;
                    }
                    itemInfo.position = itemPosition;
                    b = true;
                    n2 = i;
                    max = n;
                }
            }
        }
        Collections.sort(this.mItems, LazyViewPager.COMPARATOR);
        if (n >= 0) {
            this.setCurrentItemInternal(n, false, true);
            b = true;
        }
        if (b) {
            this.populate();
            this.requestLayout();
        }
    }
    
    public boolean dispatchKeyEvent(final KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || this.executeKeyEvent(keyEvent);
    }
    
    public boolean dispatchPopulateAccessibilityEvent(final AccessibilityEvent accessibilityEvent) {
        for (int childCount = this.getChildCount(), i = 0; i < childCount; ++i) {
            final View child = this.getChildAt(i);
            if (child.getVisibility() == 0) {
                final ItemInfo infoForChild = this.infoForChild(child);
                if (infoForChild != null && infoForChild.position == this.mCurItem && child.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                    return true;
                }
            }
        }
        return false;
    }
    
    float distanceInfluenceForSnapDuration(final float n) {
        return (float)Math.sin((float)((n - 0.5f) * 0.4712389167638204));
    }
    
    public void draw(final Canvas canvas) {
        final boolean b = true;
        super.draw(canvas);
        boolean b2 = false;
        boolean b3 = false;
        final int overScrollMode = ViewCompat.getOverScrollMode((View)this);
        if (overScrollMode == 0 || (overScrollMode == 1 && this.mAdapter != null && this.mAdapter.getCount() > 1)) {
            if (!this.mLeftEdge.isFinished()) {
                final int save = canvas.save();
                final int n = this.getHeight() - this.getPaddingTop() - this.getPaddingBottom();
                canvas.rotate(270.0f);
                canvas.translate((float)(-n + this.getPaddingTop()), 0.0f);
                this.mLeftEdge.setSize(n, this.getWidth());
                b3 = (false | this.mLeftEdge.draw(canvas));
                canvas.restoreToCount(save);
            }
            b2 = b3;
            if (!this.mRightEdge.isFinished()) {
                final int save2 = canvas.save();
                final int width = this.getWidth();
                final int height = this.getHeight();
                final int paddingTop = this.getPaddingTop();
                final int paddingBottom = this.getPaddingBottom();
                int count = b ? 1 : 0;
                if (this.mAdapter != null) {
                    count = this.mAdapter.getCount();
                }
                canvas.rotate(90.0f);
                canvas.translate((float)(-this.getPaddingTop()), (float)(-count * (this.mPageMargin + width) + this.mPageMargin));
                this.mRightEdge.setSize(height - paddingTop - paddingBottom, width);
                b2 = (b3 | this.mRightEdge.draw(canvas));
                canvas.restoreToCount(save2);
            }
        }
        else {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        }
        if (b2) {
            this.invalidate();
        }
    }
    
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        final Drawable mMarginDrawable = this.mMarginDrawable;
        if (mMarginDrawable != null && mMarginDrawable.isStateful()) {
            mMarginDrawable.setState(this.getDrawableState());
        }
    }
    
    public void endFakeDrag() {
        if (!this.mFakeDragging) {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        }
        final VelocityTracker mVelocityTracker = this.mVelocityTracker;
        mVelocityTracker.computeCurrentVelocity(1000, (float)this.mMaximumVelocity);
        final int n = (int)VelocityTrackerCompat.getYVelocity(mVelocityTracker, this.mActivePointerId);
        this.mPopulatePending = true;
        if (Math.abs(n) > this.mMinimumVelocity || Math.abs(this.mInitialMotionX - this.mLastMotionX) >= this.getWidth() / 3) {
            if (this.mLastMotionX > this.mInitialMotionX) {
                this.setCurrentItemInternal(this.mCurItem - 1, true, true);
            }
            else {
                this.setCurrentItemInternal(this.mCurItem + 1, true, true);
            }
        }
        else {
            this.setCurrentItemInternal(this.mCurItem, true, true);
        }
        this.endDrag();
        this.mFakeDragging = false;
    }
    
    public boolean executeKeyEvent(final KeyEvent keyEvent) {
        if (keyEvent.getAction() == 0) {
            switch (keyEvent.getKeyCode()) {
                case 21: {
                    return this.arrowScroll(17);
                }
                case 22: {
                    return this.arrowScroll(66);
                }
                case 61: {
                    if (KeyEventCompat.hasNoModifiers(keyEvent)) {
                        return this.arrowScroll(2);
                    }
                    if (KeyEventCompat.hasModifiers(keyEvent, 1)) {
                        return this.arrowScroll(1);
                    }
                    break;
                }
            }
        }
        return false;
    }
    
    public void fakeDragBy(float n) {
        if (!this.mFakeDragging) {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        }
        this.mLastMotionX += n;
        final float n2 = this.getScrollX() - n;
        final int n3 = this.getWidth() + this.mPageMargin;
        n = Math.max(0, (this.mCurItem - 1) * n3);
        final float n4 = Math.min(this.mCurItem + 1, this.mAdapter.getCount() - 1) * n3;
        if (n2 >= n) {
            n = n2;
            if (n2 > n4) {
                n = n4;
            }
        }
        this.mLastMotionX += n - (int)n;
        this.scrollTo((int)n, this.getScrollY());
        if (this.mOnPageChangeListener != null) {
            final int n5 = (int)n / n3;
            final int n6 = (int)n % n3;
            n = n6 / n3;
            this.mOnPageChangeListener.onPageScrolled(n5, n, n6);
        }
        final MotionEvent obtain = MotionEvent.obtain(this.mFakeDragBeginTime, SystemClock.uptimeMillis(), 2, this.mLastMotionX, 0.0f, 0);
        this.mVelocityTracker.addMovement(obtain);
        obtain.recycle();
    }
    
    public PagerAdapter getAdapter() {
        return this.mAdapter;
    }
    
    public int getCurrentItem() {
        return this.mCurItem;
    }
    
    public int getOffscreenPageLimit() {
        return this.mOffscreenPageLimit;
    }
    
    public int getPageMargin() {
        return this.mPageMargin;
    }
    
    ItemInfo infoForAnyChild(View view) {
        while (true) {
            final ViewParent parent = view.getParent();
            if (parent == this) {
                return this.infoForChild(view);
            }
            if (parent == null || !(parent instanceof View)) {
                return null;
            }
            view = (View)parent;
        }
    }
    
    ItemInfo infoForChild(final View view) {
        for (int i = 0; i < this.mItems.size(); ++i) {
            final ItemInfo itemInfo = this.mItems.get(i);
            if (this.mAdapter.isViewFromObject(view, itemInfo.object)) {
                return itemInfo;
            }
        }
        return null;
    }
    
    void initViewPager() {
        this.setWillNotDraw(false);
        this.setDescendantFocusability(262144);
        this.setFocusable(true);
        final Context context = this.getContext();
        this.mScroller = new Scroller(context, LazyViewPager.sInterpolator);
        final ViewConfiguration value = ViewConfiguration.get(context);
        this.mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(value);
        this.mMinimumVelocity = value.getScaledMinimumFlingVelocity();
        this.mMaximumVelocity = value.getScaledMaximumFlingVelocity();
        this.mLeftEdge = new EdgeEffectCompat(context);
        this.mRightEdge = new EdgeEffectCompat(context);
        this.mBaseLineFlingVelocity = 2500.0f * context.getResources().getDisplayMetrics().density;
        this.mFlingVelocityInfluence = 0.4f;
    }
    
    public boolean isFakeDragging() {
        return this.mFakeDragging;
    }
    
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }
    
    protected void onDraw(final Canvas canvas) {
        super.onDraw(canvas);
        if (this.mPageMargin > 0 && this.mMarginDrawable != null) {
            final int scrollX = this.getScrollX();
            final int width = this.getWidth();
            final int n = scrollX % (this.mPageMargin + width);
            if (n != 0) {
                final int n2 = scrollX - n + width;
                this.mMarginDrawable.setBounds(n2, 0, this.mPageMargin + n2, this.getHeight());
                this.mMarginDrawable.draw(canvas);
            }
        }
    }
    
    public boolean onInterceptTouchEvent(final MotionEvent motionEvent) {
        final int n = motionEvent.getAction() & 0xFF;
        if (n == 3 || n == 1) {
            this.mIsBeingDragged = false;
            this.mIsUnableToDrag = false;
            this.mActivePointerId = -1;
            return false;
        }
        if (n != 0) {
            if (this.mIsBeingDragged) {
                return true;
            }
            if (this.mIsUnableToDrag) {
                return false;
            }
        }
        switch (n) {
            case 2: {
                final int mActivePointerId = this.mActivePointerId;
                if (mActivePointerId == -1) {
                    break;
                }
                final int pointerIndex = MotionEventCompat.findPointerIndex(motionEvent, mActivePointerId);
                final float x = MotionEventCompat.getX(motionEvent, pointerIndex);
                final float n2 = x - this.mLastMotionX;
                final float abs = Math.abs(n2);
                final float y = MotionEventCompat.getY(motionEvent, pointerIndex);
                final float abs2 = Math.abs(y - this.mLastMotionY);
                final int scrollX = this.getScrollX();
                if ((n2 > 0.0f && scrollX == 0) || (n2 < 0.0f && this.mAdapter != null && scrollX >= (this.mAdapter.getCount() - 1) * this.getWidth() - 1)) {}
                if (this.canScroll((View)this, false, (int)n2, (int)x, (int)y)) {
                    this.mLastMotionX = x;
                    this.mInitialMotionX = x;
                    this.mLastMotionY = y;
                    return false;
                }
                if (abs > this.mTouchSlop && abs > abs2) {
                    this.mIsBeingDragged = true;
                    this.setScrollState(1);
                    this.mLastMotionX = x;
                    this.setScrollingCacheEnabled(true);
                    break;
                }
                if (abs2 > this.mTouchSlop) {
                    this.mIsUnableToDrag = true;
                    break;
                }
                break;
            }
            case 0: {
                final float x2 = motionEvent.getX();
                this.mInitialMotionX = x2;
                this.mLastMotionX = x2;
                this.mLastMotionY = motionEvent.getY();
                this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, 0);
                if (this.mScrollState == 2) {
                    this.mIsBeingDragged = true;
                    this.mIsUnableToDrag = false;
                    this.setScrollState(1);
                    break;
                }
                this.completeScroll();
                this.mIsBeingDragged = false;
                this.mIsUnableToDrag = false;
                break;
            }
            case 6: {
                this.onSecondaryPointerUp(motionEvent);
                break;
            }
        }
        return this.mIsBeingDragged;
    }
    
    protected void onLayout(final boolean b, final int n, int i, final int n2, int childCount) {
        this.mInLayout = true;
        this.populate();
        this.mInLayout = false;
        View child;
        ItemInfo infoForChild;
        int n3;
        int paddingTop;
        for (childCount = this.getChildCount(), i = 0; i < childCount; ++i) {
            child = this.getChildAt(i);
            if (child.getVisibility() != 8) {
                infoForChild = this.infoForChild(child);
                if (infoForChild != null) {
                    n3 = this.getPaddingLeft() + (this.mPageMargin + (n2 - n)) * infoForChild.position;
                    paddingTop = this.getPaddingTop();
                    child.layout(n3, paddingTop, child.getMeasuredWidth() + n3, child.getMeasuredHeight() + paddingTop);
                }
            }
        }
        this.mFirstLayout = false;
    }
    
    protected void onMeasure(int i, int childCount) {
        this.setMeasuredDimension(getDefaultSize(0, i), getDefaultSize(0, childCount));
        this.mChildWidthMeasureSpec = View$MeasureSpec.makeMeasureSpec(this.getMeasuredWidth() - this.getPaddingLeft() - this.getPaddingRight(), 1073741824);
        this.mChildHeightMeasureSpec = View$MeasureSpec.makeMeasureSpec(this.getMeasuredHeight() - this.getPaddingTop() - this.getPaddingBottom(), 1073741824);
        this.mInLayout = true;
        this.populate();
        this.mInLayout = false;
        View child;
        for (childCount = this.getChildCount(), i = 0; i < childCount; ++i) {
            child = this.getChildAt(i);
            if (child.getVisibility() != 8) {
                child.measure(this.mChildWidthMeasureSpec, this.mChildHeightMeasureSpec);
            }
        }
    }
    
    protected boolean onRequestFocusInDescendants(final int n, final Rect rect) {
        int childCount = this.getChildCount();
        int i;
        int n2;
        if ((n & 0x2) != 0x0) {
            i = 0;
            n2 = 1;
        }
        else {
            i = childCount - 1;
            n2 = -1;
            childCount = -1;
        }
        while (i != childCount) {
            final View child = this.getChildAt(i);
            if (child.getVisibility() == 0) {
                final ItemInfo infoForChild = this.infoForChild(child);
                if (infoForChild != null && infoForChild.position == this.mCurItem && child.requestFocus(n, rect)) {
                    return true;
                }
            }
            i += n2;
        }
        return false;
    }
    
    public void onRestoreInstanceState(final Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        final SavedState savedState = (SavedState)parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.mAdapter != null) {
            this.mAdapter.restoreState(savedState.adapterState, savedState.loader);
            this.setCurrentItemInternal(savedState.position, false, true);
            return;
        }
        this.mRestoredCurItem = savedState.position;
        this.mRestoredAdapterState = savedState.adapterState;
        this.mRestoredClassLoader = savedState.loader;
    }
    
    public Parcelable onSaveInstanceState() {
        final SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.position = this.mCurItem;
        if (this.mAdapter != null) {
            savedState.adapterState = this.mAdapter.saveState();
        }
        return (Parcelable)savedState;
    }
    
    protected void onSizeChanged(final int n, final int n2, final int n3, final int n4) {
        super.onSizeChanged(n, n2, n3, n4);
        if (n != n3) {
            this.recomputeScrollPosition(n, n3, this.mPageMargin, this.mPageMargin);
        }
    }
    
    public boolean onTouchEvent(final MotionEvent motionEvent) {
        if (this.mFakeDragging) {
            return true;
        }
        if (motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) {
            return false;
        }
        if (this.mAdapter == null || this.mAdapter.getCount() == 0) {
            return false;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        final int action = motionEvent.getAction();
        final boolean b = false;
        final boolean b2 = false;
        final boolean b3 = false;
        int n2;
        final int n = n2 = 0;
        while (true) {
            switch (action & 0xFF) {
                default: {
                    n2 = n;
                    break Label_0140;
                }
                case 6: {
                    this.onSecondaryPointerUp(motionEvent);
                    this.mLastMotionX = MotionEventCompat.getX(motionEvent, MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId));
                    n2 = n;
                    break Label_0140;
                }
                case 5: {
                    final int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
                    this.mLastMotionX = MotionEventCompat.getX(motionEvent, actionIndex);
                    this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, actionIndex);
                    n2 = n;
                    break Label_0140;
                }
                case 0: {
                    this.completeScroll();
                    final float x = motionEvent.getX();
                    this.mInitialMotionX = x;
                    this.mLastMotionX = x;
                    this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, 0);
                    n2 = n;
                }
                case 4: {
                    if (n2 != 0) {
                        this.invalidate();
                    }
                    return true;
                }
                case 2: {
                    if (!this.mIsBeingDragged) {
                        final int pointerIndex = MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId);
                        final float x2 = MotionEventCompat.getX(motionEvent, pointerIndex);
                        final float abs = Math.abs(x2 - this.mLastMotionX);
                        final float abs2 = Math.abs(MotionEventCompat.getY(motionEvent, pointerIndex) - this.mLastMotionY);
                        if (abs > this.mTouchSlop && abs > abs2) {
                            this.mIsBeingDragged = true;
                            this.mLastMotionX = x2;
                            this.setScrollState(1);
                            this.setScrollingCacheEnabled(true);
                        }
                    }
                    n2 = n;
                    if (!this.mIsBeingDragged) {
                        continue;
                    }
                    final float x3 = MotionEventCompat.getX(motionEvent, MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId));
                    final float mLastMotionX = this.mLastMotionX;
                    this.mLastMotionX = x3;
                    final float n3 = this.getScrollX() + (mLastMotionX - x3);
                    final int width = this.getWidth();
                    final int n4 = width + this.mPageMargin;
                    final int n5 = this.mAdapter.getCount() - 1;
                    float n6 = Math.max(0, (this.mCurItem - 1) * n4);
                    final float n7 = Math.min(this.mCurItem + 1, n5) * n4;
                    boolean b4;
                    if (n3 < n6) {
                        b4 = b;
                        if (n6 == 0.0f) {
                            b4 = this.mLeftEdge.onPull(-n3 / width);
                        }
                    }
                    else {
                        b4 = b2;
                        n6 = n3;
                        if (n3 > n7) {
                            b4 = b3;
                            if (n7 == n5 * n4) {
                                b4 = this.mRightEdge.onPull((n3 - n7) / width);
                            }
                            n6 = n7;
                        }
                    }
                    this.mLastMotionX += n6 - (int)n6;
                    this.scrollTo((int)n6, this.getScrollY());
                    n2 = (b4 ? 1 : 0);
                    if (this.mOnPageChangeListener != null) {
                        final int n8 = (int)n6 / n4;
                        final int n9 = (int)n6 % n4;
                        this.mOnPageChangeListener.onPageScrolled(n8, n9 / n4, n9);
                        n2 = (b4 ? 1 : 0);
                    }
                    continue;
                }
                case 1: {
                    n2 = n;
                    if (this.mIsBeingDragged) {
                        final VelocityTracker mVelocityTracker = this.mVelocityTracker;
                        mVelocityTracker.computeCurrentVelocity(1000, (float)this.mMaximumVelocity);
                        final int n10 = (int)VelocityTrackerCompat.getXVelocity(mVelocityTracker, this.mActivePointerId);
                        this.mPopulatePending = true;
                        int n11 = this.getScrollX() / (this.getWidth() + this.mPageMargin);
                        if (n10 <= 0) {
                            ++n11;
                        }
                        this.setCurrentItemInternal(n11, true, true, n10);
                        this.mActivePointerId = -1;
                        this.endDrag();
                        n2 = ((this.mLeftEdge.onRelease() | this.mRightEdge.onRelease()) ? 1 : 0);
                    }
                    continue;
                }
                case 3: {
                    n2 = n;
                    if (this.mIsBeingDragged) {
                        this.setCurrentItemInternal(this.mCurItem, true, true);
                        this.mActivePointerId = -1;
                        this.endDrag();
                        n2 = ((this.mLeftEdge.onRelease() | this.mRightEdge.onRelease()) ? 1 : 0);
                    }
                    continue;
                }
            }
            break;
        }
    }
    
    boolean pageLeft() {
        if (this.mCurItem > 0) {
            this.setCurrentItem(this.mCurItem - 1, true);
            return true;
        }
        return false;
    }
    
    boolean pageRight() {
        if (this.mAdapter != null && this.mCurItem < this.mAdapter.getCount() - 1) {
            this.setCurrentItem(this.mCurItem + 1, true);
            return true;
        }
        return false;
    }
    
    void populate() {
        if (this.mAdapter != null && !this.mPopulatePending && this.getWindowToken() != null) {
            this.mAdapter.startUpdate(this);
            final int mOffscreenPageLimit = this.mOffscreenPageLimit;
            final int max = Math.max(0, this.mCurItem - mOffscreenPageLimit);
            final int min = Math.min(this.mAdapter.getCount() - 1, this.mCurItem + mOffscreenPageLimit);
            int position = -1;
            int n;
            for (int i = 0; i < this.mItems.size(); i = n + 1) {
                final ItemInfo itemInfo = this.mItems.get(i);
                if ((itemInfo.position < max || itemInfo.position > min) && !itemInfo.scrolling) {
                    this.mItems.remove(i);
                    n = i - 1;
                    this.mAdapter.destroyItem(this, itemInfo.position, itemInfo.object);
                }
                else {
                    n = i;
                    if (position < min) {
                        n = i;
                        if (itemInfo.position > max) {
                            final int n2 = position + 1;
                            int n3 = i;
                            int n4;
                            if ((n4 = n2) < max) {
                                n4 = max;
                                n3 = i;
                            }
                            while (true) {
                                n = n3;
                                if (n4 > min) {
                                    break;
                                }
                                n = n3;
                                if (n4 >= itemInfo.position) {
                                    break;
                                }
                                this.addNewItem(n4, n3);
                                ++n4;
                                ++n3;
                            }
                        }
                    }
                }
                position = itemInfo.position;
            }
            int position2;
            if (this.mItems.size() > 0) {
                position2 = this.mItems.get(this.mItems.size() - 1).position;
            }
            else {
                position2 = -1;
            }
            if (position2 < min) {
                int j = position2 + 1;
                if (j <= max) {
                    j = max;
                }
                while (j <= min) {
                    this.addNewItem(j, -1);
                    ++j;
                }
            }
            final ItemInfo itemInfo2 = null;
            int n5 = 0;
            ItemInfo itemInfo3;
            while (true) {
                itemInfo3 = itemInfo2;
                if (n5 >= this.mItems.size()) {
                    break;
                }
                if (this.mItems.get(n5).position == this.mCurItem) {
                    itemInfo3 = this.mItems.get(n5);
                    break;
                }
                ++n5;
            }
            final PagerAdapter mAdapter = this.mAdapter;
            final int mCurItem = this.mCurItem;
            Object object;
            if (itemInfo3 != null) {
                object = itemInfo3.object;
            }
            else {
                object = null;
            }
            mAdapter.setPrimaryItem(this, mCurItem, object);
            this.mAdapter.finishUpdate(this);
            if (this.hasFocus()) {
                final View focus = this.findFocus();
                ItemInfo infoForAnyChild;
                if (focus != null) {
                    infoForAnyChild = this.infoForAnyChild(focus);
                }
                else {
                    infoForAnyChild = null;
                }
                if (infoForAnyChild == null || infoForAnyChild.position != this.mCurItem) {
                    for (int k = 0; k < this.getChildCount(); ++k) {
                        final View child = this.getChildAt(k);
                        final ItemInfo infoForChild = this.infoForChild(child);
                        if (infoForChild != null && infoForChild.position == this.mCurItem && child.requestFocus(2)) {
                            break;
                        }
                    }
                }
            }
        }
    }
    
    public void setAdapter(final PagerAdapter mAdapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
            this.mAdapter.startUpdate(this);
            for (int i = 0; i < this.mItems.size(); ++i) {
                final ItemInfo itemInfo = this.mItems.get(i);
                this.mAdapter.destroyItem(this, itemInfo.position, itemInfo.object);
            }
            this.mAdapter.finishUpdate(this);
            this.mItems.clear();
            this.removeAllViews();
            this.scrollTo(this.mCurItem = 0, 0);
        }
        this.mAdapter = mAdapter;
        if (this.mAdapter != null) {
            if (this.mObserver == null) {
                this.mObserver = new PagerObserver();
            }
            this.mAdapter.registerDataSetObserver(this.mObserver);
            this.mPopulatePending = false;
            if (this.mRestoredCurItem < 0) {
                this.populate();
                return;
            }
            this.mAdapter.restoreState(this.mRestoredAdapterState, this.mRestoredClassLoader);
            this.setCurrentItemInternal(this.mRestoredCurItem, false, true);
            this.mRestoredCurItem = -1;
            this.mRestoredAdapterState = null;
            this.mRestoredClassLoader = null;
        }
    }
    
    public void setCurrentItem(final int n) {
        this.mPopulatePending = false;
        this.setCurrentItemInternal(n, !this.mFirstLayout, false);
    }
    
    public void setCurrentItem(final int n, final boolean b) {
        this.setCurrentItemInternal(n, b, this.mPopulatePending = false);
    }
    
    void setCurrentItemInternal(final int n, final boolean b, final boolean b2) {
        this.setCurrentItemInternal(n, b, b2, 0);
    }
    
    void setCurrentItemInternal(int i, final boolean b, final boolean b2, final int n) {
        final int n2 = 1;
        if (this.mAdapter == null || this.mAdapter.getCount() <= 0) {
            this.setScrollingCacheEnabled(false);
        }
        else {
            if (!b2 && this.mCurItem == i && this.mItems.size() != 0) {
                this.setScrollingCacheEnabled(false);
                return;
            }
            int mCurItem;
            if (i < 0) {
                mCurItem = 0;
            }
            else if ((mCurItem = i) >= this.mAdapter.getCount()) {
                mCurItem = this.mAdapter.getCount() - 1;
            }
            i = this.mOffscreenPageLimit;
            if (mCurItem > this.mCurItem + i || mCurItem < this.mCurItem - i) {
                for (i = 0; i < this.mItems.size(); ++i) {
                    this.mItems.get(i).scrolling = true;
                }
            }
            if (this.mCurItem != mCurItem) {
                i = n2;
            }
            else {
                i = 0;
            }
            this.mCurItem = mCurItem;
            this.populate();
            final int n3 = (this.getWidth() + this.mPageMargin) * mCurItem;
            if (!b) {
                if (i != 0 && this.mOnPageChangeListener != null) {
                    this.mOnPageChangeListener.onPageSelected(mCurItem);
                }
                this.completeScroll();
                this.scrollTo(n3, 0);
                return;
            }
            this.smoothScrollTo(n3, 0, n);
            if (i != 0 && this.mOnPageChangeListener != null) {
                this.mOnPageChangeListener.onPageSelected(mCurItem);
            }
        }
    }
    
    public void setOffscreenPageLimit(final int n) {
        int mOffscreenPageLimit = n;
        if (n < 0) {
            Log.w("LazyViewPager", "Requested offscreen page limit " + n + " too small; defaulting to " + 0);
            mOffscreenPageLimit = 0;
        }
        if (mOffscreenPageLimit != this.mOffscreenPageLimit) {
            this.mOffscreenPageLimit = mOffscreenPageLimit;
            this.populate();
        }
    }
    
    public void setOnPageChangeListener(final OnPageChangeListener mOnPageChangeListener) {
        this.mOnPageChangeListener = mOnPageChangeListener;
    }
    
    public void setPageMargin(final int mPageMargin) {
        final int mPageMargin2 = this.mPageMargin;
        this.mPageMargin = mPageMargin;
        final int width = this.getWidth();
        this.recomputeScrollPosition(width, width, mPageMargin, mPageMargin2);
        this.requestLayout();
    }
    
    public void setPageMarginDrawable(final int n) {
        this.setPageMarginDrawable(this.getContext().getResources().getDrawable(n));
    }
    
    public void setPageMarginDrawable(final Drawable mMarginDrawable) {
        this.mMarginDrawable = mMarginDrawable;
        if (mMarginDrawable != null) {
            this.refreshDrawableState();
        }
        this.setWillNotDraw(mMarginDrawable == null);
        this.invalidate();
    }
    
    void smoothScrollTo(final int n, final int n2) {
        this.smoothScrollTo(n, n2, 0);
    }
    
    void smoothScrollTo(int min, int n, int abs) {
        if (this.getChildCount() == 0) {
            this.setScrollingCacheEnabled(false);
            return;
        }
        final int scrollX = this.getScrollX();
        final int scrollY = this.getScrollY();
        final int n2 = min - scrollX;
        n -= scrollY;
        if (n2 == 0 && n == 0) {
            this.completeScroll();
            this.setScrollState(0);
            return;
        }
        this.setScrollingCacheEnabled(true);
        this.mScrolling = true;
        this.setScrollState(2);
        min = (int)(100.0f * (Math.abs(n2) / (this.getWidth() + this.mPageMargin)));
        abs = Math.abs(abs);
        if (abs > 0) {
            min += (int)(min / (abs / this.mBaseLineFlingVelocity) * this.mFlingVelocityInfluence);
        }
        else {
            min += 100;
        }
        min = Math.min(min, 600);
        this.mScroller.startScroll(scrollX, scrollY, n2, n, min);
        this.invalidate();
    }
    
    protected boolean verifyDrawable(final Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.mMarginDrawable;
    }
    
    static class ItemInfo
    {
        Object object;
        int position;
        boolean scrolling;
    }
    
    public interface OnPageChangeListener
    {
        void onPageScrollStateChanged(final int p0);
        
        void onPageScrolled(final int p0, final float p1, final int p2);
        
        void onPageSelected(final int p0);
    }
    
    private class PagerObserver extends DataSetObserver
    {
        public void onChanged() {
            LazyViewPager.this.dataSetChanged();
        }
        
        public void onInvalidated() {
            LazyViewPager.this.dataSetChanged();
        }
    }
    
    public static class SavedState extends View$BaseSavedState
    {
        public static final Parcelable$Creator<SavedState> CREATOR;
        Parcelable adapterState;
        ClassLoader loader;
        int position;
        
        static {
            CREATOR = ParcelableCompat.newCreator((ParcelableCompatCreatorCallbacks<SavedState>)new ParcelableCompatCreatorCallbacks<SavedState>() {
                @Override
                public SavedState createFromParcel(final Parcel parcel, final ClassLoader classLoader) {
                    return new SavedState(parcel, classLoader);
                }
                
                @Override
                public SavedState[] newArray(final int n) {
                    return new SavedState[n];
                }
            });
        }
        
        SavedState(final Parcel parcel, final ClassLoader classLoader) {
            super(parcel);
            ClassLoader classLoader2 = classLoader;
            if (classLoader == null) {
                classLoader2 = this.getClass().getClassLoader();
            }
            this.position = parcel.readInt();
            this.adapterState = parcel.readParcelable(classLoader2);
            this.loader = classLoader2;
        }
        
        public SavedState(final Parcelable parcelable) {
            super(parcelable);
        }
        
        public String toString() {
            return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + "}";
        }
        
        public void writeToParcel(final Parcel parcel, final int n) {
            super.writeToParcel(parcel, n);
            parcel.writeInt(this.position);
            parcel.writeParcelable(this.adapterState, n);
        }
    }
    
    public static class SimpleOnPageChangeListener implements OnPageChangeListener
    {
        @Override
        public void onPageScrollStateChanged(final int n) {
        }
        
        @Override
        public void onPageScrolled(final int n, final float n2, final int n3) {
        }
        
        @Override
        public void onPageSelected(final int n) {
        }
    }
}
