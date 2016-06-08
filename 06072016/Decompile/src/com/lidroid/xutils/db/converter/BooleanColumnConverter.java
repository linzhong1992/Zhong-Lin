package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class BooleanColumnConverter implements ColumnConverter<Boolean>
{
    @Override
    public Object fieldValue2ColumnValue(final Boolean b) {
        if (b == null) {
            return null;
        }
        int n;
        if (b) {
            n = 1;
        }
        else {
            n = 0;
        }
        return n;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Boolean getFieldValue(final Cursor cursor, final int n) {
        boolean b = true;
        if (cursor.isNull(n)) {
            return null;
        }
        if (cursor.getInt(n) != 1) {
            b = false;
        }
        return b;
    }
    
    @Override
    public Boolean getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        boolean b;
        if (s.length() == 1) {
            b = "1".equals(s);
        }
        else {
            b = Boolean.valueOf(s);
        }
        return b;
    }
}
