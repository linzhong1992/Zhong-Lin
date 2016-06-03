package com.lidroid.xutils.db.table;

public class KeyValue
{
  private String key;
  private Object value;
  
  public KeyValue(String paramString, Object paramObject)
  {
    this.key = paramString;
    this.value = paramObject;
  }
  
  public String getKey()
  {
    return this.key;
  }
  
  public Object getValue()
  {
    return this.value;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\KeyValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */