package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.table.Column;
import com.lidroid.xutils.db.table.ColumnUtils;
import com.lidroid.xutils.db.table.Finder;
import com.lidroid.xutils.db.table.Foreign;
import com.lidroid.xutils.db.table.Id;
import com.lidroid.xutils.db.table.KeyValue;
import com.lidroid.xutils.db.table.TableUtils;
import com.lidroid.xutils.exception.DbException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public class SqlInfoBuilder
{
  public static SqlInfo buildCreateTableSqlInfo(Class<?> paramClass)
    throws DbException
  {
    Object localObject = TableUtils.getTableName(paramClass);
    Id localId = TableUtils.getId(paramClass);
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("CREATE TABLE IF NOT EXISTS ");
    localStringBuffer.append((String)localObject);
    localStringBuffer.append(" ( ");
    if (localId.isAutoIncrement())
    {
      localStringBuffer.append("\"").append(localId.getColumnName()).append("\"  ").append("INTEGER PRIMARY KEY AUTOINCREMENT,");
      paramClass = TableUtils.getColumnMap(paramClass).values().iterator();
    }
    for (;;)
    {
      if (!paramClass.hasNext())
      {
        localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
        localStringBuffer.append(" )");
        return new SqlInfo(localStringBuffer.toString());
        localStringBuffer.append("\"").append(localId.getColumnName()).append("\"  ").append(localId.getColumnDbType()).append(" PRIMARY KEY,");
        break;
      }
      localObject = (Column)paramClass.next();
      if (!(localObject instanceof Finder))
      {
        localStringBuffer.append("\"").append(((Column)localObject).getColumnName()).append("\"  ");
        localStringBuffer.append(((Column)localObject).getColumnDbType());
        if (ColumnUtils.isUnique(((Column)localObject).getColumnField())) {
          localStringBuffer.append(" UNIQUE");
        }
        if (ColumnUtils.isNotNull(((Column)localObject).getColumnField())) {
          localStringBuffer.append(" NOT NULL");
        }
        localObject = ColumnUtils.getCheck(((Column)localObject).getColumnField());
        if (localObject != null) {
          localStringBuffer.append(" CHECK(").append((String)localObject).append(")");
        }
        localStringBuffer.append(",");
      }
    }
  }
  
  private static String buildDeleteSqlByTableName(String paramString)
  {
    return "DELETE FROM " + paramString;
  }
  
  public static SqlInfo buildDeleteSqlInfo(Class<?> paramClass, WhereBuilder paramWhereBuilder)
    throws DbException
  {
    paramClass = new StringBuilder(buildDeleteSqlByTableName(TableUtils.getTableName(paramClass)));
    if ((paramWhereBuilder != null) && (paramWhereBuilder.getWhereItemSize() > 0)) {
      paramClass.append(" WHERE ").append(paramWhereBuilder.toString());
    }
    return new SqlInfo(paramClass.toString());
  }
  
  public static SqlInfo buildDeleteSqlInfo(Class<?> paramClass, Object paramObject)
    throws DbException
  {
    SqlInfo localSqlInfo = new SqlInfo();
    String str = TableUtils.getTableName(paramClass);
    Id localId = TableUtils.getId(paramClass);
    if (paramObject == null) {
      throw new DbException("this entity[" + paramClass + "]'s id value is null");
    }
    paramClass = new StringBuilder(buildDeleteSqlByTableName(str));
    paramClass.append(" WHERE ").append(WhereBuilder.b(localId.getColumnName(), "=", paramObject));
    localSqlInfo.setSql(paramClass.toString());
    return localSqlInfo;
  }
  
  public static SqlInfo buildDeleteSqlInfo(Object paramObject)
    throws DbException
  {
    SqlInfo localSqlInfo = new SqlInfo();
    Object localObject1 = paramObject.getClass();
    String str = TableUtils.getTableName((Class)localObject1);
    localObject1 = TableUtils.getId((Class)localObject1);
    Object localObject2 = ((Id)localObject1).getColumnValue(paramObject);
    if (localObject2 == null) {
      throw new DbException("this entity[" + paramObject.getClass() + "]'s id value is null");
    }
    paramObject = new StringBuilder(buildDeleteSqlByTableName(str));
    ((StringBuilder)paramObject).append(" WHERE ").append(WhereBuilder.b(((Id)localObject1).getColumnName(), "=", localObject2));
    localSqlInfo.setSql(((StringBuilder)paramObject).toString());
    return localSqlInfo;
  }
  
  public static SqlInfo buildInsertSqlInfo(DbUtils paramDbUtils, Object paramObject)
    throws DbException
  {
    paramDbUtils = entity2KeyValueList(paramDbUtils, paramObject);
    if (paramDbUtils.size() == 0) {
      return null;
    }
    SqlInfo localSqlInfo = new SqlInfo();
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("INSERT INTO ");
    localStringBuffer.append(TableUtils.getTableName(paramObject.getClass()));
    localStringBuffer.append(" (");
    paramObject = paramDbUtils.iterator();
    int j;
    int i;
    if (!((Iterator)paramObject).hasNext())
    {
      localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
      localStringBuffer.append(") VALUES (");
      j = paramDbUtils.size();
      i = 0;
    }
    for (;;)
    {
      if (i >= j)
      {
        localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
        localStringBuffer.append(")");
        localSqlInfo.setSql(localStringBuffer.toString());
        return localSqlInfo;
        KeyValue localKeyValue = (KeyValue)((Iterator)paramObject).next();
        localStringBuffer.append(localKeyValue.getKey()).append(",");
        localSqlInfo.addBindArgWithoutConverter(localKeyValue.getValue());
        break;
      }
      localStringBuffer.append("?,");
      i += 1;
    }
  }
  
  public static SqlInfo buildReplaceSqlInfo(DbUtils paramDbUtils, Object paramObject)
    throws DbException
  {
    paramDbUtils = entity2KeyValueList(paramDbUtils, paramObject);
    if (paramDbUtils.size() == 0) {
      return null;
    }
    SqlInfo localSqlInfo = new SqlInfo();
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("REPLACE INTO ");
    localStringBuffer.append(TableUtils.getTableName(paramObject.getClass()));
    localStringBuffer.append(" (");
    paramObject = paramDbUtils.iterator();
    int j;
    int i;
    if (!((Iterator)paramObject).hasNext())
    {
      localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
      localStringBuffer.append(") VALUES (");
      j = paramDbUtils.size();
      i = 0;
    }
    for (;;)
    {
      if (i >= j)
      {
        localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
        localStringBuffer.append(")");
        localSqlInfo.setSql(localStringBuffer.toString());
        return localSqlInfo;
        KeyValue localKeyValue = (KeyValue)((Iterator)paramObject).next();
        localStringBuffer.append(localKeyValue.getKey()).append(",");
        localSqlInfo.addBindArgWithoutConverter(localKeyValue.getValue());
        break;
      }
      localStringBuffer.append("?,");
      i += 1;
    }
  }
  
  public static SqlInfo buildUpdateSqlInfo(DbUtils paramDbUtils, Object paramObject, WhereBuilder paramWhereBuilder, String... paramVarArgs)
    throws DbException
  {
    Object localObject2 = entity2KeyValueList(paramDbUtils, paramObject);
    if (((List)localObject2).size() == 0) {
      return null;
    }
    Object localObject1 = null;
    paramDbUtils = (DbUtils)localObject1;
    if (paramVarArgs != null)
    {
      paramDbUtils = (DbUtils)localObject1;
      if (paramVarArgs.length > 0)
      {
        paramDbUtils = new HashSet(paramVarArgs.length);
        Collections.addAll(paramDbUtils, paramVarArgs);
      }
    }
    localObject1 = TableUtils.getTableName(paramObject.getClass());
    paramObject = new SqlInfo();
    paramVarArgs = new StringBuffer("UPDATE ");
    paramVarArgs.append((String)localObject1);
    paramVarArgs.append(" SET ");
    localObject1 = ((List)localObject2).iterator();
    for (;;)
    {
      if (!((Iterator)localObject1).hasNext())
      {
        paramVarArgs.deleteCharAt(paramVarArgs.length() - 1);
        if ((paramWhereBuilder != null) && (paramWhereBuilder.getWhereItemSize() > 0)) {
          paramVarArgs.append(" WHERE ").append(paramWhereBuilder.toString());
        }
        ((SqlInfo)paramObject).setSql(paramVarArgs.toString());
        return (SqlInfo)paramObject;
      }
      localObject2 = (KeyValue)((Iterator)localObject1).next();
      if ((paramDbUtils == null) || (paramDbUtils.contains(((KeyValue)localObject2).getKey())))
      {
        paramVarArgs.append(((KeyValue)localObject2).getKey()).append("=?,");
        ((SqlInfo)paramObject).addBindArgWithoutConverter(((KeyValue)localObject2).getValue());
      }
    }
  }
  
  public static SqlInfo buildUpdateSqlInfo(DbUtils paramDbUtils, Object paramObject, String... paramVarArgs)
    throws DbException
  {
    Object localObject2 = entity2KeyValueList(paramDbUtils, paramObject);
    if (((List)localObject2).size() == 0) {
      return null;
    }
    Object localObject1 = null;
    paramDbUtils = (DbUtils)localObject1;
    if (paramVarArgs != null)
    {
      paramDbUtils = (DbUtils)localObject1;
      if (paramVarArgs.length > 0)
      {
        paramDbUtils = new HashSet(paramVarArgs.length);
        Collections.addAll(paramDbUtils, paramVarArgs);
      }
    }
    paramVarArgs = paramObject.getClass();
    Object localObject3 = TableUtils.getTableName(paramVarArgs);
    paramVarArgs = TableUtils.getId(paramVarArgs);
    localObject1 = paramVarArgs.getColumnValue(paramObject);
    if (localObject1 == null) {
      throw new DbException("this entity[" + paramObject.getClass() + "]'s id value is null");
    }
    paramObject = new SqlInfo();
    StringBuffer localStringBuffer = new StringBuffer("UPDATE ");
    localStringBuffer.append((String)localObject3);
    localStringBuffer.append(" SET ");
    localObject2 = ((List)localObject2).iterator();
    for (;;)
    {
      if (!((Iterator)localObject2).hasNext())
      {
        localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
        localStringBuffer.append(" WHERE ").append(WhereBuilder.b(paramVarArgs.getColumnName(), "=", localObject1));
        ((SqlInfo)paramObject).setSql(localStringBuffer.toString());
        return (SqlInfo)paramObject;
      }
      localObject3 = (KeyValue)((Iterator)localObject2).next();
      if ((paramDbUtils == null) || (paramDbUtils.contains(((KeyValue)localObject3).getKey())))
      {
        localStringBuffer.append(((KeyValue)localObject3).getKey()).append("=?,");
        ((SqlInfo)paramObject).addBindArgWithoutConverter(((KeyValue)localObject3).getValue());
      }
    }
  }
  
  private static KeyValue column2KeyValue(Object paramObject, Column paramColumn)
  {
    Object localObject1 = null;
    String str = paramColumn.getColumnName();
    Object localObject2 = paramColumn.getColumnValue(paramObject);
    paramObject = localObject2;
    if (localObject2 == null) {
      paramObject = paramColumn.getDefaultValue();
    }
    paramColumn = (Column)localObject1;
    if (str != null) {
      paramColumn = new KeyValue(str, paramObject);
    }
    return paramColumn;
  }
  
  public static List<KeyValue> entity2KeyValueList(DbUtils paramDbUtils, Object paramObject)
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = paramObject.getClass();
    Object localObject2 = TableUtils.getId((Class)localObject1);
    if (!((Id)localObject2).isAutoIncrement())
    {
      Object localObject3 = ((Id)localObject2).getColumnValue(paramObject);
      localArrayList.add(new KeyValue(((Id)localObject2).getColumnName(), localObject3));
    }
    localObject1 = TableUtils.getColumnMap((Class)localObject1).values().iterator();
    for (;;)
    {
      if (!((Iterator)localObject1).hasNext()) {
        return localArrayList;
      }
      localObject2 = (Column)((Iterator)localObject1).next();
      if ((localObject2 instanceof Finder))
      {
        ((Finder)localObject2).db = paramDbUtils;
      }
      else
      {
        if ((localObject2 instanceof Foreign)) {
          ((Foreign)localObject2).db = paramDbUtils;
        }
        localObject2 = column2KeyValue(paramObject, (Column)localObject2);
        if (localObject2 != null) {
          localArrayList.add(localObject2);
        }
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\SqlInfoBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */