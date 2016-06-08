package com.google.gson;

import com.google.gson.internal.*;
import com.google.gson.stream.*;
import java.io.*;

public final class JsonParser
{
    public JsonElement parse(final JsonReader jsonReader) throws JsonIOException, JsonSyntaxException {
        final boolean lenient = jsonReader.isLenient();
        jsonReader.setLenient(true);
        try {
            return Streams.parse(jsonReader);
        }
        catch (StackOverflowError stackOverflowError) {
            throw new JsonParseException("Failed parsing JSON source: " + jsonReader + " to Json", stackOverflowError);
        }
        catch (OutOfMemoryError outOfMemoryError) {
            throw new JsonParseException("Failed parsing JSON source: " + jsonReader + " to Json", outOfMemoryError);
        }
        finally {
            jsonReader.setLenient(lenient);
        }
    }
    
    public JsonElement parse(final Reader reader) throws JsonIOException, JsonSyntaxException {
        JsonElement parse;
        try {
            final JsonReader jsonReader = new JsonReader(reader);
            parse = this.parse(jsonReader);
            if (!parse.isJsonNull() && jsonReader.peek() != JsonToken.END_DOCUMENT) {
                throw new JsonSyntaxException("Did not consume the entire document.");
            }
        }
        catch (MalformedJsonException ex) {
            throw new JsonSyntaxException(ex);
        }
        catch (IOException ex2) {
            throw new JsonIOException(ex2);
        }
        catch (NumberFormatException ex3) {
            throw new JsonSyntaxException(ex3);
        }
        return parse;
    }
    
    public JsonElement parse(final String s) throws JsonSyntaxException {
        return this.parse(new StringReader(s));
    }
}
