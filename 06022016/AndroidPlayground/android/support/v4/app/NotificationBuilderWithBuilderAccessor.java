package android.support.v4.app;

import android.app.Notification;
import android.app.Notification.Builder;

public abstract interface NotificationBuilderWithBuilderAccessor
{
  public abstract Notification build();
  
  public abstract Notification.Builder getBuilder();
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\v4\app\NotificationBuilderWithBuilderAccessor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */