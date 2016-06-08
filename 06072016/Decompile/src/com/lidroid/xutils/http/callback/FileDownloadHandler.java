package com.lidroid.xutils.http.callback;

import org.apache.http.*;
import java.io.*;

public class FileDownloadHandler
{
    public File handleEntity(final HttpEntity p0, final RequestCallBackHandler p1, final String p2, final boolean p3, final String p4) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: ifnull          11
        //     4: aload_3        
        //     5: invokestatic    android/text/TextUtils.isEmpty:(Ljava/lang/CharSequence;)Z
        //     8: ifeq            15
        //    11: aconst_null    
        //    12: astore_1       
        //    13: aload_1        
        //    14: areturn        
        //    15: new             Ljava/io/File;
        //    18: dup            
        //    19: aload_3        
        //    20: invokespecial   java/io/File.<init>:(Ljava/lang/String;)V
        //    23: astore          13
        //    25: aload           13
        //    27: invokevirtual   java/io/File.exists:()Z
        //    30: ifne            60
        //    33: aload           13
        //    35: invokevirtual   java/io/File.getParentFile:()Ljava/io/File;
        //    38: astore          14
        //    40: aload           14
        //    42: invokevirtual   java/io/File.exists:()Z
        //    45: ifne            54
        //    48: aload           14
        //    50: invokevirtual   java/io/File.mkdirs:()Z
        //    53: pop            
        //    54: aload           13
        //    56: invokevirtual   java/io/File.createNewFile:()Z
        //    59: pop            
        //    60: lconst_0       
        //    61: lstore          7
        //    63: aconst_null    
        //    64: astore          15
        //    66: aconst_null    
        //    67: astore          14
        //    69: iload           4
        //    71: ifeq            160
        //    74: aload           13
        //    76: invokevirtual   java/io/File.length:()J
        //    79: lstore          7
        //    81: new             Ljava/io/FileOutputStream;
        //    84: dup            
        //    85: aload_3        
        //    86: iconst_1       
        //    87: invokespecial   java/io/FileOutputStream.<init>:(Ljava/lang/String;Z)V
        //    90: astore_3       
        //    91: aload_1        
        //    92: invokeinterface org/apache/http/HttpEntity.getContentLength:()J
        //    97: lload           7
        //    99: ladd           
        //   100: lstore          11
        //   102: new             Ljava/io/BufferedInputStream;
        //   105: dup            
        //   106: aload_1        
        //   107: invokeinterface org/apache/http/HttpEntity.getContent:()Ljava/io/InputStream;
        //   112: invokespecial   java/io/BufferedInputStream.<init>:(Ljava/io/InputStream;)V
        //   115: astore_1       
        //   116: new             Ljava/io/BufferedOutputStream;
        //   119: dup            
        //   120: aload_3        
        //   121: invokespecial   java/io/BufferedOutputStream.<init>:(Ljava/io/OutputStream;)V
        //   124: astore          15
        //   126: aload_2        
        //   127: ifnull          172
        //   130: aload_2        
        //   131: lload           11
        //   133: lload           7
        //   135: iconst_1       
        //   136: invokeinterface com/lidroid/xutils/http/callback/RequestCallBackHandler.updateProgress:(JJZ)Z
        //   141: istore          4
        //   143: iload           4
        //   145: ifne            172
        //   148: aload_1        
        //   149: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   152: aload           15
        //   154: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   157: aload           13
        //   159: areturn        
        //   160: new             Ljava/io/FileOutputStream;
        //   163: dup            
        //   164: aload_3        
        //   165: invokespecial   java/io/FileOutputStream.<init>:(Ljava/lang/String;)V
        //   168: astore_3       
        //   169: goto            91
        //   172: sipush          4096
        //   175: newarray        B
        //   177: astore          14
        //   179: aload_1        
        //   180: aload           14
        //   182: invokevirtual   java/io/BufferedInputStream.read:([B)I
        //   185: istore          6
        //   187: iload           6
        //   189: iconst_m1      
        //   190: if_icmpne       277
        //   193: aload_3        
        //   194: invokevirtual   java/io/FileOutputStream.flush:()V
        //   197: aload_2        
        //   198: ifnull          213
        //   201: aload_2        
        //   202: lload           11
        //   204: lload           7
        //   206: iconst_1       
        //   207: invokeinterface com/lidroid/xutils/http/callback/RequestCallBackHandler.updateProgress:(JJZ)Z
        //   212: pop            
        //   213: aload_1        
        //   214: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   217: aload           15
        //   219: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   222: aload           13
        //   224: astore_1       
        //   225: aload           13
        //   227: invokevirtual   java/io/File.exists:()Z
        //   230: ifeq            13
        //   233: aload           13
        //   235: astore_1       
        //   236: aload           5
        //   238: invokestatic    android/text/TextUtils.isEmpty:(Ljava/lang/CharSequence;)Z
        //   241: ifne            13
        //   244: new             Ljava/io/File;
        //   247: dup            
        //   248: aload           13
        //   250: invokevirtual   java/io/File.getParent:()Ljava/lang/String;
        //   253: aload           5
        //   255: invokespecial   java/io/File.<init>:(Ljava/lang/String;Ljava/lang/String;)V
        //   258: astore_1       
        //   259: aload_1        
        //   260: invokevirtual   java/io/File.exists:()Z
        //   263: ifne            353
        //   266: aload           13
        //   268: aload_1        
        //   269: invokevirtual   java/io/File.renameTo:(Ljava/io/File;)Z
        //   272: ifeq            390
        //   275: aload_1        
        //   276: areturn        
        //   277: aload_3        
        //   278: aload           14
        //   280: iconst_0       
        //   281: iload           6
        //   283: invokevirtual   java/io/FileOutputStream.write:([BII)V
        //   286: lload           7
        //   288: iload           6
        //   290: i2l            
        //   291: ladd           
        //   292: lstore          9
        //   294: lload           9
        //   296: lstore          7
        //   298: aload_2        
        //   299: ifnull          179
        //   302: aload_2        
        //   303: lload           11
        //   305: lload           9
        //   307: iconst_0       
        //   308: invokeinterface com/lidroid/xutils/http/callback/RequestCallBackHandler.updateProgress:(JJZ)Z
        //   313: istore          4
        //   315: lload           9
        //   317: lstore          7
        //   319: iload           4
        //   321: ifne            179
        //   324: aload_1        
        //   325: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   328: aload           15
        //   330: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   333: aload           13
        //   335: areturn        
        //   336: astore_2       
        //   337: aload           14
        //   339: astore_3       
        //   340: aload           15
        //   342: astore_1       
        //   343: aload_1        
        //   344: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   347: aload_3        
        //   348: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   351: aload_2        
        //   352: athrow         
        //   353: new             Ljava/io/File;
        //   356: dup            
        //   357: aload           13
        //   359: invokevirtual   java/io/File.getParent:()Ljava/lang/String;
        //   362: new             Ljava/lang/StringBuilder;
        //   365: dup            
        //   366: invokestatic    java/lang/System.currentTimeMillis:()J
        //   369: invokestatic    java/lang/String.valueOf:(J)Ljava/lang/String;
        //   372: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   375: aload           5
        //   377: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   380: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   383: invokespecial   java/io/File.<init>:(Ljava/lang/String;Ljava/lang/String;)V
        //   386: astore_1       
        //   387: goto            259
        //   390: aload           13
        //   392: astore_1       
        //   393: goto            275
        //   396: astore_2       
        //   397: aload           14
        //   399: astore_3       
        //   400: goto            343
        //   403: astore_2       
        //   404: aload           15
        //   406: astore_3       
        //   407: goto            343
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  74     91     336    343    Any
        //  91     116    336    343    Any
        //  116    126    396    403    Any
        //  130    143    403    410    Any
        //  160    169    336    343    Any
        //  172    179    403    410    Any
        //  179    187    403    410    Any
        //  193    197    403    410    Any
        //  201    213    403    410    Any
        //  277    286    403    410    Any
        //  302    315    403    410    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 201, Size: 201
        //     at java.util.ArrayList.rangeCheck(Unknown Source)
        //     at java.util.ArrayList.get(Unknown Source)
        //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3321)
        //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
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
