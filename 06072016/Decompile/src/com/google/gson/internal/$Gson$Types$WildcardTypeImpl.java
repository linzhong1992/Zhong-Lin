package com.google.gson.internal;

import java.io.*;
import java.lang.reflect.*;

private static final class WildcardTypeImpl implements WildcardType, Serializable
{
    private static final long serialVersionUID = 0L;
    private final Type lowerBound;
    private final Type upperBound;
    
    public WildcardTypeImpl(final Type[] array, final Type[] array2) {
        final boolean b = true;
        $Gson$Preconditions.checkArgument(array2.length <= 1);
        $Gson$Preconditions.checkArgument(array.length == 1);
        if (array2.length == 1) {
            $Gson$Preconditions.checkNotNull(array2[0]);
            $Gson$Types.access$000(array2[0]);
            $Gson$Preconditions.checkArgument(array[0] == Object.class && b);
            this.lowerBound = $Gson$Types.canonicalize(array2[0]);
            this.upperBound = Object.class;
            return;
        }
        $Gson$Preconditions.checkNotNull(array[0]);
        $Gson$Types.access$000(array[0]);
        this.lowerBound = null;
        this.upperBound = $Gson$Types.canonicalize(array[0]);
    }
    
    @Override
    public boolean equals(final Object o) {
        return o instanceof WildcardType && $Gson$Types.equals(this, (Type)o);
    }
    
    @Override
    public Type[] getLowerBounds() {
        if (this.lowerBound != null) {
            return new Type[] { this.lowerBound };
        }
        return $Gson$Types.EMPTY_TYPE_ARRAY;
    }
    
    @Override
    public Type[] getUpperBounds() {
        return new Type[] { this.upperBound };
    }
    
    @Override
    public int hashCode() {
        int n;
        if (this.lowerBound != null) {
            n = this.lowerBound.hashCode() + 31;
        }
        else {
            n = 1;
        }
        return n ^ this.upperBound.hashCode() + 31;
    }
    
    @Override
    public String toString() {
        if (this.lowerBound != null) {
            return "? super " + $Gson$Types.typeToString(this.lowerBound);
        }
        if (this.upperBound == Object.class) {
            return "?";
        }
        return "? extends " + $Gson$Types.typeToString(this.upperBound);
    }
}
