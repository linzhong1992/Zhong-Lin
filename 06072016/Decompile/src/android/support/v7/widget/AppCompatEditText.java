package android.support.v7.widget;

import android.support.v4.view.*;
import android.content.*;
import android.util.*;
import android.support.v7.appcompat.*;
import android.support.v7.internal.widget.*;
import android.view.*;
import android.widget.*;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.support.annotation.*;

public class AppCompatEditText extends EditText implements TintableBackgroundView
{
    private AppCompatBackgroundHelper mBackgroundTintHelper;
    private AppCompatTextHelper mTextHelper;
    private TintManager mTintManager;
    
    public AppCompatEditText(final Context context) {
        this(context, null);
    }
    
    public AppCompatEditText(final Context context, final AttributeSet set) {
        this(context, set, R.attr.editTextStyle);
    }
    
    public AppCompatEditText(final Context context, final AttributeSet set, final int n) {
        super(TintContextWrapper.wrap(context), set, n);
        this.mTintManager = TintManager.get(this.getContext());
        (this.mBackgroundTintHelper = new AppCompatBackgroundHelper((View)this, this.mTintManager)).loadFromAttributes(set, n);
        (this.mTextHelper = AppCompatTextHelper.create((TextView)this)).loadFromAttributes(set, n);
        this.mTextHelper.applyCompoundDrawablesTints();
    }
    
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.applySupportBackgroundTint();
        }
        if (this.mTextHelper != null) {
            this.mTextHelper.applyCompoundDrawablesTints();
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
    
    public void setTextAppearance(final Context context, final int n) {
        super.setTextAppearance(context, n);
        if (this.mTextHelper != null) {
            this.mTextHelper.onSetTextAppearance(context, n);
        }
    }
}
