package com.google.gson.internal;

import com.google.gson.stream.JsonReader;
import java.io.IOException;

public abstract class JsonReaderInternalAccess
{
  public static JsonReaderInternalAccess INSTANCE;
  
  public abstract void promoteNameToValue(JsonReader paramJsonReader)
    throws IOException;
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\google\gson\internal\JsonReaderInternalAccess.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */