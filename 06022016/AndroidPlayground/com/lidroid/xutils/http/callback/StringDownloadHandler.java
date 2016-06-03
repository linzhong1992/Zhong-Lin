package com.lidroid.xutils.http.callback;

public class StringDownloadHandler
{
  /* Error */
  public String handleEntity(org.apache.http.HttpEntity paramHttpEntity, RequestCallBackHandler paramRequestCallBackHandler, String paramString)
    throws java.io.IOException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +5 -> 6
    //   4: aconst_null
    //   5: areturn
    //   6: lconst_0
    //   7: lstore 4
    //   9: aload_1
    //   10: invokeinterface 19 1 0
    //   15: lstore 8
    //   17: aload_2
    //   18: ifnull +18 -> 36
    //   21: aload_2
    //   22: lload 8
    //   24: lconst_0
    //   25: iconst_1
    //   26: invokeinterface 25 6 0
    //   31: ifne +5 -> 36
    //   34: aconst_null
    //   35: areturn
    //   36: aconst_null
    //   37: astore 11
    //   39: new 27	java/lang/StringBuilder
    //   42: dup
    //   43: invokespecial 28	java/lang/StringBuilder:<init>	()V
    //   46: astore 12
    //   48: aload_1
    //   49: invokeinterface 32 1 0
    //   54: astore_1
    //   55: aload_1
    //   56: astore 11
    //   58: new 34	java/io/BufferedReader
    //   61: dup
    //   62: new 36	java/io/InputStreamReader
    //   65: dup
    //   66: aload_1
    //   67: aload_3
    //   68: invokespecial 39	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;Ljava/lang/String;)V
    //   71: invokespecial 42	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   74: astore 13
    //   76: aload_1
    //   77: astore 11
    //   79: aload 13
    //   81: invokevirtual 46	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   84: astore 14
    //   86: aload 14
    //   88: ifnonnull +35 -> 123
    //   91: aload_2
    //   92: ifnull +18 -> 110
    //   95: aload_1
    //   96: astore 11
    //   98: aload_2
    //   99: lload 8
    //   101: lload 4
    //   103: iconst_1
    //   104: invokeinterface 25 6 0
    //   109: pop
    //   110: aload_1
    //   111: invokestatic 52	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   114: aload 12
    //   116: invokevirtual 55	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   119: invokevirtual 60	java/lang/String:trim	()Ljava/lang/String;
    //   122: areturn
    //   123: aload_1
    //   124: astore 11
    //   126: aload 12
    //   128: aload 14
    //   130: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   133: bipush 10
    //   135: invokevirtual 67	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   138: pop
    //   139: aload_1
    //   140: astore 11
    //   142: lload 4
    //   144: aload 14
    //   146: aload_3
    //   147: invokestatic 73	com/lidroid/xutils/util/OtherUtils:sizeOfString	(Ljava/lang/String;Ljava/lang/String;)J
    //   150: ladd
    //   151: lstore 6
    //   153: lload 6
    //   155: lstore 4
    //   157: aload_2
    //   158: ifnull -82 -> 76
    //   161: aload_1
    //   162: astore 11
    //   164: aload_2
    //   165: lload 8
    //   167: lload 6
    //   169: iconst_0
    //   170: invokeinterface 25 6 0
    //   175: istore 10
    //   177: lload 6
    //   179: lstore 4
    //   181: iload 10
    //   183: ifne -107 -> 76
    //   186: lload 6
    //   188: lstore 4
    //   190: goto -99 -> 91
    //   193: astore_1
    //   194: aload 11
    //   196: invokestatic 52	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   199: aload_1
    //   200: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	201	0	this	StringDownloadHandler
    //   0	201	1	paramHttpEntity	org.apache.http.HttpEntity
    //   0	201	2	paramRequestCallBackHandler	RequestCallBackHandler
    //   0	201	3	paramString	String
    //   7	182	4	l1	long
    //   151	36	6	l2	long
    //   15	151	8	l3	long
    //   175	7	10	bool	boolean
    //   37	158	11	localHttpEntity	org.apache.http.HttpEntity
    //   46	81	12	localStringBuilder	StringBuilder
    //   74	6	13	localBufferedReader	java.io.BufferedReader
    //   84	61	14	str	String
    // Exception table:
    //   from	to	target	type
    //   48	55	193	finally
    //   58	76	193	finally
    //   79	86	193	finally
    //   98	110	193	finally
    //   126	139	193	finally
    //   142	153	193	finally
    //   164	177	193	finally
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\callback\StringDownloadHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */