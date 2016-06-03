package com.alien.demo.data;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;

public class ComplexPreferences
{
  private static Gson GSON = new Gson();
  private static ComplexPreferences complexPreferences;
  private Context context;
  private SharedPreferences.Editor editor;
  private SharedPreferences preferences;
  Type typeOfObject = new TypeToken() {}.getType();
  
  private ComplexPreferences(Context paramContext, String paramString, int paramInt)
  {
    this.context = paramContext;
    String str;
    if (paramString != null)
    {
      str = paramString;
      if (!paramString.equals("")) {}
    }
    else
    {
      str = "complex_preferences";
    }
    this.preferences = paramContext.getSharedPreferences(str, paramInt);
    this.editor = this.preferences.edit();
  }
  
  public static ComplexPreferences getComplexPreferences(Context paramContext, String paramString, int paramInt)
  {
    if (complexPreferences == null) {
      complexPreferences = new ComplexPreferences(paramContext, paramString, paramInt);
    }
    return complexPreferences;
  }
  
  public void commit()
  {
    this.editor.commit();
  }
  
  public <T> T getObject(String paramString, Class<T> paramClass)
  {
    String str = this.preferences.getString(paramString, null);
    if (str == null) {
      return null;
    }
    try
    {
      paramClass = GSON.fromJson(str, paramClass);
      return paramClass;
    }
    catch (Exception paramClass)
    {
      throw new IllegalArgumentException("Object storaged with key " + paramString + " is instanceof other class");
    }
  }
  
  public void putObject(String paramString, Object paramObject)
  {
    if (paramObject == null) {
      throw new IllegalArgumentException("object is null");
    }
    if ((paramString.equals("")) || (paramString == null)) {
      throw new IllegalArgumentException("key is empty or null");
    }
    this.editor.putString(paramString, GSON.toJson(paramObject));
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\data\ComplexPreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */