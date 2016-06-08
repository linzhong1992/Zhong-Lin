package com.alien.demo.data;

import com.google.gson.*;
import android.content.*;
import java.lang.reflect.*;
import com.google.gson.reflect.*;

public class ComplexPreferences
{
    private static Gson GSON;
    private static ComplexPreferences complexPreferences;
    private Context context;
    private SharedPreferences$Editor editor;
    private SharedPreferences preferences;
    Type typeOfObject;
    
    static {
        ComplexPreferences.GSON = new Gson();
    }
    
    private ComplexPreferences(final Context context, final String s, final int n) {
        this.typeOfObject = new TypeToken<Object>() {}.getType();
        this.context = context;
        String s2 = null;
        Label_0044: {
            if (s != null) {
                s2 = s;
                if (!s.equals("")) {
                    break Label_0044;
                }
            }
            s2 = "complex_preferences";
        }
        this.preferences = context.getSharedPreferences(s2, n);
        this.editor = this.preferences.edit();
    }
    
    public static ComplexPreferences getComplexPreferences(final Context context, final String s, final int n) {
        if (ComplexPreferences.complexPreferences == null) {
            ComplexPreferences.complexPreferences = new ComplexPreferences(context, s, n);
        }
        return ComplexPreferences.complexPreferences;
    }
    
    public void commit() {
        this.editor.commit();
    }
    
    public <T> T getObject(final String s, final Class<T> clazz) {
        final String string = this.preferences.getString(s, (String)null);
        if (string == null) {
            return null;
        }
        try {
            return ComplexPreferences.GSON.fromJson(string, clazz);
        }
        catch (Exception ex) {
            throw new IllegalArgumentException("Object storaged with key " + s + " is instanceof other class");
        }
    }
    
    public void putObject(final String s, final Object o) {
        if (o == null) {
            throw new IllegalArgumentException("object is null");
        }
        if (s.equals("") || s == null) {
            throw new IllegalArgumentException("key is empty or null");
        }
        this.editor.putString(s, ComplexPreferences.GSON.toJson(o));
    }
}
