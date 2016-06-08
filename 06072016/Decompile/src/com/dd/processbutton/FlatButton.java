package com.dd.processbutton;

import android.widget.*;
import android.content.*;
import android.util.*;
import android.content.res.*;
import android.graphics.drawable.*;
import android.os.*;
import android.annotation.*;

public class FlatButton extends Button
{
    private float cornerRadius;
    private StateListDrawable mNormalDrawable;
    private CharSequence mNormalText;
    
    public FlatButton(final Context context) {
        super(context);
        this.init(context, null);
    }
    
    public FlatButton(final Context context, final AttributeSet set) {
        super(context, set);
        this.init(context, set);
    }
    
    public FlatButton(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.init(context, set);
    }
    
    private LayerDrawable createNormalDrawable(final TypedArray typedArray) {
        final LayerDrawable layerDrawable = (LayerDrawable)this.getDrawable(R.drawable.rect_normal).mutate();
        final GradientDrawable gradientDrawable = (GradientDrawable)layerDrawable.getDrawable(0).mutate();
        gradientDrawable.setCornerRadius(this.getCornerRadius());
        gradientDrawable.setColor(typedArray.getColor(R.styleable.FlatButton_pb_colorPressed, this.getColor(R.color.blue_pressed)));
        final GradientDrawable gradientDrawable2 = (GradientDrawable)layerDrawable.getDrawable(1).mutate();
        gradientDrawable2.setCornerRadius(this.getCornerRadius());
        gradientDrawable2.setColor(typedArray.getColor(R.styleable.FlatButton_pb_colorNormal, this.getColor(R.color.blue_normal)));
        return layerDrawable;
    }
    
    private Drawable createPressedDrawable(final TypedArray typedArray) {
        final GradientDrawable gradientDrawable = (GradientDrawable)this.getDrawable(R.drawable.rect_pressed).mutate();
        gradientDrawable.setCornerRadius(this.getCornerRadius());
        gradientDrawable.setColor(typedArray.getColor(R.styleable.FlatButton_pb_colorPressed, this.getColor(R.color.blue_pressed)));
        return (Drawable)gradientDrawable;
    }
    
    private void init(final Context context, final AttributeSet set) {
        this.mNormalDrawable = new StateListDrawable();
        if (set != null) {
            this.initAttributes(context, set);
        }
        this.mNormalText = this.getText().toString();
        this.setBackgroundCompat((Drawable)this.mNormalDrawable);
    }
    
    private void initAttributes(Context typedArray, final AttributeSet set) {
        typedArray = (Context)this.getTypedArray(typedArray, set, R.styleable.FlatButton);
        if (typedArray == null) {
            return;
        }
        try {
            this.cornerRadius = ((TypedArray)typedArray).getDimension(R.styleable.FlatButton_pb_cornerRadius, this.getDimension(R.dimen.corner_radius));
            this.mNormalDrawable.addState(new int[] { 16842919 }, this.createPressedDrawable((TypedArray)typedArray));
            this.mNormalDrawable.addState(new int[] { 16842908 }, this.createPressedDrawable((TypedArray)typedArray));
            this.mNormalDrawable.addState(new int[] { 16842913 }, this.createPressedDrawable((TypedArray)typedArray));
            this.mNormalDrawable.addState(new int[0], (Drawable)this.createNormalDrawable((TypedArray)typedArray));
        }
        finally {
            ((TypedArray)typedArray).recycle();
        }
    }
    
    protected int getColor(final int n) {
        return this.getResources().getColor(n);
    }
    
    public float getCornerRadius() {
        return this.cornerRadius;
    }
    
    protected float getDimension(final int n) {
        return this.getResources().getDimension(n);
    }
    
    protected Drawable getDrawable(final int n) {
        return this.getResources().getDrawable(n);
    }
    
    public StateListDrawable getNormalDrawable() {
        return this.mNormalDrawable;
    }
    
    public CharSequence getNormalText() {
        return this.mNormalText;
    }
    
    protected TypedArray getTypedArray(final Context context, final AttributeSet set, final int[] array) {
        return context.obtainStyledAttributes(set, array, 0, 0);
    }
    
    @SuppressLint({ "NewApi" })
    public void setBackgroundCompat(final Drawable drawable) {
        final int paddingLeft = this.getPaddingLeft();
        final int paddingTop = this.getPaddingTop();
        final int paddingRight = this.getPaddingRight();
        final int paddingBottom = this.getPaddingBottom();
        if (Build$VERSION.SDK_INT >= 16) {
            this.setBackground(drawable);
        }
        else {
            this.setBackgroundDrawable(drawable);
        }
        this.setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
    }
    
    public void setNormalText(final CharSequence mNormalText) {
        this.mNormalText = mNormalText;
    }
}
