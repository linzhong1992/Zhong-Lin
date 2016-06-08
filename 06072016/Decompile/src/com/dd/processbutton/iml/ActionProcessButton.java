package com.dd.processbutton.iml;

import android.content.*;
import android.util.*;
import android.view.*;
import com.dd.processbutton.*;
import android.content.res.*;
import android.graphics.drawable.*;
import android.graphics.*;
import android.view.animation.*;
import android.support.v4.view.*;

public class ActionProcessButton extends ProcessButton
{
    private int mColor1;
    private int mColor2;
    private int mColor3;
    private int mColor4;
    private Mode mMode;
    private ProgressBar mProgressBar;
    
    public ActionProcessButton(final Context context) {
        super(context);
        this.init(context);
    }
    
    public ActionProcessButton(final Context context, final AttributeSet set) {
        super(context, set);
        this.init(context);
    }
    
    public ActionProcessButton(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.init(context);
    }
    
    private void drawEndlessProgress(final Canvas canvas) {
        if (this.mProgressBar == null) {
            this.mProgressBar = new ProgressBar((View)this);
            this.setupProgressBarBounds();
            this.mProgressBar.setColorScheme(this.mColor1, this.mColor2, this.mColor3, this.mColor4);
            this.mProgressBar.start();
        }
        if (this.getProgress() > 0) {
            this.mProgressBar.draw(canvas);
        }
    }
    
    private void drawLineProgress(final Canvas canvas) {
        this.getProgressDrawable().setBounds(0, (int)(this.getMeasuredHeight() - this.getMeasuredHeight() * 0.05), (int)(this.getMeasuredWidth() * (this.getProgress() / this.getMaxProgress())), this.getMeasuredHeight());
        this.getProgressDrawable().draw(canvas);
    }
    
    private void init(final Context context) {
        final Resources resources = context.getResources();
        this.mMode = Mode.ENDLESS;
        this.mColor1 = resources.getColor(R.color.holo_blue_bright);
        this.mColor2 = resources.getColor(R.color.holo_green_light);
        this.mColor3 = resources.getColor(R.color.holo_orange_light);
        this.mColor4 = resources.getColor(R.color.holo_red_light);
    }
    
    private void setupProgressBarBounds() {
        this.mProgressBar.setBounds(0, (int)(this.getMeasuredHeight() - this.getDimension(R.dimen.layer_padding)), this.getMeasuredWidth(), this.getMeasuredHeight());
    }
    
    @Override
    public void drawProgress(final Canvas canvas) {
        if (this.getBackground() != this.getProgressDrawable()) {
            this.setBackgroundDrawable((Drawable)this.getProgressDrawable());
        }
        switch (this.mMode) {
            default: {}
            case ENDLESS: {
                this.drawEndlessProgress(canvas);
            }
            case PROGRESS: {
                this.drawLineProgress(canvas);
            }
        }
    }
    
    protected void onSizeChanged(final int n, final int n2, final int n3, final int n4) {
        super.onSizeChanged(n, n2, n3, n4);
        if (this.mProgressBar != null) {
            this.setupProgressBarBounds();
        }
    }
    
    public void setColorScheme(final int mColor1, final int mColor2, final int mColor3, final int mColor4) {
        this.mColor1 = mColor1;
        this.mColor2 = mColor2;
        this.mColor3 = mColor3;
        this.mColor4 = mColor4;
    }
    
    public void setMode(final Mode mMode) {
        this.mMode = mMode;
    }
    
    public void startAnimation() {
        if (this.mMode == Mode.ENDLESS) {
            this.setProgress(50);
        }
    }
    
    public void stopAnimation() {
        if (this.mMode == Mode.ENDLESS) {
            this.setProgress(0);
        }
    }
    
    public enum Mode
    {
        ENDLESS, 
        PROGRESS;
    }
    
    public static class ProgressBar
    {
        private static final int ANIMATION_DURATION_MS = 2000;
        private static final int COLOR1 = -1291845632;
        private static final int COLOR2 = Integer.MIN_VALUE;
        private static final int COLOR3 = 1291845632;
        private static final int COLOR4 = 436207616;
        private static final int FINISH_ANIMATION_DURATION_MS = 1000;
        private static final Interpolator INTERPOLATOR;
        private Rect mBounds;
        private final RectF mClipRect;
        private int mColor1;
        private int mColor2;
        private int mColor3;
        private int mColor4;
        private long mFinishTime;
        private final Paint mPaint;
        private View mParent;
        private boolean mRunning;
        private long mStartTime;
        private float mTriggerPercentage;
        
        static {
            INTERPOLATOR = (Interpolator)new AccelerateDecelerateInterpolator();
        }
        
        public ProgressBar(final View mParent) {
            this.mPaint = new Paint();
            this.mClipRect = new RectF();
            this.mBounds = new Rect();
            this.mParent = mParent;
            this.mColor1 = -1291845632;
            this.mColor2 = Integer.MIN_VALUE;
            this.mColor3 = 1291845632;
            this.mColor4 = 436207616;
        }
        
        private void drawCircle(final Canvas canvas, final float n, float interpolation, final int color, final float n2) {
            this.mPaint.setColor(color);
            canvas.save();
            canvas.translate(n, interpolation);
            interpolation = ProgressBar.INTERPOLATOR.getInterpolation(n2);
            canvas.scale(interpolation, interpolation);
            canvas.drawCircle(0.0f, 0.0f, n, this.mPaint);
            canvas.restore();
        }
        
        private void drawTrigger(final Canvas canvas, final int n, final int n2) {
            this.mPaint.setColor(this.mColor1);
            canvas.drawCircle((float)n, (float)n2, n * this.mTriggerPercentage, this.mPaint);
        }
        
        void draw(final Canvas canvas) {
            final int width = this.mBounds.width();
            final int height = this.mBounds.height();
            final int n = width / 2;
            final int n2 = height / 2;
            boolean b = false;
            final int save = canvas.save();
            canvas.clipRect(this.mBounds);
            int save2;
            if (this.mRunning || this.mFinishTime > 0L) {
                final long currentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
                final long mStartTime = this.mStartTime;
                final long n3 = (currentAnimationTimeMillis - this.mStartTime) / 2000L;
                final float n4 = (currentAnimationTimeMillis - mStartTime) % 2000L / 20.0f;
                if (!this.mRunning) {
                    if (currentAnimationTimeMillis - this.mFinishTime >= 1000L) {
                        this.mFinishTime = 0L;
                        return;
                    }
                    final float n5 = width / 2 * ProgressBar.INTERPOLATOR.getInterpolation((currentAnimationTimeMillis - this.mFinishTime) % 1000L / 10.0f / 100.0f);
                    this.mClipRect.set(n - n5, 0.0f, n + n5, (float)height);
                    canvas.saveLayerAlpha(this.mClipRect, 0, 0);
                    b = true;
                }
                if (n3 == 0L) {
                    canvas.drawColor(this.mColor1);
                }
                else if (n4 >= 0.0f && n4 < 25.0f) {
                    canvas.drawColor(this.mColor4);
                }
                else if (n4 >= 25.0f && n4 < 50.0f) {
                    canvas.drawColor(this.mColor1);
                }
                else if (n4 >= 50.0f && n4 < 75.0f) {
                    canvas.drawColor(this.mColor2);
                }
                else {
                    canvas.drawColor(this.mColor3);
                }
                if (n4 >= 0.0f && n4 <= 25.0f) {
                    this.drawCircle(canvas, n, n2, this.mColor1, (25.0f + n4) * 2.0f / 100.0f);
                }
                if (n4 >= 0.0f && n4 <= 50.0f) {
                    this.drawCircle(canvas, n, n2, this.mColor2, 2.0f * n4 / 100.0f);
                }
                if (n4 >= 25.0f && n4 <= 75.0f) {
                    this.drawCircle(canvas, n, n2, this.mColor3, (n4 - 25.0f) * 2.0f / 100.0f);
                }
                if (n4 >= 50.0f && n4 <= 100.0f) {
                    this.drawCircle(canvas, n, n2, this.mColor4, (n4 - 50.0f) * 2.0f / 100.0f);
                }
                if (n4 >= 75.0f && n4 <= 100.0f) {
                    this.drawCircle(canvas, n, n2, this.mColor1, (n4 - 75.0f) * 2.0f / 100.0f);
                }
                save2 = save;
                if (this.mTriggerPercentage > 0.0f) {
                    save2 = save;
                    if (b) {
                        canvas.restoreToCount(save);
                        save2 = canvas.save();
                        canvas.clipRect(this.mBounds);
                        this.drawTrigger(canvas, n, n2);
                    }
                }
                ViewCompat.postInvalidateOnAnimation(this.mParent);
            }
            else {
                save2 = save;
                if (this.mTriggerPercentage > 0.0f) {
                    save2 = save;
                    if (this.mTriggerPercentage <= 1.0) {
                        this.drawTrigger(canvas, n, n2);
                        save2 = save;
                    }
                }
            }
            canvas.restoreToCount(save2);
        }
        
        void setBounds(final int left, final int top, final int right, final int bottom) {
            this.mBounds.left = left;
            this.mBounds.top = top;
            this.mBounds.right = right;
            this.mBounds.bottom = bottom;
        }
        
        void setColorScheme(final int mColor1, final int mColor2, final int mColor3, final int mColor4) {
            this.mColor1 = mColor1;
            this.mColor2 = mColor2;
            this.mColor3 = mColor3;
            this.mColor4 = mColor4;
        }
        
        void start() {
            if (!this.mRunning) {
                this.mTriggerPercentage = 0.0f;
                this.mStartTime = AnimationUtils.currentAnimationTimeMillis();
                this.mRunning = true;
                this.mParent.postInvalidate();
            }
        }
    }
}
