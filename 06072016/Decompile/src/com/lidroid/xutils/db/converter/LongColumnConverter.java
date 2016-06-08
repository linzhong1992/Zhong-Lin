package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class LongColumnConverter implements ColumnConverter<Long>
{
    @Override
    public Object fieldValue2ColumnValue(final Long n) {
        return n;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Long getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getLong(n);
    }
    
    @Override
    public Long getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return Long.valueOf(s);
    }
}
