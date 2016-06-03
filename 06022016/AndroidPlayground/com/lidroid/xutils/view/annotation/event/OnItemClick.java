package com.lidroid.xutils.view.annotation.event;

import android.widget.AdapterView.OnItemClickListener;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@EventBase(listenerSetter="setOnItemClickListener", listenerType=AdapterView.OnItemClickListener.class, methodName="onItemClick")
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.METHOD})
public @interface OnItemClick
{
  int[] parentId() default {0};
  
  int[] value();
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\view\annotation\event\OnItemClick.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */