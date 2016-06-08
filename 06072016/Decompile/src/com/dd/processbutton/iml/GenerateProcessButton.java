package com.dd.processbutton.iml;

import com.dd.processbutton.*;
import android.content.*;
import android.util.*;
import android.graphics.*;

public class GenerateProcessButton extends ProcessButton
{
    public GenerateProcessButton(final Context context) {
        super(context);
    }
    
    public GenerateProcessButton(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    public GenerateProcessButton(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
    }
    
    @Override
    public void drawProgress(final Canvas canvas) {
        this.getProgressDrawable().setBounds(0, 0, this.getMeasuredWidth(), (int)(this.getMeasuredHeight() * (this.getProgress() / this.getMaxProgress())));
        this.getProgressDrawable().draw(canvas);
    }
}
