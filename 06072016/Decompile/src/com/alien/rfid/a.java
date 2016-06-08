package com.alien.rfid;

import java.util.concurrent.*;
import android.net.*;

class a extends RFIDReader
{
    private static a h;
    private int a;
    private int b;
    private com.rscja.deviceapi.a c;
    private ALRH450CusAPI d;
    private boolean e;
    private boolean f;
    private CountDownLatch g;
    private LocalServerSocket i;
    
    static {
        a.h = null;
    }
    
    private a() throws ReaderException {
        this.a = 10;
        this.b = 0;
        this.d();
    }
    
    public static RFIDReader a() throws ReaderException {
        synchronized (a.class) {
            if (a.h == null) {
                a.h = new a();
            }
            a.h.d();
            return a.h;
        }
    }
    
    private RFIDResult a(final LockFields lockFields, final Mask mask, final String s, final com.rscja.deviceapi.a.b b) throws ReaderException {
        synchronized (this) {
            this.e();
            if (mask.getData().length() * 4 <= mask.getBitLength()) {
                throw new InvalidParamException("Mask data is shorter than the bit length");
            }
        }
        final LockFields lockFields2;
        // monitorexit(this)
        return new RFIDResult(this.d.lockUnlockFields(s, mask.getBank().getValue(), mask.getBitPointer(), mask.getData(), mask.getBitLength(), this.a(lockFields2, b)) == 0);
    }
    
    private com.rscja.deviceapi.a.a a(final Bank bank) throws InvalidParamException {
        synchronized (this) {
            com.rscja.deviceapi.a.a a;
            if (bank == Bank.EPC) {
                a = com.rscja.deviceapi.a.a.b;
            }
            else if (bank == Bank.TID) {
                a = com.rscja.deviceapi.a.a.c;
            }
            else if (bank == Bank.RESERVED) {
                a = com.rscja.deviceapi.a.a.a;
            }
            else {
                if (bank != Bank.USER) {
                    throw new InvalidParamException("Invalid Memory Bank");
                }
                a = com.rscja.deviceapi.a.a.d;
            }
            return a;
        }
    }
    
    private String a(final LockFields lockFields, final com.rscja.deviceapi.a.b b) {
        synchronized (this) {
            Enum a = com.rscja.deviceapi.a.b.a;
            Enum a2 = com.rscja.deviceapi.a.b.a;
            Enum a3 = com.rscja.deviceapi.a.b.a;
            final com.rscja.deviceapi.a.b a4 = com.rscja.deviceapi.a.b.a;
            Enum a5 = com.rscja.deviceapi.a.b.a;
            if ((lockFields.getFieldBitmap() & 0x2) != 0x0) {
                a = b;
            }
            if ((lockFields.getFieldBitmap() & 0x1) != 0x0) {
                a2 = b;
            }
            if ((lockFields.getFieldBitmap() & 0x4) != 0x0) {
                a3 = b;
            }
            if ((lockFields.getFieldBitmap() & 0x8) != 0x0) {
                a5 = b;
            }
            return this.c.a((com.rscja.deviceapi.a.b)a, (com.rscja.deviceapi.a.b)a2, (com.rscja.deviceapi.a.b)a3, a4, (com.rscja.deviceapi.a.b)a5);
        }
    }
    
    private void a(final Mask mask) throws ReaderException {
        int n = 0;
        // monitorenter(this)
    Label_0029_Outer:
        while (true) {
            while (true) {
                if (n < 4) {
                    try {
                        this.d.setFilter(n, 0, "", 0);
                        ++n;
                        continue Label_0029_Outer;
                        // iftrue(Label_0073:, this.d.setFilter(mask.getBank().getValue(), mask.getBitPointer(), mask.getData(), mask.getBitLength()) == 0)
                        throw new ReaderException("Error setting mask");
                    }
                    finally {
                    }
                    // monitorexit(this)
                    break;
                }
                continue;
            }
        }
        Label_0073:;
    }
    // monitorexit(this)
    
    private void b() {
        this.d.setInvMaxTry(1000);
        this.d.setInvReadWaitTime(5);
    }
    
    private void c() {
        this.d.setInvMaxTry(500);
        this.d.setInvReadWaitTime(10);
    }
    
    private void d() throws ReaderException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: monitorenter   
        //     2: aload_0        
        //     3: getfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //     6: astore_1       
        //     7: aload_1        
        //     8: ifnull          14
        //    11: aload_0        
        //    12: monitorexit    
        //    13: return         
        //    14: aload_0        
        //    15: new             Landroid/net/LocalServerSocket;
        //    18: dup            
        //    19: ldc             "alienapi"
        //    21: invokespecial   android/net/LocalServerSocket.<init>:(Ljava/lang/String;)V
        //    24: putfield        com/alien/rfid/a.i:Landroid/net/LocalServerSocket;
        //    27: aload_0        
        //    28: new             Lcom/alien/rfid/ALRH450CusAPI;
        //    31: dup            
        //    32: invokespecial   com/alien/rfid/ALRH450CusAPI.<init>:()V
        //    35: putfield        com/alien/rfid/a.d:Lcom/alien/rfid/ALRH450CusAPI;
        //    38: aload_0        
        //    39: invokestatic    com/rscja/deviceapi/a.b:()Lcom/rscja/deviceapi/a;
        //    42: putfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //    45: aload_0        
        //    46: getfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //    49: invokevirtual   com/rscja/deviceapi/a.c:()Z
        //    52: ifeq            11
        //    55: aload_0        
        //    56: getfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //    59: invokevirtual   com/rscja/deviceapi/a.f:()Z
        //    62: pop            
        //    63: aload_0        
        //    64: invokespecial   com/alien/rfid/a.b:()V
        //    67: bipush          8
        //    69: newarray        I
        //    71: astore_1       
        //    72: aload_0        
        //    73: getfield        com/alien/rfid/a.d:Lcom/alien/rfid/ALRH450CusAPI;
        //    76: aload_1        
        //    77: invokevirtual   com/alien/rfid/ALRH450CusAPI.getGen2Parameter:([I)I
        //    80: ifeq            137
        //    83: new             Lcom/alien/rfid/ReaderException;
        //    86: dup            
        //    87: ldc             "Error reading Gen2 params"
        //    89: invokespecial   com/alien/rfid/ReaderException.<init>:(Ljava/lang/String;)V
        //    92: athrow         
        //    93: astore_1       
        //    94: new             Lcom/alien/rfid/ReaderException;
        //    97: dup            
        //    98: new             Ljava/lang/StringBuilder;
        //   101: dup            
        //   102: invokespecial   java/lang/StringBuilder.<init>:()V
        //   105: ldc             "Error initializing RFIDReaderH450: "
        //   107: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   110: aload_1        
        //   111: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   114: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   117: invokespecial   com/alien/rfid/ReaderException.<init>:(Ljava/lang/String;)V
        //   120: athrow         
        //   121: astore_1       
        //   122: aload_0        
        //   123: monitorexit    
        //   124: aload_1        
        //   125: athrow         
        //   126: astore_1       
        //   127: new             Lcom/alien/rfid/RFIDBusyException;
        //   130: dup            
        //   131: ldc             "RFID is in use by other process"
        //   133: invokespecial   com/alien/rfid/RFIDBusyException.<init>:(Ljava/lang/String;)V
        //   136: athrow         
        //   137: aload_0        
        //   138: aload_0        
        //   139: getfield        com/alien/rfid/a.d:Lcom/alien/rfid/ALRH450CusAPI;
        //   142: aload_1        
        //   143: getstatic       com/alien/rfid/ALRH450CusAPI.a:Lcom/alien/rfid/ALRH450CusAPI$a;
        //   146: invokevirtual   com/alien/rfid/ALRH450CusAPI.a:([ILcom/alien/rfid/ALRH450CusAPI$a;)I
        //   149: putfield        com/alien/rfid/a.b:I
        //   152: goto            11
        //    Exceptions:
        //  throws com.alien.rfid.ReaderException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  2      7      121    126    Any
        //  14     27     126    137    Ljava/lang/Exception;
        //  14     27     121    126    Any
        //  27     93     93     121    Ljava/lang/Exception;
        //  27     93     121    126    Any
        //  94     121    121    126    Any
        //  127    137    121    126    Any
        //  137    152    93     121    Ljava/lang/Exception;
        //  137    152    121    126    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0014:
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
    
    private void e() throws ReaderException {
        if (this.e) {
            throw new RFIDBusyException("Reader is busy!");
        }
    }
    
    @Override
    public void close() {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: monitorenter   
        //     2: aload_0        
        //     3: getfield        com/alien/rfid/a.i:Landroid/net/LocalServerSocket;
        //     6: astore_1       
        //     7: aload_1        
        //     8: ifnull          23
        //    11: aload_0        
        //    12: getfield        com/alien/rfid/a.i:Landroid/net/LocalServerSocket;
        //    15: invokevirtual   android/net/LocalServerSocket.close:()V
        //    18: aload_0        
        //    19: aconst_null    
        //    20: putfield        com/alien/rfid/a.i:Landroid/net/LocalServerSocket;
        //    23: aload_0        
        //    24: getfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //    27: ifnull          43
        //    30: aload_0        
        //    31: getfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //    34: invokevirtual   com/rscja/deviceapi/a.d:()Z
        //    37: pop            
        //    38: aload_0        
        //    39: aconst_null    
        //    40: putfield        com/alien/rfid/a.c:Lcom/rscja/deviceapi/a;
        //    43: aload_0        
        //    44: monitorexit    
        //    45: return         
        //    46: astore_1       
        //    47: aload_0        
        //    48: monitorexit    
        //    49: aload_1        
        //    50: athrow         
        //    51: astore_1       
        //    52: goto            18
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  2      7      46     51     Any
        //  11     18     51     55     Ljava/lang/Exception;
        //  11     18     46     51     Any
        //  18     23     46     51     Any
        //  23     43     46     51     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0018:
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
    
    @Override
    public String getInfo(final RFIDInfo rfidInfo) {
        switch (a$2.a[rfidInfo.ordinal()]) {
            case 1: {
                final int hardwareVersion = this.d.getHardwareVersion();
                if (hardwareVersion != -1) {
                    return "" + (hardwareVersion & 0xFF) + "." + ((hardwareVersion & 0xFF00) >> 8) + "." + ((hardwareVersion & 0xFF0000) >> 16);
                }
                break;
            }
            case 2: {
                final int firmwareVersion = this.d.getFirmwareVersion();
                if (firmwareVersion != -1) {
                    return "" + (firmwareVersion & 0xFF) + "." + ((firmwareVersion & 0xFF00) >> 8) + "." + ((firmwareVersion & 0xFF0000) >> 16);
                }
                break;
            }
            case 3: {
                final long moduleId = this.d.getModuleId();
                if (moduleId != -1L) {
                    return "" + moduleId;
                }
                break;
            }
            case 4: {
                switch (this.d.getRegion()) {
                    default: {
                        return null;
                    }
                    case 1: {
                        return "China 1";
                    }
                    case 2: {
                        return "China 2";
                    }
                    case 4: {
                        return "Europe";
                    }
                    case 8: {
                        return "USA";
                    }
                    case 22: {
                        return "Korea";
                    }
                    case 50: {
                        return "Japan";
                    }
                    case 51: {
                        return "Brazil";
                    }
                    case 52: {
                        return "WR1";
                    }
                }
                break;
            }
        }
        return null;
    }
    
    @Override
    public int getPower() throws ReaderException {
        synchronized (this) {
            this.e();
            return this.c.e();
        }
    }
    
    @Override
    public int getQ() throws ReaderException {
        synchronized (this) {
            return this.b;
        }
    }
    
    @Override
    public Session getSession() throws ReaderException {
        synchronized (this) {
            this.e();
            if (this.d.getGen2Parameter(new int[8]) != 0) {
                throw new ReaderException("Error reading Gen2 params");
            }
        }
        final int[] array;
        // monitorexit(this)
        return Session.fromValue(this.d.a(array, ALRH450CusAPI.d));
    }
    
    @Override
    public Target getTarget() throws ReaderException {
        synchronized (this) {
            this.e();
            if (this.d.getGen2Parameter(new int[8]) != 0) {
                throw new ReaderException("Error reading Gen2 params");
            }
        }
        final int[] array;
        // monitorexit(this)
        return Target.fromValue(this.d.a(array, ALRH450CusAPI.e));
    }
    
    @Override
    public void inventory(final RFIDCallback rfidCallback, final Mask mask) throws ReaderException {
        synchronized (this) {
            this.e();
            if (this.c == null) {
                throw new ReaderException("RFID is not initialized!");
            }
        }
        this.e = true;
        this.g = new CountDownLatch(1);
        this.a(mask);
        final RFIDCallback rfidCallback2;
        new Thread(new Runnable() {
            final /* synthetic */ RFIDReader a;
            
            @Override
            public void run() {
                if (!com.alien.rfid.a.this.f) {
                    final com.rscja.deviceapi.a c = com.alien.rfid.a.this.c;
                    int n;
                    if (com.alien.rfid.a.this.b > 0) {
                        n = 1;
                    }
                    else {
                        n = 0;
                    }
                    if (c.a(n, com.alien.rfid.a.this.b)) {
                        final ALRH450CusAPI.b b = new ALRH450CusAPI.b();
                        while (com.alien.rfid.a.this.e && !com.alien.rfid.a.this.f) {
                            if (com.alien.rfid.a.this.d.b(b)) {
                                rfidCallback2.onTagRead(new Tag(this.a, b.a, b.c));
                            }
                            if (!com.alien.rfid.a.this.f) {
                                try {
                                    Thread.sleep(com.alien.rfid.a.this.a);
                                }
                                catch (InterruptedException ex) {}
                            }
                        }
                        com.alien.rfid.a.this.c.f();
                    }
                }
                com.alien.rfid.a.this.g.countDown();
                com.alien.rfid.a.this.g = null;
                com.alien.rfid.a.this.e = false;
            }
        }).start();
    }
    // monitorexit(this)
    
    @Override
    public boolean isRunning() {
        return this.e;
    }
    
    @Override
    public RFIDResult kill(final String s, final Mask mask) throws ReaderException {
        synchronized (this) {
            this.e();
            if (mask.getData().length() * 4 < mask.getBitLength()) {
                throw new InvalidParamException("Mask data is shorter than the bit length");
            }
        }
        final String s2;
        // monitorexit(this)
        return new RFIDResult(this.d.killTag(s2, mask.getBank().getValue(), mask.getBitPointer(), mask.getData(), mask.getBitLength()) == 0);
    }
    
    @Override
    public RFIDResult lock(final LockFields lockFields, final LockType lockType, final Mask mask, final String s) throws ReaderException {
        com.rscja.deviceapi.a.b b;
        while (true) {
            Label_0088: {
                Label_0081: {
                    Label_0074: {
                        Label_0056: {
                            while (true) {
                                Label_0095: {
                                    synchronized (this) {
                                        switch (a$2.b[lockType.ordinal()]) {
                                            case 1: {
                                                break Label_0056;
                                            }
                                            case 2: {
                                                break Label_0074;
                                            }
                                            case 3: {
                                                break Label_0081;
                                            }
                                            case 4: {
                                                break Label_0088;
                                            }
                                            default: {
                                                break Label_0095;
                                            }
                                        }
                                        throw new InvalidParamException("Invalid lock type");
                                    }
                                    break Label_0056;
                                }
                                continue;
                            }
                        }
                        b = com.rscja.deviceapi.a.b.b;
                        break;
                    }
                    b = com.rscja.deviceapi.a.b.c;
                    break;
                }
                b = com.rscja.deviceapi.a.b.d;
                break;
            }
            b = com.rscja.deviceapi.a.b.e;
            break;
        }
        // monitorexit(this)
        return this.a(lockFields, mask, s, b);
    }
    
    @Override
    public RFIDResult read(final Bank bank, final int n, final int n2, final Mask mask, final String s) throws ReaderException {
        synchronized (this) {
            this.e();
            if (mask.getData().length() * 4 < mask.getBitLength()) {
                throw new InvalidParamException("Mask data is shorter than the bit length");
            }
        }
        while (true) {
            while (true) {
                Label_0130: {
                    try {
                        this.c();
                        final Bank bank2;
                        final String data = this.d.readData(s, mask.getBank().getValue(), mask.getBitPointer(), mask.getData(), mask.getBitLength(), bank2.getValue(), n, n2);
                        if (data != null) {
                            final String upperCase = data.toUpperCase();
                            final RFIDResult rfidResult = new RFIDResult(upperCase != null, upperCase);
                            this.b();
                            // monitorexit(this)
                            return rfidResult;
                        }
                        break Label_0130;
                    }
                    finally {
                        this.b();
                    }
                }
                continue;
            }
        }
    }
    
    @Override
    public RFIDResult read(final Mask mask) throws ReaderException {
        synchronized (this) {
            this.e();
            this.a(mask);
            final ALRH450CusAPI.b b = new ALRH450CusAPI.b();
            RFIDResult rfidResult;
            if (!this.d.a(b)) {
                rfidResult = new RFIDResult(false);
            }
            else {
                rfidResult = new RFIDResult(true, new Tag(this, b.a, b.c));
            }
            return rfidResult;
        }
    }
    
    @Override
    public void setPower(final int n) throws ReaderException {
        synchronized (this) {
            this.e();
            if (n < 0 || n > 30) {
                throw new InvalidParamException("Power value must be 1-30 dBm");
            }
        }
        this.c.a(n);
    }
    // monitorexit(this)
    
    @Override
    public void setQ(final int b) throws ReaderException {
        synchronized (this) {
            this.e();
            if (b < 0 || b > 15) {
                throw new InvalidParamException("Q value must be 0-" + Integer.toString(15));
            }
        }
        this.b = b;
        final int[] gen2Parameter = new int[8];
        if (this.d.getGen2Parameter(gen2Parameter) != 0) {
            throw new ReaderException("Error reading Gen2 params");
        }
        this.d.a(gen2Parameter, ALRH450CusAPI.a, b);
        if (this.d.setGen2Parameter(gen2Parameter) != 0) {
            throw new ReaderException("Error setting Gen2 params");
        }
    }
    // monitorexit(this)
    
    @Override
    public void setSession(final Session session) throws ReaderException {
        final int[] gen2Parameter;
        synchronized (this) {
            this.e();
            gen2Parameter = new int[8];
            if (this.d.getGen2Parameter(gen2Parameter) != 0) {
                throw new ReaderException("Error reading Gen2 params");
            }
        }
        final Session session2;
        this.d.a(gen2Parameter, ALRH450CusAPI.d, session2.getValue());
        if (this.d.setGen2Parameter(gen2Parameter) != 0) {
            throw new ReaderException("Error setting Gen2 params");
        }
    }
    // monitorexit(this)
    
    @Override
    public void setTarget(final Target target) throws ReaderException {
        final int[] gen2Parameter;
        synchronized (this) {
            this.e();
            gen2Parameter = new int[8];
            if (this.d.getGen2Parameter(gen2Parameter) != 0) {
                throw new ReaderException("Error reading Gen2 params");
            }
        }
        final Target target2;
        this.d.a(gen2Parameter, ALRH450CusAPI.e, target2.getValue());
        if (this.d.setGen2Parameter(gen2Parameter) != 0) {
            throw new ReaderException("Error setting Gen2 params");
        }
    }
    // monitorexit(this)
    
    @Override
    public void stop() throws ReaderException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: monitorenter   
        //     2: aload_0        
        //     3: getfield        com/alien/rfid/a.e:Z
        //     6: istore_1       
        //     7: iload_1        
        //     8: ifne            14
        //    11: aload_0        
        //    12: monitorexit    
        //    13: return         
        //    14: aload_0        
        //    15: iconst_1       
        //    16: putfield        com/alien/rfid/a.f:Z
        //    19: aload_0        
        //    20: getfield        com/alien/rfid/a.d:Lcom/alien/rfid/ALRH450CusAPI;
        //    23: iconst_0       
        //    24: invokevirtual   com/alien/rfid/ALRH450CusAPI.enableInventory:(Z)V
        //    27: aload_0        
        //    28: getfield        com/alien/rfid/a.g:Ljava/util/concurrent/CountDownLatch;
        //    31: astore_2       
        //    32: aload_2        
        //    33: ifnull          40
        //    36: aload_2        
        //    37: invokevirtual   java/util/concurrent/CountDownLatch.await:()V
        //    40: aload_0        
        //    41: iconst_0       
        //    42: putfield        com/alien/rfid/a.f:Z
        //    45: aload_0        
        //    46: getfield        com/alien/rfid/a.d:Lcom/alien/rfid/ALRH450CusAPI;
        //    49: iconst_1       
        //    50: invokevirtual   com/alien/rfid/ALRH450CusAPI.enableInventory:(Z)V
        //    53: goto            11
        //    56: astore_2       
        //    57: aload_0        
        //    58: monitorexit    
        //    59: aload_2        
        //    60: athrow         
        //    61: astore_2       
        //    62: goto            40
        //    Exceptions:
        //  throws com.alien.rfid.ReaderException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  2      7      56     61     Any
        //  14     32     61     65     Ljava/lang/InterruptedException;
        //  14     32     56     61     Any
        //  36     40     61     65     Ljava/lang/InterruptedException;
        //  36     40     56     61     Any
        //  40     53     56     61     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0014:
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
    
    @Override
    public RFIDResult write(final Bank bank, final int n, final String s, final Mask mask, final String s2) throws ReaderException {
        synchronized (this) {
            this.e();
            this.a(bank);
            if (mask.getData().length() * 4 < mask.getBitLength()) {
                throw new InvalidParamException("Mask data is shorter than the bit length!");
            }
        }
        if (s.length() % 4 != 0) {
            throw new InvalidParamException("Data length must be in WORD units");
        }
        try {
            this.c();
            final Bank bank2;
            final RFIDResult rfidResult = new RFIDResult(this.d.writeData(s2, mask.getBank().getValue(), mask.getBitPointer(), mask.getData(), mask.getBitLength(), bank2.getValue(), n, s.length() / 4, s) == 0);
            this.b();
            // monitorexit(this)
            return rfidResult;
        }
        finally {
            this.b();
        }
    }
}
