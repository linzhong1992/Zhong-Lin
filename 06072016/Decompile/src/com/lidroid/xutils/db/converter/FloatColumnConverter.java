package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class FloatColumnConverter implements ColumnConverter<Float>
{
    @Override
    public Object fieldValue2ColumnValue(final Float n) {
        return n;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.REAL;
    }
    
    @Override
    public Float getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getFloat(n);
    }
    
    @Override
    public Float getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return Float.valueOf(s);
    }
}
