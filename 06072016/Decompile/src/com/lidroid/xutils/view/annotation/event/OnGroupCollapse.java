package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnGroupCollapseListener", listenerType = ExpandableListView$OnGroupCollapseListener.class, methodName = "onGroupCollapse")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnGroupCollapse {
    int[] parentId() default { 0 };
    
    int[] value();
}
