package com.lidroid.xutils.util.core;

import com.lidroid.xutils.util.IOUtils;
import com.lidroid.xutils.util.LogUtils;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class LruDiskCache
  implements Closeable
{
  static final long ANY_SEQUENCE_NUMBER = -1L;
  private static final String CLEAN = "CLEAN";
  private static final String DIRTY = "DIRTY";
  static final String JOURNAL_FILE = "journal";
  static final String JOURNAL_FILE_BACKUP = "journal.bkp";
  static final String JOURNAL_FILE_TEMP = "journal.tmp";
  static final Pattern LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_-]{1,64}");
  static final String MAGIC = "libcore.io.DiskLruCache";
  private static final OutputStream NULL_OUTPUT_STREAM = new OutputStream()
  {
    public void write(int paramAnonymousInt)
      throws IOException
    {}
  };
  private static final String READ = "READ";
  private static final String REMOVE = "REMOVE";
  static final String VERSION_1 = "1";
  private final int appVersion;
  private final Callable<Void> cleanupCallable = new Callable()
  {
    public Void call()
      throws Exception
    {
      synchronized (LruDiskCache.this)
      {
        if (LruDiskCache.this.journalWriter == null) {
          return null;
        }
        LruDiskCache.this.trimToSize();
        if (LruDiskCache.this.journalRebuildRequired())
        {
          LruDiskCache.this.rebuildJournal();
          LruDiskCache.this.redundantOpCount = 0;
        }
        return null;
      }
    }
  };
  private final File directory;
  private DiskCacheFileNameGenerator diskCacheFileNameGenerator = new MD5DiskCacheFileNameGenerator();
  final ThreadPoolExecutor executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue());
  private final File journalFile;
  private final File journalFileBackup;
  private final File journalFileTmp;
  private Writer journalWriter;
  private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap(0, 0.75F, true);
  private long maxSize;
  private long nextSequenceNumber = 0L;
  private int redundantOpCount;
  private long size = 0L;
  private final int valueCount;
  
  private LruDiskCache(File paramFile, int paramInt1, int paramInt2, long paramLong)
  {
    this.directory = paramFile;
    this.appVersion = paramInt1;
    this.journalFile = new File(paramFile, "journal");
    this.journalFileTmp = new File(paramFile, "journal.tmp");
    this.journalFileBackup = new File(paramFile, "journal.bkp");
    this.valueCount = paramInt2;
    this.maxSize = paramLong;
  }
  
  private void checkNotClosed()
  {
    if (this.journalWriter == null) {
      throw new IllegalStateException("cache is closed");
    }
  }
  
  private void completeEdit(Editor paramEditor, boolean paramBoolean)
    throws IOException
  {
    Entry localEntry;
    try
    {
      localEntry = paramEditor.entry;
      if (localEntry.currentEditor != paramEditor) {
        throw new IllegalStateException();
      }
    }
    finally {}
    int i;
    if ((paramBoolean) && (!localEntry.readable))
    {
      i = 0;
      if (i >= this.valueCount) {
        break label403;
      }
    }
    for (;;)
    {
      long l1;
      if (i >= this.valueCount)
      {
        this.redundantOpCount += 1;
        localEntry.currentEditor = null;
        if (!(localEntry.readable | paramBoolean)) {
          break label354;
        }
        localEntry.readable = true;
        this.journalWriter.write("CLEAN " + localEntry.diskKey + " t_" + localEntry.expiryTimestamp + localEntry.getLengths() + '\n');
        if (paramBoolean)
        {
          l1 = this.nextSequenceNumber;
          this.nextSequenceNumber = (1L + l1);
          localEntry.sequenceNumber = l1;
        }
      }
      for (;;)
      {
        this.journalWriter.flush();
        if ((this.size > this.maxSize) || (journalRebuildRequired())) {
          this.executorService.submit(this.cleanupCallable);
        }
        for (;;)
        {
          return;
          if (paramEditor.written[i] == 0)
          {
            paramEditor.abort();
            throw new IllegalStateException("Newly created entry didn't create value for index " + i);
          }
          if (localEntry.getDirtyFile(i).exists()) {
            break;
          }
          paramEditor.abort();
        }
        paramEditor = localEntry.getDirtyFile(i);
        if (paramBoolean)
        {
          if (!paramEditor.exists()) {
            break label415;
          }
          File localFile = localEntry.getCleanFile(i);
          paramEditor.renameTo(localFile);
          l1 = localEntry.lengths[i];
          long l2 = localFile.length();
          localEntry.lengths[i] = l2;
          this.size = (this.size - l1 + l2);
          break label415;
        }
        deleteIfExists(paramEditor);
        break label415;
        label354:
        this.lruEntries.remove(localEntry.diskKey);
        this.journalWriter.write("REMOVE " + localEntry.diskKey + '\n');
      }
      label403:
      i = 0;
      continue;
      i += 1;
      break;
      label415:
      i += 1;
    }
  }
  
  private static void deleteContents(File paramFile)
    throws IOException
  {
    File[] arrayOfFile = paramFile.listFiles();
    if (arrayOfFile == null) {
      throw new IOException("not a readable directory: " + paramFile);
    }
    int j = arrayOfFile.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return;
      }
      paramFile = arrayOfFile[i];
      if (paramFile.isDirectory()) {
        deleteContents(paramFile);
      }
      if ((paramFile.exists()) && (!paramFile.delete())) {
        throw new IOException("failed to delete file: " + paramFile);
      }
      i += 1;
    }
  }
  
  private static void deleteIfExists(File paramFile)
    throws IOException
  {
    if ((paramFile.exists()) && (!paramFile.delete())) {
      throw new IOException();
    }
  }
  
  private Editor editByDiskKey(String paramString, long paramLong)
    throws IOException
  {
    Editor localEditor1 = null;
    for (;;)
    {
      Entry localEntry;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)this.lruEntries.get(paramString);
        if (paramLong != -1L)
        {
          localObject = localEditor1;
          if (localEntry != null)
          {
            long l = localEntry.sequenceNumber;
            if (l != paramLong) {
              localObject = localEditor1;
            }
          }
          else
          {
            return (Editor)localObject;
          }
        }
        if (localEntry == null)
        {
          localObject = new Entry(paramString, null);
          this.lruEntries.put(paramString, localObject);
          localEditor1 = new Editor((Entry)localObject, null);
          ((Entry)localObject).currentEditor = localEditor1;
          this.journalWriter.write("DIRTY " + paramString + '\n');
          this.journalWriter.flush();
          localObject = localEditor1;
          continue;
        }
        localEditor2 = localEntry.currentEditor;
      }
      finally {}
      Editor localEditor2;
      Object localObject = localEntry;
      if (localEditor2 != null) {
        localObject = localEditor1;
      }
    }
  }
  
  private Snapshot getByDiskKey(String paramString)
    throws IOException
  {
    Object localObject2 = null;
    label240:
    label409:
    for (;;)
    {
      Entry localEntry;
      Object localObject1;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)this.lruEntries.get(paramString);
        if (localEntry == null)
        {
          localObject1 = localObject2;
          return (Snapshot)localObject1;
        }
        localObject1 = localObject2;
        if (!localEntry.readable) {
          continue;
        }
        if (localEntry.expiryTimestamp >= System.currentTimeMillis()) {
          break label240;
        }
        i = 0;
        if (i >= this.valueCount)
        {
          this.redundantOpCount += 1;
          this.journalWriter.append("REMOVE " + paramString + '\n');
          this.lruEntries.remove(paramString);
          localObject1 = localObject2;
          if (!journalRebuildRequired()) {
            continue;
          }
          this.executorService.submit(this.cleanupCallable);
          localObject1 = localObject2;
          continue;
        }
        localObject1 = localEntry.getCleanFile(i);
      }
      finally {}
      if ((((File)localObject1).exists()) && (!((File)localObject1).delete())) {
        throw new IOException("failed to delete " + localObject1);
      }
      this.size -= localEntry.lengths[i];
      localEntry.lengths[i] = 0L;
      i += 1;
      continue;
      FileInputStream[] arrayOfFileInputStream = new FileInputStream[this.valueCount];
      int i = 0;
      try
      {
        for (;;)
        {
          int j = this.valueCount;
          if (i >= j)
          {
            this.redundantOpCount += 1;
            this.journalWriter.append("READ " + paramString + '\n');
            if (journalRebuildRequired()) {
              this.executorService.submit(this.cleanupCallable);
            }
            localObject1 = new Snapshot(paramString, localEntry.sequenceNumber, arrayOfFileInputStream, localEntry.lengths, null);
            break;
          }
          arrayOfFileInputStream[i] = new FileInputStream(localEntry.getCleanFile(i));
          i += 1;
        }
        localObject1 = localObject2;
      }
      catch (FileNotFoundException paramString)
      {
        i = 0;
      }
      for (;;)
      {
        if (i >= this.valueCount) {
          break label409;
        }
        localObject1 = localObject2;
        if (arrayOfFileInputStream[i] == null) {
          break;
        }
        IOUtils.closeQuietly(arrayOfFileInputStream[i]);
        i += 1;
      }
    }
  }
  
  private static String inputStreamToString(InputStream paramInputStream)
    throws IOException
  {
    return readFully(new InputStreamReader(paramInputStream, "UTF-8"));
  }
  
  private boolean journalRebuildRequired()
  {
    return (this.redundantOpCount >= 2000) && (this.redundantOpCount >= this.lruEntries.size());
  }
  
  public static LruDiskCache open(File paramFile, int paramInt1, int paramInt2, long paramLong)
    throws IOException
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (paramInt2 <= 0) {
      throw new IllegalArgumentException("valueCount <= 0");
    }
    Object localObject = new File(paramFile, "journal.bkp");
    File localFile;
    if (((File)localObject).exists())
    {
      localFile = new File(paramFile, "journal");
      if (!localFile.exists()) {
        break label150;
      }
      ((File)localObject).delete();
    }
    for (;;)
    {
      localObject = new LruDiskCache(paramFile, paramInt1, paramInt2, paramLong);
      if (!((LruDiskCache)localObject).journalFile.exists()) {
        break label210;
      }
      try
      {
        ((LruDiskCache)localObject).readJournal();
        ((LruDiskCache)localObject).processJournal();
        ((LruDiskCache)localObject).journalWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(((LruDiskCache)localObject).journalFile, true), "US-ASCII"));
        return (LruDiskCache)localObject;
      }
      catch (Throwable localThrowable)
      {
        label150:
        LogUtils.e("DiskLruCache " + paramFile + " is corrupt: " + localThrowable.getMessage() + ", removing", localThrowable);
        ((LruDiskCache)localObject).delete();
      }
      renameTo((File)localObject, localFile, false);
    }
    label210:
    paramFile.mkdirs();
    paramFile = new LruDiskCache(paramFile, paramInt1, paramInt2, paramLong);
    paramFile.rebuildJournal();
    return paramFile;
  }
  
  private void processJournal()
    throws IOException
  {
    deleteIfExists(this.journalFileTmp);
    Iterator localIterator = this.lruEntries.values().iterator();
    Entry localEntry;
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      localEntry = (Entry)localIterator.next();
      if (localEntry.currentEditor != null) {
        break;
      }
      i = 0;
      while (i < this.valueCount)
      {
        this.size += localEntry.lengths[i];
        i += 1;
      }
    }
    localEntry.currentEditor = null;
    int i = 0;
    for (;;)
    {
      if (i >= this.valueCount)
      {
        localIterator.remove();
        break;
      }
      deleteIfExists(localEntry.getCleanFile(i));
      deleteIfExists(localEntry.getDirtyFile(i));
      i += 1;
    }
  }
  
  private static String readFully(Reader paramReader)
    throws IOException
  {
    Object localObject2 = null;
    try
    {
      localObject1 = new StringWriter();
      try
      {
        localObject2 = new char['Ѐ'];
        for (;;)
        {
          int i = paramReader.read((char[])localObject2);
          if (i == -1)
          {
            localObject2 = ((StringWriter)localObject1).toString();
            IOUtils.closeQuietly(paramReader);
            IOUtils.closeQuietly((Closeable)localObject1);
            return (String)localObject2;
          }
          ((StringWriter)localObject1).write((char[])localObject2, 0, i);
        }
        IOUtils.closeQuietly(paramReader);
      }
      finally {}
    }
    finally
    {
      Object localObject1 = localObject3;
      Object localObject4 = localObject5;
    }
    IOUtils.closeQuietly((Closeable)localObject1);
    throw ((Throwable)localObject3);
  }
  
  /* Error */
  private void readJournal()
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: new 30	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader
    //   5: dup
    //   6: aload_0
    //   7: new 391	java/io/FileInputStream
    //   10: dup
    //   11: aload_0
    //   12: getfield 158	com/lidroid/xutils/util/core/LruDiskCache:journalFile	Ljava/io/File;
    //   15: invokespecial 398	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   18: invokespecial 516	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:<init>	(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/io/InputStream;)V
    //   21: astore_2
    //   22: aload_2
    //   23: invokevirtual 519	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:readLine	()Ljava/lang/String;
    //   26: astore_3
    //   27: aload_2
    //   28: invokevirtual 519	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:readLine	()Ljava/lang/String;
    //   31: astore 4
    //   33: aload_2
    //   34: invokevirtual 519	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:readLine	()Ljava/lang/String;
    //   37: astore 5
    //   39: aload_2
    //   40: invokevirtual 519	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:readLine	()Ljava/lang/String;
    //   43: astore 6
    //   45: aload_2
    //   46: invokevirtual 519	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:readLine	()Ljava/lang/String;
    //   49: astore 7
    //   51: ldc 56
    //   53: aload_3
    //   54: invokevirtual 525	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   57: ifeq +54 -> 111
    //   60: ldc 65
    //   62: aload 4
    //   64: invokevirtual 525	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   67: ifeq +44 -> 111
    //   70: aload_0
    //   71: getfield 151	com/lidroid/xutils/util/core/LruDiskCache:appVersion	I
    //   74: invokestatic 530	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   77: aload 5
    //   79: invokevirtual 525	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   82: ifeq +29 -> 111
    //   85: aload_0
    //   86: getfield 164	com/lidroid/xutils/util/core/LruDiskCache:valueCount	I
    //   89: invokestatic 530	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   92: aload 6
    //   94: invokevirtual 525	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   97: ifeq +14 -> 111
    //   100: ldc_w 532
    //   103: aload 7
    //   105: invokevirtual 525	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   108: ifne +74 -> 182
    //   111: new 173	java/io/IOException
    //   114: dup
    //   115: new 246	java/lang/StringBuilder
    //   118: dup
    //   119: ldc_w 534
    //   122: invokespecial 249	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   125: aload_3
    //   126: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: ldc_w 536
    //   132: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: aload 4
    //   137: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: ldc_w 536
    //   143: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   146: aload 6
    //   148: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   151: ldc_w 536
    //   154: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   157: aload 7
    //   159: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: ldc_w 538
    //   165: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: invokevirtual 274	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   171: invokespecial 342	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   174: athrow
    //   175: astore_3
    //   176: aload_2
    //   177: invokestatic 404	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   180: aload_3
    //   181: athrow
    //   182: iconst_0
    //   183: istore_1
    //   184: aload_0
    //   185: aload_2
    //   186: invokevirtual 519	com/lidroid/xutils/util/core/LruDiskCache$StrictLineReader:readLine	()Ljava/lang/String;
    //   189: invokespecial 541	com/lidroid/xutils/util/core/LruDiskCache:readJournalLine	(Ljava/lang/String;)V
    //   192: iload_1
    //   193: iconst_1
    //   194: iadd
    //   195: istore_1
    //   196: goto -12 -> 184
    //   199: astore_3
    //   200: aload_0
    //   201: iload_1
    //   202: aload_0
    //   203: getfield 119	com/lidroid/xutils/util/core/LruDiskCache:lruEntries	Ljava/util/LinkedHashMap;
    //   206: invokevirtual 418	java/util/LinkedHashMap:size	()I
    //   209: isub
    //   210: putfield 203	com/lidroid/xutils/util/core/LruDiskCache:redundantOpCount	I
    //   213: aload_2
    //   214: invokestatic 404	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   217: return
    //   218: astore 4
    //   220: aload_3
    //   221: astore_2
    //   222: aload 4
    //   224: astore_3
    //   225: goto -49 -> 176
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	228	0	this	LruDiskCache
    //   183	27	1	i	int
    //   21	201	2	localObject1	Object
    //   1	125	3	str1	String
    //   175	6	3	localObject2	Object
    //   199	22	3	localEOFException	EOFException
    //   224	1	3	localObject3	Object
    //   31	105	4	str2	String
    //   218	5	4	localObject4	Object
    //   37	41	5	str3	String
    //   43	104	6	str4	String
    //   49	109	7	str5	String
    // Exception table:
    //   from	to	target	type
    //   22	111	175	finally
    //   111	175	175	finally
    //   184	192	175	finally
    //   200	213	175	finally
    //   184	192	199	java/io/EOFException
    //   2	22	218	finally
  }
  
  private void readJournalLine(String paramString)
    throws IOException
  {
    int i = paramString.indexOf(' ');
    if (i == -1) {
      throw new IOException("unexpected journal line: " + paramString);
    }
    int j = i + 1;
    int k = paramString.indexOf(' ', j);
    Object localObject2;
    Object localObject1;
    if (k == -1)
    {
      localObject2 = paramString.substring(j);
      localObject1 = localObject2;
      if (i != "REMOVE".length()) {
        break label109;
      }
      localObject1 = localObject2;
      if (!paramString.startsWith("REMOVE")) {
        break label109;
      }
      this.lruEntries.remove(localObject2);
    }
    label109:
    do
    {
      do
      {
        return;
        localObject1 = paramString.substring(j, k);
        Entry localEntry = (Entry)this.lruEntries.get(localObject1);
        localObject2 = localEntry;
        if (localEntry == null)
        {
          localObject2 = new Entry((String)localObject1, null);
          this.lruEntries.put(localObject1, localObject2);
        }
        if ((k == -1) || (i != "CLEAN".length()) || (!paramString.startsWith("CLEAN"))) {
          break;
        }
        ((Entry)localObject2).readable = true;
        ((Entry)localObject2).currentEditor = null;
        localObject1 = paramString.substring(k + 1).split(" ");
      } while (localObject1.length <= 0);
      try
      {
        if (localObject1[0].startsWith("t_"))
        {
          ((Entry)localObject2).expiryTimestamp = Long.valueOf(localObject1[0].substring(2)).longValue();
          ((Entry)localObject2).setLengths((String[])localObject1, 1);
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        throw new IOException("unexpected journal line: " + paramString);
      }
      ((Entry)localObject2).expiryTimestamp = Long.MAX_VALUE;
      ((Entry)localObject2).setLengths(localThrowable, 0);
      return;
      if ((k == -1) && (i == "DIRTY".length()) && (paramString.startsWith("DIRTY")))
      {
        ((Entry)localObject2).currentEditor = new Editor((Entry)localObject2, null);
        return;
      }
    } while ((k == -1) && (i == "READ".length()) && (paramString.startsWith("READ")));
    throw new IOException("unexpected journal line: " + paramString);
  }
  
  /* Error */
  private void rebuildJournal()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 170	com/lidroid/xutils/util/core/LruDiskCache:journalWriter	Ljava/io/Writer;
    //   6: ifnull +10 -> 16
    //   9: aload_0
    //   10: getfield 170	com/lidroid/xutils/util/core/LruDiskCache:journalWriter	Ljava/io/Writer;
    //   13: invokestatic 404	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   16: aconst_null
    //   17: astore_3
    //   18: new 439	java/io/BufferedWriter
    //   21: dup
    //   22: new 441	java/io/OutputStreamWriter
    //   25: dup
    //   26: new 443	java/io/FileOutputStream
    //   29: dup
    //   30: aload_0
    //   31: getfield 160	com/lidroid/xutils/util/core/LruDiskCache:journalFileTmp	Ljava/io/File;
    //   34: invokespecial 586	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   37: ldc_w 448
    //   40: invokespecial 451	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
    //   43: invokespecial 454	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
    //   46: astore_2
    //   47: aload_2
    //   48: ldc 56
    //   50: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   53: aload_2
    //   54: ldc_w 588
    //   57: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   60: aload_2
    //   61: ldc 65
    //   63: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   66: aload_2
    //   67: ldc_w 588
    //   70: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   73: aload_2
    //   74: aload_0
    //   75: getfield 151	com/lidroid/xutils/util/core/LruDiskCache:appVersion	I
    //   78: invokestatic 530	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   81: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   84: aload_2
    //   85: ldc_w 588
    //   88: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   91: aload_2
    //   92: aload_0
    //   93: getfield 164	com/lidroid/xutils/util/core/LruDiskCache:valueCount	I
    //   96: invokestatic 530	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   99: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   102: aload_2
    //   103: ldc_w 588
    //   106: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   109: aload_2
    //   110: ldc_w 588
    //   113: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   116: aload_0
    //   117: getfield 119	com/lidroid/xutils/util/core/LruDiskCache:lruEntries	Ljava/util/LinkedHashMap;
    //   120: invokevirtual 481	java/util/LinkedHashMap:values	()Ljava/util/Collection;
    //   123: invokeinterface 487 1 0
    //   128: astore_3
    //   129: aload_3
    //   130: invokeinterface 492 1 0
    //   135: istore_1
    //   136: iload_1
    //   137: ifne +85 -> 222
    //   140: aload_2
    //   141: invokestatic 404	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   144: aload_0
    //   145: getfield 158	com/lidroid/xutils/util/core/LruDiskCache:journalFile	Ljava/io/File;
    //   148: invokevirtual 307	java/io/File:exists	()Z
    //   151: ifeq +15 -> 166
    //   154: aload_0
    //   155: getfield 158	com/lidroid/xutils/util/core/LruDiskCache:journalFile	Ljava/io/File;
    //   158: aload_0
    //   159: getfield 162	com/lidroid/xutils/util/core/LruDiskCache:journalFileBackup	Ljava/io/File;
    //   162: iconst_1
    //   163: invokestatic 457	com/lidroid/xutils/util/core/LruDiskCache:renameTo	(Ljava/io/File;Ljava/io/File;Z)V
    //   166: aload_0
    //   167: getfield 160	com/lidroid/xutils/util/core/LruDiskCache:journalFileTmp	Ljava/io/File;
    //   170: aload_0
    //   171: getfield 158	com/lidroid/xutils/util/core/LruDiskCache:journalFile	Ljava/io/File;
    //   174: iconst_0
    //   175: invokestatic 457	com/lidroid/xutils/util/core/LruDiskCache:renameTo	(Ljava/io/File;Ljava/io/File;Z)V
    //   178: aload_0
    //   179: getfield 162	com/lidroid/xutils/util/core/LruDiskCache:journalFileBackup	Ljava/io/File;
    //   182: invokevirtual 350	java/io/File:delete	()Z
    //   185: pop
    //   186: aload_0
    //   187: new 439	java/io/BufferedWriter
    //   190: dup
    //   191: new 441	java/io/OutputStreamWriter
    //   194: dup
    //   195: new 443	java/io/FileOutputStream
    //   198: dup
    //   199: aload_0
    //   200: getfield 158	com/lidroid/xutils/util/core/LruDiskCache:journalFile	Ljava/io/File;
    //   203: iconst_1
    //   204: invokespecial 446	java/io/FileOutputStream:<init>	(Ljava/io/File;Z)V
    //   207: ldc_w 448
    //   210: invokespecial 451	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
    //   213: invokespecial 454	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
    //   216: putfield 170	com/lidroid/xutils/util/core/LruDiskCache:journalWriter	Ljava/io/Writer;
    //   219: aload_0
    //   220: monitorexit
    //   221: return
    //   222: aload_3
    //   223: invokeinterface 496 1 0
    //   228: checkcast 21	com/lidroid/xutils/util/core/LruDiskCache$Entry
    //   231: astore 4
    //   233: aload 4
    //   235: invokestatic 234	com/lidroid/xutils/util/core/LruDiskCache$Entry:access$2	(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    //   238: ifnull +48 -> 286
    //   241: aload_2
    //   242: new 246	java/lang/StringBuilder
    //   245: dup
    //   246: ldc_w 375
    //   249: invokespecial 249	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   252: aload 4
    //   254: invokestatic 252	com/lidroid/xutils/util/core/LruDiskCache$Entry:access$3	(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;
    //   257: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   260: bipush 10
    //   262: invokevirtual 271	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   265: invokevirtual 274	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   268: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   271: goto -142 -> 129
    //   274: astore_3
    //   275: aload_2
    //   276: invokestatic 404	com/lidroid/xutils/util/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   279: aload_3
    //   280: athrow
    //   281: astore_2
    //   282: aload_0
    //   283: monitorexit
    //   284: aload_2
    //   285: athrow
    //   286: aload_2
    //   287: new 246	java/lang/StringBuilder
    //   290: dup
    //   291: ldc -8
    //   293: invokespecial 249	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   296: aload 4
    //   298: invokestatic 252	com/lidroid/xutils/util/core/LruDiskCache$Entry:access$3	(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;
    //   301: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   304: ldc_w 258
    //   307: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   310: aload 4
    //   312: invokestatic 261	com/lidroid/xutils/util/core/LruDiskCache$Entry:access$9	(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J
    //   315: invokevirtual 264	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   318: aload 4
    //   320: invokevirtual 268	com/lidroid/xutils/util/core/LruDiskCache$Entry:getLengths	()Ljava/lang/String;
    //   323: invokevirtual 256	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   326: bipush 10
    //   328: invokevirtual 271	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   331: invokevirtual 274	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   334: invokevirtual 279	java/io/Writer:write	(Ljava/lang/String;)V
    //   337: goto -208 -> 129
    //   340: astore 4
    //   342: aload_3
    //   343: astore_2
    //   344: aload 4
    //   346: astore_3
    //   347: goto -72 -> 275
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	350	0	this	LruDiskCache
    //   135	2	1	bool	boolean
    //   46	230	2	localBufferedWriter	BufferedWriter
    //   281	6	2	localObject1	Object
    //   343	1	2	localObject2	Object
    //   17	206	3	localIterator	Iterator
    //   274	69	3	localObject3	Object
    //   346	1	3	localObject4	Object
    //   231	88	4	localEntry	Entry
    //   340	5	4	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   47	129	274	finally
    //   129	136	274	finally
    //   222	271	274	finally
    //   286	337	274	finally
    //   2	16	281	finally
    //   140	166	281	finally
    //   166	219	281	finally
    //   275	281	281	finally
    //   18	47	340	finally
  }
  
  private boolean removeByDiskKey(String paramString)
    throws IOException
  {
    for (;;)
    {
      Entry localEntry;
      int i;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)this.lruEntries.get(paramString);
        if (localEntry != null)
        {
          localObject = localEntry.currentEditor;
          if (localObject == null) {}
        }
        else
        {
          bool = false;
          return bool;
        }
        i = 0;
        if (i >= this.valueCount)
        {
          this.redundantOpCount += 1;
          this.journalWriter.append("REMOVE " + paramString + '\n');
          this.lruEntries.remove(paramString);
          if (!journalRebuildRequired()) {
            break label214;
          }
          this.executorService.submit(this.cleanupCallable);
          break label214;
        }
        Object localObject = localEntry.getCleanFile(i);
        if ((((File)localObject).exists()) && (!((File)localObject).delete())) {
          throw new IOException("failed to delete " + localObject);
        }
      }
      finally {}
      this.size -= localEntry.lengths[i];
      localEntry.lengths[i] = 0L;
      i += 1;
      continue;
      label214:
      boolean bool = true;
    }
  }
  
  private static void renameTo(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramBoolean) {
      deleteIfExists(paramFile2);
    }
    if (!paramFile1.renameTo(paramFile2)) {
      throw new IOException();
    }
  }
  
  private void trimToSize()
    throws IOException
  {
    for (;;)
    {
      if (this.size <= this.maxSize) {
        return;
      }
      removeByDiskKey((String)((Map.Entry)this.lruEntries.entrySet().iterator().next()).getKey());
    }
  }
  
  private void validateKey(String paramString)
  {
    if (!LEGAL_KEY_PATTERN.matcher(paramString).matches()) {
      throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,64}: \"" + paramString + "\"");
    }
  }
  
  public void close()
    throws IOException
  {
    for (;;)
    {
      try
      {
        Object localObject1 = this.journalWriter;
        if (localObject1 == null) {
          return;
        }
        localObject1 = new ArrayList(this.lruEntries.values()).iterator();
        if (!((Iterator)localObject1).hasNext())
        {
          trimToSize();
          this.journalWriter.close();
          this.journalWriter = null;
          continue;
        }
        localEntry = (Entry)((Iterator)localObject2).next();
      }
      finally {}
      Entry localEntry;
      if (localEntry.currentEditor != null) {
        localEntry.currentEditor.abort();
      }
    }
  }
  
  public void delete()
    throws IOException
  {
    IOUtils.closeQuietly(this);
    deleteContents(this.directory);
  }
  
  public Editor edit(String paramString)
    throws IOException
  {
    return editByDiskKey(this.diskCacheFileNameGenerator.generate(paramString), -1L);
  }
  
  public void flush()
    throws IOException
  {
    try
    {
      checkNotClosed();
      trimToSize();
      this.journalWriter.flush();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public Snapshot get(String paramString)
    throws IOException
  {
    return getByDiskKey(this.diskCacheFileNameGenerator.generate(paramString));
  }
  
  public File getCacheFile(String paramString, int paramInt)
  {
    paramString = this.diskCacheFileNameGenerator.generate(paramString);
    return new File(this.directory, paramString + "." + paramInt);
  }
  
  public File getDirectory()
  {
    return this.directory;
  }
  
  public DiskCacheFileNameGenerator getDiskCacheFileNameGenerator()
  {
    return this.diskCacheFileNameGenerator;
  }
  
  /* Error */
  public long getExpiryTimestamp(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 147	com/lidroid/xutils/util/core/LruDiskCache:diskCacheFileNameGenerator	Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;
    //   6: aload_1
    //   7: invokeinterface 628 2 0
    //   12: astore_1
    //   13: aload_0
    //   14: invokespecial 355	com/lidroid/xutils/util/core/LruDiskCache:checkNotClosed	()V
    //   17: aload_0
    //   18: aload_1
    //   19: invokespecial 358	com/lidroid/xutils/util/core/LruDiskCache:validateKey	(Ljava/lang/String;)V
    //   22: aload_0
    //   23: getfield 119	com/lidroid/xutils/util/core/LruDiskCache:lruEntries	Ljava/util/LinkedHashMap;
    //   26: aload_1
    //   27: invokevirtual 361	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   30: checkcast 21	com/lidroid/xutils/util/core/LruDiskCache$Entry
    //   33: astore_1
    //   34: aload_1
    //   35: ifnonnull +9 -> 44
    //   38: lconst_0
    //   39: lstore_2
    //   40: aload_0
    //   41: monitorexit
    //   42: lload_2
    //   43: lreturn
    //   44: aload_1
    //   45: invokestatic 261	com/lidroid/xutils/util/core/LruDiskCache$Entry:access$9	(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J
    //   48: lstore_2
    //   49: goto -9 -> 40
    //   52: astore_1
    //   53: aload_0
    //   54: monitorexit
    //   55: aload_1
    //   56: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	57	0	this	LruDiskCache
    //   0	57	1	paramString	String
    //   39	10	2	l	long
    // Exception table:
    //   from	to	target	type
    //   2	34	52	finally
    //   44	49	52	finally
  }
  
  public long getMaxSize()
  {
    try
    {
      long l = this.maxSize;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public boolean isClosed()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 170	com/lidroid/xutils/util/core/LruDiskCache:journalWriter	Ljava/io/Writer;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnonnull +9 -> 17
    //   11: iconst_1
    //   12: istore_1
    //   13: aload_0
    //   14: monitorexit
    //   15: iload_1
    //   16: ireturn
    //   17: iconst_0
    //   18: istore_1
    //   19: goto -6 -> 13
    //   22: astore_2
    //   23: aload_0
    //   24: monitorexit
    //   25: aload_2
    //   26: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	27	0	this	LruDiskCache
    //   12	7	1	bool	boolean
    //   6	2	2	localWriter	Writer
    //   22	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	22	finally
  }
  
  public boolean remove(String paramString)
    throws IOException
  {
    return removeByDiskKey(this.diskCacheFileNameGenerator.generate(paramString));
  }
  
  public void setDiskCacheFileNameGenerator(DiskCacheFileNameGenerator paramDiskCacheFileNameGenerator)
  {
    if (paramDiskCacheFileNameGenerator != null) {
      this.diskCacheFileNameGenerator = paramDiskCacheFileNameGenerator;
    }
  }
  
  public void setMaxSize(long paramLong)
  {
    try
    {
      this.maxSize = paramLong;
      this.executorService.submit(this.cleanupCallable);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public long size()
  {
    try
    {
      long l = this.size;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static abstract interface DiskCacheFileNameGenerator
  {
    public abstract String generate(String paramString);
  }
  
  public final class Editor
  {
    private boolean committed;
    private final LruDiskCache.Entry entry;
    private boolean hasErrors;
    private final boolean[] written;
    
    private Editor(LruDiskCache.Entry paramEntry)
    {
      this.entry = paramEntry;
      if (LruDiskCache.Entry.access$0(paramEntry)) {}
      for (this$1 = null;; this$1 = new boolean[LruDiskCache.this.valueCount])
      {
        this.written = LruDiskCache.this;
        return;
      }
    }
    
    public void abort()
      throws IOException
    {
      LruDiskCache.this.completeEdit(this, false);
    }
    
    public void abortUnlessCommitted()
    {
      if (!this.committed) {}
      try
      {
        abort();
        return;
      }
      catch (Throwable localThrowable) {}
    }
    
    public void commit()
      throws IOException
    {
      if (this.hasErrors)
      {
        LruDiskCache.this.completeEdit(this, false);
        LruDiskCache.this.removeByDiskKey(LruDiskCache.Entry.access$3(this.entry));
      }
      for (;;)
      {
        this.committed = true;
        return;
        LruDiskCache.this.completeEdit(this, true);
      }
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      InputStream localInputStream = newInputStream(paramInt);
      if (localInputStream != null) {
        return LruDiskCache.inputStreamToString(localInputStream);
      }
      return null;
    }
    
    public InputStream newInputStream(int paramInt)
      throws IOException
    {
      synchronized (LruDiskCache.this)
      {
        if (LruDiskCache.Entry.access$2(this.entry) != this) {
          throw new IllegalStateException();
        }
      }
      if (!LruDiskCache.Entry.access$0(this.entry)) {
        return null;
      }
      try
      {
        FileInputStream localFileInputStream = new FileInputStream(this.entry.getCleanFile(paramInt));
        return localFileInputStream;
      }
      catch (FileNotFoundException localFileNotFoundException) {}
      return null;
    }
    
    public OutputStream newOutputStream(int paramInt)
      throws IOException
    {
      synchronized (LruDiskCache.this)
      {
        if (LruDiskCache.Entry.access$2(this.entry) != this) {
          throw new IllegalStateException();
        }
      }
      if (!LruDiskCache.Entry.access$0(this.entry)) {
        this.written[paramInt] = true;
      }
      File localFile = this.entry.getDirtyFile(paramInt);
      try
      {
        Object localObject2 = new FileOutputStream(localFile);
        localObject2 = new FaultHidingOutputStream((OutputStream)localObject2, null);
        return (OutputStream)localObject2;
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        for (;;)
        {
          LruDiskCache.this.directory.mkdirs();
          try
          {
            FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
          }
          catch (FileNotFoundException localFileNotFoundException2)
          {
            OutputStream localOutputStream = LruDiskCache.NULL_OUTPUT_STREAM;
            return localOutputStream;
          }
        }
      }
    }
    
    public void set(int paramInt, String paramString)
      throws IOException
    {
      Object localObject3 = null;
      try
      {
        OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(newOutputStream(paramInt), "UTF-8");
        IOUtils.closeQuietly(paramString);
      }
      finally
      {
        try
        {
          localOutputStreamWriter.write(paramString);
          IOUtils.closeQuietly(localOutputStreamWriter);
          return;
        }
        finally
        {
          paramString = (String)localObject1;
          Object localObject2 = localObject4;
        }
        localObject1 = finally;
        paramString = (String)localObject3;
      }
      throw ((Throwable)localObject1);
    }
    
    public void setEntryExpiryTimestamp(long paramLong)
    {
      LruDiskCache.Entry.access$1(this.entry, paramLong);
    }
    
    private class FaultHidingOutputStream
      extends FilterOutputStream
    {
      private FaultHidingOutputStream(OutputStream paramOutputStream)
      {
        super();
      }
      
      public void close()
      {
        try
        {
          this.out.close();
          return;
        }
        catch (Throwable localThrowable)
        {
          LruDiskCache.Editor.this.hasErrors = true;
        }
      }
      
      public void flush()
      {
        try
        {
          this.out.flush();
          return;
        }
        catch (Throwable localThrowable)
        {
          LruDiskCache.Editor.this.hasErrors = true;
        }
      }
      
      public void write(int paramInt)
      {
        try
        {
          this.out.write(paramInt);
          return;
        }
        catch (Throwable localThrowable)
        {
          LruDiskCache.Editor.this.hasErrors = true;
        }
      }
      
      public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      {
        try
        {
          this.out.write(paramArrayOfByte, paramInt1, paramInt2);
          this.out.flush();
          return;
        }
        catch (Throwable paramArrayOfByte)
        {
          LruDiskCache.Editor.this.hasErrors = true;
        }
      }
    }
  }
  
  private final class Entry
  {
    private LruDiskCache.Editor currentEditor;
    private final String diskKey;
    private long expiryTimestamp = Long.MAX_VALUE;
    private final long[] lengths;
    private boolean readable;
    private long sequenceNumber;
    
    private Entry(String paramString)
    {
      this.diskKey = paramString;
      this.lengths = new long[LruDiskCache.this.valueCount];
    }
    
    private IOException invalidLengths(String[] paramArrayOfString)
      throws IOException
    {
      throw new IOException("unexpected journal line: " + Arrays.toString(paramArrayOfString));
    }
    
    /* Error */
    private void setLengths(String[] paramArrayOfString, int paramInt)
      throws IOException
    {
      // Byte code:
      //   0: aload_1
      //   1: arraylength
      //   2: iload_2
      //   3: isub
      //   4: aload_0
      //   5: getfield 24	com/lidroid/xutils/util/core/LruDiskCache$Entry:this$0	Lcom/lidroid/xutils/util/core/LruDiskCache;
      //   8: invokestatic 37	com/lidroid/xutils/util/core/LruDiskCache:access$7	(Lcom/lidroid/xutils/util/core/LruDiskCache;)I
      //   11: if_icmpeq +9 -> 20
      //   14: aload_0
      //   15: aload_1
      //   16: invokespecial 102	com/lidroid/xutils/util/core/LruDiskCache$Entry:invalidLengths	([Ljava/lang/String;)Ljava/io/IOException;
      //   19: athrow
      //   20: iconst_0
      //   21: istore_3
      //   22: iload_3
      //   23: aload_0
      //   24: getfield 24	com/lidroid/xutils/util/core/LruDiskCache$Entry:this$0	Lcom/lidroid/xutils/util/core/LruDiskCache;
      //   27: invokestatic 37	com/lidroid/xutils/util/core/LruDiskCache:access$7	(Lcom/lidroid/xutils/util/core/LruDiskCache;)I
      //   30: if_icmplt +4 -> 34
      //   33: return
      //   34: aload_0
      //   35: getfield 39	com/lidroid/xutils/util/core/LruDiskCache$Entry:lengths	[J
      //   38: iload_3
      //   39: aload_1
      //   40: iload_3
      //   41: iload_2
      //   42: iadd
      //   43: aaload
      //   44: invokestatic 108	java/lang/Long:parseLong	(Ljava/lang/String;)J
      //   47: lastore
      //   48: iload_3
      //   49: iconst_1
      //   50: iadd
      //   51: istore_3
      //   52: goto -30 -> 22
      //   55: astore 4
      //   57: aload_0
      //   58: aload_1
      //   59: invokespecial 102	com/lidroid/xutils/util/core/LruDiskCache$Entry:invalidLengths	([Ljava/lang/String;)Ljava/io/IOException;
      //   62: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	63	0	this	Entry
      //   0	63	1	paramArrayOfString	String[]
      //   0	63	2	paramInt	int
      //   21	31	3	i	int
      //   55	1	4	localNumberFormatException	NumberFormatException
      // Exception table:
      //   from	to	target	type
      //   22	33	55	java/lang/NumberFormatException
      //   34	48	55	java/lang/NumberFormatException
    }
    
    public File getCleanFile(int paramInt)
    {
      return new File(LruDiskCache.this.directory, this.diskKey + "." + paramInt);
    }
    
    public File getDirtyFile(int paramInt)
    {
      return new File(LruDiskCache.this.directory, this.diskKey + "." + paramInt + ".tmp");
    }
    
    public String getLengths()
      throws IOException
    {
      StringBuilder localStringBuilder = new StringBuilder();
      long[] arrayOfLong = this.lengths;
      int j = arrayOfLong.length;
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          return localStringBuilder.toString();
        }
        long l = arrayOfLong[i];
        localStringBuilder.append(' ').append(l);
        i += 1;
      }
    }
  }
  
  public class MD5DiskCacheFileNameGenerator
    implements LruDiskCache.DiskCacheFileNameGenerator
  {
    public MD5DiskCacheFileNameGenerator() {}
    
    private String bytesToHexString(byte[] paramArrayOfByte)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      int i = 0;
      for (;;)
      {
        if (i >= paramArrayOfByte.length) {
          return localStringBuilder.toString();
        }
        String str = Integer.toHexString(paramArrayOfByte[i] & 0xFF);
        if (str.length() == 1) {
          localStringBuilder.append('0');
        }
        localStringBuilder.append(str);
        i += 1;
      }
    }
    
    public String generate(String paramString)
    {
      try
      {
        Object localObject = MessageDigest.getInstance("MD5");
        ((MessageDigest)localObject).update(paramString.getBytes());
        localObject = bytesToHexString(((MessageDigest)localObject).digest());
        return (String)localObject;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {}
      return String.valueOf(paramString.hashCode());
    }
  }
  
  public final class Snapshot
    implements Closeable
  {
    private final String diskKey;
    private final FileInputStream[] ins;
    private final long[] lengths;
    private final long sequenceNumber;
    
    private Snapshot(String paramString, long paramLong, FileInputStream[] paramArrayOfFileInputStream, long[] paramArrayOfLong)
    {
      this.diskKey = paramString;
      this.sequenceNumber = paramLong;
      this.ins = paramArrayOfFileInputStream;
      this.lengths = paramArrayOfLong;
    }
    
    public void close()
    {
      FileInputStream[] arrayOfFileInputStream = this.ins;
      int j = arrayOfFileInputStream.length;
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          return;
        }
        IOUtils.closeQuietly(arrayOfFileInputStream[i]);
        i += 1;
      }
    }
    
    public LruDiskCache.Editor edit()
      throws IOException
    {
      return LruDiskCache.this.editByDiskKey(this.diskKey, this.sequenceNumber);
    }
    
    public FileInputStream getInputStream(int paramInt)
    {
      return this.ins[paramInt];
    }
    
    public long getLength(int paramInt)
    {
      return this.lengths[paramInt];
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      return LruDiskCache.inputStreamToString(getInputStream(paramInt));
    }
  }
  
  private class StrictLineReader
    implements Closeable
  {
    private static final byte CR = 13;
    private static final byte LF = 10;
    private byte[] buf;
    private final Charset charset = Charset.forName("US-ASCII");
    private int end;
    private final InputStream in;
    private int pos;
    
    public StrictLineReader(InputStream paramInputStream)
    {
      this(paramInputStream, 8192);
    }
    
    public StrictLineReader(InputStream paramInputStream, int paramInt)
    {
      if (paramInputStream == null) {
        throw new NullPointerException();
      }
      if (paramInt < 0) {
        throw new IllegalArgumentException("capacity <= 0");
      }
      this.in = paramInputStream;
      this.buf = new byte[paramInt];
    }
    
    private void fillBuf()
      throws IOException
    {
      int i = this.in.read(this.buf, 0, this.buf.length);
      if (i == -1) {
        throw new EOFException();
      }
      this.pos = 0;
      this.end = i;
    }
    
    public void close()
      throws IOException
    {
      synchronized (this.in)
      {
        if (this.buf != null)
        {
          this.buf = null;
          this.in.close();
        }
        return;
      }
    }
    
    public String readLine()
      throws IOException
    {
      synchronized (this.in)
      {
        if (this.buf == null) {
          throw new IOException("LineReader is closed");
        }
      }
      if (this.pos >= this.end) {
        fillBuf();
      }
      int i = this.pos;
      Object localObject2;
      if (i == this.end) {
        localObject2 = new ByteArrayOutputStream(this.end - this.pos + 80)
        {
          public String toString()
          {
            if ((this.count > 0) && (this.buf[(this.count - 1)] == 13)) {}
            for (int i = this.count - 1;; i = this.count) {
              try
              {
                String str = new String(this.buf, 0, i, LruDiskCache.StrictLineReader.this.charset.name());
                return str;
              }
              catch (UnsupportedEncodingException localUnsupportedEncodingException)
              {
                throw new AssertionError(localUnsupportedEncodingException);
              }
            }
          }
        };
      }
      label282:
      for (;;)
      {
        ((ByteArrayOutputStream)localObject2).write(this.buf, this.pos, this.end - this.pos);
        this.end = -1;
        fillBuf();
        i = this.pos;
        for (;;)
        {
          if (i == this.end) {
            break label282;
          }
          if (this.buf[i] == 10)
          {
            if (i != this.pos) {
              ((ByteArrayOutputStream)localObject2).write(this.buf, this.pos, i - this.pos);
            }
            ((ByteArrayOutputStream)localObject2).flush();
            this.pos = (i + 1);
            localObject2 = ((ByteArrayOutputStream)localObject2).toString();
            return (String)localObject2;
            if (this.buf[i] == 10)
            {
              if ((i != this.pos) && (this.buf[(i - 1)] == 13)) {}
              for (int j = i - 1;; j = i)
              {
                localObject2 = new String(this.buf, this.pos, j - this.pos, this.charset.name());
                this.pos = (i + 1);
                return (String)localObject2;
              }
            }
            i += 1;
            break;
          }
          i += 1;
        }
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\core\LruDiskCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */