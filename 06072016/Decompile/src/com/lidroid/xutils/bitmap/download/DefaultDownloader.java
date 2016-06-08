package com.lidroid.xutils.bitmap.download;

import java.io.*;
import com.lidroid.xutils.*;

public class DefaultDownloader extends Downloader
{
    @Override
    public long downloadToStream(final String p0, final OutputStream p1, final BitmapUtils.BitmapLoadTask<?> p2) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: ifnull          18
        //     4: aload_3        
        //     5: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.isCancelled:()Z
        //     8: ifne            18
        //    11: aload_3        
        //    12: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.getTargetContainer:()Landroid/view/View;
        //    15: ifnonnull       22
        //    18: ldc2_w          -1
        //    21: lreturn        
        //    22: aconst_null    
        //    23: astore          16
        //    25: aconst_null    
        //    26: astore          15
        //    28: invokestatic    com/lidroid/xutils/util/OtherUtils.trustAllSSLForHttpsURLConnection:()V
        //    31: lconst_0       
        //    32: lstore          9
        //    34: aload           15
        //    36: astore          14
        //    38: aload           16
        //    40: astore          13
        //    42: aload_1        
        //    43: ldc             "/"
        //    45: invokevirtual   java/lang/String.startsWith:(Ljava/lang/String;)Z
        //    48: ifeq            168
        //    51: aload           15
        //    53: astore          14
        //    55: aload           16
        //    57: astore          13
        //    59: new             Ljava/io/FileInputStream;
        //    62: dup            
        //    63: aload_1        
        //    64: invokespecial   java/io/FileInputStream.<init>:(Ljava/lang/String;)V
        //    67: astore_1       
        //    68: aload           15
        //    70: astore          14
        //    72: aload           16
        //    74: astore          13
        //    76: aload_1        
        //    77: invokevirtual   java/io/FileInputStream.available:()I
        //    80: i2l            
        //    81: lstore          5
        //    83: aload           15
        //    85: astore          14
        //    87: aload           16
        //    89: astore          13
        //    91: new             Ljava/io/BufferedInputStream;
        //    94: dup            
        //    95: aload_1        
        //    96: invokespecial   java/io/BufferedInputStream.<init>:(Ljava/io/InputStream;)V
        //    99: astore_1       
        //   100: aload_1        
        //   101: astore          13
        //   103: aload_1        
        //   104: astore          14
        //   106: invokestatic    java/lang/System.currentTimeMillis:()J
        //   109: lstore          7
        //   111: aload_1        
        //   112: astore          13
        //   114: aload_1        
        //   115: astore          14
        //   117: aload_0        
        //   118: invokevirtual   com/lidroid/xutils/bitmap/download/DefaultDownloader.getDefaultExpiry:()J
        //   121: lstore          11
        //   123: lload           7
        //   125: lload           11
        //   127: ladd           
        //   128: lstore          7
        //   130: aload_1        
        //   131: astore          14
        //   133: aload_1        
        //   134: astore          13
        //   136: aload_3        
        //   137: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.isCancelled:()Z
        //   140: ifne            160
        //   143: aload_1        
        //   144: astore          14
        //   146: aload_1        
        //   147: astore          13
        //   149: aload_3        
        //   150: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.getTargetContainer:()Landroid/view/View;
        //   153: astore          15
        //   155: aload           15
        //   157: ifnonnull       399
        //   160: aload_1        
        //   161: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   164: ldc2_w          -1
        //   167: lreturn        
        //   168: aload           15
        //   170: astore          14
        //   172: aload           16
        //   174: astore          13
        //   176: aload_1        
        //   177: ldc             "assets/"
        //   179: invokevirtual   java/lang/String.startsWith:(Ljava/lang/String;)Z
        //   182: ifeq            254
        //   185: aload           15
        //   187: astore          14
        //   189: aload           16
        //   191: astore          13
        //   193: aload_0        
        //   194: invokevirtual   com/lidroid/xutils/bitmap/download/DefaultDownloader.getContext:()Landroid/content/Context;
        //   197: invokevirtual   android/content/Context.getAssets:()Landroid/content/res/AssetManager;
        //   200: aload_1        
        //   201: bipush          7
        //   203: aload_1        
        //   204: invokevirtual   java/lang/String.length:()I
        //   207: invokevirtual   java/lang/String.substring:(II)Ljava/lang/String;
        //   210: invokevirtual   android/content/res/AssetManager.open:(Ljava/lang/String;)Ljava/io/InputStream;
        //   213: astore_1       
        //   214: aload           15
        //   216: astore          14
        //   218: aload           16
        //   220: astore          13
        //   222: aload_1        
        //   223: invokevirtual   java/io/InputStream.available:()I
        //   226: i2l            
        //   227: lstore          5
        //   229: aload           15
        //   231: astore          14
        //   233: aload           16
        //   235: astore          13
        //   237: new             Ljava/io/BufferedInputStream;
        //   240: dup            
        //   241: aload_1        
        //   242: invokespecial   java/io/BufferedInputStream.<init>:(Ljava/io/InputStream;)V
        //   245: astore_1       
        //   246: ldc2_w          9223372036854775807
        //   249: lstore          7
        //   251: goto            130
        //   254: aload           15
        //   256: astore          14
        //   258: aload           16
        //   260: astore          13
        //   262: new             Ljava/net/URL;
        //   265: dup            
        //   266: aload_1        
        //   267: invokespecial   java/net/URL.<init>:(Ljava/lang/String;)V
        //   270: invokevirtual   java/net/URL.openConnection:()Ljava/net/URLConnection;
        //   273: astore          17
        //   275: aload           15
        //   277: astore          14
        //   279: aload           16
        //   281: astore          13
        //   283: aload           17
        //   285: aload_0        
        //   286: invokevirtual   com/lidroid/xutils/bitmap/download/DefaultDownloader.getDefaultConnectTimeout:()I
        //   289: invokevirtual   java/net/URLConnection.setConnectTimeout:(I)V
        //   292: aload           15
        //   294: astore          14
        //   296: aload           16
        //   298: astore          13
        //   300: aload           17
        //   302: aload_0        
        //   303: invokevirtual   com/lidroid/xutils/bitmap/download/DefaultDownloader.getDefaultReadTimeout:()I
        //   306: invokevirtual   java/net/URLConnection.setReadTimeout:(I)V
        //   309: aload           15
        //   311: astore          14
        //   313: aload           16
        //   315: astore          13
        //   317: new             Ljava/io/BufferedInputStream;
        //   320: dup            
        //   321: aload           17
        //   323: invokevirtual   java/net/URLConnection.getInputStream:()Ljava/io/InputStream;
        //   326: invokespecial   java/io/BufferedInputStream.<init>:(Ljava/io/InputStream;)V
        //   329: astore_1       
        //   330: aload_1        
        //   331: astore          13
        //   333: aload_1        
        //   334: astore          14
        //   336: aload           17
        //   338: invokevirtual   java/net/URLConnection.getExpiration:()J
        //   341: lstore          5
        //   343: lload           5
        //   345: lstore          7
        //   347: aload_1        
        //   348: astore          13
        //   350: aload_1        
        //   351: astore          14
        //   353: lload           5
        //   355: invokestatic    java/lang/System.currentTimeMillis:()J
        //   358: lcmp           
        //   359: ifge            378
        //   362: aload_1        
        //   363: astore          13
        //   365: aload_1        
        //   366: astore          14
        //   368: invokestatic    java/lang/System.currentTimeMillis:()J
        //   371: aload_0        
        //   372: invokevirtual   com/lidroid/xutils/bitmap/download/DefaultDownloader.getDefaultExpiry:()J
        //   375: ladd           
        //   376: lstore          7
        //   378: aload_1        
        //   379: astore          13
        //   381: aload_1        
        //   382: astore          14
        //   384: aload           17
        //   386: invokevirtual   java/net/URLConnection.getContentLength:()I
        //   389: istore          4
        //   391: iload           4
        //   393: i2l            
        //   394: lstore          5
        //   396: goto            130
        //   399: aload_1        
        //   400: astore          14
        //   402: aload_1        
        //   403: astore          13
        //   405: sipush          4096
        //   408: newarray        B
        //   410: astore          15
        //   412: aload_1        
        //   413: astore          14
        //   415: aload_1        
        //   416: astore          13
        //   418: aload_1        
        //   419: aload           15
        //   421: invokevirtual   java/io/BufferedInputStream.read:([B)I
        //   424: istore          4
        //   426: iload           4
        //   428: iconst_m1      
        //   429: if_icmpne       449
        //   432: aload_1        
        //   433: astore          14
        //   435: aload_1        
        //   436: astore          13
        //   438: aload_2        
        //   439: invokevirtual   java/io/OutputStream.flush:()V
        //   442: aload_1        
        //   443: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   446: lload           7
        //   448: lreturn        
        //   449: aload_1        
        //   450: astore          14
        //   452: aload_1        
        //   453: astore          13
        //   455: aload_2        
        //   456: aload           15
        //   458: iconst_0       
        //   459: iload           4
        //   461: invokevirtual   java/io/OutputStream.write:([BII)V
        //   464: lload           9
        //   466: iload           4
        //   468: i2l            
        //   469: ladd           
        //   470: lstore          9
        //   472: aload_1        
        //   473: astore          14
        //   475: aload_1        
        //   476: astore          13
        //   478: aload_3        
        //   479: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.isCancelled:()Z
        //   482: ifne            502
        //   485: aload_1        
        //   486: astore          14
        //   488: aload_1        
        //   489: astore          13
        //   491: aload_3        
        //   492: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.getTargetContainer:()Landroid/view/View;
        //   495: astore          16
        //   497: aload           16
        //   499: ifnonnull       510
        //   502: aload_1        
        //   503: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   506: ldc2_w          -1
        //   509: lreturn        
        //   510: aload_1        
        //   511: astore          14
        //   513: aload_1        
        //   514: astore          13
        //   516: aload_3        
        //   517: lload           5
        //   519: lload           9
        //   521: invokevirtual   com/lidroid/xutils/BitmapUtils$BitmapLoadTask.updateProgress:(JJ)V
        //   524: goto            412
        //   527: astore_1       
        //   528: aload           14
        //   530: astore          13
        //   532: aload_1        
        //   533: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   536: aload_1        
        //   537: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   540: aload           14
        //   542: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   545: ldc2_w          -1
        //   548: lreturn        
        //   549: astore_1       
        //   550: aload           13
        //   552: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   555: aload_1        
        //   556: athrow         
        //   557: astore_1       
        //   558: goto            550
        //   561: astore_1       
        //   562: goto            528
        //    Signature:
        //  (Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<*>;)J
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  42     51     527    528    Ljava/lang/Throwable;
        //  42     51     549    550    Any
        //  59     68     527    528    Ljava/lang/Throwable;
        //  59     68     549    550    Any
        //  76     83     527    528    Ljava/lang/Throwable;
        //  76     83     549    550    Any
        //  91     100    527    528    Ljava/lang/Throwable;
        //  91     100    549    550    Any
        //  106    111    561    565    Ljava/lang/Throwable;
        //  106    111    557    561    Any
        //  117    123    561    565    Ljava/lang/Throwable;
        //  117    123    557    561    Any
        //  136    143    527    528    Ljava/lang/Throwable;
        //  136    143    549    550    Any
        //  149    155    527    528    Ljava/lang/Throwable;
        //  149    155    549    550    Any
        //  176    185    527    528    Ljava/lang/Throwable;
        //  176    185    549    550    Any
        //  193    214    527    528    Ljava/lang/Throwable;
        //  193    214    549    550    Any
        //  222    229    527    528    Ljava/lang/Throwable;
        //  222    229    549    550    Any
        //  237    246    527    528    Ljava/lang/Throwable;
        //  237    246    549    550    Any
        //  262    275    527    528    Ljava/lang/Throwable;
        //  262    275    549    550    Any
        //  283    292    527    528    Ljava/lang/Throwable;
        //  283    292    549    550    Any
        //  300    309    527    528    Ljava/lang/Throwable;
        //  300    309    549    550    Any
        //  317    330    527    528    Ljava/lang/Throwable;
        //  317    330    549    550    Any
        //  336    343    561    565    Ljava/lang/Throwable;
        //  336    343    557    561    Any
        //  353    362    561    565    Ljava/lang/Throwable;
        //  353    362    557    561    Any
        //  368    378    561    565    Ljava/lang/Throwable;
        //  368    378    557    561    Any
        //  384    391    561    565    Ljava/lang/Throwable;
        //  384    391    557    561    Any
        //  405    412    527    528    Ljava/lang/Throwable;
        //  405    412    549    550    Any
        //  418    426    527    528    Ljava/lang/Throwable;
        //  418    426    549    550    Any
        //  438    442    527    528    Ljava/lang/Throwable;
        //  438    442    549    550    Any
        //  455    464    527    528    Ljava/lang/Throwable;
        //  455    464    549    550    Any
        //  478    485    527    528    Ljava/lang/Throwable;
        //  478    485    549    550    Any
        //  491    497    527    528    Ljava/lang/Throwable;
        //  491    497    549    550    Any
        //  516    524    527    528    Ljava/lang/Throwable;
        //  516    524    549    550    Any
        //  532    540    549    550    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0130:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2596)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:757)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:655)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:532)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:499)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:141)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:130)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.buildAst(JavaLanguage.java:71)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at us.deathmarine.luyten.FileSaver.doSaveJarDecompiled(FileSaver.java:191)
        //     at us.deathmarine.luyten.FileSaver.access$300(FileSaver.java:46)
        //     at us.deathmarine.luyten.FileSaver$4.run(FileSaver.java:112)
        //     at java.lang.Thread.run(Unknown Source)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
}
