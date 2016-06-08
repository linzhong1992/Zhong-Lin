package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class ByteColumnConverter implements ColumnConverter<Byte>
{
    @Override
    public Object fieldValue2ColumnValue(final Byte b) {
        return b;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Byte getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return (byte)cursor.getInt(n);
    }
    
    @Override
    public Byte getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return Byte.valueOf(s);
    }
}
