package com.lidroid.xutils.util.core;

import java.util.regex.*;
import java.util.concurrent.*;
import com.lidroid.xutils.util.*;
import java.util.*;
import java.security.*;
import java.nio.charset.*;
import java.io.*;

public final class LruDiskCache implements Closeable
{
    static final long ANY_SEQUENCE_NUMBER = -1L;
    private static final String CLEAN = "CLEAN";
    private static final String DIRTY = "DIRTY";
    static final String JOURNAL_FILE = "journal";
    static final String JOURNAL_FILE_BACKUP = "journal.bkp";
    static final String JOURNAL_FILE_TEMP = "journal.tmp";
    static final Pattern LEGAL_KEY_PATTERN;
    static final String MAGIC = "libcore.io.DiskLruCache";
    private static final OutputStream NULL_OUTPUT_STREAM;
    private static final String READ = "READ";
    private static final String REMOVE = "REMOVE";
    static final String VERSION_1 = "1";
    private final int appVersion;
    private final Callable<Void> cleanupCallable;
    private final File directory;
    private DiskCacheFileNameGenerator diskCacheFileNameGenerator;
    final ThreadPoolExecutor executorService;
    private final File journalFile;
    private final File journalFileBackup;
    private final File journalFileTmp;
    private Writer journalWriter;
    private final LinkedHashMap<String, Entry> lruEntries;
    private long maxSize;
    private long nextSequenceNumber;
    private int redundantOpCount;
    private long size;
    private final int valueCount;
    
    static {
        LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_-]{1,64}");
        NULL_OUTPUT_STREAM = new OutputStream() {
            @Override
            public void write(final int n) throws IOException {
            }
        };
    }
    
    private LruDiskCache(final File directory, final int appVersion, final int valueCount, final long maxSize) {
        this.size = 0L;
        this.lruEntries = new LinkedHashMap<String, Entry>(0, 0.75f, true);
        this.nextSequenceNumber = 0L;
        this.executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
        this.cleanupCallable = new Callable<Void>() {
            @Override
            public Void call() throws Exception {
                synchronized (LruDiskCache.this) {
                    if (LruDiskCache.this.journalWriter == null) {
                        return null;
                    }
                    LruDiskCache.this.trimToSize();
                    if (LruDiskCache.this.journalRebuildRequired()) {
                        LruDiskCache.this.rebuildJournal();
                        LruDiskCache.access$4(LruDiskCache.this, 0);
                    }
                    return null;
                }
            }
        };
        this.diskCacheFileNameGenerator = (DiskCacheFileNameGenerator)new MD5DiskCacheFileNameGenerator();
        this.directory = directory;
        this.appVersion = appVersion;
        this.journalFile = new File(directory, "journal");
        this.journalFileTmp = new File(directory, "journal.tmp");
        this.journalFileBackup = new File(directory, "journal.bkp");
        this.valueCount = valueCount;
        this.maxSize = maxSize;
    }
    
    static /* synthetic */ void access$4(final LruDiskCache lruDiskCache, final int redundantOpCount) {
        lruDiskCache.redundantOpCount = redundantOpCount;
    }
    
    private void checkNotClosed() {
        if (this.journalWriter == null) {
            throw new IllegalStateException("cache is closed");
        }
    }
    
    private void completeEdit(final Editor editor, final boolean b) throws IOException {
        final Entry access$2;
        synchronized (this) {
            access$2 = editor.entry;
            if (access$2.currentEditor != editor) {
                throw new IllegalStateException();
            }
        }
    Label_0212:
        while (true) {
            if (b && !access$2.readable) {
                for (int i = 0; i < this.valueCount; ++i) {
                    final Editor editor2;
                    if (!editor2.written[i]) {
                        editor2.abort();
                        throw new IllegalStateException("Newly created entry didn't create value for index " + i);
                    }
                    if (!access$2.getDirtyFile(i).exists()) {
                        editor2.abort();
                        break Label_0212;
                    }
                }
            }
            Label_0403: {
                break Label_0403;
                return;
            }
            for (int j = 0; j < this.valueCount; ++j) {
                final File dirtyFile = access$2.getDirtyFile(j);
                if (b) {
                    if (dirtyFile.exists()) {
                        final File cleanFile = access$2.getCleanFile(j);
                        dirtyFile.renameTo(cleanFile);
                        final long n = access$2.lengths[j];
                        final long length = cleanFile.length();
                        access$2.lengths[j] = length;
                        this.size = this.size - n + length;
                    }
                }
                else {
                    deleteIfExists(dirtyFile);
                }
            }
            ++this.redundantOpCount;
            Entry.access$6(access$2, null);
            if (access$2.readable | b) {
                Entry.access$5(access$2, true);
                this.journalWriter.write("CLEAN " + access$2.diskKey + " t_" + access$2.expiryTimestamp + access$2.getLengths() + '\n');
                if (b) {
                    final long nextSequenceNumber = this.nextSequenceNumber;
                    this.nextSequenceNumber = 1L + nextSequenceNumber;
                    Entry.access$11(access$2, nextSequenceNumber);
                }
            }
            else {
                this.lruEntries.remove(access$2.diskKey);
                this.journalWriter.write("REMOVE " + access$2.diskKey + '\n');
            }
            this.journalWriter.flush();
            if (this.size > this.maxSize || this.journalRebuildRequired()) {
                this.executorService.submit(this.cleanupCallable);
            }
            continue Label_0212;
        }
    }
    // monitorexit(this)
    
    private static void deleteContents(File file) throws IOException {
        final File[] listFiles = file.listFiles();
        if (listFiles == null) {
            throw new IOException("not a readable directory: " + file);
        }
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            file = listFiles[i];
            if (file.isDirectory()) {
                deleteContents(file);
            }
            if (file.exists() && !file.delete()) {
                throw new IOException("failed to delete file: " + file);
            }
        }
    }
    
    private static void deleteIfExists(final File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }
    
    private Editor editByDiskKey(final String s, final long n) throws IOException {
        while (true) {
            Editor editor = null;
            while (true) {
                final Entry entry;
                synchronized (this) {
                    this.checkNotClosed();
                    this.validateKey(s);
                    entry = this.lruEntries.get(s);
                    Label_0067: {
                        if (n == -1L) {
                            break Label_0067;
                        }
                        Editor editor2 = editor;
                        if (entry != null) {
                            if (entry.sequenceNumber == n) {
                                break Label_0067;
                            }
                            editor2 = editor;
                        }
                        return editor2;
                    }
                    if (entry == null) {
                        final Entry entry2 = new Entry(s, (Entry)null);
                        this.lruEntries.put(s, entry2);
                        editor = new Editor(entry2, (Editor)null);
                        Entry.access$6(entry2, editor);
                        this.journalWriter.write("DIRTY " + s + '\n');
                        this.journalWriter.flush();
                        return editor;
                    }
                }
                final Editor access$2 = entry.currentEditor;
                final Entry entry2 = entry;
                if (access$2 != null) {
                    return editor;
                }
                continue;
            }
        }
    }
    
    private Snapshot getByDiskKey(final String s) throws IOException {
        File cleanFile;
        while (true) {
            final Snapshot snapshot = null;
            Entry entry = null;
            Label_0240: {
                while (true) {
                    int i = 0;
                    Label_0159: {
                        synchronized (this) {
                            this.checkNotClosed();
                            this.validateKey(s);
                            entry = this.lruEntries.get(s);
                            Snapshot snapshot2;
                            if (entry == null) {
                                snapshot2 = snapshot;
                            }
                            else {
                                snapshot2 = snapshot;
                                if (entry.readable) {
                                    if (entry.expiryTimestamp >= System.currentTimeMillis()) {
                                        break Label_0240;
                                    }
                                    i = 0;
                                    if (i < this.valueCount) {
                                        break Label_0159;
                                    }
                                    ++this.redundantOpCount;
                                    this.journalWriter.append((CharSequence)("REMOVE " + s + '\n'));
                                    this.lruEntries.remove(s);
                                    snapshot2 = snapshot;
                                    if (this.journalRebuildRequired()) {
                                        this.executorService.submit(this.cleanupCallable);
                                        snapshot2 = snapshot;
                                    }
                                }
                            }
                            return snapshot2;
                        }
                    }
                    cleanFile = entry.getCleanFile(i);
                    if (cleanFile.exists() && !cleanFile.delete()) {
                        break;
                    }
                    this.size -= entry.lengths[i];
                    entry.lengths[i] = 0L;
                    ++i;
                    continue;
                }
            }
            final FileInputStream[] array = new FileInputStream[this.valueCount];
            int i = 0;
            try {
                while (i < this.valueCount) {
                    array[i] = new FileInputStream(entry.getCleanFile(i));
                    ++i;
                }
                ++this.redundantOpCount;
                this.journalWriter.append((CharSequence)("READ " + s + '\n'));
                if (this.journalRebuildRequired()) {
                    this.executorService.submit(this.cleanupCallable);
                }
                return new Snapshot(s, entry.sequenceNumber, array, entry.lengths, (Snapshot)null);
            }
            catch (FileNotFoundException ex) {
                i = 0;
                while (true) {
                    Snapshot snapshot2 = snapshot;
                    if (i >= this.valueCount) {
                        return snapshot2;
                    }
                    snapshot2 = snapshot;
                    if (array[i] == null) {
                        return snapshot2;
                    }
                    IOUtils.closeQuietly(array[i]);
                    ++i;
                }
            }
        }
        throw new IOException("failed to delete " + cleanFile);
    }
    
    private static String inputStreamToString(final InputStream inputStream) throws IOException {
        return readFully(new InputStreamReader(inputStream, "UTF-8"));
    }
    
    private boolean journalRebuildRequired() {
        return this.redundantOpCount >= 2000 && this.redundantOpCount >= this.lruEntries.size();
    }
    
    public static LruDiskCache open(final File file, final int n, final int n2, final long n3) throws IOException {
        if (n3 <= 0L) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        if (n2 <= 0) {
            throw new IllegalArgumentException("valueCount <= 0");
        }
        Object o = new File(file, "journal.bkp");
        Label_0150: {
            if (((File)o).exists()) {
                final File file2 = new File(file, "journal");
                if (!file2.exists()) {
                    break Label_0150;
                }
                ((File)o).delete();
            }
            while (true) {
                o = new LruDiskCache(file, n, n2, n3);
                if (!((LruDiskCache)o).journalFile.exists()) {
                    break Label_0150;
                }
                try {
                    ((LruDiskCache)o).readJournal();
                    ((LruDiskCache)o).processJournal();
                    ((LruDiskCache)o).journalWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(((LruDiskCache)o).journalFile, true), "US-ASCII"));
                    return (LruDiskCache)o;
                    final File file2;
                    renameTo((File)o, file2, false);
                    continue;
                }
                catch (Throwable t) {
                    LogUtils.e("DiskLruCache " + file + " is corrupt: " + t.getMessage() + ", removing", t);
                    ((LruDiskCache)o).delete();
                }
                break;
            }
        }
        file.mkdirs();
        final LruDiskCache lruDiskCache = new LruDiskCache(file, n, n2, n3);
        lruDiskCache.rebuildJournal();
        return lruDiskCache;
    }
    
    private void processJournal() throws IOException {
        deleteIfExists(this.journalFileTmp);
        final Iterator<Entry> iterator = this.lruEntries.values().iterator();
        while (iterator.hasNext()) {
            final Entry entry = iterator.next();
            if (entry.currentEditor == null) {
                for (int i = 0; i < this.valueCount; ++i) {
                    this.size += entry.lengths[i];
                }
            }
            else {
                Entry.access$6(entry, null);
                for (int j = 0; j < this.valueCount; ++j) {
                    deleteIfExists(entry.getCleanFile(j));
                    deleteIfExists(entry.getDirtyFile(j));
                }
                iterator.remove();
            }
        }
    }
    
    private static String readFully(final Reader reader) throws IOException {
        StringWriter stringWriter = null;
        while (true) {
            try {
                final StringWriter stringWriter2 = new StringWriter();
                try {
                    final char[] array = new char[1024];
                    while (true) {
                        final int read = reader.read(array);
                        if (read == -1) {
                            break;
                        }
                        stringWriter2.write(array, 0, read);
                    }
                    final String string = stringWriter2.toString();
                    IOUtils.closeQuietly(reader);
                    IOUtils.closeQuietly(stringWriter2);
                    return string;
                }
                finally {}
                IOUtils.closeQuietly(reader);
                IOUtils.closeQuietly(stringWriter2);
                throw stringWriter;
            }
            finally {
                final StringWriter stringWriter2 = stringWriter;
                final StringWriter stringWriter3;
                stringWriter = stringWriter3;
                continue;
            }
            break;
        }
    }
    
    private void readJournal() throws IOException {
        StrictLineReader strictLineReader = null;
        while (true) {
            try {
                final StrictLineReader strictLineReader2 = new StrictLineReader(new FileInputStream(this.journalFile));
                Label_0182: {
                    try {
                        final String line = strictLineReader2.readLine();
                        final String line2 = strictLineReader2.readLine();
                        final String line3 = strictLineReader2.readLine();
                        final String line4 = strictLineReader2.readLine();
                        final String line5 = strictLineReader2.readLine();
                        if (!"libcore.io.DiskLruCache".equals(line) || !"1".equals(line2) || !Integer.toString(this.appVersion).equals(line3) || !Integer.toString(this.valueCount).equals(line4) || !"".equals(line5)) {
                            throw new IOException("unexpected journal header: [" + line + ", " + line2 + ", " + line4 + ", " + line5 + "]");
                        }
                        break Label_0182;
                    }
                    finally {}
                    IOUtils.closeQuietly(strictLineReader2);
                    throw strictLineReader;
                }
                int n = 0;
                try {
                    while (true) {
                        this.readJournalLine(strictLineReader2.readLine());
                        ++n;
                    }
                }
                catch (EOFException strictLineReader) {
                    this.redundantOpCount = n - this.lruEntries.size();
                    IOUtils.closeQuietly(strictLineReader2);
                }
            }
            finally {
                final StrictLineReader strictLineReader2 = strictLineReader;
                final StrictLineReader strictLineReader3;
                strictLineReader = strictLineReader3;
                continue;
            }
            break;
        }
    }
    
    private void readJournalLine(final String s) throws IOException {
        final int index = s.indexOf(32);
        if (index == -1) {
            throw new IOException("unexpected journal line: " + s);
        }
        final int n = index + 1;
        final int index2 = s.indexOf(32, n);
        String s2 = null;
        Label_0109: {
            if (index2 != -1) {
                s2 = s.substring(n, index2);
                break Label_0109;
            }
            final String s3 = s2 = s.substring(n);
            if (index != "REMOVE".length()) {
                break Label_0109;
            }
            s2 = s3;
            if (!s.startsWith("REMOVE")) {
                break Label_0109;
            }
            this.lruEntries.remove(s3);
            return;
        }
        Entry entry;
        if ((entry = this.lruEntries.get(s2)) == null) {
            entry = new Entry(s2, (Entry)null);
            this.lruEntries.put(s2, entry);
        }
        if (index2 != -1 && index == "CLEAN".length() && s.startsWith("CLEAN")) {
            Entry.access$5(entry, true);
            Entry.access$6(entry, null);
            final String[] split = s.substring(index2 + 1).split(" ");
            if (split.length > 0) {
                try {
                    if (split[0].startsWith("t_")) {
                        Entry.access$1(entry, Long.valueOf(split[0].substring(2)));
                        entry.setLengths(split, 1);
                        return;
                    }
                }
                catch (Throwable t) {
                    throw new IOException("unexpected journal line: " + s);
                }
                Entry.access$1(entry, Long.MAX_VALUE);
                entry.setLengths(split, 0);
            }
        }
        else {
            if (index2 == -1 && index == "DIRTY".length() && s.startsWith("DIRTY")) {
                Entry.access$6(entry, new Editor(entry, (Editor)null));
                return;
            }
            if (index2 != -1 || index != "READ".length() || !s.startsWith("READ")) {
                throw new IOException("unexpected journal line: " + s);
            }
        }
    }
    
    private void rebuildJournal() throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: monitorenter   
        //     2: aload_0        
        //     3: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalWriter:Ljava/io/Writer;
        //     6: ifnull          16
        //     9: aload_0        
        //    10: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalWriter:Ljava/io/Writer;
        //    13: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //    16: aconst_null    
        //    17: astore_3       
        //    18: new             Ljava/io/BufferedWriter;
        //    21: dup            
        //    22: new             Ljava/io/OutputStreamWriter;
        //    25: dup            
        //    26: new             Ljava/io/FileOutputStream;
        //    29: dup            
        //    30: aload_0        
        //    31: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFileTmp:Ljava/io/File;
        //    34: invokespecial   java/io/FileOutputStream.<init>:(Ljava/io/File;)V
        //    37: ldc_w           "US-ASCII"
        //    40: invokespecial   java/io/OutputStreamWriter.<init>:(Ljava/io/OutputStream;Ljava/lang/String;)V
        //    43: invokespecial   java/io/BufferedWriter.<init>:(Ljava/io/Writer;)V
        //    46: astore_2       
        //    47: aload_2        
        //    48: ldc             "libcore.io.DiskLruCache"
        //    50: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //    53: aload_2        
        //    54: ldc_w           "\n"
        //    57: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //    60: aload_2        
        //    61: ldc             "1"
        //    63: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //    66: aload_2        
        //    67: ldc_w           "\n"
        //    70: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //    73: aload_2        
        //    74: aload_0        
        //    75: getfield        com/lidroid/xutils/util/core/LruDiskCache.appVersion:I
        //    78: invokestatic    java/lang/Integer.toString:(I)Ljava/lang/String;
        //    81: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //    84: aload_2        
        //    85: ldc_w           "\n"
        //    88: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //    91: aload_2        
        //    92: aload_0        
        //    93: getfield        com/lidroid/xutils/util/core/LruDiskCache.valueCount:I
        //    96: invokestatic    java/lang/Integer.toString:(I)Ljava/lang/String;
        //    99: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //   102: aload_2        
        //   103: ldc_w           "\n"
        //   106: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //   109: aload_2        
        //   110: ldc_w           "\n"
        //   113: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //   116: aload_0        
        //   117: getfield        com/lidroid/xutils/util/core/LruDiskCache.lruEntries:Ljava/util/LinkedHashMap;
        //   120: invokevirtual   java/util/LinkedHashMap.values:()Ljava/util/Collection;
        //   123: invokeinterface java/util/Collection.iterator:()Ljava/util/Iterator;
        //   128: astore_3       
        //   129: aload_3        
        //   130: invokeinterface java/util/Iterator.hasNext:()Z
        //   135: istore_1       
        //   136: iload_1        
        //   137: ifne            222
        //   140: aload_2        
        //   141: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   144: aload_0        
        //   145: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFile:Ljava/io/File;
        //   148: invokevirtual   java/io/File.exists:()Z
        //   151: ifeq            166
        //   154: aload_0        
        //   155: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFile:Ljava/io/File;
        //   158: aload_0        
        //   159: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFileBackup:Ljava/io/File;
        //   162: iconst_1       
        //   163: invokestatic    com/lidroid/xutils/util/core/LruDiskCache.renameTo:(Ljava/io/File;Ljava/io/File;Z)V
        //   166: aload_0        
        //   167: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFileTmp:Ljava/io/File;
        //   170: aload_0        
        //   171: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFile:Ljava/io/File;
        //   174: iconst_0       
        //   175: invokestatic    com/lidroid/xutils/util/core/LruDiskCache.renameTo:(Ljava/io/File;Ljava/io/File;Z)V
        //   178: aload_0        
        //   179: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFileBackup:Ljava/io/File;
        //   182: invokevirtual   java/io/File.delete:()Z
        //   185: pop            
        //   186: aload_0        
        //   187: new             Ljava/io/BufferedWriter;
        //   190: dup            
        //   191: new             Ljava/io/OutputStreamWriter;
        //   194: dup            
        //   195: new             Ljava/io/FileOutputStream;
        //   198: dup            
        //   199: aload_0        
        //   200: getfield        com/lidroid/xutils/util/core/LruDiskCache.journalFile:Ljava/io/File;
        //   203: iconst_1       
        //   204: invokespecial   java/io/FileOutputStream.<init>:(Ljava/io/File;Z)V
        //   207: ldc_w           "US-ASCII"
        //   210: invokespecial   java/io/OutputStreamWriter.<init>:(Ljava/io/OutputStream;Ljava/lang/String;)V
        //   213: invokespecial   java/io/BufferedWriter.<init>:(Ljava/io/Writer;)V
        //   216: putfield        com/lidroid/xutils/util/core/LruDiskCache.journalWriter:Ljava/io/Writer;
        //   219: aload_0        
        //   220: monitorexit    
        //   221: return         
        //   222: aload_3        
        //   223: invokeinterface java/util/Iterator.next:()Ljava/lang/Object;
        //   228: checkcast       Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
        //   231: astore          4
        //   233: aload           4
        //   235: invokestatic    com/lidroid/xutils/util/core/LruDiskCache$Entry.access$2:(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
        //   238: ifnull          286
        //   241: aload_2        
        //   242: new             Ljava/lang/StringBuilder;
        //   245: dup            
        //   246: ldc_w           "DIRTY "
        //   249: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   252: aload           4
        //   254: invokestatic    com/lidroid/xutils/util/core/LruDiskCache$Entry.access$3:(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;
        //   257: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   260: bipush          10
        //   262: invokevirtual   java/lang/StringBuilder.append:(C)Ljava/lang/StringBuilder;
        //   265: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   268: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //   271: goto            129
        //   274: astore_3       
        //   275: aload_2        
        //   276: invokestatic    com/lidroid/xutils/util/IOUtils.closeQuietly:(Ljava/io/Closeable;)V
        //   279: aload_3        
        //   280: athrow         
        //   281: astore_2       
        //   282: aload_0        
        //   283: monitorexit    
        //   284: aload_2        
        //   285: athrow         
        //   286: aload_2        
        //   287: new             Ljava/lang/StringBuilder;
        //   290: dup            
        //   291: ldc             "CLEAN "
        //   293: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   296: aload           4
        //   298: invokestatic    com/lidroid/xutils/util/core/LruDiskCache$Entry.access$3:(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;
        //   301: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   304: ldc_w           " t_"
        //   307: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   310: aload           4
        //   312: invokestatic    com/lidroid/xutils/util/core/LruDiskCache$Entry.access$9:(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J
        //   315: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //   318: aload           4
        //   320: invokevirtual   com/lidroid/xutils/util/core/LruDiskCache$Entry.getLengths:()Ljava/lang/String;
        //   323: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   326: bipush          10
        //   328: invokevirtual   java/lang/StringBuilder.append:(C)Ljava/lang/StringBuilder;
        //   331: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   334: invokevirtual   java/io/Writer.write:(Ljava/lang/String;)V
        //   337: goto            129
        //   340: astore          4
        //   342: aload_3        
        //   343: astore_2       
        //   344: aload           4
        //   346: astore_3       
        //   347: goto            275
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  2      16     281    286    Any
        //  18     47     340    350    Any
        //  47     129    274    275    Any
        //  129    136    274    275    Any
        //  140    166    281    286    Any
        //  166    219    281    286    Any
        //  222    271    274    275    Any
        //  275    281    281    286    Any
        //  286    337    274    275    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0129:
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
    
    private boolean removeByDiskKey(final String s) throws IOException {
        while (true) {
            while (true) {
                final Entry entry;
                int n;
                synchronized (this) {
                    this.checkNotClosed();
                    this.validateKey(s);
                    entry = this.lruEntries.get(s);
                    if (entry == null || entry.currentEditor != null) {
                        return false;
                    }
                    n = 0;
                    if (n >= this.valueCount) {
                        ++this.redundantOpCount;
                        this.journalWriter.append((CharSequence)("REMOVE " + s + '\n'));
                        this.lruEntries.remove(s);
                        if (this.journalRebuildRequired()) {
                            this.executorService.submit(this.cleanupCallable);
                        }
                        return true;
                    }
                    else {
                        final File cleanFile = entry.getCleanFile(n);
                        if (cleanFile.exists() && !cleanFile.delete()) {
                            throw new IOException("failed to delete " + cleanFile);
                        }
                    }
                }
                this.size -= entry.lengths[n];
                entry.lengths[n] = 0L;
                ++n;
                continue;
            }
            return true;
        }
    }
    
    private static void renameTo(final File file, final File file2, final boolean b) throws IOException {
        if (b) {
            deleteIfExists(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }
    
    private void trimToSize() throws IOException {
        while (this.size > this.maxSize) {
            this.removeByDiskKey(this.lruEntries.entrySet().iterator().next().getKey());
        }
    }
    
    private void validateKey(final String s) {
        if (!LruDiskCache.LEGAL_KEY_PATTERN.matcher(s).matches()) {
            throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,64}: \"" + s + "\"");
        }
    }
    
    @Override
    public void close() throws IOException {
        while (true) {
            while (true) {
                final Iterator<Entry> iterator;
                Label_0065: {
                    synchronized (this) {
                        if (this.journalWriter != null) {
                            iterator = new ArrayList<Entry>(this.lruEntries.values()).iterator();
                            if (iterator.hasNext()) {
                                break Label_0065;
                            }
                            this.trimToSize();
                            this.journalWriter.close();
                            this.journalWriter = null;
                        }
                        return;
                    }
                }
                final Entry entry = iterator.next();
                if (entry.currentEditor != null) {
                    entry.currentEditor.abort();
                    continue;
                }
                continue;
            }
        }
    }
    
    public void delete() throws IOException {
        IOUtils.closeQuietly(this);
        deleteContents(this.directory);
    }
    
    public Editor edit(final String s) throws IOException {
        return this.editByDiskKey(this.diskCacheFileNameGenerator.generate(s), -1L);
    }
    
    public void flush() throws IOException {
        synchronized (this) {
            this.checkNotClosed();
            this.trimToSize();
            this.journalWriter.flush();
        }
    }
    
    public Snapshot get(final String s) throws IOException {
        return this.getByDiskKey(this.diskCacheFileNameGenerator.generate(s));
    }
    
    public File getCacheFile(String generate, final int n) {
        generate = this.diskCacheFileNameGenerator.generate(generate);
        return new File(this.directory, String.valueOf(generate) + "." + n);
    }
    
    public File getDirectory() {
        return this.directory;
    }
    
    public DiskCacheFileNameGenerator getDiskCacheFileNameGenerator() {
        return this.diskCacheFileNameGenerator;
    }
    
    public long getExpiryTimestamp(String generate) throws IOException {
        synchronized (this) {
            generate = this.diskCacheFileNameGenerator.generate(generate);
            this.checkNotClosed();
            this.validateKey(generate);
            final Entry entry = this.lruEntries.get(generate);
            long access$9;
            if (entry == null) {
                access$9 = 0L;
            }
            else {
                access$9 = entry.expiryTimestamp;
            }
            return access$9;
        }
    }
    
    public long getMaxSize() {
        synchronized (this) {
            return this.maxSize;
        }
    }
    
    public boolean isClosed() {
        synchronized (this) {
            return this.journalWriter == null;
        }
    }
    
    public boolean remove(final String s) throws IOException {
        return this.removeByDiskKey(this.diskCacheFileNameGenerator.generate(s));
    }
    
    public void setDiskCacheFileNameGenerator(final DiskCacheFileNameGenerator diskCacheFileNameGenerator) {
        if (diskCacheFileNameGenerator != null) {
            this.diskCacheFileNameGenerator = diskCacheFileNameGenerator;
        }
    }
    
    public void setMaxSize(final long maxSize) {
        synchronized (this) {
            this.maxSize = maxSize;
            this.executorService.submit(this.cleanupCallable);
        }
    }
    
    public long size() {
        synchronized (this) {
            return this.size;
        }
    }
    
    public interface DiskCacheFileNameGenerator
    {
        String generate(final String p0);
    }
    
    public final class Editor
    {
        private boolean committed;
        private final Entry entry;
        private boolean hasErrors;
        private final boolean[] written;
        
        private Editor(final Entry entry) {
            this.entry = entry;
            boolean[] written;
            if (entry.readable) {
                written = null;
            }
            else {
                written = new boolean[LruDiskCache.this.valueCount];
            }
            this.written = written;
        }
        
        static /* synthetic */ void access$0(final Editor editor, final boolean hasErrors) {
            editor.hasErrors = hasErrors;
        }
        
        public void abort() throws IOException {
            LruDiskCache.this.completeEdit(this, false);
        }
        
        public void abortUnlessCommitted() {
            if (this.committed) {
                return;
            }
            try {
                this.abort();
            }
            catch (Throwable t) {}
        }
        
        public void commit() throws IOException {
            if (this.hasErrors) {
                LruDiskCache.this.completeEdit(this, false);
                LruDiskCache.this.removeByDiskKey(this.entry.diskKey);
            }
            else {
                LruDiskCache.this.completeEdit(this, true);
            }
            this.committed = true;
        }
        
        public String getString(final int n) throws IOException {
            final InputStream inputStream = this.newInputStream(n);
            if (inputStream != null) {
                return inputStreamToString(inputStream);
            }
            return null;
        }
        
        public InputStream newInputStream(final int n) throws IOException {
            synchronized (LruDiskCache.this) {
                if (this.entry.currentEditor != this) {
                    throw new IllegalStateException();
                }
            }
            if (!this.entry.readable) {
                // monitorexit(lruDiskCache)
                return null;
            }
            try {
                // monitorexit(lruDiskCache)
                return new FileInputStream(this.entry.getCleanFile(n));
            }
            catch (FileNotFoundException ex) {
                // monitorexit(lruDiskCache)
                return null;
            }
        }
        
        public OutputStream newOutputStream(final int n) throws IOException {
            synchronized (LruDiskCache.this) {
                if (this.entry.currentEditor != this) {
                    throw new IllegalStateException();
                }
            }
            if (!this.entry.readable) {
                this.written[n] = true;
            }
            final File dirtyFile = this.entry.getDirtyFile(n);
            try {
                final FileOutputStream fileOutputStream = new FileOutputStream(dirtyFile);
                // monitorexit(lruDiskCache)
                return new FaultHidingOutputStream((OutputStream)fileOutputStream, (FaultHidingOutputStream)null);
            }
            catch (FileNotFoundException ex) {
                LruDiskCache.this.directory.mkdirs();
                try {
                    final FileOutputStream fileOutputStream = new FileOutputStream(dirtyFile);
                }
                catch (FileNotFoundException ex2) {
                    // monitorexit(lruDiskCache)
                    return LruDiskCache.NULL_OUTPUT_STREAM;
                }
            }
        }
        
        public void set(final int n, final String s) throws IOException {
            final Closeable closeable = null;
            OutputStreamWriter outputStreamWriter;
            try {
                final OutputStreamWriter outputStreamWriter2;
                outputStreamWriter = (outputStreamWriter2 = new OutputStreamWriter(this.newOutputStream(n), "UTF-8"));
                final String s2 = s;
                outputStreamWriter2.write(s2);
                final OutputStreamWriter outputStreamWriter3 = outputStreamWriter;
                IOUtils.closeQuietly(outputStreamWriter3);
                return;
            }
            finally {
                final OutputStreamWriter outputStreamWriter4;
                outputStreamWriter = outputStreamWriter4;
                final Closeable closeable2 = closeable;
            }
            while (true) {
                try {
                    final OutputStreamWriter outputStreamWriter2 = outputStreamWriter;
                    final String s2 = s;
                    outputStreamWriter2.write(s2);
                    final OutputStreamWriter outputStreamWriter3 = outputStreamWriter;
                    IOUtils.closeQuietly(outputStreamWriter3);
                    return;
                    final Closeable closeable2;
                    IOUtils.closeQuietly(closeable2);
                    throw outputStreamWriter;
                }
                finally {
                    final Closeable closeable2 = outputStreamWriter;
                    final OutputStreamWriter outputStreamWriter5;
                    outputStreamWriter = outputStreamWriter5;
                    continue;
                }
                break;
            }
        }
        
        public void setEntryExpiryTimestamp(final long n) {
            Entry.access$1(this.entry, n);
        }
        
        private class FaultHidingOutputStream extends FilterOutputStream
        {
            private FaultHidingOutputStream(final OutputStream outputStream) {
                super(outputStream);
            }
            
            @Override
            public void close() {
                try {
                    this.out.close();
                }
                catch (Throwable t) {
                    Editor.access$0(Editor.this, true);
                }
            }
            
            @Override
            public void flush() {
                try {
                    this.out.flush();
                }
                catch (Throwable t) {
                    Editor.access$0(Editor.this, true);
                }
            }
            
            @Override
            public void write(final int n) {
                try {
                    this.out.write(n);
                }
                catch (Throwable t) {
                    Editor.access$0(Editor.this, true);
                }
            }
            
            @Override
            public void write(final byte[] array, final int n, final int n2) {
                try {
                    this.out.write(array, n, n2);
                    this.out.flush();
                }
                catch (Throwable t) {
                    Editor.access$0(Editor.this, true);
                }
            }
        }
    }
    
    private final class Entry
    {
        private Editor currentEditor;
        private final String diskKey;
        private long expiryTimestamp;
        private final long[] lengths;
        private boolean readable;
        private long sequenceNumber;
        
        private Entry(final String diskKey) {
            this.expiryTimestamp = Long.MAX_VALUE;
            this.diskKey = diskKey;
            this.lengths = new long[LruDiskCache.this.valueCount];
        }
        
        static /* synthetic */ void access$1(final Entry entry, final long expiryTimestamp) {
            entry.expiryTimestamp = expiryTimestamp;
        }
        
        static /* synthetic */ void access$11(final Entry entry, final long sequenceNumber) {
            entry.sequenceNumber = sequenceNumber;
        }
        
        static /* synthetic */ void access$5(final Entry entry, final boolean readable) {
            entry.readable = readable;
        }
        
        static /* synthetic */ void access$6(final Entry entry, final Editor currentEditor) {
            entry.currentEditor = currentEditor;
        }
        
        private IOException invalidLengths(final String[] array) throws IOException {
            throw new IOException("unexpected journal line: " + Arrays.toString(array));
        }
        
        private void setLengths(final String[] array, final int n) throws IOException {
            if (array.length - n != LruDiskCache.this.valueCount) {
                throw this.invalidLengths(array);
            }
            int i = 0;
            try {
                while (i < LruDiskCache.this.valueCount) {
                    this.lengths[i] = Long.parseLong(array[i + n]);
                    ++i;
                }
            }
            catch (NumberFormatException ex) {
                throw this.invalidLengths(array);
            }
        }
        
        public File getCleanFile(final int n) {
            return new File(LruDiskCache.this.directory, String.valueOf(this.diskKey) + "." + n);
        }
        
        public File getDirtyFile(final int n) {
            return new File(LruDiskCache.this.directory, String.valueOf(this.diskKey) + "." + n + ".tmp");
        }
        
        public String getLengths() throws IOException {
            final StringBuilder sb = new StringBuilder();
            final long[] lengths = this.lengths;
            for (int length = lengths.length, i = 0; i < length; ++i) {
                sb.append(' ').append(lengths[i]);
            }
            return sb.toString();
        }
    }
    
    public class MD5DiskCacheFileNameGenerator implements DiskCacheFileNameGenerator
    {
        private String bytesToHexString(final byte[] array) {
            final StringBuilder sb = new StringBuilder();
            for (int i = 0; i < array.length; ++i) {
                final String hexString = Integer.toHexString(array[i] & 0xFF);
                if (hexString.length() == 1) {
                    sb.append('0');
                }
                sb.append(hexString);
            }
            return sb.toString();
        }
        
        @Override
        public String generate(final String s) {
            try {
                final MessageDigest instance = MessageDigest.getInstance("MD5");
                instance.update(s.getBytes());
                return this.bytesToHexString(instance.digest());
            }
            catch (NoSuchAlgorithmException ex) {
                return String.valueOf(s.hashCode());
            }
        }
    }
    
    public final class Snapshot implements Closeable
    {
        private final String diskKey;
        private final FileInputStream[] ins;
        private final long[] lengths;
        private final long sequenceNumber;
        
        private Snapshot(final String diskKey, final long sequenceNumber, final FileInputStream[] ins, final long[] lengths) {
            this.diskKey = diskKey;
            this.sequenceNumber = sequenceNumber;
            this.ins = ins;
            this.lengths = lengths;
        }
        
        @Override
        public void close() {
            final FileInputStream[] ins = this.ins;
            for (int length = ins.length, i = 0; i < length; ++i) {
                IOUtils.closeQuietly(ins[i]);
            }
        }
        
        public Editor edit() throws IOException {
            return LruDiskCache.this.editByDiskKey(this.diskKey, this.sequenceNumber);
        }
        
        public FileInputStream getInputStream(final int n) {
            return this.ins[n];
        }
        
        public long getLength(final int n) {
            return this.lengths[n];
        }
        
        public String getString(final int n) throws IOException {
            return inputStreamToString(this.getInputStream(n));
        }
    }
    
    private class StrictLineReader implements Closeable
    {
        private static final byte CR = 13;
        private static final byte LF = 10;
        private byte[] buf;
        private final Charset charset;
        private int end;
        private final InputStream in;
        private int pos;
        
        public StrictLineReader(final LruDiskCache lruDiskCache, final InputStream inputStream) {
            this(lruDiskCache, inputStream, 8192);
        }
        
        public StrictLineReader(final InputStream in, final int n) {
            this.charset = Charset.forName("US-ASCII");
            if (in == null) {
                throw new NullPointerException();
            }
            if (n < 0) {
                throw new IllegalArgumentException("capacity <= 0");
            }
            this.in = in;
            this.buf = new byte[n];
        }
        
        private void fillBuf() throws IOException {
            final int read = this.in.read(this.buf, 0, this.buf.length);
            if (read == -1) {
                throw new EOFException();
            }
            this.pos = 0;
            this.end = read;
        }
        
        @Override
        public void close() throws IOException {
            synchronized (this.in) {
                if (this.buf != null) {
                    this.buf = null;
                    this.in.close();
                }
            }
        }
        
        public String readLine() throws IOException {
            synchronized (this.in) {
                if (this.buf == null) {
                    throw new IOException("LineReader is closed");
                }
            }
            if (this.pos >= this.end) {
                this.fillBuf();
            }
            for (int i = this.pos; i != this.end; ++i) {
                if (this.buf[i] == 10) {
                    int n;
                    if (i != this.pos && this.buf[i - 1] == 13) {
                        n = i - 1;
                    }
                    else {
                        n = i;
                    }
                    final String s = new String(this.buf, this.pos, n - this.pos, this.charset.name());
                    this.pos = i + 1;
                    // monitorexit(inputStream)
                    return s;
                }
            }
            final ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(this.end - this.pos + 80) {
                @Override
                public String toString() {
                    Label_0056: {
                        if (this.count <= 0 || this.buf[this.count - 1] != 13) {
                            break Label_0056;
                        }
                        int count = this.count - 1;
                        try {
                            return new String(this.buf, 0, count, StrictLineReader.this.charset.name());
                            count = this.count;
                            return new String(this.buf, 0, count, StrictLineReader.this.charset.name());
                        }
                        catch (UnsupportedEncodingException ex) {
                            throw new AssertionError((Object)ex);
                        }
                    }
                }
            };
            int j = 0;
        Block_5:
            while (true) {
                byteArrayOutputStream.write(this.buf, this.pos, this.end - this.pos);
                this.end = -1;
                this.fillBuf();
                for (j = this.pos; j != this.end; ++j) {
                    if (this.buf[j] == 10) {
                        break Block_5;
                    }
                }
            }
            if (j != this.pos) {
                byteArrayOutputStream.write(this.buf, this.pos, j - this.pos);
            }
            byteArrayOutputStream.flush();
            this.pos = j + 1;
            // monitorexit(inputStream)
            return byteArrayOutputStream.toString();
        }
    }
}
