package com.lidroid.xutils.db.converter;

import java.sql.*;
import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class SqlDateColumnConverter implements ColumnConverter<Date>
{
    @Override
    public Object fieldValue2ColumnValue(final Date date) {
        if (date == null) {
            return null;
        }
        return date.getTime();
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Date getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return new Date(cursor.getLong(n));
    }
    
    @Override
    public Date getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return new Date(Long.valueOf(s));
    }
}
