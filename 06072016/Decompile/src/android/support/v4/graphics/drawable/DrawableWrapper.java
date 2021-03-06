package android.support.v4.graphics.drawable;

import android.graphics.drawable.*;
import android.content.res.*;
import android.graphics.*;

public interface DrawableWrapper
{
    Drawable getWrappedDrawable();
    
    void setTint(final int p0);
    
    void setTintList(final ColorStateList p0);
    
    void setTintMode(final PorterDuff$Mode p0);
    
    void setWrappedDrawable(final Drawable p0);
}
