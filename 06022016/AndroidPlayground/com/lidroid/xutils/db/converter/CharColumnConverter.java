package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import android.text.TextUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class CharColumnConverter
  implements ColumnConverter<Character>
{
  public Object fieldValue2ColumnValue(Character paramCharacter)
  {
    if (paramCharacter == null) {
      return null;
    }
    return Integer.valueOf(paramCharacter.charValue());
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.INTEGER;
  }
  
  public Character getFieldValue(Cursor paramCursor, int paramInt)
  {
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    return Character.valueOf((char)paramCursor.getInt(paramInt));
  }
  
  public Character getFieldValue(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    return Character.valueOf(paramString.charAt(0));
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\CharColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */