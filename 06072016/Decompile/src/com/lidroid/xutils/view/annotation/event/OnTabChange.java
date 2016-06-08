package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnTabChangeListener", listenerType = TabHost$OnTabChangeListener.class, methodName = "onTabChange")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnTabChange {
    int[] parentId() default { 0 };
    
    int[] value();
}
