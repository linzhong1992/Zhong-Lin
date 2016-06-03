package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.ColumnDbType;
import java.util.concurrent.ConcurrentHashMap;

public class ColumnConverterFactory
{
  private static final ConcurrentHashMap<String, ColumnConverter> columnType_columnConverter_map = new ConcurrentHashMap();
  
  static
  {
    Object localObject = new BooleanColumnConverter();
    columnType_columnConverter_map.put(Boolean.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Boolean.class.getCanonicalName(), localObject);
    localObject = new ByteArrayColumnConverter();
    columnType_columnConverter_map.put(byte[].class.getCanonicalName(), localObject);
    localObject = new ByteColumnConverter();
    columnType_columnConverter_map.put(Byte.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Byte.class.getCanonicalName(), localObject);
    localObject = new CharColumnConverter();
    columnType_columnConverter_map.put(Character.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Character.class.getCanonicalName(), localObject);
    localObject = new DateColumnConverter();
    columnType_columnConverter_map.put(java.util.Date.class.getCanonicalName(), localObject);
    localObject = new DoubleColumnConverter();
    columnType_columnConverter_map.put(Double.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Double.class.getCanonicalName(), localObject);
    localObject = new FloatColumnConverter();
    columnType_columnConverter_map.put(Float.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Float.class.getCanonicalName(), localObject);
    localObject = new IntegerColumnConverter();
    columnType_columnConverter_map.put(Integer.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Integer.class.getCanonicalName(), localObject);
    localObject = new LongColumnConverter();
    columnType_columnConverter_map.put(Long.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Long.class.getCanonicalName(), localObject);
    localObject = new ShortColumnConverter();
    columnType_columnConverter_map.put(Short.TYPE.getCanonicalName(), localObject);
    columnType_columnConverter_map.put(Short.class.getCanonicalName(), localObject);
    localObject = new SqlDateColumnConverter();
    columnType_columnConverter_map.put(java.sql.Date.class.getCanonicalName(), localObject);
    localObject = new StringColumnConverter();
    columnType_columnConverter_map.put(String.class.getCanonicalName(), localObject);
  }
  
  public static ColumnConverter getColumnConverter(Class paramClass)
  {
    if (columnType_columnConverter_map.containsKey(paramClass.getCanonicalName())) {
      return (ColumnConverter)columnType_columnConverter_map.get(paramClass.getCanonicalName());
    }
    if (ColumnConverter.class.isAssignableFrom(paramClass)) {
      try
      {
        ColumnConverter localColumnConverter = (ColumnConverter)paramClass.newInstance();
        if (localColumnConverter != null) {
          columnType_columnConverter_map.put(paramClass.getCanonicalName(), localColumnConverter);
        }
        return localColumnConverter;
      }
      catch (Throwable paramClass) {}
    }
    return null;
  }
  
  public static ColumnDbType getDbColumnType(Class paramClass)
  {
    paramClass = getColumnConverter(paramClass);
    if (paramClass != null) {
      return paramClass.getColumnDbType();
    }
    return ColumnDbType.TEXT;
  }
  
  public static boolean isSupportColumnConverter(Class paramClass)
  {
    if (columnType_columnConverter_map.containsKey(paramClass.getCanonicalName())) {}
    for (;;)
    {
      return true;
      if (ColumnConverter.class.isAssignableFrom(paramClass)) {
        try
        {
          ColumnConverter localColumnConverter = (ColumnConverter)paramClass.newInstance();
          if (localColumnConverter != null) {
            columnType_columnConverter_map.put(paramClass.getCanonicalName(), localColumnConverter);
          }
          if (localColumnConverter != null) {
            return false;
          }
        }
        catch (Throwable paramClass) {}
      }
    }
    return false;
  }
  
  public static void registerColumnConverter(Class paramClass, ColumnConverter paramColumnConverter)
  {
    columnType_columnConverter_map.put(paramClass.getCanonicalName(), paramColumnConverter);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\ColumnConverterFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */