package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnItemSelectedListener", listenerType = AdapterView$OnItemSelectedListener.class, methodName = "onItemSelected")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnItemSelected {
    int[] parentId() default { 0 };
    
    int[] value();
}
