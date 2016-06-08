package android.support.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.CLASS)
@Target({ ElementType.METHOD })
public @interface CallSuper {
}
