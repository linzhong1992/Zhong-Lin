package com.lidroid.xutils.db.table;

import android.database.Cursor;
import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;
import com.lidroid.xutils.db.sqlite.FinderLazyLoader;
import com.lidroid.xutils.exception.DbException;
import com.lidroid.xutils.util.LogUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

public class Finder
  extends Column
{
  public DbUtils db;
  private final String targetColumnName;
  private final String valueColumnName;
  
  protected Finder(Class<?> paramClass, Field paramField)
  {
    super(paramClass, paramField);
    paramClass = (com.lidroid.xutils.db.annotation.Finder)paramField.getAnnotation(com.lidroid.xutils.db.annotation.Finder.class);
    this.valueColumnName = paramClass.valueColumn();
    this.targetColumnName = paramClass.targetColumn();
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.TEXT;
  }
  
  public Object getColumnValue(Object paramObject)
  {
    return null;
  }
  
  public Object getDefaultValue()
  {
    return null;
  }
  
  public String getTargetColumnName()
  {
    return this.targetColumnName;
  }
  
  public Class<?> getTargetEntityType()
  {
    return ColumnUtils.getFinderTargetEntityType(this);
  }
  
  public void setValue2Entity(Object paramObject, Cursor paramCursor, int paramInt)
  {
    paramCursor = null;
    Object localObject1 = this.columnField.getType();
    Object localObject3 = TableUtils.getColumnOrId(paramObject.getClass(), this.valueColumnName).getColumnValue(paramObject);
    if (localObject1.equals(FinderLazyLoader.class)) {
      paramCursor = new FinderLazyLoader(this, localObject3);
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
      if (localObject1.equals(List.class)) {
        try
        {
          localObject1 = new FinderLazyLoader(this, localObject3).getAllFromDb();
          paramCursor = (Cursor)localObject1;
        }
        catch (DbException localDbException1)
        {
          LogUtils.e(localDbException1.getMessage(), localDbException1);
        }
      } else {
        try
        {
          Object localObject2 = new FinderLazyLoader(this, localObject3).getFirstFromDb();
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


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\Finder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */