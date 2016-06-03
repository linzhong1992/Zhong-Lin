package com.lidroid.xutils.db.table;

import com.lidroid.xutils.db.annotation.NoAutoIncrement;
import com.lidroid.xutils.util.LogUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashSet;

public class Id
  extends Column
{
  private static final HashSet<String> AUTO_INCREMENT_TYPES;
  private static final HashSet<String> INTEGER_TYPES = new HashSet(2);
  private String columnFieldClassName = this.columnField.getType().getCanonicalName();
  private boolean isAutoIncrement = false;
  private boolean isAutoIncrementChecked = false;
  
  static
  {
    AUTO_INCREMENT_TYPES = new HashSet(4);
    INTEGER_TYPES.add(Integer.TYPE.getCanonicalName());
    INTEGER_TYPES.add(Integer.class.getCanonicalName());
    AUTO_INCREMENT_TYPES.addAll(INTEGER_TYPES);
    AUTO_INCREMENT_TYPES.add(Long.TYPE.getCanonicalName());
    AUTO_INCREMENT_TYPES.add(Long.class.getCanonicalName());
  }
  
  protected Id(Class<?> paramClass, Field paramField)
  {
    super(paramClass, paramField);
  }
  
  public Object getColumnValue(Object paramObject)
  {
    Object localObject = super.getColumnValue(paramObject);
    if (localObject != null)
    {
      paramObject = localObject;
      if (isAutoIncrement()) {
        if (!localObject.equals(Integer.valueOf(0)))
        {
          paramObject = localObject;
          if (!localObject.equals(Long.valueOf(0L))) {}
        }
        else
        {
          paramObject = null;
        }
      }
      return paramObject;
    }
    return null;
  }
  
  public boolean isAutoIncrement()
  {
    boolean bool = true;
    if (!this.isAutoIncrementChecked)
    {
      this.isAutoIncrementChecked = true;
      if ((this.columnField.getAnnotation(NoAutoIncrement.class) != null) || (!AUTO_INCREMENT_TYPES.contains(this.columnFieldClassName))) {
        break label49;
      }
    }
    for (;;)
    {
      this.isAutoIncrement = bool;
      return this.isAutoIncrement;
      label49:
      bool = false;
    }
  }
  
  public void setAutoIncrementId(Object paramObject, long paramLong)
  {
    Object localObject = Long.valueOf(paramLong);
    if (INTEGER_TYPES.contains(this.columnFieldClassName)) {
      localObject = Integer.valueOf((int)paramLong);
    }
    if (this.setMethod != null) {
      try
      {
        this.setMethod.invoke(paramObject, new Object[] { localObject });
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
      this.columnField.set(paramObject, localObject);
      return;
    }
    catch (Throwable paramObject)
    {
      LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\Id.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */