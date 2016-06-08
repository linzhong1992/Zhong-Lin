package com.lidroid.xutils.http.client;

import org.apache.http.conn.ssl.*;
import com.lidroid.xutils.util.*;
import java.security.cert.*;
import javax.net.ssl.*;
import java.security.*;
import java.net.*;
import java.io.*;

public class DefaultSSLSocketFactory extends SSLSocketFactory
{
    private static DefaultSSLSocketFactory instance;
    private static KeyStore trustStore;
    private SSLContext sslContext;
    
    static {
        try {
            (DefaultSSLSocketFactory.trustStore = KeyStore.getInstance(KeyStore.getDefaultType())).load(null, null);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
        }
    }
    
    private DefaultSSLSocketFactory() throws UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
        super(DefaultSSLSocketFactory.trustStore);
        (this.sslContext = SSLContext.getInstance("TLS")).init(null, new TrustManager[] { new X509TrustManager() {
                @Override
                public void checkClientTrusted(final X509Certificate[] array, final String s) throws CertificateException {
                }
                
                @Override
                public void checkServerTrusted(final X509Certificate[] array, final String s) throws CertificateException {
                }
                
                @Override
                public X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
            } }, null);
        this.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
    }
    
    public static DefaultSSLSocketFactory getSocketFactory() {
        Label_0016: {
            if (DefaultSSLSocketFactory.instance != null) {
                break Label_0016;
            }
            try {
                DefaultSSLSocketFactory.instance = new DefaultSSLSocketFactory();
                return DefaultSSLSocketFactory.instance;
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
                return DefaultSSLSocketFactory.instance;
            }
        }
    }
    
    public Socket createSocket() throws IOException {
        return this.sslContext.getSocketFactory().createSocket();
    }
    
    public Socket createSocket(final Socket socket, final String s, final int n, final boolean b) throws IOException {
        return this.sslContext.getSocketFactory().createSocket(socket, s, n, b);
    }
}
