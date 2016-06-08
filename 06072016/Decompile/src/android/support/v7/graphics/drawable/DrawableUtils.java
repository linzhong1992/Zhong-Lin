package android.support.v7.graphics.drawable;

import android.graphics.*;
import android.os.*;

public class DrawableUtils
{
    public static PorterDuff$Mode parseTintMode(final int n, final PorterDuff$Mode porterDuff$Mode) {
        switch (n) {
            case 3: {
                return PorterDuff$Mode.SRC_OVER;
            }
            case 5: {
                return PorterDuff$Mode.SRC_IN;
            }
            case 9: {
                return PorterDuff$Mode.SRC_ATOP;
            }
            case 14: {
                return PorterDuff$Mode.MULTIPLY;
            }
            case 15: {
                return PorterDuff$Mode.SCREEN;
            }
            case 16: {
                if (Build$VERSION.SDK_INT >= 11) {
                    return PorterDuff$Mode.valueOf("ADD");
                }
                break;
            }
        }
        return porterDuff$Mode;
    }
}
