package com.lidroid.xutils.util.core;

import java.util.concurrent.*;

public class KeyExpiryMap<K, V> extends ConcurrentHashMap<K, Long>
{
    private static final int DEFAULT_CONCURRENCY_LEVEL = 16;
    private static final long serialVersionUID = 1L;
    
    public KeyExpiryMap() {
    }
    
    public KeyExpiryMap(final int n) {
        super(n);
    }
    
    public KeyExpiryMap(final int n, final float n2) {
        super(n, n2, 16);
    }
    
    public KeyExpiryMap(final int n, final float n2, final int n3) {
        super(n, n2, n3);
    }
    
    @Override
    public void clear() {
        synchronized (this) {
            super.clear();
        }
    }
    
    @Override
    public boolean containsKey(final Object o) {
        // monitorenter(this)
        boolean b = false;
        try {
            if (super.containsKey(o)) {
                if (System.currentTimeMillis() < super.get(o)) {
                    b = true;
                }
                else {
                    this.remove(o);
                    b = b;
                }
            }
            return b;
        }
        finally {
        }
        // monitorexit(this)
    }
    
    @Override
    public Long get(final Object o) {
        synchronized (this) {
            Long n;
            if (this.containsKey(o)) {
                n = super.get(o);
            }
            else {
                n = null;
            }
            return n;
        }
    }
    
    @Override
    public Long put(final K k, final Long n) {
        synchronized (this) {
            if (this.containsKey(k)) {
                this.remove(k);
            }
            return super.put(k, n);
        }
    }
    
    @Override
    public Long remove(final Object o) {
        synchronized (this) {
            return super.remove(o);
        }
    }
}
