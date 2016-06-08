package com.lidroid.xutils.view.annotation.event;

import android.view.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnLongClickListener", listenerType = View$OnLongClickListener.class, methodName = "onLongClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnLongClick {
    int[] parentId() default { 0 };
    
    int[] value();
}
