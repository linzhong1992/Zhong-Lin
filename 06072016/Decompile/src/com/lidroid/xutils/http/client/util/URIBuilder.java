package com.lidroid.xutils.http.client.util;

import org.apache.http.*;
import com.lidroid.xutils.util.*;
import java.net.*;
import java.nio.charset.*;
import org.apache.http.conn.util.*;
import android.text.*;
import org.apache.http.message.*;
import java.util.*;

public class URIBuilder
{
    private String encodedAuthority;
    private String encodedFragment;
    private String encodedPath;
    private String encodedQuery;
    private String encodedSchemeSpecificPart;
    private String encodedUserInfo;
    private String fragment;
    private String host;
    private String path;
    private int port;
    private List<NameValuePair> queryParams;
    private String scheme;
    private String userInfo;
    
    public URIBuilder() {
        this.port = -1;
    }
    
    public URIBuilder(final String s) {
        try {
            this.digestURI(new URI(s));
        }
        catch (URISyntaxException ex) {
            LogUtils.e(ex.getMessage(), ex);
        }
    }
    
    public URIBuilder(final URI uri) {
        this.digestURI(uri);
    }
    
    private String buildString(final Charset charset) {
        final StringBuilder sb = new StringBuilder();
        if (this.scheme != null) {
            sb.append(this.scheme).append(':');
        }
        if (this.encodedSchemeSpecificPart != null) {
            sb.append(this.encodedSchemeSpecificPart);
        }
        else {
            if (this.encodedAuthority != null) {
                sb.append("//").append(this.encodedAuthority);
            }
            else if (this.host != null) {
                sb.append("//");
                if (this.encodedUserInfo != null) {
                    sb.append(this.encodedUserInfo).append("@");
                }
                else if (this.userInfo != null) {
                    sb.append(this.encodeUserInfo(this.userInfo, charset)).append("@");
                }
                if (InetAddressUtils.isIPv6Address(this.host)) {
                    sb.append("[").append(this.host).append("]");
                }
                else {
                    sb.append(this.host);
                }
                if (this.port >= 0) {
                    sb.append(":").append(this.port);
                }
            }
            if (this.encodedPath != null) {
                sb.append(normalizePath(this.encodedPath));
            }
            else if (this.path != null) {
                sb.append(this.encodePath(normalizePath(this.path), charset));
            }
            if (this.encodedQuery != null) {
                sb.append("?").append(this.encodedQuery);
            }
            else if (this.queryParams != null) {
                sb.append("?").append(this.encodeQuery(this.queryParams, charset));
            }
        }
        if (this.encodedFragment != null) {
            sb.append("#").append(this.encodedFragment);
        }
        else if (this.fragment != null) {
            sb.append("#").append(this.encodeFragment(this.fragment, charset));
        }
        return sb.toString();
    }
    
    private void digestURI(final URI uri) {
        this.scheme = uri.getScheme();
        this.encodedSchemeSpecificPart = uri.getRawSchemeSpecificPart();
        this.encodedAuthority = uri.getRawAuthority();
        this.host = uri.getHost();
        this.port = uri.getPort();
        this.encodedUserInfo = uri.getRawUserInfo();
        this.userInfo = uri.getUserInfo();
        this.encodedPath = uri.getRawPath();
        this.path = uri.getPath();
        this.encodedQuery = uri.getRawQuery();
        this.queryParams = this.parseQuery(uri.getRawQuery());
        this.encodedFragment = uri.getRawFragment();
        this.fragment = uri.getFragment();
    }
    
    private String encodeFragment(final String s, final Charset charset) {
        return URLEncodedUtils.encFragment(s, charset);
    }
    
    private String encodePath(final String s, final Charset charset) {
        return URLEncodedUtils.encPath(s, charset).replace("+", "20%");
    }
    
    private String encodeQuery(final List<NameValuePair> list, final Charset charset) {
        return URLEncodedUtils.format(list, charset);
    }
    
    private String encodeUserInfo(final String s, final Charset charset) {
        return URLEncodedUtils.encUserInfo(s, charset);
    }
    
    private static String normalizePath(final String s) {
        String s2;
        if (s == null) {
            s2 = null;
        }
        else {
            int n;
            for (n = 0; n < s.length() && s.charAt(n) == '/'; ++n) {}
            s2 = s;
            if (n > 1) {
                return s.substring(n - 1);
            }
        }
        return s2;
    }
    
    private List<NameValuePair> parseQuery(final String s) {
        if (!TextUtils.isEmpty((CharSequence)s)) {
            return URLEncodedUtils.parse(s);
        }
        return null;
    }
    
    public URIBuilder addParameter(final String s, final String s2) {
        if (this.queryParams == null) {
            this.queryParams = new ArrayList<NameValuePair>();
        }
        this.queryParams.add((NameValuePair)new BasicNameValuePair(s, s2));
        this.encodedQuery = null;
        this.encodedSchemeSpecificPart = null;
        return this;
    }
    
    public URI build(final Charset charset) throws URISyntaxException {
        return new URI(this.buildString(charset));
    }
    
    public String getFragment() {
        return this.fragment;
    }
    
    public String getHost() {
        return this.host;
    }
    
    public String getPath() {
        return this.path;
    }
    
    public int getPort() {
        return this.port;
    }
    
    public List<NameValuePair> getQueryParams() {
        if (this.queryParams != null) {
            return new ArrayList<NameValuePair>(this.queryParams);
        }
        return new ArrayList<NameValuePair>();
    }
    
    public String getScheme() {
        return this.scheme;
    }
    
    public String getUserInfo() {
        return this.userInfo;
    }
    
    public URIBuilder setFragment(final String fragment) {
        this.fragment = fragment;
        this.encodedFragment = null;
        return this;
    }
    
    public URIBuilder setHost(final String host) {
        this.host = host;
        this.encodedSchemeSpecificPart = null;
        this.encodedAuthority = null;
        return this;
    }
    
    public URIBuilder setParameter(final String s, final String s2) {
        if (this.queryParams == null) {
            this.queryParams = new ArrayList<NameValuePair>();
        }
        if (!this.queryParams.isEmpty()) {
            final Iterator<NameValuePair> iterator = this.queryParams.iterator();
            while (iterator.hasNext()) {
                if (iterator.next().getName().equals(s)) {
                    iterator.remove();
                }
            }
        }
        this.queryParams.add((NameValuePair)new BasicNameValuePair(s, s2));
        this.encodedQuery = null;
        this.encodedSchemeSpecificPart = null;
        return this;
    }
    
    public URIBuilder setPath(final String path) {
        this.path = path;
        this.encodedSchemeSpecificPart = null;
        this.encodedPath = null;
        return this;
    }
    
    public URIBuilder setPort(final int n) {
        int port = n;
        if (n < 0) {
            port = -1;
        }
        this.port = port;
        this.encodedSchemeSpecificPart = null;
        this.encodedAuthority = null;
        return this;
    }
    
    public URIBuilder setQuery(final String s) {
        this.queryParams = this.parseQuery(s);
        this.encodedQuery = null;
        this.encodedSchemeSpecificPart = null;
        return this;
    }
    
    public URIBuilder setScheme(final String scheme) {
        this.scheme = scheme;
        return this;
    }
    
    public URIBuilder setUserInfo(final String userInfo) {
        this.userInfo = userInfo;
        this.encodedSchemeSpecificPart = null;
        this.encodedAuthority = null;
        this.encodedUserInfo = null;
        return this;
    }
    
    public URIBuilder setUserInfo(final String s, final String s2) {
        return this.setUserInfo(String.valueOf(s) + ':' + s2);
    }
}
