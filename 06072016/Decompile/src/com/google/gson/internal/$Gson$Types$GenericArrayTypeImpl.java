package com.google.gson.internal;

import java.io.*;
import java.lang.reflect.*;

private static final class GenericArrayTypeImpl implements GenericArrayType, Serializable
{
    private static final long serialVersionUID = 0L;
    private final Type componentType;
    
    public GenericArrayTypeImpl(final Type type) {
        this.componentType = $Gson$Types.canonicalize(type);
    }
    
    @Override
    public boolean equals(final Object o) {
        return o instanceof GenericArrayType && $Gson$Types.equals(this, (Type)o);
    }
    
    @Override
    public Type getGenericComponentType() {
        return this.componentType;
    }
    
    @Override
    public int hashCode() {
        return this.componentType.hashCode();
    }
    
    @Override
    public String toString() {
        return $Gson$Types.typeToString(this.componentType) + "[]";
    }
}
