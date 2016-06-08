package com.google.gson;

import com.google.gson.stream.*;
import java.io.*;
import com.google.gson.internal.bind.*;

public abstract class TypeAdapter<T>
{
    public final T fromJson(final Reader reader) throws IOException {
        return this.read(new JsonReader(reader));
    }
    
    public final T fromJson(final String s) throws IOException {
        return this.fromJson(new StringReader(s));
    }
    
    public final T fromJsonTree(final JsonElement jsonElement) {
        try {
            return this.read(new JsonTreeReader(jsonElement));
        }
        catch (IOException ex) {
            throw new JsonIOException(ex);
        }
    }
    
    public final TypeAdapter<T> nullSafe() {
        return new TypeAdapter<T>() {
            @Override
            public T read(final JsonReader jsonReader) throws IOException {
                if (jsonReader.peek() == JsonToken.NULL) {
                    jsonReader.nextNull();
                    return null;
                }
                return TypeAdapter.this.read(jsonReader);
            }
            
            @Override
            public void write(final JsonWriter jsonWriter, final T t) throws IOException {
                if (t == null) {
                    jsonWriter.nullValue();
                    return;
                }
                TypeAdapter.this.write(jsonWriter, t);
            }
        };
    }
    
    public abstract T read(final JsonReader p0) throws IOException;
    
    public final String toJson(final T t) throws IOException {
        final StringWriter stringWriter = new StringWriter();
        this.toJson(stringWriter, t);
        return stringWriter.toString();
    }
    
    public final void toJson(final Writer writer, final T t) throws IOException {
        this.write(new JsonWriter(writer), t);
    }
    
    public final JsonElement toJsonTree(final T t) {
        try {
            final JsonTreeWriter jsonTreeWriter = new JsonTreeWriter();
            this.write(jsonTreeWriter, t);
            return jsonTreeWriter.get();
        }
        catch (IOException ex) {
            throw new JsonIOException(ex);
        }
    }
    
    public abstract void write(final JsonWriter p0, final T p1) throws IOException;
}
