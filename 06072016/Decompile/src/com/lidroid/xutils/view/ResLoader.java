package com.lidroid.xutils.view;

import android.content.*;
import android.view.animation.*;
import android.graphics.drawable.*;
import android.graphics.*;
import android.content.res.*;

public class ResLoader
{
    static /* synthetic */ int[] $SWITCH_TABLE$com$lidroid$xutils$view$ResType() {
        final int[] $switch_TABLE$com$lidroid$xutils$view$ResType = ResLoader.$SWITCH_TABLE$com$lidroid$xutils$view$ResType;
        if ($switch_TABLE$com$lidroid$xutils$view$ResType != null) {
            return $switch_TABLE$com$lidroid$xutils$view$ResType;
        }
        final int[] $switch_TABLE$com$lidroid$xutils$view$ResType2 = new int[ResType.values().length];
        while (true) {
            try {
                $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Animation.ordinal()] = 1;
                try {
                    $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Boolean.ordinal()] = 2;
                    try {
                        $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Color.ordinal()] = 3;
                        try {
                            $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.ColorStateList.ordinal()] = 4;
                            try {
                                $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Dimension.ordinal()] = 5;
                                try {
                                    $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.DimensionPixelOffset.ordinal()] = 6;
                                    try {
                                        $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.DimensionPixelSize.ordinal()] = 7;
                                        try {
                                            $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Drawable.ordinal()] = 8;
                                            try {
                                                $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.IntArray.ordinal()] = 10;
                                                try {
                                                    $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Integer.ordinal()] = 9;
                                                    try {
                                                        $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Movie.ordinal()] = 11;
                                                        try {
                                                            $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.String.ordinal()] = 12;
                                                            try {
                                                                $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.StringArray.ordinal()] = 13;
                                                                try {
                                                                    $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Text.ordinal()] = 14;
                                                                    try {
                                                                        $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.TextArray.ordinal()] = 15;
                                                                        try {
                                                                            $switch_TABLE$com$lidroid$xutils$view$ResType2[ResType.Xml.ordinal()] = 16;
                                                                            return ResLoader.$SWITCH_TABLE$com$lidroid$xutils$view$ResType = $switch_TABLE$com$lidroid$xutils$view$ResType2;
                                                                        }
                                                                        catch (NoSuchFieldError noSuchFieldError) {}
                                                                    }
                                                                    catch (NoSuchFieldError noSuchFieldError2) {}
                                                                }
                                                                catch (NoSuchFieldError noSuchFieldError3) {}
                                                            }
                                                            catch (NoSuchFieldError noSuchFieldError4) {}
                                                        }
                                                        catch (NoSuchFieldError noSuchFieldError5) {}
                                                    }
                                                    catch (NoSuchFieldError noSuchFieldError6) {}
                                                }
                                                catch (NoSuchFieldError noSuchFieldError7) {}
                                            }
                                            catch (NoSuchFieldError noSuchFieldError8) {}
                                        }
                                        catch (NoSuchFieldError noSuchFieldError9) {}
                                    }
                                    catch (NoSuchFieldError noSuchFieldError10) {}
                                }
                                catch (NoSuchFieldError noSuchFieldError11) {}
                            }
                            catch (NoSuchFieldError noSuchFieldError12) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError13) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError14) {}
                }
                catch (NoSuchFieldError noSuchFieldError15) {}
            }
            catch (NoSuchFieldError noSuchFieldError16) {
                continue;
            }
            break;
        }
    }
    
    public static Animation getAnimation(final Context context, final int n) {
        return AnimationUtils.loadAnimation(context, n);
    }
    
    public static boolean getBoolean(final Context context, final int n) {
        return context.getResources().getBoolean(n);
    }
    
    public static int getColor(final Context context, final int n) {
        return context.getResources().getColor(n);
    }
    
    public static ColorStateList getColorStateList(final Context context, final int n) {
        return context.getResources().getColorStateList(n);
    }
    
    public static float getDimension(final Context context, final int n) {
        return context.getResources().getDimension(n);
    }
    
    public static int getDimensionPixelOffset(final Context context, final int n) {
        return context.getResources().getDimensionPixelOffset(n);
    }
    
    public static int getDimensionPixelSize(final Context context, final int n) {
        return context.getResources().getDimensionPixelSize(n);
    }
    
    public static Drawable getDrawable(final Context context, final int n) {
        return context.getResources().getDrawable(n);
    }
    
    public static int[] getIntArray(final Context context, final int n) {
        return context.getResources().getIntArray(n);
    }
    
    public static int getInteger(final Context context, final int n) {
        return context.getResources().getInteger(n);
    }
    
    public static Movie getMovie(final Context context, final int n) {
        return context.getResources().getMovie(n);
    }
    
    public static String getString(final Context context, final int n) {
        return context.getResources().getString(n);
    }
    
    public static String[] getStringArray(final Context context, final int n) {
        return context.getResources().getStringArray(n);
    }
    
    public static CharSequence getText(final Context context, final int n) {
        return context.getResources().getText(n);
    }
    
    public static CharSequence[] getTextArray(final Context context, final int n) {
        return context.getResources().getTextArray(n);
    }
    
    public static XmlResourceParser getXml(final Context context, final int n) {
        return context.getResources().getXml(n);
    }
    
    public static Object loadRes(final ResType resType, final Context context, final int n) {
        if (context == null || n < 1) {
            return null;
        }
        switch ($SWITCH_TABLE$com$lidroid$xutils$view$ResType()[resType.ordinal()]) {
            default: {
                return null;
            }
            case 1: {
                return getAnimation(context, n);
            }
            case 2: {
                return getBoolean(context, n);
            }
            case 3: {
                return getColor(context, n);
            }
            case 4: {
                return getColorStateList(context, n);
            }
            case 5: {
                return getDimension(context, n);
            }
            case 6: {
                return getDimensionPixelOffset(context, n);
            }
            case 7: {
                return getDimensionPixelSize(context, n);
            }
            case 8: {
                return getDrawable(context, n);
            }
            case 9: {
                return getInteger(context, n);
            }
            case 10: {
                return getIntArray(context, n);
            }
            case 11: {
                return getMovie(context, n);
            }
            case 12: {
                return getString(context, n);
            }
            case 13: {
                return getStringArray(context, n);
            }
            case 14: {
                return getText(context, n);
            }
            case 15: {
                return getTextArray(context, n);
            }
            case 16: {
                return getXml(context, n);
            }
        }
    }
}
