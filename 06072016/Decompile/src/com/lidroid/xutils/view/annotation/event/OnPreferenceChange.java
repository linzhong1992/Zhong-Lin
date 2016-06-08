package com.lidroid.xutils.view.annotation.event;

import android.preference.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnPreferenceChangeListener", listenerType = Preference$OnPreferenceChangeListener.class, methodName = "onPreferenceChange")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnPreferenceChange {
    String[] value();
}
