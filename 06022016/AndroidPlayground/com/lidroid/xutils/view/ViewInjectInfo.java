package com.lidroid.xutils.view;

public class ViewInjectInfo
{
  public int parentId;
  public Object value;
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof ViewInjectInfo)) {
        return false;
      }
      paramObject = (ViewInjectInfo)paramObject;
      if (this.parentId != ((ViewInjectInfo)paramObject).parentId) {
        return false;
      }
      if (this.value != null) {
        break;
      }
    } while (((ViewInjectInfo)paramObject).value == null);
    return false;
    return this.value.equals(((ViewInjectInfo)paramObject).value);
  }
  
  public int hashCode()
  {
    return this.value.hashCode() * 31 + this.parentId;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\view\ViewInjectInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */