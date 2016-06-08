package android.support.v7.app;

import android.content.*;
import android.view.*;
import android.util.*;

class AppCompatDelegateImplV11 extends AppCompatDelegateImplV7
{
    AppCompatDelegateImplV11(final Context context, final Window window, final AppCompatCallback appCompatCallback) {
        super(context, window, appCompatCallback);
    }
    
    @Override
    View callActivityOnCreateView(final View view, final String s, final Context context, final AttributeSet set) {
        return null;
    }
}
