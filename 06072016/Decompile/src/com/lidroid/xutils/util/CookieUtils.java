package com.lidroid.xutils.util;

import org.apache.http.client.*;
import org.apache.http.cookie.*;
import android.text.*;
import android.content.*;
import org.apache.http.impl.cookie.*;
import java.io.*;
import java.util.concurrent.atomic.*;
import java.util.function.*;
import java.util.concurrent.*;
import java.lang.reflect.*;
import sun.misc.*;
import java.util.*;
import java.util.concurrent.locks.*;

public class CookieUtils implements CookieStore
{
    private static final String COOKIE_NAME_PREFIX = "cookie_";
    private static final String COOKIE_NAME_STORE = "names";
    private static final String COOKIE_PREFS = "CookiePrefsFile";
    private final SharedPreferences cookiePrefs;
    private final ConcurrentHashMap<String, Cookie> cookies;
    
    public CookieUtils(final Context context) {
        int i = 0;
        this.cookiePrefs = context.getSharedPreferences("CookiePrefsFile", 0);
        this.cookies = new ConcurrentHashMap<String, Cookie>();
        final String string = this.cookiePrefs.getString("names", (String)null);
        if (string != null) {
            for (String[] split = TextUtils.split(string, ","); i < split.length; ++i) {
                final String s = split[i];
                final String string2 = this.cookiePrefs.getString("cookie_" + s, (String)null);
                if (string2 != null) {
                    final Cookie decodeCookie = this.decodeCookie(string2);
                    if (decodeCookie != null) {
                        this.cookies.put(s, decodeCookie);
                    }
                }
            }
            this.clearExpired(new Date());
        }
    }
    
    public void addCookie(final Cookie cookie) {
        final String name = cookie.getName();
        if (!cookie.isExpired(new Date())) {
            this.cookies.put(name, cookie);
        }
        else {
            this.cookies.remove(name);
        }
        final SharedPreferences$Editor edit = this.cookiePrefs.edit();
        edit.putString("names", TextUtils.join((CharSequence)",", (Iterable)this.cookies.keySet()));
        edit.putString("cookie_" + name, this.encodeCookie(new SerializableCookie(cookie)));
        edit.commit();
    }
    
    protected String byteArrayToHexString(final byte[] array) {
        final StringBuffer sb = new StringBuffer(array.length * 2);
        for (int length = array.length, i = 0; i < length; ++i) {
            final int n = array[i] & 0xFF;
            if (n < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(n));
        }
        return sb.toString().toUpperCase();
    }
    
    public void clear() {
        final SharedPreferences$Editor edit = this.cookiePrefs.edit();
        final Iterator<String> iterator = this.cookies.keySet().iterator();
        while (iterator.hasNext()) {
            edit.remove("cookie_" + iterator.next());
        }
        edit.remove("names");
        edit.commit();
        this.cookies.clear();
    }
    
    public boolean clearExpired(final Date date) {
        boolean b = false;
        final SharedPreferences$Editor edit = this.cookiePrefs.edit();
        for (final Map.Entry<String, Cookie> entry : this.cookies.entrySet()) {
            final String s = entry.getKey();
            final Cookie cookie = entry.getValue();
            if (cookie.getExpiryDate() == null || cookie.isExpired(date)) {
                this.cookies.remove(s);
                edit.remove("cookie_" + s);
                b = true;
            }
        }
        if (b) {
            edit.putString("names", TextUtils.join((CharSequence)",", (Iterable)this.cookies.keySet()));
        }
        edit.commit();
        return b;
    }
    
    protected Cookie decodeCookie(final String s) {
        final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.hexStringToByteArray(s));
        try {
            return ((SerializableCookie)new ObjectInputStream(byteArrayInputStream).readObject()).getCookie();
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    protected String encodeCookie(final SerializableCookie serializableCookie) {
        final ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            new ObjectOutputStream(byteArrayOutputStream).writeObject(serializableCookie);
            return this.byteArrayToHexString(byteArrayOutputStream.toByteArray());
        }
        catch (Throwable t) {
            return null;
        }
    }
    
    public Cookie getCookie(final String s) {
        return this.cookies.get(s);
    }
    
    public List<Cookie> getCookies() {
        return new ArrayList<Cookie>(this.cookies.values());
    }
    
    protected byte[] hexStringToByteArray(final String s) {
        final int length = s.length();
        final byte[] array = new byte[length / 2];
        for (int i = 0; i < length; i += 2) {
            array[i / 2] = (byte)((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
        }
        return array;
    }
    
    public class SerializableCookie implements Serializable
    {
        private static final long serialVersionUID = 6374381828722046732L;
        private transient BasicClientCookie clientCookie;
        private final transient Cookie cookie;
        
        public SerializableCookie(final Cookie cookie) {
            this.cookie = cookie;
        }
        
        private void readObject(final ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
            (this.clientCookie = new BasicClientCookie((String)objectInputStream.readObject(), (String)objectInputStream.readObject())).setComment((String)objectInputStream.readObject());
            this.clientCookie.setDomain((String)objectInputStream.readObject());
            this.clientCookie.setExpiryDate((Date)objectInputStream.readObject());
            this.clientCookie.setPath((String)objectInputStream.readObject());
            this.clientCookie.setVersion(objectInputStream.readInt());
            this.clientCookie.setSecure(objectInputStream.readBoolean());
        }
        
        private void writeObject(final ObjectOutputStream objectOutputStream) throws IOException {
            objectOutputStream.writeObject(this.cookie.getName());
            objectOutputStream.writeObject(this.cookie.getValue());
            objectOutputStream.writeObject(this.cookie.getComment());
            objectOutputStream.writeObject(this.cookie.getDomain());
            objectOutputStream.writeObject(this.cookie.getExpiryDate());
            objectOutputStream.writeObject(this.cookie.getPath());
            objectOutputStream.writeInt(this.cookie.getVersion());
            objectOutputStream.writeBoolean(this.cookie.isSecure());
        }
        
        public Cookie getCookie() {
            Object o = this.cookie;
            if (this.clientCookie != null) {
                o = this.clientCookie;
            }
            return (Cookie)o;
        }
    }
}
