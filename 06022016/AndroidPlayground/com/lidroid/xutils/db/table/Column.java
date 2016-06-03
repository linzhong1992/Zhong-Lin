package com.lidroid.xutils.db.table;

import android.database.Cursor;
import com.lidroid.xutils.db.converter.ColumnConverter;
import com.lidroid.xutils.db.converter.ColumnConverterFactory;
import com.lidroid.xutils.db.sqlite.ColumnDbType;
import com.lidroid.xutils.util.LogUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Column
{
  protected final ColumnConverter columnConverter;
  protected final Field columnField;
  protected final String columnName;
  private final Object defaultValue;
  protected final Method getMethod;
  protected final Method setMethod;
  
  protected Column(Class<?> paramClass, Field paramField)
  {
    this.columnField = paramField;
    this.columnConverter = ColumnConverterFactory.getColumnConverter(paramField.getType());
    this.columnName = ColumnUtils.getColumnNameByField(paramField);
    if (this.columnConverter != null) {}
    for (this.defaultValue = this.columnConverter.getFieldValue(ColumnUtils.getColumnDefaultValue(paramField));; this.defaultValue = null)
    {
      this.getMethod = ColumnUtils.getColumnGetMethod(paramClass, paramField);
      this.setMethod = ColumnUtils.getColumnSetMethod(paramClass, paramField);
      return;
    }
  }
  
  public ColumnDbType getColumnDbType()
  {
    return this.columnConverter.getColumnDbType();
  }
  
  public Field getColumnField()
  {
    return this.columnField;
  }
  
  public String getColumnName()
  {
    return this.columnName;
  }
  
  public Object getColumnValue(Object paramObject)
  {
    paramObject = getFieldValue(paramObject);
    return this.columnConverter.fieldValue2ColumnValue(paramObject);
  }
  
  public Object getDefaultValue()
  {
    return this.defaultValue;
  }
  
  public Object getFieldValue(Object paramObject)
  {
    Object localObject = null;
    if ((paramObject == null) || (this.getMethod != null)) {
      try
      {
        localObject = this.getMethod.invoke(paramObject, new Object[0]);
        return localObject;
      }
      catch (Throwable paramObject)
      {
        LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
        return null;
      }
    }
    try
    {
      this.columnField.setAccessible(true);
      paramObject = this.columnField.get(paramObject);
      return paramObject;
    }
    catch (Throwable paramObject)
    {
      LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
    }
    return null;
  }
  
  public void setValue2Entity(Object paramObject, Cursor paramCursor, int paramInt)
  {
    paramCursor = this.columnConverter.getFieldValue(paramCursor, paramInt);
    if ((paramCursor == null) && (this.defaultValue == null)) {
      return;
    }
    Object localObject2;
    Object localObject1;
    if (this.setMethod != null) {
      try
      {
        localObject2 = this.setMethod;
        localObject1 = paramCursor;
        if (paramCursor == null) {
          localObject1 = this.defaultValue;
        }
        ((Method)localObject2).invoke(paramObject, new Object[] { localObject1 });
        return;
      }
      catch (Throwable paramObject)
      {
        LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
        return;
      }
    }
    try
    {
      this.columnField.setAccessible(true);
      localObject2 = this.columnField;
      localObject1 = paramCursor;
      if (paramCursor == null) {
        localObject1 = this.defaultValue;
      }
      ((Field)localObject2).set(paramObject, localObject1);
      return;
    }
    catch (Throwable paramObject)
    {
      LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\Column.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */