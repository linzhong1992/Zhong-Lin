package com.lidroid.xutils.view.annotation.event;

import android.widget.*;
import java.lang.annotation.*;

@EventBase(listenerSetter = "setOnSeekBarChangeListener", listenerType = SeekBar$OnSeekBarChangeListener.class, methodName = "onProgressChanged")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface OnProgressChanged {
    int[] parentId() default { 0 };
    
    int[] value();
}
