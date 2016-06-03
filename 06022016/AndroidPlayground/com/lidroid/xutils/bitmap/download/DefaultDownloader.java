package com.lidroid.xutils.bitmap.download;

public class DefaultDownloader
  extends Downloader
{
  /* Error */
  public long downloadToStream(String paramString, java.io.OutputStream paramOutputStream, com.lidroid.xutils.BitmapUtils.BitmapLoadTask<?> paramBitmapLoadTask)
  {
    // Byte code:
    //   0: aload_3
    //   1: ifnull +17 -> 18
    //   4: aload_3
    //   5: invokevirtual 19	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:isCancelled	()Z
    //   8: ifne +10 -> 18
    //   11: aload_3
    //   12: invokevirtual 23	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:getTargetContainer	()Landroid/view/View;
    //   15: ifnonnull +7 -> 22
    //   18: ldc2_w 24
    //   21: lreturn
    //   22: aconst_null
    //   23: astore 16
    //   25: aconst_null
    //   26: astore 15
    //   28: invokestatic 30	com/lidroid/xutils/util/OtherUtils:trustAllSSLForHttpsURLConnection	()V
    //   31: lconst_0
    //   32: lstore 9
    //   34: aload 15
    //   36: astore 14
    //   38: aload 16
    //   40: astore 13
    //   42: aload_1
    //   43: ldc 32
    //   45: invokevirtual 38	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   48: ifeq +120 -> 168
    //   51: aload 15
    //   53: astore 14
    //   55: aload 16
    //   57: astore 13
    //   59: new 40	java/io/FileInputStream
    //   62: dup
    //   63: aload_1
    //   64: invokespecial 43	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   67: astore_1
    //   68: aload 15
    //   70: astore 14
    //   72: aload 16
    //   74: astore 13
    //   76: aload_1
    //   77: invokevirtual 47	java/io/FileInputStream:available	()I
    //   80: i2l
    //   81: lstore 5
    //   83: aload 15
    //   85: astore 14
    //   87: aload 16
    //   89: astore 13
    //   91: new 49	java/io/BufferedInputStream
    //   94: dup
    //   95: aload_1
    //   96: invokespecial 52	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   99: astore_1
    //   100: aload_1
    //   101: astore 13
    //   103: aload_1
    //   104: astore 14
    //   106: invokestatic 58	java/lang/System:currentTimeMillis	()J
    //   109: lstore 7
    //   111: aload_1
    //   112: astore 13
    //   114: aload_1
    //   115: astore 14
    //   117: aload_0
    //   118: invokevirtual 61	com/lidroid/xutils/bitmap/download/DefaultDownloader:getDefaultExpiry	()J
    //   121: lstore 11
    //   123: lload 7
    //   125: lload 11
    //   127: ladd
    //   128: lstore 7
    //   130: aload_1
    //   131: astore 14
    //   133: aload_1
    //   134: astore 13
    //   136: aload_3
    //   137: invokevirtual 19	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:isCancelled	()Z
    //   140: ifne +20 -> 160
    //   143: aload_1
    //   144: astore 14
    //   146: aload_1
    //   147: astore 13
    //   149: aload_3
    //   150: invokevirtual 23	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:getTargetContainer	()Landroid/view/View;
    //   153: astore 15
    //   155: aload 15
    //   157: ifnonnull +242 -> 399
    //   160: aload_1
    //   161: invokestatic 67	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   164: ldc2_w 24
    //   167: lreturn
    //   168: aload 15
    //   170: astore 14
    //   172: aload 16
    //   174: astore 13
    //   176: aload_1
    //   177: ldc 69
    //   179: invokevirtual 38	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   182: ifeq +72 -> 254
    //   185: aload 15
    //   187: astore 14
    //   189: aload 16
    //   191: astore 13
    //   193: aload_0
    //   194: invokevirtual 73	com/lidroid/xutils/bitmap/download/DefaultDownloader:getContext	()Landroid/content/Context;
    //   197: invokevirtual 79	android/content/Context:getAssets	()Landroid/content/res/AssetManager;
    //   200: aload_1
    //   201: bipush 7
    //   203: aload_1
    //   204: invokevirtual 82	java/lang/String:length	()I
    //   207: invokevirtual 86	java/lang/String:substring	(II)Ljava/lang/String;
    //   210: invokevirtual 92	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   213: astore_1
    //   214: aload 15
    //   216: astore 14
    //   218: aload 16
    //   220: astore 13
    //   222: aload_1
    //   223: invokevirtual 95	java/io/InputStream:available	()I
    //   226: i2l
    //   227: lstore 5
    //   229: aload 15
    //   231: astore 14
    //   233: aload 16
    //   235: astore 13
    //   237: new 49	java/io/BufferedInputStream
    //   240: dup
    //   241: aload_1
    //   242: invokespecial 52	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   245: astore_1
    //   246: ldc2_w 96
    //   249: lstore 7
    //   251: goto -121 -> 130
    //   254: aload 15
    //   256: astore 14
    //   258: aload 16
    //   260: astore 13
    //   262: new 99	java/net/URL
    //   265: dup
    //   266: aload_1
    //   267: invokespecial 100	java/net/URL:<init>	(Ljava/lang/String;)V
    //   270: invokevirtual 104	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   273: astore 17
    //   275: aload 15
    //   277: astore 14
    //   279: aload 16
    //   281: astore 13
    //   283: aload 17
    //   285: aload_0
    //   286: invokevirtual 107	com/lidroid/xutils/bitmap/download/DefaultDownloader:getDefaultConnectTimeout	()I
    //   289: invokevirtual 113	java/net/URLConnection:setConnectTimeout	(I)V
    //   292: aload 15
    //   294: astore 14
    //   296: aload 16
    //   298: astore 13
    //   300: aload 17
    //   302: aload_0
    //   303: invokevirtual 116	com/lidroid/xutils/bitmap/download/DefaultDownloader:getDefaultReadTimeout	()I
    //   306: invokevirtual 119	java/net/URLConnection:setReadTimeout	(I)V
    //   309: aload 15
    //   311: astore 14
    //   313: aload 16
    //   315: astore 13
    //   317: new 49	java/io/BufferedInputStream
    //   320: dup
    //   321: aload 17
    //   323: invokevirtual 123	java/net/URLConnection:getInputStream	()Ljava/io/InputStream;
    //   326: invokespecial 52	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   329: astore_1
    //   330: aload_1
    //   331: astore 13
    //   333: aload_1
    //   334: astore 14
    //   336: aload 17
    //   338: invokevirtual 126	java/net/URLConnection:getExpiration	()J
    //   341: lstore 5
    //   343: lload 5
    //   345: lstore 7
    //   347: aload_1
    //   348: astore 13
    //   350: aload_1
    //   351: astore 14
    //   353: lload 5
    //   355: invokestatic 58	java/lang/System:currentTimeMillis	()J
    //   358: lcmp
    //   359: ifge +19 -> 378
    //   362: aload_1
    //   363: astore 13
    //   365: aload_1
    //   366: astore 14
    //   368: invokestatic 58	java/lang/System:currentTimeMillis	()J
    //   371: aload_0
    //   372: invokevirtual 61	com/lidroid/xutils/bitmap/download/DefaultDownloader:getDefaultExpiry	()J
    //   375: ladd
    //   376: lstore 7
    //   378: aload_1
    //   379: astore 13
    //   381: aload_1
    //   382: astore 14
    //   384: aload 17
    //   386: invokevirtual 129	java/net/URLConnection:getContentLength	()I
    //   389: istore 4
    //   391: iload 4
    //   393: i2l
    //   394: lstore 5
    //   396: goto -266 -> 130
    //   399: aload_1
    //   400: astore 14
    //   402: aload_1
    //   403: astore 13
    //   405: sipush 4096
    //   408: newarray <illegal type>
    //   410: astore 15
    //   412: aload_1
    //   413: astore 14
    //   415: aload_1
    //   416: astore 13
    //   418: aload_1
    //   419: aload 15
    //   421: invokevirtual 133	java/io/BufferedInputStream:read	([B)I
    //   424: istore 4
    //   426: iload 4
    //   428: iconst_m1
    //   429: if_icmpne +20 -> 449
    //   432: aload_1
    //   433: astore 14
    //   435: aload_1
    //   436: astore 13
    //   438: aload_2
    //   439: invokevirtual 138	java/io/OutputStream:flush	()V
    //   442: aload_1
    //   443: invokestatic 67	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   446: lload 7
    //   448: lreturn
    //   449: aload_1
    //   450: astore 14
    //   452: aload_1
    //   453: astore 13
    //   455: aload_2
    //   456: aload 15
    //   458: iconst_0
    //   459: iload 4
    //   461: invokevirtual 142	java/io/OutputStream:write	([BII)V
    //   464: lload 9
    //   466: iload 4
    //   468: i2l
    //   469: ladd
    //   470: lstore 9
    //   472: aload_1
    //   473: astore 14
    //   475: aload_1
    //   476: astore 13
    //   478: aload_3
    //   479: invokevirtual 19	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:isCancelled	()Z
    //   482: ifne +20 -> 502
    //   485: aload_1
    //   486: astore 14
    //   488: aload_1
    //   489: astore 13
    //   491: aload_3
    //   492: invokevirtual 23	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:getTargetContainer	()Landroid/view/View;
    //   495: astore 16
    //   497: aload 16
    //   499: ifnonnull +11 -> 510
    //   502: aload_1
    //   503: invokestatic 67	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   506: ldc2_w 24
    //   509: lreturn
    //   510: aload_1
    //   511: astore 14
    //   513: aload_1
    //   514: astore 13
    //   516: aload_3
    //   517: lload 5
    //   519: lload 9
    //   521: invokevirtual 146	com/lidroid/xutils/BitmapUtils$BitmapLoadTask:updateProgress	(JJ)V
    //   524: goto -112 -> 412
    //   527: astore_1
    //   528: aload 14
    //   530: astore 13
    //   532: aload_1
    //   533: invokevirtual 150	java/lang/Throwable:getMessage	()Ljava/lang/String;
    //   536: aload_1
    //   537: invokestatic 156	com/lidroid/xutils/util/LogUtils:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   540: aload 14
    //   542: invokestatic 67	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   545: ldc2_w 24
    //   548: lreturn
    //   549: astore_1
    //   550: aload 13
    //   552: invokestatic 67	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   555: aload_1
    //   556: athrow
    //   557: astore_1
    //   558: goto -8 -> 550
    //   561: astore_1
    //   562: goto -34 -> 528
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	565	0	this	DefaultDownloader
    //   0	565	1	paramString	String
    //   0	565	2	paramOutputStream	java.io.OutputStream
    //   0	565	3	paramBitmapLoadTask	com.lidroid.xutils.BitmapUtils.BitmapLoadTask<?>
    //   389	78	4	i	int
    //   81	437	5	l1	long
    //   109	338	7	l2	long
    //   32	488	9	l3	long
    //   121	5	11	l4	long
    //   40	511	13	localObject1	Object
    //   36	505	14	localObject2	Object
    //   26	431	15	localObject3	Object
    //   23	475	16	localView	android.view.View
    //   273	112	17	localURLConnection	java.net.URLConnection
    // Exception table:
    //   from	to	target	type
    //   42	51	527	java/lang/Throwable
    //   59	68	527	java/lang/Throwable
    //   76	83	527	java/lang/Throwable
    //   91	100	527	java/lang/Throwable
    //   136	143	527	java/lang/Throwable
    //   149	155	527	java/lang/Throwable
    //   176	185	527	java/lang/Throwable
    //   193	214	527	java/lang/Throwable
    //   222	229	527	java/lang/Throwable
    //   237	246	527	java/lang/Throwable
    //   262	275	527	java/lang/Throwable
    //   283	292	527	java/lang/Throwable
    //   300	309	527	java/lang/Throwable
    //   317	330	527	java/lang/Throwable
    //   405	412	527	java/lang/Throwable
    //   418	426	527	java/lang/Throwable
    //   438	442	527	java/lang/Throwable
    //   455	464	527	java/lang/Throwable
    //   478	485	527	java/lang/Throwable
    //   491	497	527	java/lang/Throwable
    //   516	524	527	java/lang/Throwable
    //   42	51	549	finally
    //   59	68	549	finally
    //   76	83	549	finally
    //   91	100	549	finally
    //   136	143	549	finally
    //   149	155	549	finally
    //   176	185	549	finally
    //   193	214	549	finally
    //   222	229	549	finally
    //   237	246	549	finally
    //   262	275	549	finally
    //   283	292	549	finally
    //   300	309	549	finally
    //   317	330	549	finally
    //   405	412	549	finally
    //   418	426	549	finally
    //   438	442	549	finally
    //   455	464	549	finally
    //   478	485	549	finally
    //   491	497	549	finally
    //   516	524	549	finally
    //   532	540	549	finally
    //   106	111	557	finally
    //   117	123	557	finally
    //   336	343	557	finally
    //   353	362	557	finally
    //   368	378	557	finally
    //   384	391	557	finally
    //   106	111	561	java/lang/Throwable
    //   117	123	561	java/lang/Throwable
    //   336	343	561	java/lang/Throwable
    //   353	362	561	java/lang/Throwable
    //   368	378	561	java/lang/Throwable
    //   384	391	561	java/lang/Throwable
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\download\DefaultDownloader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */