package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnScrollListener", listenerType = AbsListView$OnScrollListener.class, methodName = "onScrollStateChanged")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnScrollStateChanged {
    int[] parentId() default { 0 };
    
    int[] value();
}
