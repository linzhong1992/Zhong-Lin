package com.lidroid.xutils;

import android.app.Activity;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.view.View;
import com.lidroid.xutils.util.LogUtils;
import com.lidroid.xutils.view.EventListenerManager;
import com.lidroid.xutils.view.ResLoader;
import com.lidroid.xutils.view.ViewFinder;
import com.lidroid.xutils.view.ViewInjectInfo;
import com.lidroid.xutils.view.annotation.ContentView;
import com.lidroid.xutils.view.annotation.PreferenceInject;
import com.lidroid.xutils.view.annotation.ResInject;
import com.lidroid.xutils.view.annotation.ViewInject;
import com.lidroid.xutils.view.annotation.event.EventBase;
import java.lang.annotation.Annotation;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ViewUtils
{
  public static void inject(Activity paramActivity)
  {
    injectObject(paramActivity, new ViewFinder(paramActivity));
  }
  
  public static void inject(PreferenceActivity paramPreferenceActivity)
  {
    injectObject(paramPreferenceActivity, new ViewFinder(paramPreferenceActivity));
  }
  
  public static void inject(View paramView)
  {
    injectObject(paramView, new ViewFinder(paramView));
  }
  
  public static void inject(Object paramObject, Activity paramActivity)
  {
    injectObject(paramObject, new ViewFinder(paramActivity));
  }
  
  public static void inject(Object paramObject, PreferenceActivity paramPreferenceActivity)
  {
    injectObject(paramObject, new ViewFinder(paramPreferenceActivity));
  }
  
  public static void inject(Object paramObject, PreferenceGroup paramPreferenceGroup)
  {
    injectObject(paramObject, new ViewFinder(paramPreferenceGroup));
  }
  
  public static void inject(Object paramObject, View paramView)
  {
    injectObject(paramObject, new ViewFinder(paramView));
  }
  
  private static void injectObject(Object paramObject, ViewFinder paramViewFinder)
  {
    Object localObject1 = paramObject.getClass();
    Object localObject2 = (ContentView)((Class)localObject1).getAnnotation(ContentView.class);
    if (localObject2 != null) {}
    int j;
    int i;
    Object localObject4;
    label366:
    Annotation[] arrayOfAnnotation;
    try
    {
      ((Class)localObject1).getMethod("setContentView", new Class[] { Integer.TYPE }).invoke(paramObject, new Object[] { Integer.valueOf(((ContentView)localObject2).value()) });
      localObject2 = ((Class)localObject1).getDeclaredFields();
      if ((localObject2 != null) && (localObject2.length > 0))
      {
        j = localObject2.length;
        i = 0;
        if (i < j) {}
      }
      else
      {
        arrayOfMethod = ((Class)localObject1).getDeclaredMethods();
        if ((arrayOfMethod != null) && (arrayOfMethod.length > 0))
        {
          int i1 = arrayOfMethod.length;
          i = 0;
          if (i < i1) {
            break label366;
          }
        }
        return;
      }
    }
    catch (Throwable localThrowable2)
    {
      for (;;)
      {
        LogUtils.e(localThrowable2.getMessage(), localThrowable2);
      }
      Method[] arrayOfMethod = localThrowable2[i];
      localObject4 = (ViewInject)arrayOfMethod.getAnnotation(ViewInject.class);
      if (localObject4 != null) {}
      for (;;)
      {
        try
        {
          localObject4 = paramViewFinder.findViewById(((ViewInject)localObject4).value(), ((ViewInject)localObject4).parentId());
          if (localObject4 != null)
          {
            arrayOfMethod.setAccessible(true);
            arrayOfMethod.set(paramObject, localObject4);
          }
        }
        catch (Throwable localThrowable4)
        {
          LogUtils.e(localThrowable4.getMessage(), localThrowable4);
          continue;
        }
        i += 1;
        break;
        localObject4 = (ResInject)localThrowable4.getAnnotation(ResInject.class);
        if (localObject4 != null)
        {
          try
          {
            localObject4 = ResLoader.loadRes(((ResInject)localObject4).type(), paramViewFinder.getContext(), ((ResInject)localObject4).id());
            if (localObject4 == null) {
              continue;
            }
            localThrowable4.setAccessible(true);
            localThrowable4.set(paramObject, localObject4);
          }
          catch (Throwable localThrowable5)
          {
            LogUtils.e(localThrowable5.getMessage(), localThrowable5);
          }
        }
        else
        {
          localObject4 = (PreferenceInject)localThrowable5.getAnnotation(PreferenceInject.class);
          if (localObject4 != null) {
            try
            {
              localObject4 = paramViewFinder.findPreference(((PreferenceInject)localObject4).value());
              if (localObject4 != null)
              {
                localThrowable5.setAccessible(true);
                localThrowable5.set(paramObject, localObject4);
              }
            }
            catch (Throwable localThrowable6)
            {
              LogUtils.e(localThrowable6.getMessage(), localThrowable6);
            }
          }
        }
      }
      localObject4 = localThrowable6[i];
      arrayOfAnnotation = ((Method)localObject4).getDeclaredAnnotations();
      if (arrayOfAnnotation == null) {
        break label403;
      }
    }
    int i2;
    if (arrayOfAnnotation.length > 0)
    {
      i2 = arrayOfAnnotation.length;
      j = 0;
    }
    for (;;)
    {
      if (j >= i2)
      {
        label403:
        i += 1;
        break;
      }
      Annotation localAnnotation = arrayOfAnnotation[j];
      Object localObject3 = localAnnotation.annotationType();
      label474:
      label498:
      int i3;
      int m;
      label527:
      int k;
      if (((Class)localObject3).getAnnotation(EventBase.class) != null)
      {
        ((Method)localObject4).setAccessible(true);
        try
        {
          localObject5 = ((Class)localObject3).getDeclaredMethod("value", new Class[0]);
          localObject1 = null;
        }
        catch (Throwable localThrowable1)
        {
          Object localObject5;
          label537:
          int n;
          LogUtils.e(localThrowable1.getMessage(), localThrowable1);
        }
        try
        {
          localObject3 = ((Class)localObject3).getDeclaredMethod("parentId", new Class[0]);
          localObject1 = localObject3;
        }
        catch (Throwable localThrowable3)
        {
          break label474;
          if (localThrowable1 != null) {
            break label527;
          }
          k = 0;
          break label498;
          if (m < i3) {
            break label537;
          }
        }
        localObject3 = ((Method)localObject5).invoke(localAnnotation, new Object[0]);
        if (localObject1 == null)
        {
          localObject1 = null;
        }
        else
        {
          for (;;)
          {
            i3 = Array.getLength(localObject3);
            m = 0;
            break label644;
            localObject1 = ((Method)localObject1).invoke(localAnnotation, new Object[0]);
            break;
            k = Array.getLength(localObject1);
          }
          localObject5 = new ViewInjectInfo();
          ((ViewInjectInfo)localObject5).value = Array.get(localObject3, m);
          if (k > m) {}
          for (n = ((Integer)Array.get(localObject1, m)).intValue();; n = 0)
          {
            ((ViewInjectInfo)localObject5).parentId = n;
            EventListenerManager.addEventMethod(paramViewFinder, (ViewInjectInfo)localObject5, localAnnotation, paramObject, (Method)localObject4);
            m += 1;
            break;
          }
        }
      }
      label644:
      j += 1;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\ViewUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */