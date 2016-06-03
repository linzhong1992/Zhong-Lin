package com.lidroid.xutils.db.annotation;

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.TYPE})
public @interface Table
{
  String execAfterTableCreated() default "";
  
  String name() default "";
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\annotation\Table.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */