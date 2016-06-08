package com.lidroid.xutils.view.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD })
public @interface PreferenceInject {
    String value();
}
