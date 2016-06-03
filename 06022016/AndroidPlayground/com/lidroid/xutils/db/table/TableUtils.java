package com.lidroid.xutils.db.table;

import android.text.TextUtils;
import com.lidroid.xutils.db.annotation.Table;
import com.lidroid.xutils.db.converter.ColumnConverterFactory;
import com.lidroid.xutils.util.LogUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class TableUtils
{
  private static ConcurrentHashMap<String, HashMap<String, Column>> entityColumnsMap = new ConcurrentHashMap();
  private static ConcurrentHashMap<String, Id> entityIdMap = new ConcurrentHashMap();
  
  private static void addColumns2Map(Class<?> paramClass, String paramString, HashMap<String, Column> paramHashMap)
  {
    if (Object.class.equals(paramClass)) {
      return;
    }
    for (;;)
    {
      Field[] arrayOfField;
      int i;
      try
      {
        arrayOfField = paramClass.getDeclaredFields();
        int j = arrayOfField.length;
        i = 0;
        if (i >= j)
        {
          if (Object.class.equals(paramClass.getSuperclass())) {
            break;
          }
          addColumns2Map(paramClass.getSuperclass(), paramString, paramHashMap);
          return;
        }
      }
      catch (Throwable paramClass)
      {
        LogUtils.e(paramClass.getMessage(), paramClass);
        return;
      }
      Object localObject = arrayOfField[i];
      if ((!ColumnUtils.isTransient((Field)localObject)) && (!Modifier.isStatic(((Field)localObject).getModifiers()))) {
        if (ColumnConverterFactory.isSupportColumnConverter(((Field)localObject).getType()))
        {
          if (!((Field)localObject).getName().equals(paramString))
          {
            localObject = new Column(paramClass, (Field)localObject);
            if (!paramHashMap.containsKey(((Column)localObject).getColumnName())) {
              paramHashMap.put(((Column)localObject).getColumnName(), localObject);
            }
          }
        }
        else if (ColumnUtils.isForeign((Field)localObject))
        {
          localObject = new Foreign(paramClass, (Field)localObject);
          if (!paramHashMap.containsKey(((Foreign)localObject).getColumnName())) {
            paramHashMap.put(((Foreign)localObject).getColumnName(), localObject);
          }
        }
        else if (ColumnUtils.isFinder((Field)localObject))
        {
          localObject = new Finder(paramClass, (Field)localObject);
          if (!paramHashMap.containsKey(((Finder)localObject).getColumnName())) {
            paramHashMap.put(((Finder)localObject).getColumnName(), localObject);
          }
        }
      }
      i += 1;
    }
  }
  
  /* Error */
  public static HashMap<String, Column> getColumnMap(Class<?> paramClass)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 18	com/lidroid/xutils/db/table/TableUtils:entityColumnsMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   6: aload_0
    //   7: invokevirtual 123	java/lang/Class:getCanonicalName	()Ljava/lang/String;
    //   10: invokevirtual 124	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   13: ifeq +22 -> 35
    //   16: getstatic 18	com/lidroid/xutils/db/table/TableUtils:entityColumnsMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   19: aload_0
    //   20: invokevirtual 123	java/lang/Class:getCanonicalName	()Ljava/lang/String;
    //   23: invokevirtual 128	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   26: checkcast 95	java/util/HashMap
    //   29: astore_0
    //   30: ldc 2
    //   32: monitorexit
    //   33: aload_0
    //   34: areturn
    //   35: new 95	java/util/HashMap
    //   38: dup
    //   39: invokespecial 129	java/util/HashMap:<init>	()V
    //   42: astore_1
    //   43: aload_0
    //   44: aload_0
    //   45: invokestatic 133	com/lidroid/xutils/db/table/TableUtils:getPrimaryKeyFieldName	(Ljava/lang/Class;)Ljava/lang/String;
    //   48: aload_1
    //   49: invokestatic 42	com/lidroid/xutils/db/table/TableUtils:addColumns2Map	(Ljava/lang/Class;Ljava/lang/String;Ljava/util/HashMap;)V
    //   52: getstatic 18	com/lidroid/xutils/db/table/TableUtils:entityColumnsMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   55: aload_0
    //   56: invokevirtual 123	java/lang/Class:getCanonicalName	()Ljava/lang/String;
    //   59: aload_1
    //   60: invokevirtual 134	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   63: pop
    //   64: aload_1
    //   65: astore_0
    //   66: goto -36 -> 30
    //   69: astore_0
    //   70: ldc 2
    //   72: monitorexit
    //   73: aload_0
    //   74: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	75	0	paramClass	Class<?>
    //   42	23	1	localHashMap	HashMap
    // Exception table:
    //   from	to	target	type
    //   3	30	69	finally
    //   35	64	69	finally
  }
  
  public static Column getColumnOrId(Class<?> paramClass, String paramString)
  {
    if (getPrimaryKeyColumnName(paramClass).equals(paramString)) {
      return getId(paramClass);
    }
    return (Column)getColumnMap(paramClass).get(paramString);
  }
  
  public static Column getColumnOrId(Class<?> paramClass, Field paramField)
  {
    paramField = ColumnUtils.getColumnNameByField(paramField);
    if (getPrimaryKeyColumnName(paramClass).equals(paramField)) {
      return getId(paramClass);
    }
    return (Column)getColumnMap(paramClass).get(paramField);
  }
  
  public static String getExecAfterTableCreated(Class<?> paramClass)
  {
    paramClass = (Table)paramClass.getAnnotation(Table.class);
    if (paramClass != null) {
      return paramClass.execAfterTableCreated();
    }
    return null;
  }
  
  public static Id getId(Class<?> paramClass)
  {
    int j = 0;
    try
    {
      if (Object.class.equals(paramClass)) {
        throw new RuntimeException("field 'id' not found");
      }
    }
    finally {}
    if (entityIdMap.containsKey(paramClass.getCanonicalName()))
    {
      paramClass = (Id)entityIdMap.get(paramClass.getCanonicalName());
      return paramClass;
    }
    Object localObject2 = null;
    Object localObject1 = null;
    Field[] arrayOfField = paramClass.getDeclaredFields();
    int k;
    int i;
    if (arrayOfField != null)
    {
      k = arrayOfField.length;
      i = 0;
    }
    else
    {
      for (;;)
      {
        label88:
        localObject2 = localObject1;
        if (localObject1 == null)
        {
          k = arrayOfField.length;
          i = j;
          break label219;
        }
        if (localObject2 != null) {
          break label180;
        }
        paramClass = getId(paramClass.getSuperclass());
        break;
        label122:
        localObject2 = arrayOfField[i];
        if (((Field)localObject2).getAnnotation(com.lidroid.xutils.db.annotation.Id.class) == null) {
          break label231;
        }
        localObject1 = localObject2;
      }
    }
    label180:
    label211:
    label219:
    label231:
    label238:
    label241:
    label246:
    for (;;)
    {
      localObject2 = arrayOfField[i];
      if (!"id".equals(((Field)localObject2).getName()))
      {
        if (!"_id".equals(((Field)localObject2).getName())) {
          break label241;
        }
        break label238;
        localObject1 = new Id(paramClass, (Field)localObject2);
        entityIdMap.put(paramClass.getCanonicalName(), localObject1);
        paramClass = (Class<?>)localObject1;
        break;
        if (i >= k) {
          break label88;
        }
      }
      for (;;)
      {
        if (i < k) {
          break label246;
        }
        localObject2 = localObject1;
        break;
        i += 1;
        break label211;
        break label122;
        break;
        i += 1;
      }
    }
  }
  
  private static String getPrimaryKeyColumnName(Class<?> paramClass)
  {
    paramClass = getId(paramClass);
    if (paramClass == null) {
      return null;
    }
    return paramClass.getColumnName();
  }
  
  private static String getPrimaryKeyFieldName(Class<?> paramClass)
  {
    paramClass = getId(paramClass);
    if (paramClass == null) {
      return null;
    }
    return paramClass.getColumnField().getName();
  }
  
  public static String getTableName(Class<?> paramClass)
  {
    Table localTable = (Table)paramClass.getAnnotation(Table.class);
    if ((localTable == null) || (TextUtils.isEmpty(localTable.name()))) {
      return paramClass.getName().replace('.', '_');
    }
    return localTable.name();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\TableUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */