package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.v7.internal.widget.TintInfo;
import android.support.v7.internal.widget.TintManager;
import android.util.AttributeSet;
import android.widget.TextView;

class AppCompatTextHelperV17
  extends AppCompatTextHelper
{
  private static final int[] VIEW_ATTRS_v17 = { 16843666, 16843667 };
  private TintInfo mDrawableEndTint;
  private TintInfo mDrawableStartTint;
  
  AppCompatTextHelperV17(TextView paramTextView)
  {
    super(paramTextView);
  }
  
  void applyCompoundDrawablesTints()
  {
    super.applyCompoundDrawablesTints();
    if ((this.mDrawableStartTint != null) || (this.mDrawableEndTint != null))
    {
      Drawable[] arrayOfDrawable = this.mView.getCompoundDrawablesRelative();
      applyCompoundDrawableTint(arrayOfDrawable[0], this.mDrawableStartTint);
      applyCompoundDrawableTint(arrayOfDrawable[2], this.mDrawableEndTint);
    }
  }
  
  void loadFromAttributes(AttributeSet paramAttributeSet, int paramInt)
  {
    super.loadFromAttributes(paramAttributeSet, paramInt);
    Context localContext = this.mView.getContext();
    TintManager localTintManager = TintManager.get(localContext);
    paramAttributeSet = localContext.obtainStyledAttributes(paramAttributeSet, VIEW_ATTRS_v17, paramInt, 0);
    if (paramAttributeSet.hasValue(0))
    {
      this.mDrawableStartTint = new TintInfo();
      this.mDrawableStartTint.mHasTintList = true;
      this.mDrawableStartTint.mTintList = localTintManager.getTintList(paramAttributeSet.getResourceId(0, 0));
    }
    if (paramAttributeSet.hasValue(1))
    {
      this.mDrawableEndTint = new TintInfo();
      this.mDrawableEndTint.mHasTintList = true;
      this.mDrawableEndTint.mTintList = localTintManager.getTintList(paramAttributeSet.getResourceId(1, 0));
    }
    paramAttributeSet.recycle();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\v7\widget\AppCompatTextHelperV17.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */