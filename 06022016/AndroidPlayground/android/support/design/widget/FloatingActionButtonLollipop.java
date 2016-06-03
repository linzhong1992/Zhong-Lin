package android.support.design.widget;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.StateListAnimator;
import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;

@TargetApi(21)
class FloatingActionButtonLollipop
  extends FloatingActionButtonHoneycombMr1
{
  private Drawable mBorderDrawable;
  private Interpolator mInterpolator;
  private RippleDrawable mRippleDrawable;
  private Drawable mShapeDrawable;
  
  FloatingActionButtonLollipop(View paramView, ShadowViewDelegate paramShadowViewDelegate)
  {
    super(paramView, paramShadowViewDelegate);
    if (!paramView.isInEditMode()) {
      this.mInterpolator = AnimationUtils.loadInterpolator(this.mView.getContext(), 17563661);
    }
  }
  
  private Animator setupAnimator(Animator paramAnimator)
  {
    paramAnimator.setInterpolator(this.mInterpolator);
    return paramAnimator;
  }
  
  void jumpDrawableToCurrentState() {}
  
  CircularBorderDrawable newCircularDrawable()
  {
    return new CircularBorderDrawableLollipop();
  }
  
  void onDrawableStateChanged(int[] paramArrayOfInt) {}
  
  void setBackgroundDrawable(Drawable paramDrawable, ColorStateList paramColorStateList, PorterDuff.Mode paramMode, int paramInt1, int paramInt2)
  {
    this.mShapeDrawable = DrawableCompat.wrap(paramDrawable.mutate());
    DrawableCompat.setTintList(this.mShapeDrawable, paramColorStateList);
    if (paramMode != null) {
      DrawableCompat.setTintMode(this.mShapeDrawable, paramMode);
    }
    if (paramInt2 > 0) {
      this.mBorderDrawable = createBorderDrawable(paramInt2, paramColorStateList);
    }
    for (paramDrawable = new LayerDrawable(new Drawable[] { this.mBorderDrawable, this.mShapeDrawable });; paramDrawable = this.mShapeDrawable)
    {
      this.mRippleDrawable = new RippleDrawable(ColorStateList.valueOf(paramInt1), paramDrawable, null);
      this.mShadowViewDelegate.setBackgroundDrawable(this.mRippleDrawable);
      this.mShadowViewDelegate.setShadowPadding(0, 0, 0, 0);
      return;
      this.mBorderDrawable = null;
    }
  }
  
  void setBackgroundTintList(ColorStateList paramColorStateList)
  {
    DrawableCompat.setTintList(this.mShapeDrawable, paramColorStateList);
    if (this.mBorderDrawable != null) {
      DrawableCompat.setTintList(this.mBorderDrawable, paramColorStateList);
    }
  }
  
  void setBackgroundTintMode(PorterDuff.Mode paramMode)
  {
    DrawableCompat.setTintMode(this.mShapeDrawable, paramMode);
  }
  
  public void setElevation(float paramFloat)
  {
    ViewCompat.setElevation(this.mView, paramFloat);
  }
  
  void setPressedTranslationZ(float paramFloat)
  {
    StateListAnimator localStateListAnimator = new StateListAnimator();
    localStateListAnimator.addState(PRESSED_ENABLED_STATE_SET, setupAnimator(ObjectAnimator.ofFloat(this.mView, "translationZ", new float[] { paramFloat })));
    localStateListAnimator.addState(FOCUSED_ENABLED_STATE_SET, setupAnimator(ObjectAnimator.ofFloat(this.mView, "translationZ", new float[] { paramFloat })));
    localStateListAnimator.addState(EMPTY_STATE_SET, setupAnimator(ObjectAnimator.ofFloat(this.mView, "translationZ", new float[] { 0.0F })));
    this.mView.setStateListAnimator(localStateListAnimator);
  }
  
  void setRippleColor(int paramInt)
  {
    this.mRippleDrawable.setColor(ColorStateList.valueOf(paramInt));
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\design\widget\FloatingActionButtonLollipop.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */