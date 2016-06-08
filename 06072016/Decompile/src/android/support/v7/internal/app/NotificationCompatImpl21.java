package android.support.v7.internal.app;

import android.support.v4.app.*;
import android.app.*;
import android.media.session.*;

public class NotificationCompatImpl21
{
    public static void addMediaStyle(final NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor, final int[] showActionsInCompactView, final Object o) {
        final Notification$MediaStyle notification$MediaStyle = new Notification$MediaStyle(notificationBuilderWithBuilderAccessor.getBuilder());
        if (showActionsInCompactView != null) {
            notification$MediaStyle.setShowActionsInCompactView(showActionsInCompactView);
        }
        if (o != null) {
            notification$MediaStyle.setMediaSession((MediaSession$Token)o);
        }
    }
}
