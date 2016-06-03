package com.lidroid.xutils.http.client.util;

import android.text.TextUtils;
import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicHeaderValueParser;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.ParserCursor;
import org.apache.http.util.CharArrayBuffer;

public class URLEncodedUtils
{
  public static final String CONTENT_TYPE = "application/x-www-form-urlencoded";
  private static final char[] DELIM = { '&' };
  private static final BitSet FRAGMENT;
  private static final String NAME_VALUE_SEPARATOR = "=";
  private static final String PARAMETER_SEPARATOR = "&";
  private static final BitSet PATHSAFE;
  private static final BitSet PUNCT;
  private static final int RADIX = 16;
  private static final BitSet RESERVED;
  private static final BitSet UNRESERVED = new BitSet(256);
  private static final BitSet URLENCODER;
  private static final BitSet USERINFO;
  
  static
  {
    PUNCT = new BitSet(256);
    USERINFO = new BitSet(256);
    PATHSAFE = new BitSet(256);
    FRAGMENT = new BitSet(256);
    RESERVED = new BitSet(256);
    URLENCODER = new BitSet(256);
    int i = 97;
    if (i > 122)
    {
      i = 65;
      label114:
      if (i <= 90) {
        break label494;
      }
      i = 48;
    }
    for (;;)
    {
      if (i > 57)
      {
        UNRESERVED.set(95);
        UNRESERVED.set(45);
        UNRESERVED.set(46);
        UNRESERVED.set(42);
        URLENCODER.or(UNRESERVED);
        UNRESERVED.set(33);
        UNRESERVED.set(126);
        UNRESERVED.set(39);
        UNRESERVED.set(40);
        UNRESERVED.set(41);
        PUNCT.set(44);
        PUNCT.set(59);
        PUNCT.set(58);
        PUNCT.set(36);
        PUNCT.set(38);
        PUNCT.set(43);
        PUNCT.set(61);
        USERINFO.or(UNRESERVED);
        USERINFO.or(PUNCT);
        PATHSAFE.or(UNRESERVED);
        PATHSAFE.set(47);
        PATHSAFE.set(59);
        PATHSAFE.set(58);
        PATHSAFE.set(64);
        PATHSAFE.set(38);
        PATHSAFE.set(61);
        PATHSAFE.set(43);
        PATHSAFE.set(36);
        PATHSAFE.set(44);
        RESERVED.set(59);
        RESERVED.set(47);
        RESERVED.set(63);
        RESERVED.set(58);
        RESERVED.set(64);
        RESERVED.set(38);
        RESERVED.set(61);
        RESERVED.set(43);
        RESERVED.set(36);
        RESERVED.set(44);
        RESERVED.set(91);
        RESERVED.set(93);
        FRAGMENT.or(RESERVED);
        FRAGMENT.or(UNRESERVED);
        return;
        UNRESERVED.set(i);
        i += 1;
        break;
        label494:
        UNRESERVED.set(i);
        i += 1;
        break label114;
      }
      UNRESERVED.set(i);
      i += 1;
    }
  }
  
  private static String decodeFormFields(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      return null;
    }
    if (paramString2 != null) {}
    for (paramString2 = Charset.forName(paramString2);; paramString2 = Charset.forName("UTF-8")) {
      return urldecode(paramString1, paramString2, true);
    }
  }
  
  private static String decodeFormFields(String paramString, Charset paramCharset)
  {
    if (paramString == null) {
      return null;
    }
    if (paramCharset != null) {}
    for (;;)
    {
      return urldecode(paramString, paramCharset, true);
      paramCharset = Charset.forName("UTF-8");
    }
  }
  
  static String encFragment(String paramString, Charset paramCharset)
  {
    return urlencode(paramString, paramCharset, FRAGMENT, false);
  }
  
  static String encPath(String paramString, Charset paramCharset)
  {
    return urlencode(paramString, paramCharset, PATHSAFE, false);
  }
  
  static String encUserInfo(String paramString, Charset paramCharset)
  {
    return urlencode(paramString, paramCharset, USERINFO, false);
  }
  
  private static String encodeFormFields(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      return null;
    }
    if (paramString2 != null) {}
    for (paramString2 = Charset.forName(paramString2);; paramString2 = Charset.forName("UTF-8")) {
      return urlencode(paramString1, paramString2, URLENCODER, true);
    }
  }
  
  private static String encodeFormFields(String paramString, Charset paramCharset)
  {
    if (paramString == null) {
      return null;
    }
    if (paramCharset != null) {}
    for (;;)
    {
      return urlencode(paramString, paramCharset, URLENCODER, true);
      paramCharset = Charset.forName("UTF-8");
    }
  }
  
  public static String format(Iterable<? extends NameValuePair> paramIterable, Charset paramCharset)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramIterable = paramIterable.iterator();
    for (;;)
    {
      if (!paramIterable.hasNext()) {
        return localStringBuilder.toString();
      }
      Object localObject = (NameValuePair)paramIterable.next();
      String str = encodeFormFields(((NameValuePair)localObject).getName(), paramCharset);
      localObject = encodeFormFields(((NameValuePair)localObject).getValue(), paramCharset);
      if (localStringBuilder.length() > 0) {
        localStringBuilder.append("&");
      }
      localStringBuilder.append(str);
      if (localObject != null)
      {
        localStringBuilder.append("=");
        localStringBuilder.append((String)localObject);
      }
    }
  }
  
  public static String format(List<? extends NameValuePair> paramList, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramList = paramList.iterator();
    for (;;)
    {
      if (!paramList.hasNext()) {
        return localStringBuilder.toString();
      }
      Object localObject = (NameValuePair)paramList.next();
      String str = encodeFormFields(((NameValuePair)localObject).getName(), paramString);
      localObject = encodeFormFields(((NameValuePair)localObject).getValue(), paramString);
      if (localStringBuilder.length() > 0) {
        localStringBuilder.append("&");
      }
      localStringBuilder.append(str);
      if (localObject != null)
      {
        localStringBuilder.append("=");
        localStringBuilder.append((String)localObject);
      }
    }
  }
  
  public static boolean isEncoded(HttpEntity paramHttpEntity)
  {
    boolean bool2 = false;
    paramHttpEntity = paramHttpEntity.getContentType();
    boolean bool1 = bool2;
    if (paramHttpEntity != null)
    {
      paramHttpEntity = paramHttpEntity.getElements();
      bool1 = bool2;
      if (paramHttpEntity.length > 0) {
        bool1 = paramHttpEntity[0].getName().equalsIgnoreCase("application/x-www-form-urlencoded");
      }
    }
    return bool1;
  }
  
  public static List<NameValuePair> parse(String paramString)
  {
    if (paramString == null)
    {
      paramString = Collections.emptyList();
      return paramString;
    }
    BasicHeaderValueParser localBasicHeaderValueParser = BasicHeaderValueParser.DEFAULT;
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    ParserCursor localParserCursor = new ParserCursor(0, localCharArrayBuffer.length());
    ArrayList localArrayList = new ArrayList();
    for (;;)
    {
      paramString = localArrayList;
      if (localParserCursor.atEnd()) {
        break;
      }
      paramString = localBasicHeaderValueParser.parseNameValuePair(localCharArrayBuffer, localParserCursor, DELIM);
      if (paramString.getName().length() > 0) {
        localArrayList.add(new BasicNameValuePair(paramString.getName(), paramString.getValue()));
      }
    }
  }
  
  public static List<NameValuePair> parse(URI paramURI)
  {
    paramURI = paramURI.getRawQuery();
    if (!TextUtils.isEmpty(paramURI))
    {
      ArrayList localArrayList = new ArrayList();
      parse(localArrayList, new Scanner(paramURI));
      return localArrayList;
    }
    return Collections.emptyList();
  }
  
  public static void parse(List<NameValuePair> paramList, Scanner paramScanner)
  {
    paramScanner.useDelimiter("&");
    if (!paramScanner.hasNext()) {
      return;
    }
    String str2 = null;
    String str3 = paramScanner.next();
    int i = str3.indexOf("=");
    String str1;
    if (i != -1)
    {
      str1 = str3.substring(0, i).trim();
      str2 = str3.substring(i + 1).trim();
    }
    for (;;)
    {
      paramList.add(new BasicNameValuePair(str1, str2));
      break;
      str1 = str3.trim();
    }
  }
  
  private static String urldecode(String paramString, Charset paramCharset, boolean paramBoolean)
  {
    if (paramString == null) {
      return null;
    }
    ByteBuffer localByteBuffer = ByteBuffer.allocate(paramString.length());
    paramString = CharBuffer.wrap(paramString);
    for (;;)
    {
      if (!paramString.hasRemaining())
      {
        localByteBuffer.flip();
        return paramCharset.decode(localByteBuffer).toString();
      }
      int i = paramString.get();
      if ((i == 37) && (paramString.remaining() >= 2))
      {
        char c1 = paramString.get();
        char c2 = paramString.get();
        i = Character.digit(c1, 16);
        int j = Character.digit(c2, 16);
        if ((i != -1) && (j != -1))
        {
          localByteBuffer.put((byte)((i << 4) + j));
        }
        else
        {
          localByteBuffer.put((byte)37);
          localByteBuffer.put((byte)c1);
          localByteBuffer.put((byte)c2);
        }
      }
      else if ((paramBoolean) && (i == 43))
      {
        localByteBuffer.put((byte)32);
      }
      else
      {
        localByteBuffer.put((byte)i);
      }
    }
  }
  
  private static String urlencode(String paramString, Charset paramCharset, BitSet paramBitSet, boolean paramBoolean)
  {
    if (paramString == null) {
      return null;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    paramString = paramCharset.encode(paramString);
    for (;;)
    {
      if (!paramString.hasRemaining()) {
        return localStringBuilder.toString();
      }
      int i = paramString.get() & 0xFF;
      if (paramBitSet.get(i))
      {
        localStringBuilder.append((char)i);
      }
      else if ((paramBoolean) && (i == 32))
      {
        localStringBuilder.append('+');
      }
      else
      {
        localStringBuilder.append("%");
        char c1 = Character.toUpperCase(Character.forDigit(i >> 4 & 0xF, 16));
        char c2 = Character.toUpperCase(Character.forDigit(i & 0xF, 16));
        localStringBuilder.append(c1);
        localStringBuilder.append(c2);
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\util\URLEncodedUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */