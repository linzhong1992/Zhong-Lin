package android.support.v7.internal.widget;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;

public class TintContextWrapper
  extends ContextWrapper
{
  private Resources mResources;
  
  private TintContextWrapper(Context paramContext)
  {
    super(paramContext);
  }
  
  public static Context wrap(Context paramContext)
  {
    Object localObject = paramContext;
    if (!(paramContext instanceof TintContextWrapper)) {
      localObject = new TintContextWrapper(paramContext);
    }
    return (Context)localObject;
  }
  
  public Resources getResources()
  {
    if (this.mResources == null) {
      this.mResources = new TintResources(super.getResources(), TintManager.get(this));
    }
    return this.mResources;
  }
  
  static class TintResources
    extends ResourcesWrapper
  {
    private final TintManager mTintManager;
    
    public TintResources(Resources paramResources, TintManager paramTintManager)
    {
      super();
      this.mTintManager = paramTintManager;
    }
    
    public Drawable getDrawable(int paramInt)
      throws Resources.NotFoundException
    {
      Drawable localDrawable = super.getDrawable(paramInt);
      if (localDrawable != null) {
        this.mTintManager.tintDrawableUsingColorFilter(paramInt, localDrawable);
      }
      return localDrawable;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\v7\internal\widget\TintContextWrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */