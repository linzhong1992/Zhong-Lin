package com.lidroid.xutils.http.client;

import com.lidroid.xutils.util.LogUtils;
import java.io.IOException;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class DefaultSSLSocketFactory
  extends org.apache.http.conn.ssl.SSLSocketFactory
{
  private static DefaultSSLSocketFactory instance;
  private static KeyStore trustStore;
  private SSLContext sslContext = SSLContext.getInstance("TLS");
  
  static
  {
    try
    {
      trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
      trustStore.load(null, null);
      return;
    }
    catch (Throwable localThrowable)
    {
      LogUtils.e(localThrowable.getMessage(), localThrowable);
    }
  }
  
  private DefaultSSLSocketFactory()
    throws UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, KeyManagementException
  {
    super(trustStore);
    X509TrustManager local1 = new X509TrustManager()
    {
      public void checkClientTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString)
        throws CertificateException
      {}
      
      public void checkServerTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString)
        throws CertificateException
      {}
      
      public X509Certificate[] getAcceptedIssuers()
      {
        return null;
      }
    };
    this.sslContext.init(null, new TrustManager[] { local1 }, null);
    setHostnameVerifier(org.apache.http.conn.ssl.SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
  }
  
  public static DefaultSSLSocketFactory getSocketFactory()
  {
    if (instance == null) {}
    try
    {
      instance = new DefaultSSLSocketFactory();
      return instance;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        LogUtils.e(localThrowable.getMessage(), localThrowable);
      }
    }
  }
  
  public Socket createSocket()
    throws IOException
  {
    return this.sslContext.getSocketFactory().createSocket();
  }
  
  public Socket createSocket(Socket paramSocket, String paramString, int paramInt, boolean paramBoolean)
    throws IOException
  {
    return this.sslContext.getSocketFactory().createSocket(paramSocket, paramString, paramInt, paramBoolean);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\DefaultSSLSocketFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */