package com.lidroid.xutils.db.table;

import android.database.Cursor;
import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.converter.ColumnConverter;
import com.lidroid.xutils.db.converter.ColumnConverterFactory;
import com.lidroid.xutils.db.sqlite.ColumnDbType;
import com.lidroid.xutils.db.sqlite.ForeignLazyLoader;
import com.lidroid.xutils.exception.DbException;
import com.lidroid.xutils.util.LogUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

public class Foreign
  extends Column
{
  public DbUtils db;
  private final ColumnConverter foreignColumnConverter;
  private final String foreignColumnName;
  
  protected Foreign(Class<?> paramClass, Field paramField)
  {
    super(paramClass, paramField);
    this.foreignColumnName = ColumnUtils.getForeignColumnNameByField(paramField);
    this.foreignColumnConverter = ColumnConverterFactory.getColumnConverter(TableUtils.getColumnOrId(getForeignEntityType(), this.foreignColumnName).columnField.getType());
  }
  
  public ColumnDbType getColumnDbType()
  {
    return this.foreignColumnConverter.getColumnDbType();
  }
  
  public Object getColumnValue(Object paramObject)
  {
    Object localObject3 = getFieldValue(paramObject);
    Column localColumn1 = null;
    List localList = null;
    Column localColumn2 = null;
    Object localObject1 = localColumn2;
    if (localObject3 != null)
    {
      localObject1 = this.columnField.getType();
      if (!localObject1.equals(ForeignLazyLoader.class)) {
        break label52;
      }
      localObject1 = ((ForeignLazyLoader)localObject3).getColumnValue();
    }
    for (;;)
    {
      return localObject1;
      label52:
      if (localObject1.equals(List.class))
      {
        paramObject = localColumn1;
        try
        {
          localList = (List)localObject3;
          localObject1 = localColumn2;
          paramObject = localColumn1;
          if (localList.size() > 0)
          {
            paramObject = localColumn1;
            localColumn2 = TableUtils.getColumnOrId(ColumnUtils.getForeignEntityType(this), this.foreignColumnName);
            paramObject = localColumn1;
            localObject1 = localColumn2.getColumnValue(localList.get(0));
            paramObject = localObject1;
            if ((this.db != null) && (localObject1 == null))
            {
              paramObject = localObject1;
              if ((localColumn2 instanceof Id))
              {
                paramObject = localObject1;
                this.db.saveOrUpdateAll(localList);
              }
            }
            paramObject = localObject1;
            localObject1 = localColumn2.getColumnValue(localList.get(0));
            return localObject1;
          }
        }
        catch (Throwable localThrowable1)
        {
          LogUtils.e(localThrowable1.getMessage(), localThrowable1);
          return paramObject;
        }
      }
    }
    paramObject = localList;
    try
    {
      localColumn1 = TableUtils.getColumnOrId(localThrowable1, this.foreignColumnName);
      paramObject = localList;
      Object localObject2 = localColumn1.getColumnValue(localObject3);
      paramObject = localObject2;
      if ((this.db != null) && (localObject2 == null))
      {
        paramObject = localObject2;
        boolean bool = localColumn1 instanceof Id;
        if (bool) {
          paramObject = localObject2;
        }
      }
      try
      {
        this.db.saveOrUpdate(localObject3);
        paramObject = localObject2;
        return localColumn1.getColumnValue(localObject3);
      }
      catch (DbException localDbException)
      {
        for (;;)
        {
          paramObject = localObject2;
          LogUtils.e(localDbException.getMessage(), localDbException);
        }
      }
      return paramObject;
    }
    catch (Throwable localThrowable2)
    {
      LogUtils.e(localThrowable2.getMessage(), localThrowable2);
    }
  }
  
  public Object getDefaultValue()
  {
    return null;
  }
  
  public String getForeignColumnName()
  {
    return this.foreignColumnName;
  }
  
  public Class<?> getForeignEntityType()
  {
    return ColumnUtils.getForeignEntityType(this);
  }
  
  public void setValue2Entity(Object paramObject, Cursor paramCursor, int paramInt)
  {
    Object localObject1 = this.foreignColumnConverter.getFieldValue(paramCursor, paramInt);
    if (localObject1 == null) {
      return;
    }
    paramCursor = null;
    Class localClass = this.columnField.getType();
    if (localClass.equals(ForeignLazyLoader.class)) {
      paramCursor = new ForeignLazyLoader(this, localObject1);
    }
    while (this.setMethod != null)
    {
      try
      {
        this.setMethod.invoke(paramObject, new Object[] { paramCursor });
        return;
      }
      catch (Throwable paramObject)
      {
        LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
        return;
      }
      if (localClass.equals(List.class)) {
        try
        {
          localObject1 = new ForeignLazyLoader(this, localObject1).getAllFromDb();
          paramCursor = (Cursor)localObject1;
        }
        catch (DbException localDbException1)
        {
          LogUtils.e(localDbException1.getMessage(), localDbException1);
        }
      } else {
        try
        {
          Object localObject2 = new ForeignLazyLoader(this, localDbException1).getFirstFromDb();
          paramCursor = (Cursor)localObject2;
        }
        catch (DbException localDbException2)
        {
          LogUtils.e(localDbException2.getMessage(), localDbException2);
        }
      }
    }
    try
    {
      this.columnField.setAccessible(true);
      this.columnField.set(paramObject, paramCursor);
      return;
    }
    catch (Throwable paramObject)
    {
      LogUtils.e(((Throwable)paramObject).getMessage(), (Throwable)paramObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\Foreign.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */