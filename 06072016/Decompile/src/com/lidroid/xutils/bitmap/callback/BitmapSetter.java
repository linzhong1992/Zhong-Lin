package com.lidroid.xutils.bitmap.callback;

import android.view.*;
import android.graphics.drawable.*;
import android.graphics.*;

public interface BitmapSetter<T extends View>
{
    Drawable getDrawable(final T p0);
    
    void setBitmap(final T p0, final Bitmap p1);
    
    void setDrawable(final T p0, final Drawable p1);
}
