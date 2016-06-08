package android.support.design.widget;

import android.view.*;
import android.support.v4.view.*;

class CoordinatorLayoutInsetsHelperLollipop implements CoordinatorLayoutInsetsHelper
{
    @Override
    public void setupForWindowInsets(final View view, final OnApplyWindowInsetsListener onApplyWindowInsetsListener) {
        if (ViewCompat.getFitsSystemWindows(view)) {
            ViewCompat.setOnApplyWindowInsetsListener(view, onApplyWindowInsetsListener);
            view.setSystemUiVisibility(1280);
        }
    }
}
