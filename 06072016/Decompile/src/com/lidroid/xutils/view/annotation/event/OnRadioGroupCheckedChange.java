package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnCheckedChangeListener", listenerType = RadioGroup$OnCheckedChangeListener.class, methodName = "onCheckedChanged")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnRadioGroupCheckedChange {
    int[] parentId() default { 0 };
    
    int[] value();
}
