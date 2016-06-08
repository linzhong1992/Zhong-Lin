package android.support.v7.widget;

import android.widget.*;
import android.support.v4.view.*;
import android.content.*;
import android.util.*;
import android.support.v7.internal.widget.*;
import android.view.*;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.support.annotation.*;

public class AppCompatImageView extends ImageView implements TintableBackgroundView
{
    private AppCompatBackgroundHelper mBackgroundTintHelper;
    private AppCompatImageHelper mImageHelper;
    
    public AppCompatImageView(final Context context) {
        this(context, null);
    }
    
    public AppCompatImageView(final Context context, final AttributeSet set) {
        this(context, set, 0);
    }
    
    public AppCompatImageView(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        final TintManager value = TintManager.get(context);
        (this.mBackgroundTintHelper = new AppCompatBackgroundHelper((View)this, value)).loadFromAttributes(set, n);
        (this.mImageHelper = new AppCompatImageHelper(this, value)).loadFromAttributes(set, n);
    }
    
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.applySupportBackgroundTint();
        }
    }
    
    @Nullable
    public ColorStateList getSupportBackgroundTintList() {
        if (this.mBackgroundTintHelper != null) {
            return this.mBackgroundTintHelper.getSupportBackgroundTintList();
        }
        return null;
    }
    
    @Nullable
    public PorterDuff$Mode getSupportBackgroundTintMode() {
        if (this.mBackgroundTintHelper != null) {
            return this.mBackgroundTintHelper.getSupportBackgroundTintMode();
        }
        return null;
    }
    
    public void setBackgroundDrawable(final Drawable backgroundDrawable) {
        super.setBackgroundDrawable(backgroundDrawable);
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.onSetBackgroundDrawable(backgroundDrawable);
        }
    }
    
    public void setBackgroundResource(@DrawableRes final int backgroundResource) {
        super.setBackgroundResource(backgroundResource);
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.onSetBackgroundResource(backgroundResource);
        }
    }
    
    public void setImageResource(@DrawableRes final int imageResource) {
        this.mImageHelper.setImageResource(imageResource);
    }
    
    public void setSupportBackgroundTintList(@Nullable final ColorStateList supportBackgroundTintList) {
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.setSupportBackgroundTintList(supportBackgroundTintList);
        }
    }
    
    public void setSupportBackgroundTintMode(@Nullable final PorterDuff$Mode supportBackgroundTintMode) {
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.setSupportBackgroundTintMode(supportBackgroundTintMode);
        }
    }
}
