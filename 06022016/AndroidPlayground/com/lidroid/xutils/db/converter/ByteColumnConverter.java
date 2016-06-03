package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import android.text.TextUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class ByteColumnConverter
  implements ColumnConverter<Byte>
{
  public Object fieldValue2ColumnValue(Byte paramByte)
  {
    return paramByte;
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.INTEGER;
  }
  
  public Byte getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return Byte.valueOf((byte)paramCursor.getInt(paramInt));
  }
  
  public Byte getFieldValue(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    return Byte.valueOf(paramString);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\ByteColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */