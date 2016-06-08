package com.lidroid.xutils.db.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.TYPE })
public @interface Table {
    String execAfterTableCreated() default "";
    
    String name() default "";
}
