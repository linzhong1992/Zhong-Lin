package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnItemClickListener", listenerType = AdapterView$OnItemClickListener.class, methodName = "onItemClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnItemClick {
    int[] parentId() default { 0 };
    
    int[] value();
}
