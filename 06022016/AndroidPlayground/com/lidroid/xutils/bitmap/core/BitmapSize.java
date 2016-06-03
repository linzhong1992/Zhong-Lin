package com.lidroid.xutils.bitmap.core;

public class BitmapSize
{
  public static final BitmapSize ZERO = new BitmapSize(0, 0);
  private int height;
  private int width;
  
  public BitmapSize() {}
  
  public BitmapSize(int paramInt1, int paramInt2)
  {
    this.width = paramInt1;
    this.height = paramInt2;
  }
  
  public int getHeight()
  {
    return this.height;
  }
  
  public int getWidth()
  {
    return this.width;
  }
  
  public BitmapSize scale(float paramFloat)
  {
    return new BitmapSize((int)(this.width * paramFloat), (int)(this.height * paramFloat));
  }
  
  public BitmapSize scaleDown(int paramInt)
  {
    return new BitmapSize(this.width / paramInt, this.height / paramInt);
  }
  
  public void setHeight(int paramInt)
  {
    this.height = paramInt;
  }
  
  public void setWidth(int paramInt)
  {
    this.width = paramInt;
  }
  
  public String toString()
  {
    return "_" + this.width + "_" + this.height;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\core\BitmapSize.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */