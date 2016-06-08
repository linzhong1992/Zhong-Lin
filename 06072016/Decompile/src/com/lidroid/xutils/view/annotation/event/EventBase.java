package com.lidroid.xutils.view.annotation.event;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.ANNOTATION_TYPE })
public @interface EventBase {
    String listenerSetter();
    
    Class<?> listenerType();
    
    String methodName();
}
