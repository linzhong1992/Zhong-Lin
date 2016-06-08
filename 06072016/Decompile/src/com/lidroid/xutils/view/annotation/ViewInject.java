package com.lidroid.xutils.view.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD })
public @interface ViewInject {
    int parentId() default 0;
    
    int value();
}
