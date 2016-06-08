package android.support.v7.widget;

import android.widget.*;
import android.support.v7.internal.widget.*;
import android.content.*;
import android.util.*;
import android.support.v7.appcompat.*;

public class AppCompatSeekBar extends SeekBar
{
    private AppCompatSeekBarHelper mAppCompatSeekBarHelper;
    private TintManager mTintManager;
    
    public AppCompatSeekBar(final Context context) {
        this(context, null);
    }
    
    public AppCompatSeekBar(final Context context, final AttributeSet set) {
        this(context, set, R.attr.seekBarStyle);
    }
    
    public AppCompatSeekBar(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.mTintManager = TintManager.get(context);
        (this.mAppCompatSeekBarHelper = new AppCompatSeekBarHelper(this, this.mTintManager)).loadFromAttributes(set, n);
    }
}
