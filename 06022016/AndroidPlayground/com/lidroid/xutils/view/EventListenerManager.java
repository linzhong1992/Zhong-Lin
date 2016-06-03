package com.lidroid.xutils.view;

import android.view.View;
import com.lidroid.xutils.util.LogUtils;
import com.lidroid.xutils.util.core.DoubleKeyValueMap;
import com.lidroid.xutils.view.annotation.event.EventBase;
import java.lang.annotation.Annotation;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;

public class EventListenerManager
{
  private static final DoubleKeyValueMap<ViewInjectInfo, Class<?>, Object> listenerCache = new DoubleKeyValueMap();
  
  public static void addEventMethod(ViewFinder paramViewFinder, ViewInjectInfo paramViewInjectInfo, Annotation paramAnnotation, Object paramObject, Method paramMethod)
  {
    try
    {
      View localView = paramViewFinder.findViewByInfo(paramViewInjectInfo);
      if (localView != null)
      {
        paramViewFinder = (EventBase)paramAnnotation.annotationType().getAnnotation(EventBase.class);
        paramAnnotation = paramViewFinder.listenerType();
        String str1 = paramViewFinder.listenerSetter();
        String str2 = paramViewFinder.methodName();
        int i = 0;
        paramViewFinder = listenerCache.get(paramViewInjectInfo, paramAnnotation);
        if (paramViewFinder != null)
        {
          DynamicHandler localDynamicHandler = (DynamicHandler)Proxy.getInvocationHandler(paramViewFinder);
          boolean bool = paramObject.equals(localDynamicHandler.getHandler());
          i = bool;
          if (bool)
          {
            localDynamicHandler.addMethod(str2, paramMethod);
            i = bool;
          }
        }
        if (i == 0)
        {
          paramViewFinder = new DynamicHandler(paramObject);
          paramViewFinder.addMethod(str2, paramMethod);
          paramViewFinder = Proxy.newProxyInstance(paramAnnotation.getClassLoader(), new Class[] { paramAnnotation }, paramViewFinder);
          listenerCache.put(paramViewInjectInfo, paramAnnotation, paramViewFinder);
        }
        localView.getClass().getMethod(str1, new Class[] { paramAnnotation }).invoke(localView, new Object[] { paramViewFinder });
      }
      return;
    }
    catch (Throwable paramViewFinder)
    {
      LogUtils.e(paramViewFinder.getMessage(), paramViewFinder);
    }
  }
  
  public static class DynamicHandler
    implements InvocationHandler
  {
    private WeakReference<Object> handlerRef;
    private final HashMap<String, Method> methodMap = new HashMap(1);
    
    public DynamicHandler(Object paramObject)
    {
      this.handlerRef = new WeakReference(paramObject);
    }
    
    public void addMethod(String paramString, Method paramMethod)
    {
      this.methodMap.put(paramString, paramMethod);
    }
    
    public Object getHandler()
    {
      return this.handlerRef.get();
    }
    
    public Object invoke(Object paramObject, Method paramMethod, Object[] paramArrayOfObject)
      throws Throwable
    {
      paramObject = this.handlerRef.get();
      if (paramObject != null)
      {
        paramMethod = paramMethod.getName();
        paramMethod = (Method)this.methodMap.get(paramMethod);
        if (paramMethod != null) {
          return paramMethod.invoke(paramObject, paramArrayOfObject);
        }
      }
      return null;
    }
    
    public void setHandler(Object paramObject)
    {
      this.handlerRef = new WeakReference(paramObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\view\EventListenerManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */