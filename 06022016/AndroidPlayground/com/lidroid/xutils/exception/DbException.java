package com.lidroid.xutils.exception;

public class DbException
  extends BaseException
{
  private static final long serialVersionUID = 1L;
  
  public DbException() {}
  
  public DbException(String paramString)
  {
    super(paramString);
  }
  
  public DbException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public DbException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\exception\DbException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */