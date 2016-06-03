package com.lidroid.xutils.db.converter;

import android.database.Cursor;
import android.text.TextUtils;
import com.lidroid.xutils.db.sqlite.ColumnDbType;

public class BooleanColumnConverter
  implements ColumnConverter<Boolean>
{
  public Object fieldValue2ColumnValue(Boolean paramBoolean)
  {
    if (paramBoolean == null) {
      return null;
    }
    if (paramBoolean.booleanValue()) {}
    for (int i = 1;; i = 0) {
      return Integer.valueOf(i);
    }
  }
  
  public ColumnDbType getColumnDbType()
  {
    return ColumnDbType.INTEGER;
  }
  
  public Boolean getFieldValue(Cursor paramCursor, int paramInt)
  {
    boolean bool = true;
    if (paramCursor.isNull(paramInt)) {
      return null;
    }
    if (paramCursor.getInt(paramInt) == 1) {}
    for (;;)
    {
      return Boolean.valueOf(bool);
      bool = false;
    }
  }
  
  public Boolean getFieldValue(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    if (paramString.length() == 1) {}
    for (boolean bool = "1".equals(paramString);; bool = Boolean.valueOf(paramString).booleanValue()) {
      return Boolean.valueOf(bool);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\converter\BooleanColumnConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */