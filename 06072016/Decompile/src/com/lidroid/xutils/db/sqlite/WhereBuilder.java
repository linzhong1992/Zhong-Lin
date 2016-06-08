package com.lidroid.xutils.db.sqlite;

import android.text.*;
import java.lang.reflect.*;
import com.lidroid.xutils.db.table.*;
import com.lidroid.xutils.db.converter.*;
import java.util.*;

public class WhereBuilder
{
    private final List<String> whereItems;
    
    private WhereBuilder() {
        this.whereItems = new ArrayList<String>();
    }
    
    private void appendCondition(String s, String s2, String s3, final Object o) {
        final StringBuilder sb = new StringBuilder();
        if (this.whereItems.size() > 0) {
            sb.append(" ");
        }
        if (!TextUtils.isEmpty((CharSequence)s)) {
            sb.append(String.valueOf(s) + " ");
        }
        sb.append(s2);
        if ("!=".equals(s3)) {
            s = "<>";
        }
        else {
            s = s3;
            if ("==".equals(s3)) {
                s = "=";
            }
        }
        if (o == null) {
            if ("=".equals(s)) {
                sb.append(" IS NULL");
            }
            else if ("<>".equals(s)) {
                sb.append(" IS NOT NULL");
            }
            else {
                sb.append(" " + s + " NULL");
            }
        }
        else {
            sb.append(" " + s + " ");
            if ("IN".equalsIgnoreCase(s)) {
                Iterable<Object> iterable = null;
                if (o instanceof Iterable) {
                    iterable = (Iterable<Object>)o;
                }
                else if (o.getClass().isArray()) {
                    iterable = new ArrayList<Object>();
                    for (int length = Array.getLength(o), i = 0; i < length; ++i) {
                        ((ArrayList<Object>)iterable).add(Array.get(o, i));
                    }
                }
                if (iterable == null) {
                    throw new IllegalArgumentException("value must be an Array or an Iterable.");
                }
                final StringBuffer sb2 = new StringBuffer("(");
                final Iterator<Object> iterator = iterable.iterator();
                while (iterator.hasNext()) {
                    final Object convert2DbColumnValueIfNeeded = ColumnUtils.convert2DbColumnValueIfNeeded(iterator.next());
                    if (ColumnDbType.TEXT.equals(ColumnConverterFactory.getDbColumnType(convert2DbColumnValueIfNeeded.getClass()))) {
                        s2 = (s = convert2DbColumnValueIfNeeded.toString());
                        if (s2.indexOf(39) != -1) {
                            s = s2.replace("'", "''");
                        }
                        sb2.append("'" + s + "'");
                    }
                    else {
                        sb2.append(convert2DbColumnValueIfNeeded);
                    }
                    sb2.append(",");
                }
                sb2.deleteCharAt(sb2.length() - 1);
                sb2.append(")");
                sb.append(sb2.toString());
            }
            else if ("BETWEEN".equalsIgnoreCase(s)) {
                Iterable<Object> iterable2 = null;
                if (o instanceof Iterable) {
                    iterable2 = (Iterable<Object>)o;
                }
                else if (o.getClass().isArray()) {
                    iterable2 = new ArrayList<Object>();
                    for (int length2 = Array.getLength(o), j = 0; j < length2; ++j) {
                        ((ArrayList<Object>)iterable2).add(Array.get(o, j));
                    }
                }
                if (iterable2 == null) {
                    throw new IllegalArgumentException("value must be an Array or an Iterable.");
                }
                final Iterator<Object> iterator2 = iterable2.iterator();
                if (!iterator2.hasNext()) {
                    throw new IllegalArgumentException("value must have tow items.");
                }
                final Object next = iterator2.next();
                if (!iterator2.hasNext()) {
                    throw new IllegalArgumentException("value must have tow items.");
                }
                final Object next2 = iterator2.next();
                final Object convert2DbColumnValueIfNeeded2 = ColumnUtils.convert2DbColumnValueIfNeeded(next);
                final Object convert2DbColumnValueIfNeeded3 = ColumnUtils.convert2DbColumnValueIfNeeded(next2);
                if (ColumnDbType.TEXT.equals(ColumnConverterFactory.getDbColumnType(convert2DbColumnValueIfNeeded2.getClass()))) {
                    s2 = (s = convert2DbColumnValueIfNeeded2.toString());
                    if (s2.indexOf(39) != -1) {
                        s = s2.replace("'", "''");
                    }
                    s3 = (s2 = convert2DbColumnValueIfNeeded3.toString());
                    if (s3.indexOf(39) != -1) {
                        s2 = s3.replace("'", "''");
                    }
                    sb.append("'" + s + "'");
                    sb.append(" AND ");
                    sb.append("'" + s2 + "'");
                }
                else {
                    sb.append(convert2DbColumnValueIfNeeded2);
                    sb.append(" AND ");
                    sb.append(convert2DbColumnValueIfNeeded3);
                }
            }
            else {
                final Object convert2DbColumnValueIfNeeded4 = ColumnUtils.convert2DbColumnValueIfNeeded(o);
                if (ColumnDbType.TEXT.equals(ColumnConverterFactory.getDbColumnType(convert2DbColumnValueIfNeeded4.getClass()))) {
                    s2 = (s = convert2DbColumnValueIfNeeded4.toString());
                    if (s2.indexOf(39) != -1) {
                        s = s2.replace("'", "''");
                    }
                    sb.append("'" + s + "'");
                }
                else {
                    sb.append(convert2DbColumnValueIfNeeded4);
                }
            }
        }
        this.whereItems.add(sb.toString());
    }
    
    public static WhereBuilder b() {
        return new WhereBuilder();
    }
    
    public static WhereBuilder b(final String s, final String s2, final Object o) {
        final WhereBuilder whereBuilder = new WhereBuilder();
        whereBuilder.appendCondition(null, s, s2, o);
        return whereBuilder;
    }
    
    public WhereBuilder and(final String s, final String s2, final Object o) {
        String s3;
        if (this.whereItems.size() == 0) {
            s3 = null;
        }
        else {
            s3 = "AND";
        }
        this.appendCondition(s3, s, s2, o);
        return this;
    }
    
    public WhereBuilder expr(final String s) {
        this.whereItems.add(" " + s);
        return this;
    }
    
    public WhereBuilder expr(final String s, final String s2, final Object o) {
        this.appendCondition(null, s, s2, o);
        return this;
    }
    
    public int getWhereItemSize() {
        return this.whereItems.size();
    }
    
    public WhereBuilder or(final String s, final String s2, final Object o) {
        String s3;
        if (this.whereItems.size() == 0) {
            s3 = null;
        }
        else {
            s3 = "OR";
        }
        this.appendCondition(s3, s, s2, o);
        return this;
    }
    
    @Override
    public String toString() {
        if (this.whereItems.size() == 0) {
            return "";
        }
        final StringBuilder sb = new StringBuilder();
        final Iterator<String> iterator = this.whereItems.iterator();
        while (iterator.hasNext()) {
            sb.append(iterator.next());
        }
        return sb.toString();
    }
}
