package com.lidroid.xutils.exception;

public class BaseException
  extends Exception
{
  private static final long serialVersionUID = 1L;
  
  public BaseException() {}
  
  public BaseException(String paramString)
  {
    super(paramString);
  }
  
  public BaseException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public BaseException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\exception\BaseException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */