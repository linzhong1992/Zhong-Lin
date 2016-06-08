package com.google.gson.internal.bind;

import com.google.gson.reflect.*;
import java.util.*;
import com.google.gson.*;
import java.text.*;
import java.io.*;
import com.google.gson.stream.*;

public final class DateTypeAdapter extends TypeAdapter<Date>
{
    public static final TypeAdapterFactory FACTORY;
    private final DateFormat enUsFormat;
    private final DateFormat iso8601Format;
    private final DateFormat localFormat;
    
    static {
        FACTORY = new TypeAdapterFactory() {
            @Override
            public <T> TypeAdapter<T> create(final Gson gson, final TypeToken<T> typeToken) {
                if (typeToken.getRawType() == Date.class) {
                    return (TypeAdapter<T>)new DateTypeAdapter();
                }
                return null;
            }
        };
    }
    
    public DateTypeAdapter() {
        this.enUsFormat = DateFormat.getDateTimeInstance(2, 2, Locale.US);
        this.localFormat = DateFormat.getDateTimeInstance(2, 2);
        this.iso8601Format = buildIso8601Format();
    }
    
    private static DateFormat buildIso8601Format() {
        final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        return simpleDateFormat;
    }
    
    private Date deserializeToDate(String s) {
        synchronized (this) {
            try {
                s = this.localFormat.parse((String)s);
                return (Date)s;
            }
            catch (ParseException ex2) {
                try {
                    s = this.enUsFormat.parse((String)s);
                }
                catch (ParseException ex3) {
                    try {
                        s = this.iso8601Format.parse((String)s);
                    }
                    catch (ParseException ex) {
                        throw new JsonSyntaxException((String)s, ex);
                    }
                }
            }
        }
    }
    
    @Override
    public Date read(final JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        return this.deserializeToDate(jsonReader.nextString());
    }
    
    @Override
    public void write(final JsonWriter jsonWriter, final Date date) throws IOException {
        // monitorenter(this)
        Label_0014: {
            if (date != null) {
                break Label_0014;
            }
            try {
                jsonWriter.nullValue();
                return;
                jsonWriter.value(this.enUsFormat.format(date));
            }
            finally {
            }
            // monitorexit(this)
        }
    }
}
