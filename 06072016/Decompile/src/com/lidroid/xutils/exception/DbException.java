package com.lidroid.xutils.exception;

public class DbException extends BaseException
{
    private static final long serialVersionUID = 1L;
    
    public DbException() {
    }
    
    public DbException(final String s) {
        super(s);
    }
    
    public DbException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public DbException(final Throwable t) {
        super(t);
    }
}
