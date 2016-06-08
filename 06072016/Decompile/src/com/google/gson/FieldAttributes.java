package com.google.gson;

import com.google.gson.internal.*;
import java.lang.annotation.*;
import java.util.*;
import java.lang.reflect.*;

public final class FieldAttributes
{
    private final Field field;
    
    public FieldAttributes(final Field field) {
        $Gson$Preconditions.checkNotNull(field);
        this.field = field;
    }
    
    Object get(final Object o) throws IllegalAccessException {
        return this.field.get(o);
    }
    
    public <T extends Annotation> T getAnnotation(final Class<T> clazz) {
        return this.field.getAnnotation(clazz);
    }
    
    public Collection<Annotation> getAnnotations() {
        return Arrays.asList(this.field.getAnnotations());
    }
    
    public Class<?> getDeclaredClass() {
        return this.field.getType();
    }
    
    public Type getDeclaredType() {
        return this.field.getGenericType();
    }
    
    public Class<?> getDeclaringClass() {
        return this.field.getDeclaringClass();
    }
    
    public String getName() {
        return this.field.getName();
    }
    
    public boolean hasModifier(final int n) {
        return (this.field.getModifiers() & n) != 0x0;
    }
    
    boolean isSynthetic() {
        return this.field.isSynthetic();
    }
}
