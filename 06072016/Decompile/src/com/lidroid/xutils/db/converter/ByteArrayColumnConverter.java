package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;

public class ByteArrayColumnConverter implements ColumnConverter<byte[]>
{
    @Override
    public Object fieldValue2ColumnValue(final byte[] array) {
        return array;
    }
    
    @Override
    public ColumnDbType getColumnDbType() {
        return ColumnDbType.BLOB;
    }
    
    @Override
    public byte[] getFieldValue(final Cursor cursor, final int n) {
        if (cursor.isNull(n)) {
            return null;
        }
        return cursor.getBlob(n);
    }
    
    @Override
    public byte[] getFieldValue(final String s) {
        return null;
    }
}
