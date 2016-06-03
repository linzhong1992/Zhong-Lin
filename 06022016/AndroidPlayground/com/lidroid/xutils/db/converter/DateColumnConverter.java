package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import android.text.TextUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;
import java.util.Date;

public class DateColumnConverter
  implements ColumnConverter<Date>
{
  public Object fieldValue2ColumnValue(Date paramDate)
  {
    if (paramDate == null) {
      return null;
    }
    return Long.valueOf(paramDate.getTime());
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.INTEGER;
  }
  
  public Date getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return new Date(paramCursor.getLong(paramInt));
  }
  
  public Date getFieldValue(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    return new Date(Long.valueOf(paramString).longValue());
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\DateColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */