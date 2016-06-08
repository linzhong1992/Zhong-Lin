package com.lidroid.xutils.exception;

public class BaseException extends Exception
{
    private static final long serialVersionUID = 1L;
    
    public BaseException() {
    }
    
    public BaseException(final String s) {
        super(s);
    }
    
    public BaseException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public BaseException(final Throwable t) {
        super(t);
    }
}
