package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;

public class StringColumnConverter implements ColumnConverter<String>
{
    @Override
    public Object fieldValue2ColumnValue(final String s) {
        return s;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.TEXT;
    }
    
    @Override
    public String getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getString(n);
    }
    
    @Override
    public String getFieldValue(final String s) {
        return s;
    }
}
