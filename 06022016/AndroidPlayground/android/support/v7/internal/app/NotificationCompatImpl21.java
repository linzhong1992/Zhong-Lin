package android.support.v7.internal.app;

import android.app.Notification.MediaStyle;
import android.media.session.MediaSession.Token;
import android.support.v4.app.NotificationBuilderWithBuilderAccessor;

public class NotificationCompatImpl21
{
  public static void addMediaStyle(NotificationBuilderWithBuilderAccessor paramNotificationBuilderWithBuilderAccessor, int[] paramArrayOfInt, Object paramObject)
  {
    paramNotificationBuilderWithBuilderAccessor = new Notification.MediaStyle(paramNotificationBuilderWithBuilderAccessor.getBuilder());
    if (paramArrayOfInt != null) {
      paramNotificationBuilderWithBuilderAccessor.setShowActionsInCompactView(paramArrayOfInt);
    }
    if (paramObject != null) {
      paramNotificationBuilderWithBuilderAccessor.setMediaSession((MediaSession.Token)paramObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\android\support\v7\internal\app\NotificationCompatImpl21.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */