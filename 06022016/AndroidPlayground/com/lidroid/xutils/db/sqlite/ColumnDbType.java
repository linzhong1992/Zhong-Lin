package com.lidroid.xutils.db.sqlite;

public enum ColumnDbType
{
  INTEGER("INTEGER"),  REAL("REAL"),  TEXT("TEXT"),  BLOB("BLOB");
  
  private String value;
  
  private ColumnDbType(String paramString1)
  {
    this.value = paramString1;
  }
  
  public String toString()
  {
    return this.value;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\ColumnDbType.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */