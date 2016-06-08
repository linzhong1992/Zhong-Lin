package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnChildClickListener", listenerType = ExpandableListView$OnChildClickListener.class, methodName = "onChildClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnChildClick {
    int[] parentId() default { 0 };
    
    int[] value();
}
