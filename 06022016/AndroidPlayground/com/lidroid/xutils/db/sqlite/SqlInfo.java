package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.db.table.ColumnUtils;
import java.util.LinkedList;

public class SqlInfo
{
  private LinkedList<Object> bindArgs;
  private String sql;
  
  public SqlInfo() {}
  
  public SqlInfo(String paramString)
  {
    this.sql = paramString;
  }
  
  public SqlInfo(String paramString, Object... paramVarArgs)
  {
    this.sql = paramString;
    addBindArgs(paramVarArgs);
  }
  
  public void addBindArg(Object paramObject)
  {
    if (this.bindArgs == null) {
      this.bindArgs = new LinkedList();
    }
    this.bindArgs.add(ColumnUtils.convert2DbColumnValueIfNeeded(paramObject));
  }
  
  void addBindArgWithoutConverter(Object paramObject)
  {
    if (this.bindArgs == null) {
      this.bindArgs = new LinkedList();
    }
    this.bindArgs.add(paramObject);
  }
  
  public void addBindArgs(Object... paramVarArgs)
  {
    int j;
    int i;
    if (paramVarArgs != null)
    {
      j = paramVarArgs.length;
      i = 0;
    }
    for (;;)
    {
      if (i >= j) {
        return;
      }
      addBindArg(paramVarArgs[i]);
      i += 1;
    }
  }
  
  public LinkedList<Object> getBindArgs()
  {
    return this.bindArgs;
  }
  
  public Object[] getBindArgsAsArray()
  {
    if (this.bindArgs != null) {
      return this.bindArgs.toArray();
    }
    return null;
  }
  
  public String[] getBindArgsAsStrArray()
  {
    if (this.bindArgs != null)
    {
      String[] arrayOfString = new String[this.bindArgs.size()];
      int i = 0;
      if (i >= this.bindArgs.size()) {
        return arrayOfString;
      }
      Object localObject = this.bindArgs.get(i);
      if (localObject == null) {}
      for (localObject = null;; localObject = localObject.toString())
      {
        arrayOfString[i] = localObject;
        i += 1;
        break;
      }
    }
    return null;
  }
  
  public String getSql()
  {
    return this.sql;
  }
  
  public void setSql(String paramString)
  {
    this.sql = paramString;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\SqlInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */