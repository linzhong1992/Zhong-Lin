package com.dd.processbutton;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.widget.Button;

public class FlatButton
  extends Button
{
  private float cornerRadius;
  private StateListDrawable mNormalDrawable;
  private CharSequence mNormalText;
  
  public FlatButton(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null);
  }
  
  public FlatButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  public FlatButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  private LayerDrawable createNormalDrawable(TypedArray paramTypedArray)
  {
    LayerDrawable localLayerDrawable = (LayerDrawable)getDrawable(R.drawable.rect_normal).mutate();
    GradientDrawable localGradientDrawable = (GradientDrawable)localLayerDrawable.getDrawable(0).mutate();
    localGradientDrawable.setCornerRadius(getCornerRadius());
    int i = getColor(R.color.blue_pressed);
    localGradientDrawable.setColor(paramTypedArray.getColor(R.styleable.FlatButton_pb_colorPressed, i));
    localGradientDrawable = (GradientDrawable)localLayerDrawable.getDrawable(1).mutate();
    localGradientDrawable.setCornerRadius(getCornerRadius());
    i = getColor(R.color.blue_normal);
    localGradientDrawable.setColor(paramTypedArray.getColor(R.styleable.FlatButton_pb_colorNormal, i));
    return localLayerDrawable;
  }
  
  private Drawable createPressedDrawable(TypedArray paramTypedArray)
  {
    GradientDrawable localGradientDrawable = (GradientDrawable)getDrawable(R.drawable.rect_pressed).mutate();
    localGradientDrawable.setCornerRadius(getCornerRadius());
    int i = getColor(R.color.blue_pressed);
    localGradientDrawable.setColor(paramTypedArray.getColor(R.styleable.FlatButton_pb_colorPressed, i));
    return localGradientDrawable;
  }
  
  private void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    this.mNormalDrawable = new StateListDrawable();
    if (paramAttributeSet != null) {
      initAttributes(paramContext, paramAttributeSet);
    }
    this.mNormalText = getText().toString();
    setBackgroundCompat(this.mNormalDrawable);
  }
  
  private void initAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    paramContext = getTypedArray(paramContext, paramAttributeSet, R.styleable.FlatButton);
    if (paramContext == null) {
      return;
    }
    try
    {
      float f = getDimension(R.dimen.corner_radius);
      this.cornerRadius = paramContext.getDimension(R.styleable.FlatButton_pb_cornerRadius, f);
      paramAttributeSet = this.mNormalDrawable;
      Object localObject = createPressedDrawable(paramContext);
      paramAttributeSet.addState(new int[] { 16842919 }, (Drawable)localObject);
      paramAttributeSet = this.mNormalDrawable;
      localObject = createPressedDrawable(paramContext);
      paramAttributeSet.addState(new int[] { 16842908 }, (Drawable)localObject);
      paramAttributeSet = this.mNormalDrawable;
      localObject = createPressedDrawable(paramContext);
      paramAttributeSet.addState(new int[] { 16842913 }, (Drawable)localObject);
      paramAttributeSet = this.mNormalDrawable;
      localObject = createNormalDrawable(paramContext);
      paramAttributeSet.addState(new int[0], (Drawable)localObject);
      return;
    }
    finally
    {
      paramContext.recycle();
    }
  }
  
  protected int getColor(int paramInt)
  {
    return getResources().getColor(paramInt);
  }
  
  public float getCornerRadius()
  {
    return this.cornerRadius;
  }
  
  protected float getDimension(int paramInt)
  {
    return getResources().getDimension(paramInt);
  }
  
  protected Drawable getDrawable(int paramInt)
  {
    return getResources().getDrawable(paramInt);
  }
  
  public StateListDrawable getNormalDrawable()
  {
    return this.mNormalDrawable;
  }
  
  public CharSequence getNormalText()
  {
    return this.mNormalText;
  }
  
  protected TypedArray getTypedArray(Context paramContext, AttributeSet paramAttributeSet, int[] paramArrayOfInt)
  {
    return paramContext.obtainStyledAttributes(paramAttributeSet, paramArrayOfInt, 0, 0);
  }
  
  @SuppressLint({"NewApi"})
  public void setBackgroundCompat(Drawable paramDrawable)
  {
    int i = getPaddingLeft();
    int j = getPaddingTop();
    int k = getPaddingRight();
    int m = getPaddingBottom();
    if (Build.VERSION.SDK_INT >= 16) {
      setBackground(paramDrawable);
    }
    for (;;)
    {
      setPadding(i, j, k, m);
      return;
      setBackgroundDrawable(paramDrawable);
    }
  }
  
  public void setNormalText(CharSequence paramCharSequence)
  {
    this.mNormalText = paramCharSequence;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\dd\processbutton\FlatButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */