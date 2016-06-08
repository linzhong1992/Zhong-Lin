package com.lidroid.xutils.util.core;

import java.io.*;
import java.util.concurrent.atomic.*;
import java.util.function.*;
import java.util.concurrent.*;
import java.lang.reflect.*;
import sun.misc.*;
import java.util.*;
import java.util.concurrent.locks.*;

public class DoubleKeyValueMap<K1, K2, V>
{
    private ConcurrentHashMap<K1, ConcurrentHashMap<K2, V>> k1_k2V_map;
    
    public DoubleKeyValueMap() {
        this.k1_k2V_map = new ConcurrentHashMap<K1, ConcurrentHashMap<K2, V>>();
    }
    
    public void clear() {
        if (this.k1_k2V_map.size() > 0) {
            final Iterator<ConcurrentHashMap<K2, V>> iterator = this.k1_k2V_map.values().iterator();
            while (iterator.hasNext()) {
                iterator.next().clear();
            }
            this.k1_k2V_map.clear();
        }
    }
    
    public boolean containsKey(final K1 k1) {
        return this.k1_k2V_map.containsKey(k1);
    }
    
    public boolean containsKey(final K1 k1, final K2 k2) {
        return this.k1_k2V_map.containsKey(k1) && this.k1_k2V_map.get(k1).containsKey(k2);
    }
    
    public V get(final K1 k1, final K2 k2) {
        final ConcurrentHashMap<K2, V> concurrentHashMap = this.k1_k2V_map.get(k1);
        if (concurrentHashMap == null) {
            return null;
        }
        return concurrentHashMap.get(k2);
    }
    
    public ConcurrentHashMap<K2, V> get(final K1 k1) {
        return this.k1_k2V_map.get(k1);
    }
    
    public Collection<V> getAllValues() {
        Collection<Object> collection = null;
        final Set keySet = this.k1_k2V_map.keySet();
        if (keySet != null) {
            collection = (Collection<Object>)new ArrayList<V>();
            final Iterator<Object> iterator = keySet.iterator();
            while (iterator.hasNext()) {
                final Collection<V> values = this.k1_k2V_map.get(iterator.next()).values();
                if (values != null) {
                    collection.addAll(values);
                }
            }
        }
        return (Collection<V>)collection;
    }
    
    public Collection<V> getAllValues(final K1 k1) {
        final ConcurrentHashMap<K2, V> concurrentHashMap = this.k1_k2V_map.get(k1);
        if (concurrentHashMap == null) {
            return null;
        }
        return concurrentHashMap.values();
    }
    
    public Set<K1> getFirstKeys() {
        return (Set<K1>)this.k1_k2V_map.keySet();
    }
    
    public void put(final K1 k1, final K2 k2, final V v) {
        if (k1 == null || k2 == null || v == null) {
            return;
        }
        if (!this.k1_k2V_map.containsKey(k1)) {
            final ConcurrentHashMap<K2, V> concurrentHashMap = new ConcurrentHashMap<K2, V>();
            concurrentHashMap.put(k2, v);
            this.k1_k2V_map.put(k1, concurrentHashMap);
            return;
        }
        final ConcurrentHashMap<K2, V> concurrentHashMap2 = this.k1_k2V_map.get(k1);
        if (concurrentHashMap2 != null) {
            concurrentHashMap2.put(k2, v);
            return;
        }
        final ConcurrentHashMap<K2, V> concurrentHashMap3 = new ConcurrentHashMap<K2, V>();
        concurrentHashMap3.put(k2, v);
        this.k1_k2V_map.put(k1, concurrentHashMap3);
    }
    
    public void remove(final K1 k1) {
        this.k1_k2V_map.remove(k1);
    }
    
    public void remove(final K1 k1, final K2 k2) {
        final ConcurrentHashMap<K2, V> concurrentHashMap = this.k1_k2V_map.get(k1);
        if (concurrentHashMap != null) {
            concurrentHashMap.remove(k2);
        }
    }
    
    public int size() {
        int n;
        if (this.k1_k2V_map.size() == 0) {
            n = 0;
        }
        else {
            int n2 = 0;
            final Iterator<ConcurrentHashMap<K2, V>> iterator = this.k1_k2V_map.values().iterator();
            while (true) {
                n = n2;
                if (!iterator.hasNext()) {
                    break;
                }
                n2 += iterator.next().size();
            }
        }
        return n;
    }
}
