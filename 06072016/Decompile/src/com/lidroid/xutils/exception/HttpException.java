package com.lidroid.xutils.exception;

public class HttpException extends BaseException
{
    private static final long serialVersionUID = 1L;
    private int exceptionCode;
    
    public HttpException() {
    }
    
    public HttpException(final int exceptionCode) {
        this.exceptionCode = exceptionCode;
    }
    
    public HttpException(final int exceptionCode, final String s) {
        super(s);
        this.exceptionCode = exceptionCode;
    }
    
    public HttpException(final int exceptionCode, final String s, final Throwable t) {
        super(s, t);
        this.exceptionCode = exceptionCode;
    }
    
    public HttpException(final int exceptionCode, final Throwable t) {
        super(t);
        this.exceptionCode = exceptionCode;
    }
    
    public HttpException(final String s) {
        super(s);
    }
    
    public HttpException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public HttpException(final Throwable t) {
        super(t);
    }
    
    public int getExceptionCode() {
        return this.exceptionCode;
    }
}
