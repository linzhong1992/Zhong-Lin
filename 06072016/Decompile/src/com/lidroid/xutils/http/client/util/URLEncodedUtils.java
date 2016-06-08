package com.lidroid.xutils.http.client.util;

import java.nio.charset.*;
import org.apache.http.*;
import org.apache.http.util.*;
import org.apache.http.message.*;
import java.net.*;
import android.text.*;
import java.util.*;
import java.nio.*;
import java.io.*;

public class URLEncodedUtils
{
    public static final String CONTENT_TYPE = "application/x-www-form-urlencoded";
    private static final char[] DELIM;
    private static final BitSet FRAGMENT;
    private static final String NAME_VALUE_SEPARATOR = "=";
    private static final String PARAMETER_SEPARATOR = "&";
    private static final BitSet PATHSAFE;
    private static final BitSet PUNCT;
    private static final int RADIX = 16;
    private static final BitSet RESERVED;
    private static final BitSet UNRESERVED;
    private static final BitSet URLENCODER;
    private static final BitSet USERINFO;
    
    static {
        DELIM = new char[] { '&' };
        UNRESERVED = new BitSet(256);
        PUNCT = new BitSet(256);
        USERINFO = new BitSet(256);
        PATHSAFE = new BitSet(256);
        FRAGMENT = new BitSet(256);
        RESERVED = new BitSet(256);
        URLENCODER = new BitSet(256);
        for (int i = 97; i <= 122; ++i) {
            URLEncodedUtils.UNRESERVED.set(i);
        }
        for (int j = 65; j <= 90; ++j) {
            URLEncodedUtils.UNRESERVED.set(j);
        }
        for (int k = 48; k <= 57; ++k) {
            URLEncodedUtils.UNRESERVED.set(k);
        }
        URLEncodedUtils.UNRESERVED.set(95);
        URLEncodedUtils.UNRESERVED.set(45);
        URLEncodedUtils.UNRESERVED.set(46);
        URLEncodedUtils.UNRESERVED.set(42);
        URLEncodedUtils.URLENCODER.or(URLEncodedUtils.UNRESERVED);
        URLEncodedUtils.UNRESERVED.set(33);
        URLEncodedUtils.UNRESERVED.set(126);
        URLEncodedUtils.UNRESERVED.set(39);
        URLEncodedUtils.UNRESERVED.set(40);
        URLEncodedUtils.UNRESERVED.set(41);
        URLEncodedUtils.PUNCT.set(44);
        URLEncodedUtils.PUNCT.set(59);
        URLEncodedUtils.PUNCT.set(58);
        URLEncodedUtils.PUNCT.set(36);
        URLEncodedUtils.PUNCT.set(38);
        URLEncodedUtils.PUNCT.set(43);
        URLEncodedUtils.PUNCT.set(61);
        URLEncodedUtils.USERINFO.or(URLEncodedUtils.UNRESERVED);
        URLEncodedUtils.USERINFO.or(URLEncodedUtils.PUNCT);
        URLEncodedUtils.PATHSAFE.or(URLEncodedUtils.UNRESERVED);
        URLEncodedUtils.PATHSAFE.set(47);
        URLEncodedUtils.PATHSAFE.set(59);
        URLEncodedUtils.PATHSAFE.set(58);
        URLEncodedUtils.PATHSAFE.set(64);
        URLEncodedUtils.PATHSAFE.set(38);
        URLEncodedUtils.PATHSAFE.set(61);
        URLEncodedUtils.PATHSAFE.set(43);
        URLEncodedUtils.PATHSAFE.set(36);
        URLEncodedUtils.PATHSAFE.set(44);
        URLEncodedUtils.RESERVED.set(59);
        URLEncodedUtils.RESERVED.set(47);
        URLEncodedUtils.RESERVED.set(63);
        URLEncodedUtils.RESERVED.set(58);
        URLEncodedUtils.RESERVED.set(64);
        URLEncodedUtils.RESERVED.set(38);
        URLEncodedUtils.RESERVED.set(61);
        URLEncodedUtils.RESERVED.set(43);
        URLEncodedUtils.RESERVED.set(36);
        URLEncodedUtils.RESERVED.set(44);
        URLEncodedUtils.RESERVED.set(91);
        URLEncodedUtils.RESERVED.set(93);
        URLEncodedUtils.FRAGMENT.or(URLEncodedUtils.RESERVED);
        URLEncodedUtils.FRAGMENT.or(URLEncodedUtils.UNRESERVED);
    }
    
    private static String decodeFormFields(final String s, final String s2) {
        if (s == null) {
            return null;
        }
        Charset charset;
        if (s2 != null) {
            charset = Charset.forName(s2);
        }
        else {
            charset = Charset.forName("UTF-8");
        }
        return urldecode(s, charset, true);
    }
    
    private static String decodeFormFields(final String s, Charset forName) {
        if (s == null) {
            return null;
        }
        if (forName == null) {
            forName = Charset.forName("UTF-8");
        }
        return urldecode(s, forName, true);
    }
    
    static String encFragment(final String s, final Charset charset) {
        return urlencode(s, charset, URLEncodedUtils.FRAGMENT, false);
    }
    
    static String encPath(final String s, final Charset charset) {
        return urlencode(s, charset, URLEncodedUtils.PATHSAFE, false);
    }
    
    static String encUserInfo(final String s, final Charset charset) {
        return urlencode(s, charset, URLEncodedUtils.USERINFO, false);
    }
    
    private static String encodeFormFields(final String s, final String s2) {
        if (s == null) {
            return null;
        }
        Charset charset;
        if (s2 != null) {
            charset = Charset.forName(s2);
        }
        else {
            charset = Charset.forName("UTF-8");
        }
        return urlencode(s, charset, URLEncodedUtils.URLENCODER, true);
    }
    
    private static String encodeFormFields(final String s, Charset forName) {
        if (s == null) {
            return null;
        }
        if (forName == null) {
            forName = Charset.forName("UTF-8");
        }
        return urlencode(s, forName, URLEncodedUtils.URLENCODER, true);
    }
    
    public static String format(final Iterable<? extends NameValuePair> iterable, final Charset charset) {
        final StringBuilder sb = new StringBuilder();
        for (final NameValuePair nameValuePair : iterable) {
            final String encodeFormFields = encodeFormFields(nameValuePair.getName(), charset);
            final String encodeFormFields2 = encodeFormFields(nameValuePair.getValue(), charset);
            if (sb.length() > 0) {
                sb.append("&");
            }
            sb.append(encodeFormFields);
            if (encodeFormFields2 != null) {
                sb.append("=");
                sb.append(encodeFormFields2);
            }
        }
        return sb.toString();
    }
    
    public static String format(final List<? extends NameValuePair> list, final String s) {
        final StringBuilder sb = new StringBuilder();
        for (final NameValuePair nameValuePair : list) {
            final String encodeFormFields = encodeFormFields(nameValuePair.getName(), s);
            final String encodeFormFields2 = encodeFormFields(nameValuePair.getValue(), s);
            if (sb.length() > 0) {
                sb.append("&");
            }
            sb.append(encodeFormFields);
            if (encodeFormFields2 != null) {
                sb.append("=");
                sb.append(encodeFormFields2);
            }
        }
        return sb.toString();
    }
    
    public static boolean isEncoded(final HttpEntity httpEntity) {
        final boolean b = false;
        final Header contentType = httpEntity.getContentType();
        boolean equalsIgnoreCase = b;
        if (contentType != null) {
            final HeaderElement[] elements = contentType.getElements();
            equalsIgnoreCase = b;
            if (elements.length > 0) {
                equalsIgnoreCase = elements[0].getName().equalsIgnoreCase("application/x-www-form-urlencoded");
            }
        }
        return equalsIgnoreCase;
    }
    
    public static List<NameValuePair> parse(final String s) {
        List<NameValuePair> emptyList;
        if (s == null) {
            emptyList = Collections.emptyList();
        }
        else {
            final BasicHeaderValueParser default1 = BasicHeaderValueParser.DEFAULT;
            final CharArrayBuffer charArrayBuffer = new CharArrayBuffer(s.length());
            charArrayBuffer.append(s);
            final ParserCursor parserCursor = new ParserCursor(0, charArrayBuffer.length());
            final ArrayList<NameValuePair> list = new ArrayList<NameValuePair>();
            while (true) {
                emptyList = list;
                if (parserCursor.atEnd()) {
                    break;
                }
                final NameValuePair nameValuePair = default1.parseNameValuePair(charArrayBuffer, parserCursor, URLEncodedUtils.DELIM);
                if (nameValuePair.getName().length() <= 0) {
                    continue;
                }
                list.add((NameValuePair)new BasicNameValuePair(nameValuePair.getName(), nameValuePair.getValue()));
            }
        }
        return emptyList;
    }
    
    public static List<NameValuePair> parse(final URI uri) {
        final String rawQuery = uri.getRawQuery();
        if (!TextUtils.isEmpty((CharSequence)rawQuery)) {
            final ArrayList<NameValuePair> list = new ArrayList<NameValuePair>();
            parse(list, new Scanner(rawQuery));
            return list;
        }
        return Collections.emptyList();
    }
    
    public static void parse(final List<NameValuePair> list, final Scanner scanner) {
        scanner.useDelimiter("&");
        while (scanner.hasNext()) {
            String trim = null;
            final String next = scanner.next();
            final int index = next.indexOf("=");
            String s;
            if (index != -1) {
                s = next.substring(0, index).trim();
                trim = next.substring(index + 1).trim();
            }
            else {
                s = next.trim();
            }
            list.add((NameValuePair)new BasicNameValuePair(s, trim));
        }
    }
    
    private static String urldecode(final String s, final Charset charset, final boolean b) {
        if (s == null) {
            return null;
        }
        final ByteBuffer allocate = ByteBuffer.allocate(s.length());
        final CharBuffer wrap = CharBuffer.wrap(s);
        while (wrap.hasRemaining()) {
            final char value = wrap.get();
            if (value == '%' && wrap.remaining() >= 2) {
                final char value2 = wrap.get();
                final char value3 = wrap.get();
                final int digit = Character.digit(value2, 16);
                final int digit2 = Character.digit(value3, 16);
                if (digit != -1 && digit2 != -1) {
                    allocate.put((byte)((digit << 4) + digit2));
                }
                else {
                    allocate.put((byte)37);
                    allocate.put((byte)value2);
                    allocate.put((byte)value3);
                }
            }
            else if (b && value == '+') {
                allocate.put((byte)32);
            }
            else {
                allocate.put((byte)value);
            }
        }
        allocate.flip();
        return charset.decode(allocate).toString();
    }
    
    private static String urlencode(final String s, final Charset charset, final BitSet set, final boolean b) {
        if (s == null) {
            return null;
        }
        final StringBuilder sb = new StringBuilder();
        final ByteBuffer encode = charset.encode(s);
        while (encode.hasRemaining()) {
            final int n = encode.get() & 0xFF;
            if (set.get(n)) {
                sb.append((char)n);
            }
            else if (b && n == 32) {
                sb.append('+');
            }
            else {
                sb.append("%");
                final char upperCase = Character.toUpperCase(Character.forDigit(n >> 4 & 0xF, 16));
                final char upperCase2 = Character.toUpperCase(Character.forDigit(n & 0xF, 16));
                sb.append(upperCase);
                sb.append(upperCase2);
            }
        }
        return sb.toString();
    }
}
