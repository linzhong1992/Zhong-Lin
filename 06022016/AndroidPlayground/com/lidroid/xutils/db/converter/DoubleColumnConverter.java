package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import android.text.TextUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class DoubleColumnConverter
  implements ColumnConverter<Double>
{
  public Object fieldValue2ColumnValue(Double paramDouble)
  {
    return paramDouble;
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.REAL;
  }
  
  public Double getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return Double.valueOf(paramCursor.getDouble(paramInt));
  }
  
  public Double getFieldValue(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    return Double.valueOf(paramString);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\DoubleColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */