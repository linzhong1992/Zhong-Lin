package android.support.v7.internal.widget;

import android.graphics.*;
import android.support.annotation.*;

class ActionBarBackgroundDrawableV21 extends ActionBarBackgroundDrawable
{
    public ActionBarBackgroundDrawableV21(final ActionBarContainer actionBarContainer) {
        super(actionBarContainer);
    }
    
    public void getOutline(@NonNull final Outline outline) {
        if (this.mContainer.mIsSplit) {
            if (this.mContainer.mSplitBackground != null) {
                this.mContainer.mSplitBackground.getOutline(outline);
            }
        }
        else if (this.mContainer.mBackground != null) {
            this.mContainer.mBackground.getOutline(outline);
        }
    }
}
