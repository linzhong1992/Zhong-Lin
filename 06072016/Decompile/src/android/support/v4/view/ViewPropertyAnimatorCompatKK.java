package android.support.v4.view;

import android.view.*;
import android.animation.*;

class ViewPropertyAnimatorCompatKK
{
    public static void setUpdateListener(final View view, final ViewPropertyAnimatorUpdateListener viewPropertyAnimatorUpdateListener) {
        view.animate().setUpdateListener((ValueAnimator$AnimatorUpdateListener)new ValueAnimator$AnimatorUpdateListener() {
            public void onAnimationUpdate(final ValueAnimator valueAnimator) {
                viewPropertyAnimatorUpdateListener.onAnimationUpdate(view);
            }
        });
    }
}
