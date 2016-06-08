package com.lidroid.xutils.db.sqlite;

import com.lidroid.xutils.db.table.*;
import java.util.*;

public class Selector
{
    protected Class<?> entityType;
    protected int limit;
    protected int offset;
    protected List<OrderBy> orderByList;
    protected String tableName;
    protected WhereBuilder whereBuilder;
    
    private Selector(final Class<?> entityType) {
        this.limit = 0;
        this.offset = 0;
        this.entityType = entityType;
        this.tableName = TableUtils.getTableName(entityType);
    }
    
    public static Selector from(final Class<?> clazz) {
        return new Selector(clazz);
    }
    
    public Selector and(final WhereBuilder whereBuilder) {
        this.whereBuilder.expr("AND (" + whereBuilder.toString() + ")");
        return this;
    }
    
    public Selector and(final String s, final String s2, final Object o) {
        this.whereBuilder.and(s, s2, o);
        return this;
    }
    
    public Selector expr(final String s) {
        if (this.whereBuilder == null) {
            this.whereBuilder = WhereBuilder.b();
        }
        this.whereBuilder.expr(s);
        return this;
    }
    
    public Selector expr(final String s, final String s2, final Object o) {
        if (this.whereBuilder == null) {
            this.whereBuilder = WhereBuilder.b();
        }
        this.whereBuilder.expr(s, s2, o);
        return this;
    }
    
    public Class<?> getEntityType() {
        return this.entityType;
    }
    
    public DbModelSelector groupBy(final String s) {
        return new DbModelSelector(this, s);
    }
    
    public Selector limit(final int limit) {
        this.limit = limit;
        return this;
    }
    
    public Selector offset(final int offset) {
        this.offset = offset;
        return this;
    }
    
    public Selector or(final WhereBuilder whereBuilder) {
        this.whereBuilder.expr("OR (" + whereBuilder.toString() + ")");
        return this;
    }
    
    public Selector or(final String s, final String s2, final Object o) {
        this.whereBuilder.or(s, s2, o);
        return this;
    }
    
    public Selector orderBy(final String s) {
        if (this.orderByList == null) {
            this.orderByList = new ArrayList<OrderBy>(2);
        }
        this.orderByList.add(new OrderBy(s));
        return this;
    }
    
    public Selector orderBy(final String s, final boolean b) {
        if (this.orderByList == null) {
            this.orderByList = new ArrayList<OrderBy>(2);
        }
        this.orderByList.add(new OrderBy(s, b));
        return this;
    }
    
    public DbModelSelector select(final String... array) {
        return new DbModelSelector(this, array);
    }
    
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append("*");
        sb.append(" FROM ").append(this.tableName);
        if (this.whereBuilder != null && this.whereBuilder.getWhereItemSize() > 0) {
            sb.append(" WHERE ").append(this.whereBuilder.toString());
        }
        if (this.orderByList != null) {
            for (int i = 0; i < this.orderByList.size(); ++i) {
                sb.append(" ORDER BY ").append(this.orderByList.get(i).toString());
            }
        }
        if (this.limit > 0) {
            sb.append(" LIMIT ").append(this.limit);
            sb.append(" OFFSET ").append(this.offset);
        }
        return sb.toString();
    }
    
    public Selector where(final WhereBuilder whereBuilder) {
        this.whereBuilder = whereBuilder;
        return this;
    }
    
    public Selector where(final String s, final String s2, final Object o) {
        this.whereBuilder = WhereBuilder.b(s, s2, o);
        return this;
    }
    
    protected class OrderBy
    {
        private String columnName;
        private boolean desc;
        
        public OrderBy(final String columnName) {
            this.columnName = columnName;
        }
        
        public OrderBy(final String columnName, final boolean desc) {
            this.columnName = columnName;
            this.desc = desc;
        }
        
        @Override
        public String toString() {
            final StringBuilder sb = new StringBuilder(String.valueOf(this.columnName));
            String s;
            if (this.desc) {
                s = " DESC";
            }
            else {
                s = " ASC";
            }
            return sb.append(s).toString();
        }
    }
}
