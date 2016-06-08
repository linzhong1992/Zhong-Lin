package com.alien.demo.feature.geiger;

import java.util.*;

public class TagProximator
{
    public static int RssiHistoryCapacity;
    public static final Double RssiMax;
    public static final Double RssiMin;
    private static int scaledMax;
    private static Hashtable tags;
    
    static {
        RssiMin = -70.0;
        RssiMax = -30.0;
        TagProximator.scaledMax = 100;
        TagProximator.tags = new Hashtable();
        TagProximator.RssiHistoryCapacity = 5;
    }
    
    public static float addData(final String s, final double n) {
        Vector<Double> vector;
        if ((vector = TagProximator.tags.get(s)) == null) {
            vector = new Vector<Double>();
            TagProximator.tags.put(s, vector);
        }
        vector.add(n);
        while (vector.size() > TagProximator.RssiHistoryCapacity) {
            vector.remove(0);
        }
        return getProximity(s);
    }
    
    public static void clear() {
        TagProximator.tags.clear();
    }
    
    public static float getProximity(final String s) {
        float n = 0.0f;
        final Vector<Double> vector = TagProximator.tags.get(s);
        if (vector == null) {
            return 0.0f;
        }
        final Iterator<Double> iterator = vector.iterator();
        while (iterator.hasNext()) {
            n += (float)(Object)iterator.next();
        }
        return n / vector.size();
    }
    
    public static int getScaledProximity(final String s) {
        return scaleRSSI(getProximity(s));
    }
    
    private static int scaleRSSI(final float n) {
        if (n == 0.0) {
            return 0;
        }
        return (int)((n + -TagProximator.RssiMin) / (TagProximator.RssiMax - TagProximator.RssiMin) * TagProximator.scaledMax);
    }
}
