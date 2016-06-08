package com.lidroid.xutils.view.annotation.event;

import android.view.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnTouchListener", listenerType = View$OnTouchListener.class, methodName = "onTouch")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnTouch {
    int[] parentId() default { 0 };
    
    int[] value();
}
