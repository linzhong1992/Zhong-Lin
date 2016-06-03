package com.lidroid.xutils.http.client.util;

import android.text.TextUtils;
import com.lidroid.xutils.util.LogUtils;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.conn.util.InetAddressUtils;
import org.apache.http.message.BasicNameValuePair;

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
  
  public URIBuilder()
  {
    this.port = -1;
  }
  
  public URIBuilder(String paramString)
  {
    try
    {
      digestURI(new URI(paramString));
      return;
    }
    catch (URISyntaxException paramString)
    {
      LogUtils.e(paramString.getMessage(), paramString);
    }
  }
  
  public URIBuilder(URI paramURI)
  {
    digestURI(paramURI);
  }
  
  private String buildString(Charset paramCharset)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (this.scheme != null) {
      localStringBuilder.append(this.scheme).append(':');
    }
    if (this.encodedSchemeSpecificPart != null)
    {
      localStringBuilder.append(this.encodedSchemeSpecificPart);
      if (this.encodedFragment == null) {
        break label320;
      }
      localStringBuilder.append("#").append(this.encodedFragment);
    }
    for (;;)
    {
      return localStringBuilder.toString();
      if (this.encodedAuthority != null)
      {
        localStringBuilder.append("//").append(this.encodedAuthority);
        label92:
        if (this.encodedPath == null) {
          break label264;
        }
        localStringBuilder.append(normalizePath(this.encodedPath));
      }
      for (;;)
      {
        if (this.encodedQuery == null) {
          break label291;
        }
        localStringBuilder.append("?").append(this.encodedQuery);
        break;
        if (this.host == null) {
          break label92;
        }
        localStringBuilder.append("//");
        if (this.encodedUserInfo != null)
        {
          localStringBuilder.append(this.encodedUserInfo).append("@");
          label170:
          if (!InetAddressUtils.isIPv6Address(this.host)) {
            break label252;
          }
          localStringBuilder.append("[").append(this.host).append("]");
        }
        for (;;)
        {
          if (this.port < 0) {
            break label262;
          }
          localStringBuilder.append(":").append(this.port);
          break;
          if (this.userInfo == null) {
            break label170;
          }
          localStringBuilder.append(encodeUserInfo(this.userInfo, paramCharset)).append("@");
          break label170;
          label252:
          localStringBuilder.append(this.host);
        }
        label262:
        break label92;
        label264:
        if (this.path != null) {
          localStringBuilder.append(encodePath(normalizePath(this.path), paramCharset));
        }
      }
      label291:
      if (this.queryParams == null) {
        break;
      }
      localStringBuilder.append("?").append(encodeQuery(this.queryParams, paramCharset));
      break;
      label320:
      if (this.fragment != null) {
        localStringBuilder.append("#").append(encodeFragment(this.fragment, paramCharset));
      }
    }
  }
  
  private void digestURI(URI paramURI)
  {
    this.scheme = paramURI.getScheme();
    this.encodedSchemeSpecificPart = paramURI.getRawSchemeSpecificPart();
    this.encodedAuthority = paramURI.getRawAuthority();
    this.host = paramURI.getHost();
    this.port = paramURI.getPort();
    this.encodedUserInfo = paramURI.getRawUserInfo();
    this.userInfo = paramURI.getUserInfo();
    this.encodedPath = paramURI.getRawPath();
    this.path = paramURI.getPath();
    this.encodedQuery = paramURI.getRawQuery();
    this.queryParams = parseQuery(paramURI.getRawQuery());
    this.encodedFragment = paramURI.getRawFragment();
    this.fragment = paramURI.getFragment();
  }
  
  private String encodeFragment(String paramString, Charset paramCharset)
  {
    return URLEncodedUtils.encFragment(paramString, paramCharset);
  }
  
  private String encodePath(String paramString, Charset paramCharset)
  {
    return URLEncodedUtils.encPath(paramString, paramCharset).replace("+", "20%");
  }
  
  private String encodeQuery(List<NameValuePair> paramList, Charset paramCharset)
  {
    return URLEncodedUtils.format(paramList, paramCharset);
  }
  
  private String encodeUserInfo(String paramString, Charset paramCharset)
  {
    return URLEncodedUtils.encUserInfo(paramString, paramCharset);
  }
  
  private static String normalizePath(String paramString)
  {
    String str;
    if (paramString == null)
    {
      str = null;
      return str;
    }
    int i = 0;
    for (;;)
    {
      if (i >= paramString.length()) {}
      while (paramString.charAt(i) != '/')
      {
        str = paramString;
        if (i <= 1) {
          break;
        }
        return paramString.substring(i - 1);
      }
      i += 1;
    }
  }
  
  private List<NameValuePair> parseQuery(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {
      return URLEncodedUtils.parse(paramString);
    }
    return null;
  }
  
  public URIBuilder addParameter(String paramString1, String paramString2)
  {
    if (this.queryParams == null) {
      this.queryParams = new ArrayList();
    }
    this.queryParams.add(new BasicNameValuePair(paramString1, paramString2));
    this.encodedQuery = null;
    this.encodedSchemeSpecificPart = null;
    return this;
  }
  
  public URI build(Charset paramCharset)
    throws URISyntaxException
  {
    return new URI(buildString(paramCharset));
  }
  
  public String getFragment()
  {
    return this.fragment;
  }
  
  public String getHost()
  {
    return this.host;
  }
  
  public String getPath()
  {
    return this.path;
  }
  
  public int getPort()
  {
    return this.port;
  }
  
  public List<NameValuePair> getQueryParams()
  {
    if (this.queryParams != null) {
      return new ArrayList(this.queryParams);
    }
    return new ArrayList();
  }
  
  public String getScheme()
  {
    return this.scheme;
  }
  
  public String getUserInfo()
  {
    return this.userInfo;
  }
  
  public URIBuilder setFragment(String paramString)
  {
    this.fragment = paramString;
    this.encodedFragment = null;
    return this;
  }
  
  public URIBuilder setHost(String paramString)
  {
    this.host = paramString;
    this.encodedSchemeSpecificPart = null;
    this.encodedAuthority = null;
    return this;
  }
  
  public URIBuilder setParameter(String paramString1, String paramString2)
  {
    if (this.queryParams == null) {
      this.queryParams = new ArrayList();
    }
    Iterator localIterator;
    if (!this.queryParams.isEmpty()) {
      localIterator = this.queryParams.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        this.queryParams.add(new BasicNameValuePair(paramString1, paramString2));
        this.encodedQuery = null;
        this.encodedSchemeSpecificPart = null;
        return this;
      }
      if (((NameValuePair)localIterator.next()).getName().equals(paramString1)) {
        localIterator.remove();
      }
    }
  }
  
  public URIBuilder setPath(String paramString)
  {
    this.path = paramString;
    this.encodedSchemeSpecificPart = null;
    this.encodedPath = null;
    return this;
  }
  
  public URIBuilder setPort(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 0) {
      i = -1;
    }
    this.port = i;
    this.encodedSchemeSpecificPart = null;
    this.encodedAuthority = null;
    return this;
  }
  
  public URIBuilder setQuery(String paramString)
  {
    this.queryParams = parseQuery(paramString);
    this.encodedQuery = null;
    this.encodedSchemeSpecificPart = null;
    return this;
  }
  
  public URIBuilder setScheme(String paramString)
  {
    this.scheme = paramString;
    return this;
  }
  
  public URIBuilder setUserInfo(String paramString)
  {
    this.userInfo = paramString;
    this.encodedSchemeSpecificPart = null;
    this.encodedAuthority = null;
    this.encodedUserInfo = null;
    return this;
  }
  
  public URIBuilder setUserInfo(String paramString1, String paramString2)
  {
    return setUserInfo(paramString1 + ':' + paramString2);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\util\URIBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */