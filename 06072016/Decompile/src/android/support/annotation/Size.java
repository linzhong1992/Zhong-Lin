package android.support.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.CLASS)
@Target({ ElementType.PARAMETER, ElementType.LOCAL_VARIABLE, ElementType.METHOD, ElementType.FIELD })
public @interface Size {
    long max() default Long.MAX_VALUE;
    
    long min() default Long.MIN_VALUE;
    
    long multiple() default 1L;
    
    long value() default -1L;
}
