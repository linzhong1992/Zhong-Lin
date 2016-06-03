package com.dd.processbutton;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.View.BaseSavedState;

public abstract class ProcessButton
  extends FlatButton
{
  private GradientDrawable mCompleteDrawable;
  private CharSequence mCompleteText;
  private GradientDrawable mErrorDrawable;
  private CharSequence mErrorText;
  private CharSequence mLoadingText;
  private int mMaxProgress;
  private int mMinProgress;
  private int mProgress;
  private GradientDrawable mProgressDrawable;
  
  public ProcessButton(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null);
  }
  
  public ProcessButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  public ProcessButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  private void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    this.mMinProgress = 0;
    this.mMaxProgress = 100;
    this.mProgressDrawable = ((GradientDrawable)getDrawable(R.drawable.rect_progress).mutate());
    this.mProgressDrawable.setCornerRadius(getCornerRadius());
    this.mCompleteDrawable = ((GradientDrawable)getDrawable(R.drawable.rect_complete).mutate());
    this.mCompleteDrawable.setCornerRadius(getCornerRadius());
    this.mErrorDrawable = ((GradientDrawable)getDrawable(R.drawable.rect_error).mutate());
    this.mErrorDrawable.setCornerRadius(getCornerRadius());
    if (paramAttributeSet != null) {
      initAttributes(paramContext, paramAttributeSet);
    }
  }
  
  private void initAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    paramContext = getTypedArray(paramContext, paramAttributeSet, R.styleable.ProcessButton);
    if (paramContext == null) {
      return;
    }
    try
    {
      this.mLoadingText = paramContext.getString(R.styleable.ProcessButton_pb_textProgress);
      this.mCompleteText = paramContext.getString(R.styleable.ProcessButton_pb_textComplete);
      this.mErrorText = paramContext.getString(R.styleable.ProcessButton_pb_textError);
      int i = getColor(R.color.purple_progress);
      i = paramContext.getColor(R.styleable.ProcessButton_pb_colorProgress, i);
      this.mProgressDrawable.setColor(i);
      i = getColor(R.color.green_complete);
      i = paramContext.getColor(R.styleable.ProcessButton_pb_colorComplete, i);
      this.mCompleteDrawable.setColor(i);
      i = getColor(R.color.red_error);
      i = paramContext.getColor(R.styleable.ProcessButton_pb_colorError, i);
      this.mErrorDrawable.setColor(i);
      return;
    }
    finally
    {
      paramContext.recycle();
    }
  }
  
  public abstract void drawProgress(Canvas paramCanvas);
  
  public GradientDrawable getCompleteDrawable()
  {
    return this.mCompleteDrawable;
  }
  
  public CharSequence getCompleteText()
  {
    return this.mCompleteText;
  }
  
  public GradientDrawable getErrorDrawable()
  {
    return this.mErrorDrawable;
  }
  
  public CharSequence getErrorText()
  {
    return this.mErrorText;
  }
  
  public CharSequence getLoadingText()
  {
    return this.mLoadingText;
  }
  
  public int getMaxProgress()
  {
    return this.mMaxProgress;
  }
  
  public int getMinProgress()
  {
    return this.mMinProgress;
  }
  
  public int getProgress()
  {
    return this.mProgress;
  }
  
  public GradientDrawable getProgressDrawable()
  {
    return this.mProgressDrawable;
  }
  
  protected void onCompleteState()
  {
    if (getCompleteText() != null) {
      setText(getCompleteText());
    }
    setBackgroundCompat(getCompleteDrawable());
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if ((this.mProgress > this.mMinProgress) && (this.mProgress < this.mMaxProgress)) {
      drawProgress(paramCanvas);
    }
    super.onDraw(paramCanvas);
  }
  
  protected void onErrorState()
  {
    if (getErrorText() != null) {
      setText(getErrorText());
    }
    setBackgroundCompat(getErrorDrawable());
  }
  
  protected void onNormalState()
  {
    if (getNormalText() != null) {
      setText(getNormalText());
    }
    setBackgroundCompat(getNormalDrawable());
  }
  
  protected void onProgress()
  {
    if (getLoadingText() != null) {
      setText(getLoadingText());
    }
    setBackgroundCompat(getProgressDrawable());
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if ((paramParcelable instanceof SavedState))
    {
      paramParcelable = (SavedState)paramParcelable;
      this.mProgress = paramParcelable.mProgress;
      super.onRestoreInstanceState(paramParcelable.getSuperState());
      setProgress(this.mProgress);
      return;
    }
    super.onRestoreInstanceState(paramParcelable);
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    SavedState.access$002(localSavedState, this.mProgress);
    return localSavedState;
  }
  
  public void setCompleteDrawable(GradientDrawable paramGradientDrawable)
  {
    this.mCompleteDrawable = paramGradientDrawable;
  }
  
  public void setCompleteText(CharSequence paramCharSequence)
  {
    this.mCompleteText = paramCharSequence;
  }
  
  public void setErrorDrawable(GradientDrawable paramGradientDrawable)
  {
    this.mErrorDrawable = paramGradientDrawable;
  }
  
  public void setErrorText(CharSequence paramCharSequence)
  {
    this.mErrorText = paramCharSequence;
  }
  
  public void setLoadingText(CharSequence paramCharSequence)
  {
    this.mLoadingText = paramCharSequence;
  }
  
  public void setNormalText(CharSequence paramCharSequence)
  {
    super.setNormalText(paramCharSequence);
    if (this.mProgress == this.mMinProgress) {
      setText(paramCharSequence);
    }
  }
  
  public void setProgress(int paramInt)
  {
    this.mProgress = paramInt;
    if (this.mProgress == this.mMinProgress) {
      onNormalState();
    }
    for (;;)
    {
      invalidate();
      return;
      if (this.mProgress == this.mMaxProgress) {
        onCompleteState();
      } else if (this.mProgress < this.mMinProgress) {
        onErrorState();
      } else {
        onProgress();
      }
    }
  }
  
  public void setProgressDrawable(GradientDrawable paramGradientDrawable)
  {
    this.mProgressDrawable = paramGradientDrawable;
  }
  
  public static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public ProcessButton.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new ProcessButton.SavedState(paramAnonymousParcel, null);
      }
      
      public ProcessButton.SavedState[] newArray(int paramAnonymousInt)
      {
        return new ProcessButton.SavedState[paramAnonymousInt];
      }
    };
    private int mProgress;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      this.mProgress = paramParcel.readInt();
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(this.mProgress);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\dd\processbutton\ProcessButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */