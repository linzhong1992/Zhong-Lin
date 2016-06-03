package com.dd.processbutton.iml;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import com.dd.processbutton.ProcessButton;

public class SubmitProcessButton
  extends ProcessButton
{
  public SubmitProcessButton(Context paramContext)
  {
    super(paramContext);
  }
  
  public SubmitProcessButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public SubmitProcessButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public void drawProgress(Canvas paramCanvas)
  {
    float f1 = getProgress() / getMaxProgress();
    float f2 = getMeasuredWidth();
    getProgressDrawable().setBounds(0, 0, (int)(f2 * f1), getMeasuredHeight());
    getProgressDrawable().draw(paramCanvas);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\dd\processbutton\iml\SubmitProcessButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */