package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class IntegerColumnConverter implements ColumnConverter<Integer>
{
    @Override
    public Object fieldValue2ColumnValue(final Integer n) {
        return n;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Integer getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getInt(n);
    }
    
    @Override
    public Integer getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return Integer.valueOf(s);
    }
}
