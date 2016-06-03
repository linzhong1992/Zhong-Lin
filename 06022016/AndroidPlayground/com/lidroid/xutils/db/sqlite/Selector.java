package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.db.table.TableUtils;
import java.util.ArrayList;
import java.util.List;

public class Selector
{
  protected Class<?> entityType;
  protected int limit = 0;
  protected int offset = 0;
  protected List<OrderBy> orderByList;
  protected String tableName;
  protected WhereBuilder whereBuilder;
  
  private Selector(Class<?> paramClass)
  {
    this.entityType = paramClass;
    this.tableName = TableUtils.getTableName(paramClass);
  }
  
  public static Selector from(Class<?> paramClass)
  {
    return new Selector(paramClass);
  }
  
  public Selector and(WhereBuilder paramWhereBuilder)
  {
    this.whereBuilder.expr("AND (" + paramWhereBuilder.toString() + ")");
    return this;
  }
  
  public Selector and(String paramString1, String paramString2, Object paramObject)
  {
    this.whereBuilder.and(paramString1, paramString2, paramObject);
    return this;
  }
  
  public Selector expr(String paramString)
  {
    if (this.whereBuilder == null) {
      this.whereBuilder = WhereBuilder.b();
    }
    this.whereBuilder.expr(paramString);
    return this;
  }
  
  public Selector expr(String paramString1, String paramString2, Object paramObject)
  {
    if (this.whereBuilder == null) {
      this.whereBuilder = WhereBuilder.b();
    }
    this.whereBuilder.expr(paramString1, paramString2, paramObject);
    return this;
  }
  
  public Class<?> getEntityType()
  {
    return this.entityType;
  }
  
  public DbModelSelector groupBy(String paramString)
  {
    return new DbModelSelector(this, paramString);
  }
  
  public Selector limit(int paramInt)
  {
    this.limit = paramInt;
    return this;
  }
  
  public Selector offset(int paramInt)
  {
    this.offset = paramInt;
    return this;
  }
  
  public Selector or(WhereBuilder paramWhereBuilder)
  {
    this.whereBuilder.expr("OR (" + paramWhereBuilder.toString() + ")");
    return this;
  }
  
  public Selector or(String paramString1, String paramString2, Object paramObject)
  {
    this.whereBuilder.or(paramString1, paramString2, paramObject);
    return this;
  }
  
  public Selector orderBy(String paramString)
  {
    if (this.orderByList == null) {
      this.orderByList = new ArrayList(2);
    }
    this.orderByList.add(new OrderBy(paramString));
    return this;
  }
  
  public Selector orderBy(String paramString, boolean paramBoolean)
  {
    if (this.orderByList == null) {
      this.orderByList = new ArrayList(2);
    }
    this.orderByList.add(new OrderBy(paramString, paramBoolean));
    return this;
  }
  
  public DbModelSelector select(String... paramVarArgs)
  {
    return new DbModelSelector(this, paramVarArgs);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("SELECT ");
    localStringBuilder.append("*");
    localStringBuilder.append(" FROM ").append(this.tableName);
    if ((this.whereBuilder != null) && (this.whereBuilder.getWhereItemSize() > 0)) {
      localStringBuilder.append(" WHERE ").append(this.whereBuilder.toString());
    }
    int i;
    if (this.orderByList != null) {
      i = 0;
    }
    for (;;)
    {
      if (i >= this.orderByList.size())
      {
        if (this.limit > 0)
        {
          localStringBuilder.append(" LIMIT ").append(this.limit);
          localStringBuilder.append(" OFFSET ").append(this.offset);
        }
        return localStringBuilder.toString();
      }
      localStringBuilder.append(" ORDER BY ").append(((OrderBy)this.orderByList.get(i)).toString());
      i += 1;
    }
  }
  
  public Selector where(WhereBuilder paramWhereBuilder)
  {
    this.whereBuilder = paramWhereBuilder;
    return this;
  }
  
  public Selector where(String paramString1, String paramString2, Object paramObject)
  {
    this.whereBuilder = WhereBuilder.b(paramString1, paramString2, paramObject);
    return this;
  }
  
  protected class OrderBy
  {
    private String columnName;
    private boolean desc;
    
    public OrderBy(String paramString)
    {
      this.columnName = paramString;
    }
    
    public OrderBy(String paramString, boolean paramBoolean)
    {
      this.columnName = paramString;
      this.desc = paramBoolean;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(String.valueOf(this.columnName));
      if (this.desc) {}
      for (String str = " DESC";; str = " ASC") {
        return str;
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\Selector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */