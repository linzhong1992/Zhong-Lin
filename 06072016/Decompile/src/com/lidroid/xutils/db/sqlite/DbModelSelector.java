package com.lidroid.xutils.db.sqlite;

import android.text.*;

public class DbModelSelector
{
    private String[] columnExpressions;
    private String groupByColumnName;
    private WhereBuilder having;
    private Selector selector;
    
    protected DbModelSelector(final Selector selector, final String groupByColumnName) {
        this.selector = selector;
        this.groupByColumnName = groupByColumnName;
    }
    
    protected DbModelSelector(final Selector selector, final String[] columnExpressions) {
        this.selector = selector;
        this.columnExpressions = columnExpressions;
    }
    
    private DbModelSelector(final Class<?> clazz) {
        this.selector = Selector.from(clazz);
    }
    
    public static DbModelSelector from(final Class<?> clazz) {
        return new DbModelSelector(clazz);
    }
    
    public DbModelSelector and(final WhereBuilder whereBuilder) {
        this.selector.and(whereBuilder);
        return this;
    }
    
    public DbModelSelector and(final String s, final String s2, final Object o) {
        this.selector.and(s, s2, o);
        return this;
    }
    
    public DbModelSelector expr(final String s) {
        this.selector.expr(s);
        return this;
    }
    
    public DbModelSelector expr(final String s, final String s2, final Object o) {
        this.selector.expr(s, s2, o);
        return this;
    }
    
    public Class<?> getEntityType() {
        return this.selector.getEntityType();
    }
    
    public DbModelSelector groupBy(final String groupByColumnName) {
        this.groupByColumnName = groupByColumnName;
        return this;
    }
    
    public DbModelSelector having(final WhereBuilder having) {
        this.having = having;
        return this;
    }
    
    public DbModelSelector limit(final int n) {
        this.selector.limit(n);
        return this;
    }
    
    public DbModelSelector offset(final int n) {
        this.selector.offset(n);
        return this;
    }
    
    public DbModelSelector or(final WhereBuilder whereBuilder) {
        this.selector.or(whereBuilder);
        return this;
    }
    
    public DbModelSelector or(final String s, final String s2, final Object o) {
        this.selector.or(s, s2, o);
        return this;
    }
    
    public DbModelSelector orderBy(final String s) {
        this.selector.orderBy(s);
        return this;
    }
    
    public DbModelSelector orderBy(final String s, final boolean b) {
        this.selector.orderBy(s, b);
        return this;
    }
    
    public DbModelSelector select(final String... columnExpressions) {
        this.columnExpressions = columnExpressions;
        return this;
    }
    
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer();
        sb.append("SELECT ");
        if (this.columnExpressions != null && this.columnExpressions.length > 0) {
            for (int i = 0; i < this.columnExpressions.length; ++i) {
                sb.append(this.columnExpressions[i]);
                sb.append(",");
            }
            sb.deleteCharAt(sb.length() - 1);
        }
        else if (!TextUtils.isEmpty((CharSequence)this.groupByColumnName)) {
            sb.append(this.groupByColumnName);
        }
        else {
            sb.append("*");
        }
        sb.append(" FROM ").append(this.selector.tableName);
        if (this.selector.whereBuilder != null && this.selector.whereBuilder.getWhereItemSize() > 0) {
            sb.append(" WHERE ").append(this.selector.whereBuilder.toString());
        }
        if (!TextUtils.isEmpty((CharSequence)this.groupByColumnName)) {
            sb.append(" GROUP BY ").append(this.groupByColumnName);
            if (this.having != null && this.having.getWhereItemSize() > 0) {
                sb.append(" HAVING ").append(this.having.toString());
            }
        }
        if (this.selector.orderByList != null) {
            for (int j = 0; j < this.selector.orderByList.size(); ++j) {
                sb.append(" ORDER BY ").append(((Selector.OrderBy)this.selector.orderByList.get(j)).toString());
            }
        }
        if (this.selector.limit > 0) {
            sb.append(" LIMIT ").append(this.selector.limit);
            sb.append(" OFFSET ").append(this.selector.offset);
        }
        return sb.toString();
    }
    
    public DbModelSelector where(final WhereBuilder whereBuilder) {
        this.selector.where(whereBuilder);
        return this;
    }
    
    public DbModelSelector where(final String s, final String s2, final Object o) {
        this.selector.where(s, s2, o);
        return this;
    }
}
