package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class DoubleColumnConverter implements ColumnConverter<Double>
{
    @Override
    public Object fieldValue2ColumnValue(final Double n) {
        return n;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.REAL;
    }
    
    @Override
    public Double getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getDouble(n);
    }
    
    @Override
    public Double getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return Double.valueOf(s);
    }
}
