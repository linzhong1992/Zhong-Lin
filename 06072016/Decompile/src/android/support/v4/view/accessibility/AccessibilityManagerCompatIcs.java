package android.support.v4.view.accessibility;

import android.view.accessibility.*;
import java.util.*;
import android.accessibilityservice.*;

class AccessibilityManagerCompatIcs
{
    public static boolean addAccessibilityStateChangeListener(final AccessibilityManager accessibilityManager, final Object o) {
        return accessibilityManager.addAccessibilityStateChangeListener((AccessibilityManager$AccessibilityStateChangeListener)o);
    }
    
    public static List<AccessibilityServiceInfo> getEnabledAccessibilityServiceList(final AccessibilityManager accessibilityManager, final int n) {
        return (List<AccessibilityServiceInfo>)accessibilityManager.getEnabledAccessibilityServiceList(n);
    }
    
    public static List<AccessibilityServiceInfo> getInstalledAccessibilityServiceList(final AccessibilityManager accessibilityManager) {
        return (List<AccessibilityServiceInfo>)accessibilityManager.getInstalledAccessibilityServiceList();
    }
    
    public static boolean isTouchExplorationEnabled(final AccessibilityManager accessibilityManager) {
        return accessibilityManager.isTouchExplorationEnabled();
    }
    
    public static Object newAccessibilityStateChangeListener(final AccessibilityStateChangeListenerBridge accessibilityStateChangeListenerBridge) {
        return new AccessibilityManager$AccessibilityStateChangeListener() {
            public void onAccessibilityStateChanged(final boolean b) {
                accessibilityStateChangeListenerBridge.onAccessibilityStateChanged(b);
            }
        };
    }
    
    public static boolean removeAccessibilityStateChangeListener(final AccessibilityManager accessibilityManager, final Object o) {
        return accessibilityManager.removeAccessibilityStateChangeListener((AccessibilityManager$AccessibilityStateChangeListener)o);
    }
    
    interface AccessibilityStateChangeListenerBridge
    {
        void onAccessibilityStateChanged(final boolean p0);
    }
}
