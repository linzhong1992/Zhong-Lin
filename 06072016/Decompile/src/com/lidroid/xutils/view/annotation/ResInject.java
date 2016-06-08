package com.lidroid.xutils.view.annotation;

import java.lang.annotation.*;
import com.lidroid.xutils.view.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD })
public @interface ResInject {
    int id();
    
    ResType type();
}
