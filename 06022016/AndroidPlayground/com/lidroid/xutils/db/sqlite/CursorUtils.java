package com.lidroid.xutils.db.sqlite;

import android.database.Cursor;
import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.table.Column;
import com.lidroid.xutils.db.table.DbModel;
import com.lidroid.xutils.db.table.Finder;
import com.lidroid.xutils.db.table.Foreign;
import com.lidroid.xutils.db.table.Id;
import com.lidroid.xutils.db.table.Table;
import com.lidroid.xutils.util.LogUtils;
import com.lidroid.xutils.util.core.DoubleKeyValueMap;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class CursorUtils
{
  public static DbModel getDbModel(Cursor paramCursor)
  {
    DbModel localDbModel = null;
    int j;
    int i;
    if (paramCursor != null)
    {
      localDbModel = new DbModel();
      j = paramCursor.getColumnCount();
      i = 0;
    }
    for (;;)
    {
      if (i >= j) {
        return localDbModel;
      }
      localDbModel.add(paramCursor.getColumnName(i), paramCursor.getString(i));
      i += 1;
    }
  }
  
  public static <T> T getEntity(DbUtils paramDbUtils, Cursor paramCursor, Class<T> paramClass, long paramLong)
  {
    Object localObject1;
    if ((paramDbUtils == null) || (paramCursor == null))
    {
      localObject1 = null;
      return (T)localObject1;
    }
    EntityTempCache.setSeq(paramLong);
    for (;;)
    {
      Table localTable;
      int i;
      try
      {
        localTable = Table.get(paramDbUtils, paramClass);
        Id localId = localTable.getId();
        i = paramCursor.getColumnIndex(localId.getColumnName());
        String str = paramCursor.getString(i);
        Object localObject2 = EntityTempCache.get(paramClass, str);
        localObject1 = localObject2;
        if (localObject2 != null) {
          break;
        }
        paramClass = paramClass.newInstance();
        localId.setValue2Entity(paramClass, paramCursor, i);
        EntityTempCache.put(paramClass, str);
        int j = paramCursor.getColumnCount();
        i = 0;
        if (i >= j)
        {
          paramCursor = localTable.columnMap.values().iterator();
          localObject1 = paramClass;
          if (!paramCursor.hasNext()) {
            break;
          }
          localObject1 = (Column)paramCursor.next();
          if (!(localObject1 instanceof Finder)) {
            continue;
          }
          localObject1 = (Finder)localObject1;
          ((Finder)localObject1).db = paramDbUtils;
          ((Finder)localObject1).setValue2Entity(paramClass, null, 0);
          continue;
        }
        localObject1 = paramCursor.getColumnName(i);
      }
      catch (Throwable paramDbUtils)
      {
        LogUtils.e(paramDbUtils.getMessage(), paramDbUtils);
        return null;
      }
      localObject1 = (Column)localTable.columnMap.get(localObject1);
      if (localObject1 != null) {
        if ((localObject1 instanceof Foreign))
        {
          localObject1 = (Foreign)localObject1;
          ((Foreign)localObject1).db = paramDbUtils;
          ((Foreign)localObject1).setValue2Entity(paramClass, paramCursor, i);
        }
        else
        {
          ((Column)localObject1).setValue2Entity(paramClass, paramCursor, i);
        }
      }
      i += 1;
    }
  }
  
  private static class EntityTempCache
  {
    private static final DoubleKeyValueMap<Class<?>, String, Object> cache = new DoubleKeyValueMap();
    private static long seq = 0L;
    
    public static <T> T get(Class<T> paramClass, String paramString)
    {
      return (T)cache.get(paramClass, paramString);
    }
    
    public static void put(Object paramObject, String paramString)
    {
      if ((paramObject != null) && (paramString != null)) {
        cache.put(paramObject.getClass(), paramString, paramObject);
      }
    }
    
    public static void setSeq(long paramLong)
    {
      if (seq != paramLong)
      {
        cache.clear();
        seq = paramLong;
      }
    }
  }
  
  public static class FindCacheSequence
  {
    private static final String FINDER_LAZY_LOADER_CLASS_NAME = FinderLazyLoader.class.getName();
    private static final String FOREIGN_LAZY_LOADER_CLASS_NAME;
    private static long seq = 0L;
    
    static
    {
      FOREIGN_LAZY_LOADER_CLASS_NAME = ForeignLazyLoader.class.getName();
    }
    
    public static long getSeq()
    {
      String str = Thread.currentThread().getStackTrace()[4].getClassName();
      if ((!str.equals(FOREIGN_LAZY_LOADER_CLASS_NAME)) && (!str.equals(FINDER_LAZY_LOADER_CLASS_NAME))) {
        seq += 1L;
      }
      return seq;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\CursorUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */