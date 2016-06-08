package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnItemLongClickListener", listenerType = AdapterView$OnItemLongClickListener.class, methodName = "onItemLongClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnItemLongClick {
    int[] parentId() default { 0 };
    
    int[] value();
}
