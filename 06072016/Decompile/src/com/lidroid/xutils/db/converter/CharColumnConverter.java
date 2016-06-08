package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;
import android.text.*;

public class CharColumnConverter implements ColumnConverter<Character>
{
    @Override
    public Object fieldValue2ColumnValue(final Character c) {
        if (c == null) {
            return null;
        }
        return c;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.INTEGER;
    }
    
    @Override
    public Character getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return (char)cursor.getInt(n);
    }
    
    @Override
    public Character getFieldValue(final String s) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return null;
        }
        return s.charAt(0);
    }
}
