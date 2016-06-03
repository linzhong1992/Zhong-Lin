package com.lidroid.xutils.db.table;

import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.DbUtils.DaoConfig;
import java.util.HashMap;

public class Table
{
  private static final HashMap<String, Table> tableMap = new HashMap();
  private boolean checkedDatabase;
  public final HashMap<String, Column> columnMap;
  private Id id;
  private String tableName;
  
  private Table(Class<?> paramClass)
  {
    this.tableName = TableUtils.getTableName(paramClass);
    this.id = TableUtils.getId(paramClass);
    this.columnMap = TableUtils.getColumnMap(paramClass);
  }
  
  public static Table get(DbUtils paramDbUtils, Class<?> paramClass)
  {
    try
    {
      String str = paramDbUtils.getDaoConfig().getDbName() + "#" + paramClass.getCanonicalName();
      Table localTable = (Table)tableMap.get(str);
      paramDbUtils = localTable;
      if (localTable == null)
      {
        paramDbUtils = new Table(paramClass);
        tableMap.put(str, paramDbUtils);
      }
      return paramDbUtils;
    }
    finally {}
  }
  
  public static void remove(DbUtils paramDbUtils, Class<?> paramClass)
  {
    try
    {
      paramDbUtils = paramDbUtils.getDaoConfig().getDbName() + "#" + paramClass.getCanonicalName();
      tableMap.remove(paramDbUtils);
      return;
    }
    finally
    {
      paramDbUtils = finally;
      throw paramDbUtils;
    }
  }
  
  /* Error */
  public static void remove(DbUtils paramDbUtils, String paramString)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 24	com/lidroid/xutils/db/table/Table:tableMap	Ljava/util/HashMap;
    //   6: invokevirtual 108	java/util/HashMap:size	()I
    //   9: ifle +43 -> 52
    //   12: aconst_null
    //   13: astore_3
    //   14: getstatic 24	com/lidroid/xutils/db/table/Table:tableMap	Ljava/util/HashMap;
    //   17: invokevirtual 112	java/util/HashMap:entrySet	()Ljava/util/Set;
    //   20: invokeinterface 118 1 0
    //   25: astore 5
    //   27: aload 5
    //   29: invokeinterface 124 1 0
    //   34: ifne +22 -> 56
    //   37: aload_3
    //   38: invokestatic 130	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   41: ifeq +11 -> 52
    //   44: getstatic 24	com/lidroid/xutils/db/table/Table:tableMap	Ljava/util/HashMap;
    //   47: aload_3
    //   48: invokevirtual 102	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   51: pop
    //   52: ldc 2
    //   54: monitorexit
    //   55: return
    //   56: aload 5
    //   58: invokeinterface 134 1 0
    //   63: checkcast 136	java/util/Map$Entry
    //   66: astore 4
    //   68: aload 4
    //   70: invokeinterface 139 1 0
    //   75: checkcast 2	com/lidroid/xutils/db/table/Table
    //   78: astore 6
    //   80: aload 6
    //   82: ifnull -55 -> 27
    //   85: aload 6
    //   87: invokevirtual 141	com/lidroid/xutils/db/table/Table:getTableName	()Ljava/lang/String;
    //   90: aload_1
    //   91: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   94: ifeq -67 -> 27
    //   97: aload 4
    //   99: invokeinterface 148 1 0
    //   104: checkcast 67	java/lang/String
    //   107: astore 4
    //   109: aload 4
    //   111: new 53	java/lang/StringBuilder
    //   114: dup
    //   115: aload_0
    //   116: invokevirtual 59	com/lidroid/xutils/DbUtils:getDaoConfig	()Lcom/lidroid/xutils/DbUtils$DaoConfig;
    //   119: invokevirtual 65	com/lidroid/xutils/DbUtils$DaoConfig:getDbName	()Ljava/lang/String;
    //   122: invokestatic 71	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   125: invokespecial 74	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   128: ldc 76
    //   130: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   133: invokevirtual 88	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   136: invokevirtual 152	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   139: istore_2
    //   140: aload 4
    //   142: astore_3
    //   143: iload_2
    //   144: ifeq -117 -> 27
    //   147: aload 4
    //   149: astore_3
    //   150: goto -113 -> 37
    //   153: astore_0
    //   154: ldc 2
    //   156: monitorexit
    //   157: aload_0
    //   158: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	159	0	paramDbUtils	DbUtils
    //   0	159	1	paramString	String
    //   139	5	2	bool	boolean
    //   13	137	3	localObject1	Object
    //   66	82	4	localObject2	Object
    //   25	32	5	localIterator	java.util.Iterator
    //   78	8	6	localTable	Table
    // Exception table:
    //   from	to	target	type
    //   3	12	153	finally
    //   14	27	153	finally
    //   27	37	153	finally
    //   37	52	153	finally
    //   56	80	153	finally
    //   85	140	153	finally
  }
  
  public Id getId()
  {
    return this.id;
  }
  
  public String getTableName()
  {
    return this.tableName;
  }
  
  public boolean isCheckedDatabase()
  {
    return this.checkedDatabase;
  }
  
  public void setCheckedDatabase(boolean paramBoolean)
  {
    this.checkedDatabase = paramBoolean;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\db\table\Table.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */