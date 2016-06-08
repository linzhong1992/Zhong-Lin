package android.support.v7.app;

import android.support.v7.view.*;
import android.support.annotation.*;

public interface AppCompatCallback
{
    void onSupportActionModeFinished(final ActionMode p0);
    
    void onSupportActionModeStarted(final ActionMode p0);
    
    @Nullable
    ActionMode onWindowStartingSupportActionMode(final ActionMode.Callback p0);
}
