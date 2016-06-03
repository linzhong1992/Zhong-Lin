package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import android.text.TextUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class ShortColumnConverter
  implements ColumnConverter<Short>
{
  public Object fieldValue2ColumnValue(Short paramShort)
  {
    return paramShort;
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.INTEGER;
  }
  
  public Short getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return Short.valueOf(paramCursor.getShort(paramInt));
  }
  
  public Short getFieldValue(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    return Short.valueOf(paramString);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\ShortColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */