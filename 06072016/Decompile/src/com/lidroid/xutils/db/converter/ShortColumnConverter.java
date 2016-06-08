package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class ShortColumnConverter implements ColumnConverter<Short>
{
    @Override
    public Object fieldValue2ColumnValue(final Short n) {
        return n;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Short getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getShort(n);
    }
    
    @Override
    public Short getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return Short.valueOf(s);
    }
}
