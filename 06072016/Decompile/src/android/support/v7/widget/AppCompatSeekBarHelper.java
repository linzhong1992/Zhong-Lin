package android.support.v7.widget;

import android.widget.*;
import android.util.*;
import android.support.v7.internal.widget.*;
import android.graphics.drawable.*;

class AppCompatSeekBarHelper extends AppCompatProgressBarHelper
{
    private static final int[] TINT_ATTRS;
    private final SeekBar mView;
    
    static {
        TINT_ATTRS = new int[] { 16843074 };
    }
    
    AppCompatSeekBarHelper(final SeekBar mView, final TintManager tintManager) {
        super((ProgressBar)mView, tintManager);
        this.mView = mView;
    }
    
    @Override
    void loadFromAttributes(final AttributeSet set, final int n) {
        super.loadFromAttributes(set, n);
        final TintTypedArray obtainStyledAttributes = TintTypedArray.obtainStyledAttributes(this.mView.getContext(), set, AppCompatSeekBarHelper.TINT_ATTRS, n, 0);
        final Drawable drawableIfKnown = obtainStyledAttributes.getDrawableIfKnown(0);
        if (drawableIfKnown != null) {
            this.mView.setThumb(drawableIfKnown);
        }
        obtainStyledAttributes.recycle();
    }
}
