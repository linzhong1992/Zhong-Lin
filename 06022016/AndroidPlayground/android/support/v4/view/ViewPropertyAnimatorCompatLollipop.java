package android.support.v4.view;

import android.view.View;
import android.view.ViewPropertyAnimator;

class ViewPropertyAnimatorCompatLollipop
{
  public static void translationZ(View paramView, float paramFloat)
  {
    paramView.animate().translationZ(paramFloat);
  }
  
  public static void translationZBy(View paramView, float paramFloat)
  {
    paramView.animate().translationZBy(paramFloat);
  }
  
  public static void z(View paramView, float paramFloat)
  {
    paramView.animate().z(paramFloat);
  }
  
  public static void zBy(View paramView, float paramFloat)
  {
    paramView.animate().zBy(paramFloat);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\v4\view\ViewPropertyAnimatorCompatLollipop.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */