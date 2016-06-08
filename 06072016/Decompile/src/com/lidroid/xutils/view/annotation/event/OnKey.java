package com.lidroid.xutils.view.annotation.event;

import android.view.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnKeyListener", listenerType = View$OnKeyListener.class, methodName = "onKey")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnKey {
    int[] parentId() default { 0 };
    
    int[] value();
}
