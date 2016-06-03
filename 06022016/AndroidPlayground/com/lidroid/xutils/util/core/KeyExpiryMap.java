package com.lidroid.xutils.util.core;

import java.util.concurrent.ConcurrentHashMap;

public class KeyExpiryMap<K, V>
  extends ConcurrentHashMap<K, Long>
{
  private static final int DEFAULT_CONCURRENCY_LEVEL = 16;
  private static final long serialVersionUID = 1L;
  
  public KeyExpiryMap() {}
  
  public KeyExpiryMap(int paramInt)
  {
    super(paramInt);
  }
  
  public KeyExpiryMap(int paramInt, float paramFloat)
  {
    super(paramInt, paramFloat, 16);
  }
  
  public KeyExpiryMap(int paramInt1, float paramFloat, int paramInt2)
  {
    super(paramInt1, paramFloat, paramInt2);
  }
  
  public void clear()
  {
    try
    {
      super.clear();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public boolean containsKey(Object paramObject)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore_3
    //   4: iload_3
    //   5: istore_2
    //   6: aload_0
    //   7: aload_1
    //   8: invokespecial 31	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   11: ifeq +31 -> 42
    //   14: invokestatic 37	java/lang/System:currentTimeMillis	()J
    //   17: lstore 4
    //   19: aload_0
    //   20: aload_1
    //   21: invokespecial 41	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   24: checkcast 43	java/lang/Long
    //   27: invokevirtual 46	java/lang/Long:longValue	()J
    //   30: lstore 6
    //   32: lload 4
    //   34: lload 6
    //   36: lcmp
    //   37: ifge +9 -> 46
    //   40: iconst_1
    //   41: istore_2
    //   42: aload_0
    //   43: monitorexit
    //   44: iload_2
    //   45: ireturn
    //   46: aload_0
    //   47: aload_1
    //   48: invokevirtual 50	com/lidroid/xutils/util/core/KeyExpiryMap:remove	(Ljava/lang/Object;)Ljava/lang/Long;
    //   51: pop
    //   52: iload_3
    //   53: istore_2
    //   54: goto -12 -> 42
    //   57: astore_1
    //   58: aload_0
    //   59: monitorexit
    //   60: aload_1
    //   61: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	62	0	this	KeyExpiryMap
    //   0	62	1	paramObject	Object
    //   5	49	2	bool1	boolean
    //   3	50	3	bool2	boolean
    //   17	16	4	l1	long
    //   30	5	6	l2	long
    // Exception table:
    //   from	to	target	type
    //   6	32	57	finally
    //   46	52	57	finally
  }
  
  /* Error */
  public Long get(Object paramObject)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokevirtual 51	com/lidroid/xutils/util/core/KeyExpiryMap:containsKey	(Ljava/lang/Object;)Z
    //   7: ifeq +16 -> 23
    //   10: aload_0
    //   11: aload_1
    //   12: invokespecial 41	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   15: checkcast 43	java/lang/Long
    //   18: astore_1
    //   19: aload_0
    //   20: monitorexit
    //   21: aload_1
    //   22: areturn
    //   23: aconst_null
    //   24: astore_1
    //   25: goto -6 -> 19
    //   28: astore_1
    //   29: aload_0
    //   30: monitorexit
    //   31: aload_1
    //   32: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	33	0	this	KeyExpiryMap
    //   0	33	1	paramObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	19	28	finally
  }
  
  public Long put(K paramK, Long paramLong)
  {
    try
    {
      if (containsKey(paramK)) {
        remove(paramK);
      }
      paramK = (Long)super.put(paramK, paramLong);
      return paramK;
    }
    finally {}
  }
  
  public Long remove(Object paramObject)
  {
    try
    {
      paramObject = (Long)super.remove(paramObject);
      return (Long)paramObject;
    }
    finally
    {
      paramObject = finally;
      throw ((Throwable)paramObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\core\KeyExpiryMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */