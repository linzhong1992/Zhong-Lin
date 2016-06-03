package com.lidroid.xutils.db.sqlite;

import android.text.TextUtils;
import com.lidroid.xutils.db.converter.ColumnConverterFactory;
import com.lidroid.xutils.db.table.ColumnUtils;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class WhereBuilder
{
  private final List<String> whereItems = new ArrayList();
  
  private void appendCondition(String paramString1, String paramString2, String paramString3, Object paramObject)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (this.whereItems.size() > 0) {
      localStringBuilder.append(" ");
    }
    if (!TextUtils.isEmpty(paramString1)) {
      localStringBuilder.append(paramString1 + " ");
    }
    localStringBuilder.append(paramString2);
    if ("!=".equals(paramString3))
    {
      paramString1 = "<>";
      if (paramObject != null) {
        break label185;
      }
      if (!"=".equals(paramString1)) {
        break label135;
      }
      localStringBuilder.append(" IS NULL");
    }
    for (;;)
    {
      this.whereItems.add(localStringBuilder.toString());
      return;
      paramString1 = paramString3;
      if (!"==".equals(paramString3)) {
        break;
      }
      paramString1 = "=";
      break;
      label135:
      if ("<>".equals(paramString1))
      {
        localStringBuilder.append(" IS NOT NULL");
      }
      else
      {
        localStringBuilder.append(" " + paramString1 + " NULL");
        continue;
        label185:
        localStringBuilder.append(" " + paramString1 + " ");
        int j;
        int i;
        if ("IN".equalsIgnoreCase(paramString1))
        {
          paramString1 = null;
          if ((paramObject instanceof Iterable)) {
            paramString1 = (Iterable)paramObject;
          }
          for (;;)
          {
            if (paramString1 != null)
            {
              paramString3 = new StringBuffer("(");
              paramObject = paramString1.iterator();
              if (!((Iterator)paramObject).hasNext())
              {
                paramString3.deleteCharAt(paramString3.length() - 1);
                paramString3.append(")");
                localStringBuilder.append(paramString3.toString());
                break;
                if (!paramObject.getClass().isArray()) {
                  continue;
                }
                paramString1 = new ArrayList();
                j = Array.getLength(paramObject);
                i = 0;
                while (i < j)
                {
                  paramString1.add(Array.get(paramObject, i));
                  i += 1;
                }
                continue;
              }
              paramString1 = ColumnUtils.convert2DbColumnValueIfNeeded(((Iterator)paramObject).next());
              if (ColumnDbType.TEXT.equals(ColumnConverterFactory.getDbColumnType(paramString1.getClass())))
              {
                paramString2 = paramString1.toString();
                paramString1 = paramString2;
                if (paramString2.indexOf('\'') != -1) {
                  paramString1 = paramString2.replace("'", "''");
                }
                paramString3.append("'" + paramString1 + "'");
              }
              for (;;)
              {
                paramString3.append(",");
                break;
                paramString3.append(paramString1);
              }
            }
          }
          throw new IllegalArgumentException("value must be an Array or an Iterable.");
        }
        if ("BETWEEN".equalsIgnoreCase(paramString1))
        {
          paramString1 = null;
          if ((paramObject instanceof Iterable)) {
            paramString1 = (Iterable)paramObject;
          }
          for (;;)
          {
            if (paramString1 != null)
            {
              paramString2 = paramString1.iterator();
              if (!paramString2.hasNext())
              {
                throw new IllegalArgumentException("value must have tow items.");
                if (paramObject.getClass().isArray())
                {
                  paramString1 = new ArrayList();
                  j = Array.getLength(paramObject);
                  i = 0;
                  while (i < j)
                  {
                    paramString1.add(Array.get(paramObject, i));
                    i += 1;
                  }
                }
              }
              else
              {
                paramString1 = paramString2.next();
                if (!paramString2.hasNext()) {
                  throw new IllegalArgumentException("value must have tow items.");
                }
                paramString2 = paramString2.next();
                paramString1 = ColumnUtils.convert2DbColumnValueIfNeeded(paramString1);
                paramString3 = ColumnUtils.convert2DbColumnValueIfNeeded(paramString2);
                if (ColumnDbType.TEXT.equals(ColumnConverterFactory.getDbColumnType(paramString1.getClass())))
                {
                  paramString2 = paramString1.toString();
                  paramString1 = paramString2;
                  if (paramString2.indexOf('\'') != -1) {
                    paramString1 = paramString2.replace("'", "''");
                  }
                  paramString3 = paramString3.toString();
                  paramString2 = paramString3;
                  if (paramString3.indexOf('\'') != -1) {
                    paramString2 = paramString3.replace("'", "''");
                  }
                  localStringBuilder.append("'" + paramString1 + "'");
                  localStringBuilder.append(" AND ");
                  localStringBuilder.append("'" + paramString2 + "'");
                  break;
                }
                localStringBuilder.append(paramString1);
                localStringBuilder.append(" AND ");
                localStringBuilder.append(paramString3);
                break;
              }
            }
          }
          throw new IllegalArgumentException("value must be an Array or an Iterable.");
        }
        paramString1 = ColumnUtils.convert2DbColumnValueIfNeeded(paramObject);
        if (ColumnDbType.TEXT.equals(ColumnConverterFactory.getDbColumnType(paramString1.getClass())))
        {
          paramString2 = paramString1.toString();
          paramString1 = paramString2;
          if (paramString2.indexOf('\'') != -1) {
            paramString1 = paramString2.replace("'", "''");
          }
          localStringBuilder.append("'" + paramString1 + "'");
        }
        else
        {
          localStringBuilder.append(paramString1);
        }
      }
    }
  }
  
  public static WhereBuilder b()
  {
    return new WhereBuilder();
  }
  
  public static WhereBuilder b(String paramString1, String paramString2, Object paramObject)
  {
    WhereBuilder localWhereBuilder = new WhereBuilder();
    localWhereBuilder.appendCondition(null, paramString1, paramString2, paramObject);
    return localWhereBuilder;
  }
  
  public WhereBuilder and(String paramString1, String paramString2, Object paramObject)
  {
    if (this.whereItems.size() == 0) {}
    for (String str = null;; str = "AND")
    {
      appendCondition(str, paramString1, paramString2, paramObject);
      return this;
    }
  }
  
  public WhereBuilder expr(String paramString)
  {
    this.whereItems.add(" " + paramString);
    return this;
  }
  
  public WhereBuilder expr(String paramString1, String paramString2, Object paramObject)
  {
    appendCondition(null, paramString1, paramString2, paramObject);
    return this;
  }
  
  public int getWhereItemSize()
  {
    return this.whereItems.size();
  }
  
  public WhereBuilder or(String paramString1, String paramString2, Object paramObject)
  {
    if (this.whereItems.size() == 0) {}
    for (String str = null;; str = "OR")
    {
      appendCondition(str, paramString1, paramString2, paramObject);
      return this;
    }
  }
  
  public String toString()
  {
    if (this.whereItems.size() == 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = this.whereItems.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return localStringBuilder.toString();
      }
      localStringBuilder.append((String)localIterator.next());
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\sqlite\WhereBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */