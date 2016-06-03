package com.alien.demo.feature.geiger;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

public class TagProximator
{
  public static int RssiHistoryCapacity = 5;
  public static final Double RssiMax;
  public static final Double RssiMin = Double.valueOf(-70.0D);
  private static int scaledMax;
  private static Hashtable tags;
  
  static
  {
    RssiMax = Double.valueOf(-30.0D);
    scaledMax = 100;
    tags = new Hashtable();
  }
  
  public static float addData(String paramString, double paramDouble)
  {
    Vector localVector2 = (Vector)tags.get(paramString);
    Vector localVector1 = localVector2;
    if (localVector2 == null)
    {
      localVector1 = new Vector();
      tags.put(paramString, localVector1);
    }
    localVector1.add(Double.valueOf(paramDouble));
    while (localVector1.size() > RssiHistoryCapacity) {
      localVector1.remove(0);
    }
    return getProximity(paramString);
  }
  
  public static void clear()
  {
    tags.clear();
  }
  
  public static float getProximity(String paramString)
  {
    float f = 0.0F;
    paramString = (Vector)tags.get(paramString);
    if (paramString == null) {
      return 0.0F;
    }
    Iterator localIterator = paramString.iterator();
    while (localIterator.hasNext())
    {
      Double localDouble = (Double)localIterator.next();
      f = (float)(f + localDouble.doubleValue());
    }
    return f / paramString.size();
  }
  
  public static int getScaledProximity(String paramString)
  {
    return scaleRSSI(getProximity(paramString));
  }
  
  private static int scaleRSSI(float paramFloat)
  {
    if (paramFloat == 0.0D) {
      return 0;
    }
    return (int)((paramFloat + -RssiMin.doubleValue()) / (RssiMax.doubleValue() - RssiMin.doubleValue()) * scaledMax);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\geiger\TagProximator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */