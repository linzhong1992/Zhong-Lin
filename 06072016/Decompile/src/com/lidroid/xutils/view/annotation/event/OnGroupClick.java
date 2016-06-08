package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnGroupClickListener", listenerType = ExpandableListView$OnGroupClickListener.class, methodName = "onGroupClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnGroupClick {
    int[] parentId() default { 0 };
    
    int[] value();
}
