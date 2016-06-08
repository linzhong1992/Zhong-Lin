package com.lidroid.xutils.view;

import com.lidroid.xutils.util.core.*;
import java.lang.annotation.*;
import com.lidroid.xutils.view.annotation.event.*;
import java.lang.reflect.*;
import com.lidroid.xutils.util.*;
import android.view.*;
import java.lang.ref.*;
import java.util.*;

public class EventListenerManager
{
    private static final DoubleKeyValueMap<ViewInjectInfo, Class<?>, Object> listenerCache;
    
    static {
        listenerCache = new DoubleKeyValueMap<ViewInjectInfo, Class<?>, Object>();
    }
    
    public static void addEventMethod(final ViewFinder viewFinder, final ViewInjectInfo viewInjectInfo, final Annotation annotation, final Object o, final Method method) {
        try {
            final View viewByInfo = viewFinder.findViewByInfo(viewInjectInfo);
            if (viewByInfo != null) {
                final EventBase eventBase = annotation.annotationType().getAnnotation(EventBase.class);
                final Class<?> listenerType = eventBase.listenerType();
                final String listenerSetter = eventBase.listenerSetter();
                final String methodName = eventBase.methodName();
                int n = 0;
                Object o2 = EventListenerManager.listenerCache.get(viewInjectInfo, listenerType);
                if (o2 != null) {
                    final DynamicHandler dynamicHandler = (DynamicHandler)Proxy.getInvocationHandler(o2);
                    final boolean equals = o.equals(dynamicHandler.getHandler());
                    if ((n = (equals ? 1 : 0)) != 0) {
                        dynamicHandler.addMethod(methodName, method);
                        n = (equals ? 1 : 0);
                    }
                }
                if (n == 0) {
                    final DynamicHandler dynamicHandler2 = new DynamicHandler(o);
                    dynamicHandler2.addMethod(methodName, method);
                    o2 = Proxy.newProxyInstance(listenerType.getClassLoader(), new Class[] { listenerType }, dynamicHandler2);
                    EventListenerManager.listenerCache.put(viewInjectInfo, listenerType, o2);
                }
                viewByInfo.getClass().getMethod(listenerSetter, listenerType).invoke(viewByInfo, o2);
            }
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
        }
    }
    
    public static class DynamicHandler implements InvocationHandler
    {
        private WeakReference<Object> handlerRef;
        private final HashMap<String, Method> methodMap;
        
        public DynamicHandler(final Object o) {
            this.methodMap = new HashMap<String, Method>(1);
            this.handlerRef = new WeakReference<Object>(o);
        }
        
        public void addMethod(final String s, final Method method) {
            this.methodMap.put(s, method);
        }
        
        public Object getHandler() {
            return this.handlerRef.get();
        }
        
        @Override
        public Object invoke(Object value, Method method, final Object[] array) throws Throwable {
            value = this.handlerRef.get();
            if (value != null) {
                method = this.methodMap.get(method.getName());
                if (method != null) {
                    return method.invoke(value, array);
                }
            }
            return null;
        }
        
        public void setHandler(final Object o) {
            this.handlerRef = new WeakReference<Object>(o);
        }
    }
}
