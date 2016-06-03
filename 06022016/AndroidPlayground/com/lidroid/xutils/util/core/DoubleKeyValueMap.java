package com.lidroid.xutils.util.core;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class DoubleKeyValueMap<K1, K2, V>
{
  private ConcurrentHashMap<K1, ConcurrentHashMap<K2, V>> k1_k2V_map = new ConcurrentHashMap();
  
  public void clear()
  {
    Iterator localIterator;
    if (this.k1_k2V_map.size() > 0) {
      localIterator = this.k1_k2V_map.values().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        this.k1_k2V_map.clear();
        return;
      }
      ((ConcurrentHashMap)localIterator.next()).clear();
    }
  }
  
  public boolean containsKey(K1 paramK1)
  {
    return this.k1_k2V_map.containsKey(paramK1);
  }
  
  public boolean containsKey(K1 paramK1, K2 paramK2)
  {
    if (this.k1_k2V_map.containsKey(paramK1)) {
      return ((ConcurrentHashMap)this.k1_k2V_map.get(paramK1)).containsKey(paramK2);
    }
    return false;
  }
  
  public V get(K1 paramK1, K2 paramK2)
  {
    paramK1 = (ConcurrentHashMap)this.k1_k2V_map.get(paramK1);
    if (paramK1 == null) {
      return null;
    }
    return (V)paramK1.get(paramK2);
  }
  
  public ConcurrentHashMap<K2, V> get(K1 paramK1)
  {
    return (ConcurrentHashMap)this.k1_k2V_map.get(paramK1);
  }
  
  public Collection<V> getAllValues()
  {
    ArrayList localArrayList = null;
    Object localObject1 = this.k1_k2V_map.keySet();
    if (localObject1 != null)
    {
      localArrayList = new ArrayList();
      localObject1 = ((Set)localObject1).iterator();
    }
    for (;;)
    {
      if (!((Iterator)localObject1).hasNext()) {
        return localArrayList;
      }
      Object localObject2 = (Object)((Iterator)localObject1).next();
      localObject2 = ((ConcurrentHashMap)this.k1_k2V_map.get(localObject2)).values();
      if (localObject2 != null) {
        localArrayList.addAll((Collection)localObject2);
      }
    }
  }
  
  public Collection<V> getAllValues(K1 paramK1)
  {
    paramK1 = (ConcurrentHashMap)this.k1_k2V_map.get(paramK1);
    if (paramK1 == null) {
      return null;
    }
    return paramK1.values();
  }
  
  public Set<K1> getFirstKeys()
  {
    return this.k1_k2V_map.keySet();
  }
  
  public void put(K1 paramK1, K2 paramK2, V paramV)
  {
    if ((paramK1 == null) || (paramK2 == null) || (paramV == null)) {
      return;
    }
    if (this.k1_k2V_map.containsKey(paramK1))
    {
      localConcurrentHashMap = (ConcurrentHashMap)this.k1_k2V_map.get(paramK1);
      if (localConcurrentHashMap != null)
      {
        localConcurrentHashMap.put(paramK2, paramV);
        return;
      }
      localConcurrentHashMap = new ConcurrentHashMap();
      localConcurrentHashMap.put(paramK2, paramV);
      this.k1_k2V_map.put(paramK1, localConcurrentHashMap);
      return;
    }
    ConcurrentHashMap localConcurrentHashMap = new ConcurrentHashMap();
    localConcurrentHashMap.put(paramK2, paramV);
    this.k1_k2V_map.put(paramK1, localConcurrentHashMap);
  }
  
  public void remove(K1 paramK1)
  {
    this.k1_k2V_map.remove(paramK1);
  }
  
  public void remove(K1 paramK1, K2 paramK2)
  {
    paramK1 = (ConcurrentHashMap)this.k1_k2V_map.get(paramK1);
    if (paramK1 != null) {
      paramK1.remove(paramK2);
    }
  }
  
  public int size()
  {
    int j;
    if (this.k1_k2V_map.size() == 0)
    {
      j = 0;
      return j;
    }
    int i = 0;
    Iterator localIterator = this.k1_k2V_map.values().iterator();
    for (;;)
    {
      j = i;
      if (!localIterator.hasNext()) {
        break;
      }
      i += ((ConcurrentHashMap)localIterator.next()).size();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\core\DoubleKeyValueMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */