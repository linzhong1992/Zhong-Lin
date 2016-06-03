package com.lidroid.xutils.view.annotation.event;

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.ANNOTATION_TYPE})
public @interface EventBase
{
  String listenerSetter();
  
  Class<?> listenerType();
  
  String methodName();
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\view\annotation\event\EventBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */