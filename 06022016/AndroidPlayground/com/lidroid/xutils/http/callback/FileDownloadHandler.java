package com.lidroid.xutils.http.callback;

public class FileDownloadHandler
{
  /* Error */
  public java.io.File handleEntity(org.apache.http.HttpEntity paramHttpEntity, RequestCallBackHandler paramRequestCallBackHandler, String paramString1, boolean paramBoolean, String paramString2)
    throws java.io.IOException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +10 -> 11
    //   4: aload_3
    //   5: invokestatic 19	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   8: ifeq +7 -> 15
    //   11: aconst_null
    //   12: astore_1
    //   13: aload_1
    //   14: areturn
    //   15: new 21	java/io/File
    //   18: dup
    //   19: aload_3
    //   20: invokespecial 24	java/io/File:<init>	(Ljava/lang/String;)V
    //   23: astore 13
    //   25: aload 13
    //   27: invokevirtual 28	java/io/File:exists	()Z
    //   30: ifne +30 -> 60
    //   33: aload 13
    //   35: invokevirtual 32	java/io/File:getParentFile	()Ljava/io/File;
    //   38: astore 14
    //   40: aload 14
    //   42: invokevirtual 28	java/io/File:exists	()Z
    //   45: ifne +9 -> 54
    //   48: aload 14
    //   50: invokevirtual 35	java/io/File:mkdirs	()Z
    //   53: pop
    //   54: aload 13
    //   56: invokevirtual 38	java/io/File:createNewFile	()Z
    //   59: pop
    //   60: lconst_0
    //   61: lstore 7
    //   63: aconst_null
    //   64: astore 15
    //   66: aconst_null
    //   67: astore 14
    //   69: iload 4
    //   71: ifeq +89 -> 160
    //   74: aload 13
    //   76: invokevirtual 42	java/io/File:length	()J
    //   79: lstore 7
    //   81: new 44	java/io/FileOutputStream
    //   84: dup
    //   85: aload_3
    //   86: iconst_1
    //   87: invokespecial 47	java/io/FileOutputStream:<init>	(Ljava/lang/String;Z)V
    //   90: astore_3
    //   91: aload_1
    //   92: invokeinterface 52 1 0
    //   97: lload 7
    //   99: ladd
    //   100: lstore 11
    //   102: new 54	java/io/BufferedInputStream
    //   105: dup
    //   106: aload_1
    //   107: invokeinterface 58 1 0
    //   112: invokespecial 61	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   115: astore_1
    //   116: new 63	java/io/BufferedOutputStream
    //   119: dup
    //   120: aload_3
    //   121: invokespecial 66	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   124: astore 15
    //   126: aload_2
    //   127: ifnull +45 -> 172
    //   130: aload_2
    //   131: lload 11
    //   133: lload 7
    //   135: iconst_1
    //   136: invokeinterface 72 6 0
    //   141: istore 4
    //   143: iload 4
    //   145: ifne +27 -> 172
    //   148: aload_1
    //   149: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   152: aload 15
    //   154: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   157: aload 13
    //   159: areturn
    //   160: new 44	java/io/FileOutputStream
    //   163: dup
    //   164: aload_3
    //   165: invokespecial 79	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   168: astore_3
    //   169: goto -78 -> 91
    //   172: sipush 4096
    //   175: newarray <illegal type>
    //   177: astore 14
    //   179: aload_1
    //   180: aload 14
    //   182: invokevirtual 83	java/io/BufferedInputStream:read	([B)I
    //   185: istore 6
    //   187: iload 6
    //   189: iconst_m1
    //   190: if_icmpne +87 -> 277
    //   193: aload_3
    //   194: invokevirtual 86	java/io/FileOutputStream:flush	()V
    //   197: aload_2
    //   198: ifnull +15 -> 213
    //   201: aload_2
    //   202: lload 11
    //   204: lload 7
    //   206: iconst_1
    //   207: invokeinterface 72 6 0
    //   212: pop
    //   213: aload_1
    //   214: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   217: aload 15
    //   219: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   222: aload 13
    //   224: astore_1
    //   225: aload 13
    //   227: invokevirtual 28	java/io/File:exists	()Z
    //   230: ifeq -217 -> 13
    //   233: aload 13
    //   235: astore_1
    //   236: aload 5
    //   238: invokestatic 19	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   241: ifne -228 -> 13
    //   244: new 21	java/io/File
    //   247: dup
    //   248: aload 13
    //   250: invokevirtual 90	java/io/File:getParent	()Ljava/lang/String;
    //   253: aload 5
    //   255: invokespecial 93	java/io/File:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   258: astore_1
    //   259: aload_1
    //   260: invokevirtual 28	java/io/File:exists	()Z
    //   263: ifne +90 -> 353
    //   266: aload 13
    //   268: aload_1
    //   269: invokevirtual 97	java/io/File:renameTo	(Ljava/io/File;)Z
    //   272: ifeq +118 -> 390
    //   275: aload_1
    //   276: areturn
    //   277: aload_3
    //   278: aload 14
    //   280: iconst_0
    //   281: iload 6
    //   283: invokevirtual 101	java/io/FileOutputStream:write	([BII)V
    //   286: lload 7
    //   288: iload 6
    //   290: i2l
    //   291: ladd
    //   292: lstore 9
    //   294: lload 9
    //   296: lstore 7
    //   298: aload_2
    //   299: ifnull -120 -> 179
    //   302: aload_2
    //   303: lload 11
    //   305: lload 9
    //   307: iconst_0
    //   308: invokeinterface 72 6 0
    //   313: istore 4
    //   315: lload 9
    //   317: lstore 7
    //   319: iload 4
    //   321: ifne -142 -> 179
    //   324: aload_1
    //   325: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   328: aload 15
    //   330: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   333: aload 13
    //   335: areturn
    //   336: astore_2
    //   337: aload 14
    //   339: astore_3
    //   340: aload 15
    //   342: astore_1
    //   343: aload_1
    //   344: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   347: aload_3
    //   348: invokestatic 78	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   351: aload_2
    //   352: athrow
    //   353: new 21	java/io/File
    //   356: dup
    //   357: aload 13
    //   359: invokevirtual 90	java/io/File:getParent	()Ljava/lang/String;
    //   362: new 103	java/lang/StringBuilder
    //   365: dup
    //   366: invokestatic 108	java/lang/System:currentTimeMillis	()J
    //   369: invokestatic 114	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   372: invokespecial 115	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   375: aload 5
    //   377: invokevirtual 119	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   380: invokevirtual 122	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   383: invokespecial 93	java/io/File:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   386: astore_1
    //   387: goto -128 -> 259
    //   390: aload 13
    //   392: astore_1
    //   393: goto -118 -> 275
    //   396: astore_2
    //   397: aload 14
    //   399: astore_3
    //   400: goto -57 -> 343
    //   403: astore_2
    //   404: aload 15
    //   406: astore_3
    //   407: goto -64 -> 343
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	410	0	this	FileDownloadHandler
    //   0	410	1	paramHttpEntity	org.apache.http.HttpEntity
    //   0	410	2	paramRequestCallBackHandler	RequestCallBackHandler
    //   0	410	3	paramString1	String
    //   0	410	4	paramBoolean	boolean
    //   0	410	5	paramString2	String
    //   185	104	6	i	int
    //   61	257	7	l1	long
    //   292	24	9	l2	long
    //   100	204	11	l3	long
    //   23	368	13	localFile	java.io.File
    //   38	360	14	localObject	Object
    //   64	341	15	localBufferedOutputStream	java.io.BufferedOutputStream
    // Exception table:
    //   from	to	target	type
    //   74	91	336	finally
    //   91	116	336	finally
    //   160	169	336	finally
    //   116	126	396	finally
    //   130	143	403	finally
    //   172	179	403	finally
    //   179	187	403	finally
    //   193	197	403	finally
    //   201	213	403	finally
    //   277	286	403	finally
    //   302	315	403	finally
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\callback\FileDownloadHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */