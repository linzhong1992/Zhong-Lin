package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.table.ColumnUtils;
import com.lidroid.xutils.db.table.Foreign;
import com.lidroid.xutils.db.table.TableUtils;
import com.lidroid.xutils.exception.DbException;
import java.util.List;

public class ForeignLazyLoader<T>
{
  private Object columnValue;
  private final Foreign foreignColumn;
  
  public ForeignLazyLoader(Foreign paramForeign, Object paramObject)
  {
    this.foreignColumn = paramForeign;
    this.columnValue = ColumnUtils.convert2DbColumnValueIfNeeded(paramObject);
  }
  
  public ForeignLazyLoader(Class<?> paramClass, String paramString, Object paramObject)
  {
    this.foreignColumn = ((Foreign)TableUtils.getColumnOrId(paramClass, paramString));
    this.columnValue = ColumnUtils.convert2DbColumnValueIfNeeded(paramObject);
  }
  
  public List<T> getAllFromDb()
    throws DbException
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (this.foreignColumn != null)
    {
      localObject1 = localObject2;
      if (this.foreignColumn.db != null) {
        localObject1 = this.foreignColumn.db.findAll(Selector.from(this.foreignColumn.getForeignEntityType()).where(this.foreignColumn.getForeignColumnName(), "=", this.columnValue));
      }
    }
    return (List<T>)localObject1;
  }
  
  public Object getColumnValue()
  {
    return this.columnValue;
  }
  
  public T getFirstFromDb()
    throws DbException
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (this.foreignColumn != null)
    {
      localObject1 = localObject2;
      if (this.foreignColumn.db != null) {
        localObject1 = this.foreignColumn.db.findFirst(Selector.from(this.foreignColumn.getForeignEntityType()).where(this.foreignColumn.getForeignColumnName(), "=", this.columnValue));
      }
    }
    return (T)localObject1;
  }
  
  public void setColumnValue(Object paramObject)
  {
    this.columnValue = ColumnUtils.convert2DbColumnValueIfNeeded(paramObject);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\ForeignLazyLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */