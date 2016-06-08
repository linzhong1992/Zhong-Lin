package com.lidroid.xutils.view.annotation.event;

import android.view.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnClickListener", listenerType = View$OnClickListener.class, methodName = "onClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnClick {
    int[] parentId() default { 0 };
    
    int[] value();
}
