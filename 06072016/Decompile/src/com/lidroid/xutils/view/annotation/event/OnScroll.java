package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnScrollListener", listenerType = AbsListView$OnScrollListener.class, methodName = "onScroll")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnScroll {
    int[] parentId() default { 0 };
    
    int[] value();
}
