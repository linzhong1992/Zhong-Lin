package com.lidroid.xutils.db.table;

import java.util.HashMap;

public class DbModel
{
  private HashMap<String, String> dataMap = new HashMap();
  
  public void add(String paramString1, String paramString2)
  {
    this.dataMap.put(paramString1, paramString2);
  }
  
  public boolean getBoolean(String paramString)
  {
    paramString = getString(paramString);
    if (paramString != null)
    {
      if (paramString.length() == 1) {
        return "1".equals(paramString);
      }
      return Boolean.valueOf(paramString).booleanValue();
    }
    return false;
  }
  
  public HashMap<String, String> getDataMap()
  {
    return this.dataMap;
  }
  
  public java.util.Date getDate(String paramString)
  {
    return new java.util.Date(Long.valueOf(getString(paramString)).longValue());
  }
  
  public double getDouble(String paramString)
  {
    return Double.valueOf(getString(paramString)).doubleValue();
  }
  
  public float getFloat(String paramString)
  {
    return Float.valueOf(getString(paramString)).floatValue();
  }
  
  public int getInt(String paramString)
  {
    return Integer.valueOf(getString(paramString)).intValue();
  }
  
  public long getLong(String paramString)
  {
    return Long.valueOf(getString(paramString)).longValue();
  }
  
  public java.sql.Date getSqlDate(String paramString)
  {
    return new java.sql.Date(Long.valueOf(getString(paramString)).longValue());
  }
  
  public String getString(String paramString)
  {
    return (String)this.dataMap.get(paramString);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\DbModel.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */