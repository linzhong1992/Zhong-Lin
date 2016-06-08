package com.dd.processbutton;

import android.content.*;
import android.util.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.view.*;
import android.os.*;
import android.content.res.*;

public abstract class ProcessButton extends FlatButton
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
    
    public ProcessButton(final Context context) {
        super(context);
        this.init(context, null);
    }
    
    public ProcessButton(final Context context, final AttributeSet set) {
        super(context, set);
        this.init(context, set);
    }
    
    public ProcessButton(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.init(context, set);
    }
    
    private void init(final Context context, final AttributeSet set) {
        this.mMinProgress = 0;
        this.mMaxProgress = 100;
        (this.mProgressDrawable = (GradientDrawable)this.getDrawable(R.drawable.rect_progress).mutate()).setCornerRadius(this.getCornerRadius());
        (this.mCompleteDrawable = (GradientDrawable)this.getDrawable(R.drawable.rect_complete).mutate()).setCornerRadius(this.getCornerRadius());
        (this.mErrorDrawable = (GradientDrawable)this.getDrawable(R.drawable.rect_error).mutate()).setCornerRadius(this.getCornerRadius());
        if (set != null) {
            this.initAttributes(context, set);
        }
    }
    
    private void initAttributes(Context typedArray, final AttributeSet set) {
        typedArray = (Context)this.getTypedArray(typedArray, set, R.styleable.ProcessButton);
        if (typedArray == null) {
            return;
        }
        try {
            this.mLoadingText = ((TypedArray)typedArray).getString(R.styleable.ProcessButton_pb_textProgress);
            this.mCompleteText = ((TypedArray)typedArray).getString(R.styleable.ProcessButton_pb_textComplete);
            this.mErrorText = ((TypedArray)typedArray).getString(R.styleable.ProcessButton_pb_textError);
            this.mProgressDrawable.setColor(((TypedArray)typedArray).getColor(R.styleable.ProcessButton_pb_colorProgress, this.getColor(R.color.purple_progress)));
            this.mCompleteDrawable.setColor(((TypedArray)typedArray).getColor(R.styleable.ProcessButton_pb_colorComplete, this.getColor(R.color.green_complete)));
            this.mErrorDrawable.setColor(((TypedArray)typedArray).getColor(R.styleable.ProcessButton_pb_colorError, this.getColor(R.color.red_error)));
        }
        finally {
            ((TypedArray)typedArray).recycle();
        }
    }
    
    public abstract void drawProgress(final Canvas p0);
    
    public GradientDrawable getCompleteDrawable() {
        return this.mCompleteDrawable;
    }
    
    public CharSequence getCompleteText() {
        return this.mCompleteText;
    }
    
    public GradientDrawable getErrorDrawable() {
        return this.mErrorDrawable;
    }
    
    public CharSequence getErrorText() {
        return this.mErrorText;
    }
    
    public CharSequence getLoadingText() {
        return this.mLoadingText;
    }
    
    public int getMaxProgress() {
        return this.mMaxProgress;
    }
    
    public int getMinProgress() {
        return this.mMinProgress;
    }
    
    public int getProgress() {
        return this.mProgress;
    }
    
    public GradientDrawable getProgressDrawable() {
        return this.mProgressDrawable;
    }
    
    protected void onCompleteState() {
        if (this.getCompleteText() != null) {
            this.setText(this.getCompleteText());
        }
        this.setBackgroundCompat((Drawable)this.getCompleteDrawable());
    }
    
    protected void onDraw(final Canvas canvas) {
        if (this.mProgress > this.mMinProgress && this.mProgress < this.mMaxProgress) {
            this.drawProgress(canvas);
        }
        super.onDraw(canvas);
    }
    
    protected void onErrorState() {
        if (this.getErrorText() != null) {
            this.setText(this.getErrorText());
        }
        this.setBackgroundCompat((Drawable)this.getErrorDrawable());
    }
    
    protected void onNormalState() {
        if (this.getNormalText() != null) {
            this.setText(this.getNormalText());
        }
        this.setBackgroundCompat((Drawable)this.getNormalDrawable());
    }
    
    protected void onProgress() {
        if (this.getLoadingText() != null) {
            this.setText(this.getLoadingText());
        }
        this.setBackgroundCompat((Drawable)this.getProgressDrawable());
    }
    
    public void onRestoreInstanceState(final Parcelable parcelable) {
        if (parcelable instanceof SavedState) {
            final SavedState savedState = (SavedState)parcelable;
            this.mProgress = savedState.mProgress;
            super.onRestoreInstanceState(savedState.getSuperState());
            this.setProgress(this.mProgress);
            return;
        }
        super.onRestoreInstanceState(parcelable);
    }
    
    public Parcelable onSaveInstanceState() {
        final SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.mProgress = this.mProgress;
        return (Parcelable)savedState;
    }
    
    public void setCompleteDrawable(final GradientDrawable mCompleteDrawable) {
        this.mCompleteDrawable = mCompleteDrawable;
    }
    
    public void setCompleteText(final CharSequence mCompleteText) {
        this.mCompleteText = mCompleteText;
    }
    
    public void setErrorDrawable(final GradientDrawable mErrorDrawable) {
        this.mErrorDrawable = mErrorDrawable;
    }
    
    public void setErrorText(final CharSequence mErrorText) {
        this.mErrorText = mErrorText;
    }
    
    public void setLoadingText(final CharSequence mLoadingText) {
        this.mLoadingText = mLoadingText;
    }
    
    @Override
    public void setNormalText(final CharSequence charSequence) {
        super.setNormalText(charSequence);
        if (this.mProgress == this.mMinProgress) {
            this.setText(charSequence);
        }
    }
    
    public void setProgress(final int mProgress) {
        this.mProgress = mProgress;
        if (this.mProgress == this.mMinProgress) {
            this.onNormalState();
        }
        else if (this.mProgress == this.mMaxProgress) {
            this.onCompleteState();
        }
        else if (this.mProgress < this.mMinProgress) {
            this.onErrorState();
        }
        else {
            this.onProgress();
        }
        this.invalidate();
    }
    
    public void setProgressDrawable(final GradientDrawable mProgressDrawable) {
        this.mProgressDrawable = mProgressDrawable;
    }
    
    public static class SavedState extends View$BaseSavedState
    {
        public static final Parcelable$Creator<SavedState> CREATOR;
        private int mProgress;
        
        static {
            CREATOR = (Parcelable$Creator)new Parcelable$Creator<SavedState>() {
                public SavedState createFromParcel(final Parcel parcel) {
                    return new SavedState(parcel);
                }
                
                public SavedState[] newArray(final int n) {
                    return new SavedState[n];
                }
            };
        }
        
        private SavedState(final Parcel parcel) {
            super(parcel);
            this.mProgress = parcel.readInt();
        }
        
        public SavedState(final Parcelable parcelable) {
            super(parcelable);
        }
        
        public void writeToParcel(final Parcel parcel, final int n) {
            super.writeToParcel(parcel, n);
            parcel.writeInt(this.mProgress);
        }
    }
}
