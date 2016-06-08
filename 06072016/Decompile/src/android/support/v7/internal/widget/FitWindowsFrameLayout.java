package android.support.v7.internal.widget;

import android.widget.*;
import android.content.*;
import android.util.*;
import android.graphics.*;

public class FitWindowsFrameLayout extends FrameLayout implements FitWindowsViewGroup
{
    private OnFitSystemWindowsListener mListener;
    
    public FitWindowsFrameLayout(final Context context) {
        super(context);
    }
    
    public FitWindowsFrameLayout(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    protected boolean fitSystemWindows(final Rect rect) {
        if (this.mListener != null) {
            this.mListener.onFitSystemWindows(rect);
        }
        return super.fitSystemWindows(rect);
    }
    
    public void setOnFitSystemWindowsListener(final OnFitSystemWindowsListener mListener) {
        this.mListener = mListener;
    }
}
