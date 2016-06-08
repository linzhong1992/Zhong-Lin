package android.support.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.CLASS)
@Target({ ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.FIELD })
public @interface RequiresPermission {
    String[] allOf() default {};
    
    String[] anyOf() default {};
    
    boolean conditional() default false;
    
    String value() default "";
    
    @Target({ ElementType.FIELD })
    public @interface Read {
        RequiresPermission value();
    }
    
    @Target({ ElementType.FIELD })
    public @interface Write {
        RequiresPermission value();
    }
}
