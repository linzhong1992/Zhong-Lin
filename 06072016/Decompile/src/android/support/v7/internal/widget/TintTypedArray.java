package android.support.v7.internal.widget;

import android.content.*;
import android.graphics.drawable.*;
import android.content.res.*;
import android.util.*;

public class TintTypedArray
{
    private final Context mContext;
    private TintManager mTintManager;
    private final TypedArray mWrapped;
    
    private TintTypedArray(final Context mContext, final TypedArray mWrapped) {
        this.mContext = mContext;
        this.mWrapped = mWrapped;
    }
    
    public static TintTypedArray obtainStyledAttributes(final Context context, final AttributeSet set, final int[] array) {
        return new TintTypedArray(context, context.obtainStyledAttributes(set, array));
    }
    
    public static TintTypedArray obtainStyledAttributes(final Context context, final AttributeSet set, final int[] array, final int n, final int n2) {
        return new TintTypedArray(context, context.obtainStyledAttributes(set, array, n, n2));
    }
    
    public boolean getBoolean(final int n, final boolean b) {
        return this.mWrapped.getBoolean(n, b);
    }
    
    public int getChangingConfigurations() {
        return this.mWrapped.getChangingConfigurations();
    }
    
    public int getColor(final int n, final int n2) {
        return this.mWrapped.getColor(n, n2);
    }
    
    public ColorStateList getColorStateList(final int n) {
        return this.mWrapped.getColorStateList(n);
    }
    
    public float getDimension(final int n, final float n2) {
        return this.mWrapped.getDimension(n, n2);
    }
    
    public int getDimensionPixelOffset(final int n, final int n2) {
        return this.mWrapped.getDimensionPixelOffset(n, n2);
    }
    
    public int getDimensionPixelSize(final int n, final int n2) {
        return this.mWrapped.getDimensionPixelSize(n, n2);
    }
    
    public Drawable getDrawable(final int n) {
        if (this.mWrapped.hasValue(n)) {
            final int resourceId = this.mWrapped.getResourceId(n, 0);
            if (resourceId != 0) {
                return this.getTintManager().getDrawable(resourceId);
            }
        }
        return this.mWrapped.getDrawable(n);
    }
    
    public Drawable getDrawableIfKnown(int resourceId) {
        if (this.mWrapped.hasValue(resourceId)) {
            resourceId = this.mWrapped.getResourceId(resourceId, 0);
            if (resourceId != 0) {
                return this.getTintManager().getDrawable(resourceId, true);
            }
        }
        return null;
    }
    
    public float getFloat(final int n, final float n2) {
        return this.mWrapped.getFloat(n, n2);
    }
    
    public float getFraction(final int n, final int n2, final int n3, final float n4) {
        return this.mWrapped.getFraction(n, n2, n3, n4);
    }
    
    public int getIndex(final int n) {
        return this.mWrapped.getIndex(n);
    }
    
    public int getIndexCount() {
        return this.mWrapped.getIndexCount();
    }
    
    public int getInt(final int n, final int n2) {
        return this.mWrapped.getInt(n, n2);
    }
    
    public int getInteger(final int n, final int n2) {
        return this.mWrapped.getInteger(n, n2);
    }
    
    public int getLayoutDimension(final int n, final int n2) {
        return this.mWrapped.getLayoutDimension(n, n2);
    }
    
    public int getLayoutDimension(final int n, final String s) {
        return this.mWrapped.getLayoutDimension(n, s);
    }
    
    public String getNonResourceString(final int n) {
        return this.mWrapped.getNonResourceString(n);
    }
    
    public String getPositionDescription() {
        return this.mWrapped.getPositionDescription();
    }
    
    public int getResourceId(final int n, final int n2) {
        return this.mWrapped.getResourceId(n, n2);
    }
    
    public Resources getResources() {
        return this.mWrapped.getResources();
    }
    
    public String getString(final int n) {
        return this.mWrapped.getString(n);
    }
    
    public CharSequence getText(final int n) {
        return this.mWrapped.getText(n);
    }
    
    public CharSequence[] getTextArray(final int n) {
        return this.mWrapped.getTextArray(n);
    }
    
    public TintManager getTintManager() {
        if (this.mTintManager == null) {
            this.mTintManager = TintManager.get(this.mContext);
        }
        return this.mTintManager;
    }
    
    public int getType(final int n) {
        return this.mWrapped.getType(n);
    }
    
    public boolean getValue(final int n, final TypedValue typedValue) {
        return this.mWrapped.getValue(n, typedValue);
    }
    
    public boolean hasValue(final int n) {
        return this.mWrapped.hasValue(n);
    }
    
    public int length() {
        return this.mWrapped.length();
    }
    
    public TypedValue peekValue(final int n) {
        return this.mWrapped.peekValue(n);
    }
    
    public void recycle() {
        this.mWrapped.recycle();
    }
}
