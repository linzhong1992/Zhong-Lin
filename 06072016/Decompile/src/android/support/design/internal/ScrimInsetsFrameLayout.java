package android.support.design.internal;

import android.widget.*;
import android.content.*;
import android.util.*;
import android.support.design.*;
import android.view.*;
import android.support.v4.view.*;
import android.content.res.*;
import android.graphics.*;
import android.support.annotation.*;
import android.graphics.drawable.*;

public class ScrimInsetsFrameLayout extends FrameLayout
{
    private Drawable mInsetForeground;
    private Rect mInsets;
    private Rect mTempRect;
    
    public ScrimInsetsFrameLayout(final Context context) {
        this(context, null);
    }
    
    public ScrimInsetsFrameLayout(final Context context, final AttributeSet set) {
        this(context, set, 0);
    }
    
    public ScrimInsetsFrameLayout(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.mTempRect = new Rect();
        final TypedArray obtainStyledAttributes = context.obtainStyledAttributes(set, R.styleable.ScrimInsetsFrameLayout, n, R.style.Widget_Design_ScrimInsetsFrameLayout);
        this.mInsetForeground = obtainStyledAttributes.getDrawable(R.styleable.ScrimInsetsFrameLayout_insetForeground);
        obtainStyledAttributes.recycle();
        this.setWillNotDraw(true);
        ViewCompat.setOnApplyWindowInsetsListener((View)this, new OnApplyWindowInsetsListener() {
            @Override
            public WindowInsetsCompat onApplyWindowInsets(final View view, final WindowInsetsCompat windowInsetsCompat) {
                if (ScrimInsetsFrameLayout.this.mInsets == null) {
                    ScrimInsetsFrameLayout.this.mInsets = new Rect();
                }
                ScrimInsetsFrameLayout.this.mInsets.set(windowInsetsCompat.getSystemWindowInsetLeft(), windowInsetsCompat.getSystemWindowInsetTop(), windowInsetsCompat.getSystemWindowInsetRight(), windowInsetsCompat.getSystemWindowInsetBottom());
                ScrimInsetsFrameLayout.this.setWillNotDraw(ScrimInsetsFrameLayout.this.mInsets.isEmpty() || ScrimInsetsFrameLayout.this.mInsetForeground == null);
                ViewCompat.postInvalidateOnAnimation((View)ScrimInsetsFrameLayout.this);
                return windowInsetsCompat.consumeSystemWindowInsets();
            }
        });
    }
    
    public void draw(@NonNull final Canvas canvas) {
        super.draw(canvas);
        final int width = this.getWidth();
        final int height = this.getHeight();
        if (this.mInsets != null && this.mInsetForeground != null) {
            final int save = canvas.save();
            canvas.translate((float)this.getScrollX(), (float)this.getScrollY());
            this.mTempRect.set(0, 0, width, this.mInsets.top);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            this.mTempRect.set(0, height - this.mInsets.bottom, width, height);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            this.mTempRect.set(0, this.mInsets.top, this.mInsets.left, height - this.mInsets.bottom);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            this.mTempRect.set(width - this.mInsets.right, this.mInsets.top, width, height - this.mInsets.bottom);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            canvas.restoreToCount(save);
        }
    }
    
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mInsetForeground != null) {
            this.mInsetForeground.setCallback((Drawable$Callback)this);
        }
    }
    
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mInsetForeground != null) {
            this.mInsetForeground.setCallback((Drawable$Callback)null);
        }
    }
}
