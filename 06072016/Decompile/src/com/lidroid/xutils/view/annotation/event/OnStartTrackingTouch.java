package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnSeekBarChangeListener", listenerType = SeekBar$OnSeekBarChangeListener.class, methodName = "onStartTrackingTouch")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnStartTrackingTouch {
    int[] parentId() default { 0 };
    
    int[] value();
}
