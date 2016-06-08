package android.support.v7.widget;

import android.support.v7.internal.widget.*;
import android.content.*;
import android.util.*;
import android.support.v7.appcompat.*;
import android.widget.*;
import android.support.v4.view.*;
import android.graphics.*;

public class AppCompatRatingBar extends RatingBar
{
    private AppCompatProgressBarHelper mAppCompatProgressBarHelper;
    private TintManager mTintManager;
    
    public AppCompatRatingBar(final Context context) {
        this(context, null);
    }
    
    public AppCompatRatingBar(final Context context, final AttributeSet set) {
        this(context, set, R.attr.ratingBarStyle);
    }
    
    public AppCompatRatingBar(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.mTintManager = TintManager.get(context);
        (this.mAppCompatProgressBarHelper = new AppCompatProgressBarHelper((ProgressBar)this, this.mTintManager)).loadFromAttributes(set, n);
    }
    
    protected void onMeasure(final int n, final int n2) {
        synchronized (this) {
            super.onMeasure(n, n2);
            final Bitmap sampleTime = this.mAppCompatProgressBarHelper.getSampleTime();
            if (sampleTime != null) {
                this.setMeasuredDimension(ViewCompat.resolveSizeAndState(sampleTime.getWidth() * this.getNumStars(), n, 0), this.getMeasuredHeight());
            }
        }
    }
}
