package com.lidroid.xutils.bitmap.callback;

import android.view.*;
import android.view.animation.*;
import java.lang.reflect.*;
import android.graphics.*;
import com.lidroid.xutils.bitmap.*;
import android.graphics.drawable.*;

public class DefaultBitmapLoadCallBack<T extends View> extends BitmapLoadCallBack<T>
{
    private void animationDisplay(final T t, final Animation animation) {
        try {
            final Method declaredMethod = Animation.class.getDeclaredMethod("clone", (Class<?>[])new Class[0]);
            declaredMethod.setAccessible(true);
            t.startAnimation((Animation)declaredMethod.invoke(animation, new Object[0]));
        }
        catch (Throwable t2) {
            t.startAnimation(animation);
        }
    }
    
    @Override
    public void onLoadCompleted(final T t, final String s, final Bitmap bitmap, final BitmapDisplayConfig bitmapDisplayConfig, final BitmapLoadFrom bitmapLoadFrom) {
        this.setBitmap(t, bitmap);
        final Animation animation = bitmapDisplayConfig.getAnimation();
        if (animation != null) {
            this.animationDisplay(t, animation);
        }
    }
    
    @Override
    public void onLoadFailed(final T t, final String s, final Drawable drawable) {
        this.setDrawable(t, drawable);
    }
}
