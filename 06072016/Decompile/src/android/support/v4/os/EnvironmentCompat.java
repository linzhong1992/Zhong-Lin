package android.support.v4.os;

import android.os.*;
import android.util.*;
import java.io.*;

public class EnvironmentCompat
{
    public static final String MEDIA_UNKNOWN = "unknown";
    private static final String TAG = "EnvironmentCompat";
    
    public static String getStorageState(final File file) {
        if (Build$VERSION.SDK_INT >= 19) {
            return EnvironmentCompatKitKat.getStorageState(file);
        }
        try {
            if (file.getCanonicalPath().startsWith(Environment.getExternalStorageDirectory().getCanonicalPath())) {
                return Environment.getExternalStorageState();
            }
        }
        catch (IOException ex) {
            Log.w("EnvironmentCompat", "Failed to resolve canonical path: " + ex);
        }
        return "unknown";
    }
}
