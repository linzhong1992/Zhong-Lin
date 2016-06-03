package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.table.ColumnUtils;
import com.lidroid.xutils.db.table.Finder;
import com.lidroid.xutils.db.table.TableUtils;
import com.lidroid.xutils.exception.DbException;
import java.util.List;

public class FinderLazyLoader<T>
{
  private final Finder finderColumn;
  private final Object finderValue;
  
  public FinderLazyLoader(Finder paramFinder, Object paramObject)
  {
    this.finderColumn = paramFinder;
    this.finderValue = ColumnUtils.convert2DbColumnValueIfNeeded(paramObject);
  }
  
  public FinderLazyLoader(Class<?> paramClass, String paramString, Object paramObject)
  {
    this.finderColumn = ((Finder)TableUtils.getColumnOrId(paramClass, paramString));
    this.finderValue = ColumnUtils.convert2DbColumnValueIfNeeded(paramObject);
  }
  
  public List<T> getAllFromDb()
    throws DbException
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (this.finderColumn != null)
    {
      localObject1 = localObject2;
      if (this.finderColumn.db != null) {
        localObject1 = this.finderColumn.db.findAll(Selector.from(this.finderColumn.getTargetEntityType()).where(this.finderColumn.getTargetColumnName(), "=", this.finderValue));
      }
    }
    return (List<T>)localObject1;
  }
  
  public T getFirstFromDb()
    throws DbException
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (this.finderColumn != null)
    {
      localObject1 = localObject2;
      if (this.finderColumn.db != null) {
        localObject1 = this.finderColumn.db.findFirst(Selector.from(this.finderColumn.getTargetEntityType()).where(this.finderColumn.getTargetColumnName(), "=", this.finderValue));
      }
    }
    return (T)localObject1;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\FinderLazyLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */