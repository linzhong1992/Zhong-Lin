package com.lidroid.xutils.db.converter;

import com.lidroid.xutils.db.sqlite.*;
import android.database.*;

public interface ColumnConverter<T>
{
    Object fieldValue2ColumnValue(final T p0);
    
    ColumnDbType getColumnDbType();
    
    T getFieldValue(final Cursor p0, final int p1);
    
    T getFieldValue(final String p0);
}
