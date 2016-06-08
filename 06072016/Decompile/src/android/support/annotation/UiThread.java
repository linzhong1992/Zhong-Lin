package android.support.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.CLASS)
@Target({ ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.TYPE })
public @interface UiThread {
}
