package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class StringColumnConverter
  implements ColumnConverter<String>
{
  public Object fieldValue2ColumnValue(String paramString)
  {
    return paramString;
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.TEXT;
  }
  
  public String getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return paramCursor.getString(paramInt);
  }
  
  public String getFieldValue(String paramString)
  {
    return paramString;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\StringColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */