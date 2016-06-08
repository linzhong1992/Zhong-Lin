package android.support.v7.widget;

import android.support.v4.widget.*;
import android.support.v7.internal.widget.*;
import android.content.*;
import android.util.*;
import android.support.v7.appcompat.*;
import android.widget.*;
import android.content.res.*;
import android.graphics.*;
import android.support.annotation.*;
import android.support.v4.content.*;
import android.graphics.drawable.*;

public class AppCompatRadioButton extends RadioButton implements TintableCompoundButton
{
    private AppCompatCompoundButtonHelper mCompoundButtonHelper;
    private TintManager mTintManager;
    
    public AppCompatRadioButton(final Context context) {
        this(context, null);
    }
    
    public AppCompatRadioButton(final Context context, final AttributeSet set) {
        this(context, set, R.attr.radioButtonStyle);
    }
    
    public AppCompatRadioButton(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
        this.mTintManager = TintManager.get(context);
        (this.mCompoundButtonHelper = new AppCompatCompoundButtonHelper((CompoundButton)this, this.mTintManager)).loadFromAttributes(set, n);
    }
    
    public int getCompoundPaddingLeft() {
        int n = super.getCompoundPaddingLeft();
        if (this.mCompoundButtonHelper != null) {
            n = this.mCompoundButtonHelper.getCompoundPaddingLeft(n);
        }
        return n;
    }
    
    @Nullable
    public ColorStateList getSupportButtonTintList() {
        if (this.mCompoundButtonHelper != null) {
            return this.mCompoundButtonHelper.getSupportButtonTintList();
        }
        return null;
    }
    
    @Nullable
    public PorterDuff$Mode getSupportButtonTintMode() {
        if (this.mCompoundButtonHelper != null) {
            return this.mCompoundButtonHelper.getSupportButtonTintMode();
        }
        return null;
    }
    
    public void setButtonDrawable(@DrawableRes final int n) {
        Drawable buttonDrawable;
        if (this.mTintManager != null) {
            buttonDrawable = this.mTintManager.getDrawable(n);
        }
        else {
            buttonDrawable = ContextCompat.getDrawable(this.getContext(), n);
        }
        this.setButtonDrawable(buttonDrawable);
    }
    
    public void setButtonDrawable(final Drawable buttonDrawable) {
        super.setButtonDrawable(buttonDrawable);
        if (this.mCompoundButtonHelper != null) {
            this.mCompoundButtonHelper.onSetButtonDrawable();
        }
    }
    
    public void setSupportButtonTintList(@Nullable final ColorStateList supportButtonTintList) {
        if (this.mCompoundButtonHelper != null) {
            this.mCompoundButtonHelper.setSupportButtonTintList(supportButtonTintList);
        }
    }
    
    public void setSupportButtonTintMode(@Nullable final PorterDuff$Mode supportButtonTintMode) {
        if (this.mCompoundButtonHelper != null) {
            this.mCompoundButtonHelper.setSupportButtonTintMode(supportButtonTintMode);
        }
    }
}
