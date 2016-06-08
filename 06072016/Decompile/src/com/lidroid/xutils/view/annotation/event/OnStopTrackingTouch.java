package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnSeekBarChangeListener", listenerType = SeekBar$OnSeekBarChangeListener.class, methodName = "onStopTrackingTouch")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnStopTrackingTouch {
    int[] parentId() default { 0 };
    
    int[] value();
}
