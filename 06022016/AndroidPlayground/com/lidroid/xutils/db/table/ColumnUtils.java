package com.lidroid.xutils.db.table;

import android.text.TextUtils;
import com.lidroid.xutils.db.annotation.Check;
import com.lidroid.xutils.db.annotation.Column;
import com.lidroid.xutils.db.annotation.Id;
import com.lidroid.xutils.db.annotation.NotNull;
import com.lidroid.xutils.db.annotation.Transient;
import com.lidroid.xutils.db.annotation.Unique;
import com.lidroid.xutils.db.converter.ColumnConverter;
import com.lidroid.xutils.db.converter.ColumnConverterFactory;
import com.lidroid.xutils.db.sqlite.FinderLazyLoader;
import com.lidroid.xutils.db.sqlite.ForeignLazyLoader;
import com.lidroid.xutils.util.LogUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.List;

public class ColumnUtils
{
  private static final HashSet<String> DB_PRIMITIVE_TYPES = new HashSet(14);
  
  static
  {
    DB_PRIMITIVE_TYPES.add(Integer.TYPE.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Long.TYPE.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Short.TYPE.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Byte.TYPE.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Float.TYPE.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Double.TYPE.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Integer.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Long.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Short.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Byte.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Float.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(Double.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(String.class.getCanonicalName());
    DB_PRIMITIVE_TYPES.add(byte[].class.getCanonicalName());
  }
  
  public static Object convert2DbColumnValueIfNeeded(Object paramObject)
  {
    Object localObject1 = paramObject;
    Object localObject2 = localObject1;
    if (paramObject != null)
    {
      Class localClass = paramObject.getClass();
      localObject2 = localObject1;
      if (!isDbPrimitiveType(localClass))
      {
        localObject1 = ColumnConverterFactory.getColumnConverter(localClass);
        if (localObject1 == null) {
          return paramObject;
        }
        localObject2 = ((ColumnConverter)localObject1).fieldValue2ColumnValue(paramObject);
      }
    }
    return localObject2;
    return paramObject;
  }
  
  private static Method getBooleanColumnGetMethod(Class<?> paramClass, String paramString)
  {
    String str = "is" + paramString.substring(0, 1).toUpperCase() + paramString.substring(1);
    if (isStartWithIs(paramString)) {
      str = paramString;
    }
    try
    {
      paramClass = paramClass.getDeclaredMethod(str, new Class[0]);
      return paramClass;
    }
    catch (NoSuchMethodException paramClass)
    {
      LogUtils.d(str + " not exist");
    }
    return null;
  }
  
  private static Method getBooleanColumnSetMethod(Class<?> paramClass, Field paramField)
  {
    String str = paramField.getName();
    if (isStartWithIs(paramField.getName())) {}
    for (str = "set" + str.substring(2, 3).toUpperCase() + str.substring(3);; str = "set" + str.substring(0, 1).toUpperCase() + str.substring(1)) {
      try
      {
        paramClass = paramClass.getDeclaredMethod(str, new Class[] { paramField.getType() });
        return paramClass;
      }
      catch (NoSuchMethodException paramClass)
      {
        LogUtils.d(str + " not exist");
      }
    }
    return null;
  }
  
  public static String getCheck(Field paramField)
  {
    paramField = (Check)paramField.getAnnotation(Check.class);
    if (paramField != null) {
      return paramField.value();
    }
    return null;
  }
  
  public static String getColumnDefaultValue(Field paramField)
  {
    paramField = (Column)paramField.getAnnotation(Column.class);
    if ((paramField != null) && (!TextUtils.isEmpty(paramField.defaultValue()))) {
      return paramField.defaultValue();
    }
    return null;
  }
  
  public static Method getColumnGetMethod(Class<?> paramClass, Field paramField)
  {
    String str = paramField.getName();
    Object localObject1 = null;
    if (paramField.getType() == Boolean.TYPE) {
      localObject1 = getBooleanColumnGetMethod(paramClass, str);
    }
    Object localObject2 = localObject1;
    if (localObject1 == null) {
      str = "get" + str.substring(0, 1).toUpperCase() + str.substring(1);
    }
    try
    {
      localObject2 = paramClass.getDeclaredMethod(str, new Class[0]);
      localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = localObject2;
        if (!Object.class.equals(paramClass.getSuperclass())) {
          localObject1 = getColumnGetMethod(paramClass.getSuperclass(), paramField);
        }
      }
      return (Method)localObject1;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        LogUtils.d(str + " not exist");
        Object localObject3 = localObject1;
      }
    }
  }
  
  public static String getColumnNameByField(Field paramField)
  {
    Object localObject = (Column)paramField.getAnnotation(Column.class);
    if ((localObject != null) && (!TextUtils.isEmpty(((Column)localObject).column()))) {
      return ((Column)localObject).column();
    }
    localObject = (Id)paramField.getAnnotation(Id.class);
    if ((localObject != null) && (!TextUtils.isEmpty(((Id)localObject).column()))) {
      return ((Id)localObject).column();
    }
    localObject = (com.lidroid.xutils.db.annotation.Foreign)paramField.getAnnotation(com.lidroid.xutils.db.annotation.Foreign.class);
    if ((localObject != null) && (!TextUtils.isEmpty(((com.lidroid.xutils.db.annotation.Foreign)localObject).column()))) {
      return ((com.lidroid.xutils.db.annotation.Foreign)localObject).column();
    }
    if ((com.lidroid.xutils.db.annotation.Finder)paramField.getAnnotation(com.lidroid.xutils.db.annotation.Finder.class) != null) {
      return paramField.getName();
    }
    return paramField.getName();
  }
  
  public static Method getColumnSetMethod(Class<?> paramClass, Field paramField)
  {
    String str = paramField.getName();
    Object localObject1 = null;
    if (paramField.getType() == Boolean.TYPE) {
      localObject1 = getBooleanColumnSetMethod(paramClass, paramField);
    }
    Object localObject2 = localObject1;
    if (localObject1 == null) {
      str = "set" + str.substring(0, 1).toUpperCase() + str.substring(1);
    }
    try
    {
      localObject2 = paramClass.getDeclaredMethod(str, new Class[] { paramField.getType() });
      localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = localObject2;
        if (!Object.class.equals(paramClass.getSuperclass())) {
          localObject1 = getColumnSetMethod(paramClass.getSuperclass(), paramField);
        }
      }
      return (Method)localObject1;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        LogUtils.d(str + " not exist");
        Object localObject3 = localObject1;
      }
    }
  }
  
  public static Class<?> getFinderTargetEntityType(Finder paramFinder)
  {
    Class localClass2 = paramFinder.getColumnField().getType();
    Class localClass1;
    if (!localClass2.equals(FinderLazyLoader.class))
    {
      localClass1 = localClass2;
      if (!localClass2.equals(List.class)) {}
    }
    else
    {
      localClass1 = (Class)((java.lang.reflect.ParameterizedType)paramFinder.getColumnField().getGenericType()).getActualTypeArguments()[0];
    }
    return localClass1;
  }
  
  public static String getForeignColumnNameByField(Field paramField)
  {
    com.lidroid.xutils.db.annotation.Foreign localForeign = (com.lidroid.xutils.db.annotation.Foreign)paramField.getAnnotation(com.lidroid.xutils.db.annotation.Foreign.class);
    if (localForeign != null) {
      return localForeign.foreign();
    }
    return paramField.getName();
  }
  
  public static Class<?> getForeignEntityType(Foreign paramForeign)
  {
    Class localClass2 = paramForeign.getColumnField().getType();
    Class localClass1;
    if (!localClass2.equals(ForeignLazyLoader.class))
    {
      localClass1 = localClass2;
      if (!localClass2.equals(List.class)) {}
    }
    else
    {
      localClass1 = (Class)((java.lang.reflect.ParameterizedType)paramForeign.getColumnField().getGenericType()).getActualTypeArguments()[0];
    }
    return localClass1;
  }
  
  public static boolean isDbPrimitiveType(Class<?> paramClass)
  {
    return DB_PRIMITIVE_TYPES.contains(paramClass.getCanonicalName());
  }
  
  public static boolean isFinder(Field paramField)
  {
    return paramField.getAnnotation(com.lidroid.xutils.db.annotation.Finder.class) != null;
  }
  
  public static boolean isForeign(Field paramField)
  {
    return paramField.getAnnotation(com.lidroid.xutils.db.annotation.Foreign.class) != null;
  }
  
  public static boolean isNotNull(Field paramField)
  {
    return paramField.getAnnotation(NotNull.class) != null;
  }
  
  private static boolean isStartWithIs(String paramString)
  {
    return (paramString != null) && (paramString.startsWith("is"));
  }
  
  public static boolean isTransient(Field paramField)
  {
    return paramField.getAnnotation(Transient.class) != null;
  }
  
  public static boolean isUnique(Field paramField)
  {
    return paramField.getAnnotation(Unique.class) != null;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\ColumnUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */