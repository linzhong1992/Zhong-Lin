package com.lidroid.xutils.view.annotation.event;

import android.view.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnFocusChangeListener", listenerType = View$OnFocusChangeListener.class, methodName = "onFocusChange")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnFocusChange {
    int[] parentId() default { 0 };
    
    int[] value();
}
