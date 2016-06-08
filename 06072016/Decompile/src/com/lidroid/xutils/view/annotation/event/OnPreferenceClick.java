package com.lidroid.xutils.view.annotation.event;

import android.preference.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnPreferenceClickListener", listenerType = Preference$OnPreferenceClickListener.class, methodName = "onPreferenceClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnPreferenceClick {
    String[] value();
}
