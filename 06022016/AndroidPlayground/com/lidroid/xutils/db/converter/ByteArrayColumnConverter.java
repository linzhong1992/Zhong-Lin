package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class ByteArrayColumnConverter
  implements ColumnConverter<byte[]>
{
  public Object fieldValue2ColumnValue(byte[] paramArrayOfByte)
  {
    return paramArrayOfByte;
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.BLOB;
  }
  
  public byte[] getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return paramCursor.getBlob(paramInt);
  }
  
  public byte[] getFieldValue(String paramString)
  {
    return null;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\ByteArrayColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */