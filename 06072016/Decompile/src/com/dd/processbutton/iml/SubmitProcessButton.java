package com.dd.processbutton.iml;

import com.dd.processbutton.*;
import android.content.*;
import android.util.*;
import android.graphics.*;

public class SubmitProcessButton extends ProcessButton
{
    public SubmitProcessButton(final Context context) {
        super(context);
    }
    
    public SubmitProcessButton(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    public SubmitProcessButton(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
    }
    
    @Override
    public void drawProgress(final Canvas canvas) {
        this.getProgressDrawable().setBounds(0, 0, (int)(this.getMeasuredWidth() * (this.getProgress() / this.getMaxProgress())), this.getMeasuredHeight());
        this.getProgressDrawable().draw(canvas);
    }
}
