package com.lidroid.xutils;

import android.app.*;
import com.lidroid.xutils.view.*;
import android.view.*;
import android.preference.*;

public class ViewUtils
{
    public static void inject(final Activity activity) {
        injectObject(activity, new ViewFinder(activity));
    }
    
    public static void inject(final PreferenceActivity preferenceActivity) {
        injectObject(preferenceActivity, new ViewFinder(preferenceActivity));
    }
    
    public static void inject(final View view) {
        injectObject(view, new ViewFinder(view));
    }
    
    public static void inject(final Object o, final Activity activity) {
        injectObject(o, new ViewFinder(activity));
    }
    
    public static void inject(final Object o, final PreferenceActivity preferenceActivity) {
        injectObject(o, new ViewFinder(preferenceActivity));
    }
    
    public static void inject(final Object o, final PreferenceGroup preferenceGroup) {
        injectObject(o, new ViewFinder(preferenceGroup));
    }
    
    public static void inject(final Object o, final View view) {
        injectObject(o, new ViewFinder(view));
    }
    
    private static void injectObject(final Object p0, final ViewFinder p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: invokevirtual   java/lang/Object.getClass:()Ljava/lang/Class;
        //     4: astore          10
        //     6: aload           10
        //     8: ldc             Lcom/lidroid/xutils/view/annotation/ContentView;.class
        //    10: invokevirtual   java/lang/Class.getAnnotation:(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
        //    13: checkcast       Lcom/lidroid/xutils/view/annotation/ContentView;
        //    16: astore          11
        //    18: aload           11
        //    20: ifnull          62
        //    23: aload           10
        //    25: ldc             "setContentView"
        //    27: iconst_1       
        //    28: anewarray       Ljava/lang/Class;
        //    31: dup            
        //    32: iconst_0       
        //    33: getstatic       java/lang/Integer.TYPE:Ljava/lang/Class;
        //    36: aastore        
        //    37: invokevirtual   java/lang/Class.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
        //    40: aload_0        
        //    41: iconst_1       
        //    42: anewarray       Ljava/lang/Object;
        //    45: dup            
        //    46: iconst_0       
        //    47: aload           11
        //    49: invokeinterface com/lidroid/xutils/view/annotation/ContentView.value:()I
        //    54: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
        //    57: aastore        
        //    58: invokevirtual   java/lang/reflect/Method.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
        //    61: pop            
        //    62: aload           10
        //    64: invokevirtual   java/lang/Class.getDeclaredFields:()[Ljava/lang/reflect/Field;
        //    67: astore          11
        //    69: aload           11
        //    71: ifnull          91
        //    74: aload           11
        //    76: arraylength    
        //    77: ifle            91
        //    80: aload           11
        //    82: arraylength    
        //    83: istore_3       
        //    84: iconst_0       
        //    85: istore_2       
        //    86: iload_2        
        //    87: iload_3        
        //    88: if_icmplt       138
        //    91: aload           10
        //    93: invokevirtual   java/lang/Class.getDeclaredMethods:()[Ljava/lang/reflect/Method;
        //    96: astore          12
        //    98: aload           12
        //   100: ifnull          122
        //   103: aload           12
        //   105: arraylength    
        //   106: ifle            122
        //   109: aload           12
        //   111: arraylength    
        //   112: istore          7
        //   114: iconst_0       
        //   115: istore_2       
        //   116: iload_2        
        //   117: iload           7
        //   119: if_icmplt       366
        //   122: return         
        //   123: astore          11
        //   125: aload           11
        //   127: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   130: aload           11
        //   132: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   135: goto            62
        //   138: aload           11
        //   140: iload_2        
        //   141: aaload         
        //   142: astore          12
        //   144: aload           12
        //   146: ldc             Lcom/lidroid/xutils/view/annotation/ViewInject;.class
        //   148: invokevirtual   java/lang/reflect/Field.getAnnotation:(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
        //   151: checkcast       Lcom/lidroid/xutils/view/annotation/ViewInject;
        //   154: astore          13
        //   156: aload           13
        //   158: ifnull          222
        //   161: aload_1        
        //   162: aload           13
        //   164: invokeinterface com/lidroid/xutils/view/annotation/ViewInject.value:()I
        //   169: aload           13
        //   171: invokeinterface com/lidroid/xutils/view/annotation/ViewInject.parentId:()I
        //   176: invokevirtual   com/lidroid/xutils/view/ViewFinder.findViewById:(II)Landroid/view/View;
        //   179: astore          13
        //   181: aload           13
        //   183: ifnull          200
        //   186: aload           12
        //   188: iconst_1       
        //   189: invokevirtual   java/lang/reflect/Field.setAccessible:(Z)V
        //   192: aload           12
        //   194: aload_0        
        //   195: aload           13
        //   197: invokevirtual   java/lang/reflect/Field.set:(Ljava/lang/Object;Ljava/lang/Object;)V
        //   200: iload_2        
        //   201: iconst_1       
        //   202: iadd           
        //   203: istore_2       
        //   204: goto            86
        //   207: astore          12
        //   209: aload           12
        //   211: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   214: aload           12
        //   216: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   219: goto            200
        //   222: aload           12
        //   224: ldc             Lcom/lidroid/xutils/view/annotation/ResInject;.class
        //   226: invokevirtual   java/lang/reflect/Field.getAnnotation:(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
        //   229: checkcast       Lcom/lidroid/xutils/view/annotation/ResInject;
        //   232: astore          13
        //   234: aload           13
        //   236: ifnull          299
        //   239: aload           13
        //   241: invokeinterface com/lidroid/xutils/view/annotation/ResInject.type:()Lcom/lidroid/xutils/view/ResType;
        //   246: aload_1        
        //   247: invokevirtual   com/lidroid/xutils/view/ViewFinder.getContext:()Landroid/content/Context;
        //   250: aload           13
        //   252: invokeinterface com/lidroid/xutils/view/annotation/ResInject.id:()I
        //   257: invokestatic    com/lidroid/xutils/view/ResLoader.loadRes:(Lcom/lidroid/xutils/view/ResType;Landroid/content/Context;I)Ljava/lang/Object;
        //   260: astore          13
        //   262: aload           13
        //   264: ifnull          200
        //   267: aload           12
        //   269: iconst_1       
        //   270: invokevirtual   java/lang/reflect/Field.setAccessible:(Z)V
        //   273: aload           12
        //   275: aload_0        
        //   276: aload           13
        //   278: invokevirtual   java/lang/reflect/Field.set:(Ljava/lang/Object;Ljava/lang/Object;)V
        //   281: goto            200
        //   284: astore          12
        //   286: aload           12
        //   288: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   291: aload           12
        //   293: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   296: goto            200
        //   299: aload           12
        //   301: ldc             Lcom/lidroid/xutils/view/annotation/PreferenceInject;.class
        //   303: invokevirtual   java/lang/reflect/Field.getAnnotation:(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
        //   306: checkcast       Lcom/lidroid/xutils/view/annotation/PreferenceInject;
        //   309: astore          13
        //   311: aload           13
        //   313: ifnull          200
        //   316: aload_1        
        //   317: aload           13
        //   319: invokeinterface com/lidroid/xutils/view/annotation/PreferenceInject.value:()Ljava/lang/String;
        //   324: invokevirtual   com/lidroid/xutils/view/ViewFinder.findPreference:(Ljava/lang/CharSequence;)Landroid/preference/Preference;
        //   327: astore          13
        //   329: aload           13
        //   331: ifnull          200
        //   334: aload           12
        //   336: iconst_1       
        //   337: invokevirtual   java/lang/reflect/Field.setAccessible:(Z)V
        //   340: aload           12
        //   342: aload_0        
        //   343: aload           13
        //   345: invokevirtual   java/lang/reflect/Field.set:(Ljava/lang/Object;Ljava/lang/Object;)V
        //   348: goto            200
        //   351: astore          12
        //   353: aload           12
        //   355: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   358: aload           12
        //   360: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   363: goto            200
        //   366: aload           12
        //   368: iload_2        
        //   369: aaload         
        //   370: astore          13
        //   372: aload           13
        //   374: invokevirtual   java/lang/reflect/Method.getDeclaredAnnotations:()[Ljava/lang/annotation/Annotation;
        //   377: astore          14
        //   379: aload           14
        //   381: ifnull          403
        //   384: aload           14
        //   386: arraylength    
        //   387: ifle            403
        //   390: aload           14
        //   392: arraylength    
        //   393: istore          8
        //   395: iconst_0       
        //   396: istore_3       
        //   397: iload_3        
        //   398: iload           8
        //   400: if_icmplt       410
        //   403: iload_2        
        //   404: iconst_1       
        //   405: iadd           
        //   406: istore_2       
        //   407: goto            116
        //   410: aload           14
        //   412: iload_3        
        //   413: aaload         
        //   414: astore          15
        //   416: aload           15
        //   418: invokeinterface java/lang/annotation/Annotation.annotationType:()Ljava/lang/Class;
        //   423: astore          11
        //   425: aload           11
        //   427: ldc             Lcom/lidroid/xutils/view/annotation/event/EventBase;.class
        //   429: invokevirtual   java/lang/Class.getAnnotation:(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
        //   432: ifnull          651
        //   435: aload           13
        //   437: iconst_1       
        //   438: invokevirtual   java/lang/reflect/Method.setAccessible:(Z)V
        //   441: aload           11
        //   443: ldc             "value"
        //   445: iconst_0       
        //   446: anewarray       Ljava/lang/Class;
        //   449: invokevirtual   java/lang/Class.getDeclaredMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
        //   452: astore          16
        //   454: aconst_null    
        //   455: astore          10
        //   457: aload           11
        //   459: ldc             "parentId"
        //   461: iconst_0       
        //   462: anewarray       Ljava/lang/Class;
        //   465: invokevirtual   java/lang/Class.getDeclaredMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
        //   468: astore          11
        //   470: aload           11
        //   472: astore          10
        //   474: aload           16
        //   476: aload           15
        //   478: iconst_0       
        //   479: anewarray       Ljava/lang/Object;
        //   482: invokevirtual   java/lang/reflect/Method.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
        //   485: astore          11
        //   487: aload           10
        //   489: ifnonnull       511
        //   492: aconst_null    
        //   493: astore          10
        //   495: goto            633
        //   498: aload           11
        //   500: invokestatic    java/lang/reflect/Array.getLength:(Ljava/lang/Object;)I
        //   503: istore          9
        //   505: iconst_0       
        //   506: istore          5
        //   508: goto            644
        //   511: aload           10
        //   513: aload           15
        //   515: iconst_0       
        //   516: anewarray       Ljava/lang/Object;
        //   519: invokevirtual   java/lang/reflect/Method.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
        //   522: astore          10
        //   524: goto            633
        //   527: aload           10
        //   529: invokestatic    java/lang/reflect/Array.getLength:(Ljava/lang/Object;)I
        //   532: istore          4
        //   534: goto            498
        //   537: new             Lcom/lidroid/xutils/view/ViewInjectInfo;
        //   540: dup            
        //   541: invokespecial   com/lidroid/xutils/view/ViewInjectInfo.<init>:()V
        //   544: astore          16
        //   546: aload           16
        //   548: aload           11
        //   550: iload           5
        //   552: invokestatic    java/lang/reflect/Array.get:(Ljava/lang/Object;I)Ljava/lang/Object;
        //   555: putfield        com/lidroid/xutils/view/ViewInjectInfo.value:Ljava/lang/Object;
        //   558: iload           4
        //   560: iload           5
        //   562: if_icmple       607
        //   565: aload           10
        //   567: iload           5
        //   569: invokestatic    java/lang/reflect/Array.get:(Ljava/lang/Object;I)Ljava/lang/Object;
        //   572: checkcast       Ljava/lang/Integer;
        //   575: invokevirtual   java/lang/Integer.intValue:()I
        //   578: istore          6
        //   580: aload           16
        //   582: iload           6
        //   584: putfield        com/lidroid/xutils/view/ViewInjectInfo.parentId:I
        //   587: aload_1        
        //   588: aload           16
        //   590: aload           15
        //   592: aload_0        
        //   593: aload           13
        //   595: invokestatic    com/lidroid/xutils/view/EventListenerManager.addEventMethod:(Lcom/lidroid/xutils/view/ViewFinder;Lcom/lidroid/xutils/view/ViewInjectInfo;Ljava/lang/annotation/Annotation;Ljava/lang/Object;Ljava/lang/reflect/Method;)V
        //   598: iload           5
        //   600: iconst_1       
        //   601: iadd           
        //   602: istore          5
        //   604: goto            644
        //   607: iconst_0       
        //   608: istore          6
        //   610: goto            580
        //   613: astore          10
        //   615: aload           10
        //   617: invokevirtual   java/lang/Throwable.getMessage:()Ljava/lang/String;
        //   620: aload           10
        //   622: invokestatic    com/lidroid/xutils/util/LogUtils.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   625: goto            651
        //   628: astore          11
        //   630: goto            474
        //   633: aload           10
        //   635: ifnonnull       527
        //   638: iconst_0       
        //   639: istore          4
        //   641: goto            498
        //   644: iload           5
        //   646: iload           9
        //   648: if_icmplt       537
        //   651: iload_3        
        //   652: iconst_1       
        //   653: iadd           
        //   654: istore_3       
        //   655: goto            397
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  23     62     123    138    Ljava/lang/Throwable;
        //  161    181    207    222    Ljava/lang/Throwable;
        //  186    200    207    222    Ljava/lang/Throwable;
        //  239    262    284    299    Ljava/lang/Throwable;
        //  267    281    284    299    Ljava/lang/Throwable;
        //  316    329    351    366    Ljava/lang/Throwable;
        //  334    348    351    366    Ljava/lang/Throwable;
        //  441    454    613    628    Ljava/lang/Throwable;
        //  457    470    628    633    Ljava/lang/Throwable;
        //  474    487    613    628    Ljava/lang/Throwable;
        //  498    505    613    628    Ljava/lang/Throwable;
        //  511    524    613    628    Ljava/lang/Throwable;
        //  527    534    613    628    Ljava/lang/Throwable;
        //  537    558    613    628    Ljava/lang/Throwable;
        //  565    580    613    628    Ljava/lang/Throwable;
        //  580    598    613    628    Ljava/lang/Throwable;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0474:
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
