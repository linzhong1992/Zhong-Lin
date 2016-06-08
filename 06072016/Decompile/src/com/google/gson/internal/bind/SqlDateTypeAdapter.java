package com.google.gson.internal.bind;

import java.sql.*;
import com.google.gson.reflect.*;
import java.io.*;
import com.google.gson.*;
import java.text.*;
import com.google.gson.stream.*;

public final class SqlDateTypeAdapter extends TypeAdapter<Date>
{
    public static final TypeAdapterFactory FACTORY;
    private final DateFormat format;
    
    static {
        FACTORY = new TypeAdapterFactory() {
            @Override
            public <T> TypeAdapter<T> create(final Gson gson, final TypeToken<T> typeToken) {
                if (typeToken.getRawType() == Date.class) {
                    return (TypeAdapter<T>)new SqlDateTypeAdapter();
                }
                return null;
            }
        };
    }
    
    public SqlDateTypeAdapter() {
        this.format = new SimpleDateFormat("MMM d, yyyy");
    }
    
    @Override
    public Date read(final JsonReader jsonReader) throws IOException {
        synchronized (this) {
            Date date;
            if (jsonReader.peek() == JsonToken.NULL) {
                jsonReader.nextNull();
                date = null;
            }
            else {
                try {
                    date = new Date(this.format.parse(jsonReader.nextString()).getTime());
                }
                catch (ParseException ex) {
                    throw new JsonSyntaxException(ex);
                }
            }
            return date;
        }
    }
    
    @Override
    public void write(final JsonWriter jsonWriter, final Date date) throws IOException {
        // monitorenter(this)
        Label_0017: {
            if (date != null) {
                break Label_0017;
            }
            String format = null;
            try {
                while (true) {
                    jsonWriter.value(format);
                    return;
                    format = this.format.format(date);
                    continue;
                }
            }
            finally {
            }
            // monitorexit(this)
        }
    }
}
