package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnGroupExpandListener", listenerType = ExpandableListView$OnGroupExpandListener.class, methodName = "onGroupExpand")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnGroupExpand {
    int[] parentId() default { 0 };
    
    int[] value();
}
