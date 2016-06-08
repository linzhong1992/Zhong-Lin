package com.lidroid.xutils.http.client.multipart;

import org.apache.http.util.*;
import java.nio.charset.*;
import java.util.*;
import com.lidroid.xutils.http.client.multipart.content.*;
import java.nio.*;
import java.io.*;

class HttpMultipart
{
    private static final ByteArrayBuffer CR_LF;
    private static final ByteArrayBuffer FIELD_SEP;
    private static final ByteArrayBuffer TWO_DASHES;
    private final String boundary;
    private final Charset charset;
    private final HttpMultipartMode mode;
    private final List<FormBodyPart> parts;
    private String subType;
    
    static /* synthetic */ int[] $SWITCH_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode() {
        final int[] $switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode = HttpMultipart.$SWITCH_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode;
        if ($switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode != null) {
            return $switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode;
        }
        final int[] $switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode2 = new int[HttpMultipartMode.values().length];
        while (true) {
            try {
                $switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode2[HttpMultipartMode.BROWSER_COMPATIBLE.ordinal()] = 2;
                try {
                    $switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode2[HttpMultipartMode.STRICT.ordinal()] = 1;
                    return HttpMultipart.$SWITCH_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode = $switch_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode2;
                }
                catch (NoSuchFieldError noSuchFieldError) {}
            }
            catch (NoSuchFieldError noSuchFieldError2) {
                continue;
            }
            break;
        }
    }
    
    static {
        FIELD_SEP = encode(MIME.DEFAULT_CHARSET, ": ");
        CR_LF = encode(MIME.DEFAULT_CHARSET, "\r\n");
        TWO_DASHES = encode(MIME.DEFAULT_CHARSET, "--");
    }
    
    public HttpMultipart(final String s, final String s2) {
        this(s, null, s2);
    }
    
    public HttpMultipart(final String s, final Charset charset, final String s2) {
        this(s, charset, s2, HttpMultipartMode.STRICT);
    }
    
    public HttpMultipart(final String subType, Charset default_CHARSET, final String boundary, final HttpMultipartMode mode) {
        if (subType == null) {
            throw new IllegalArgumentException("Multipart subtype may not be null");
        }
        if (boundary == null) {
            throw new IllegalArgumentException("Multipart boundary may not be null");
        }
        this.subType = subType;
        if (default_CHARSET == null) {
            default_CHARSET = MIME.DEFAULT_CHARSET;
        }
        this.charset = default_CHARSET;
        this.boundary = boundary;
        this.parts = new ArrayList<FormBodyPart>();
        this.mode = mode;
    }
    
    private void doWriteTo(final HttpMultipartMode httpMultipartMode, final OutputStream outputStream, final MultipartEntity.CallBackInfo callBackInfo, final boolean b) throws IOException {
        callBackInfo.pos = 0L;
        final ByteArrayBuffer encode = encode(this.charset, this.getBoundary());
        for (final FormBodyPart formBodyPart : this.parts) {
            if (!callBackInfo.doCallBack(true)) {
                throw new InterruptedIOException("stop");
            }
            writeBytes(HttpMultipart.TWO_DASHES, outputStream);
            callBackInfo.pos += HttpMultipart.TWO_DASHES.length();
            writeBytes(encode, outputStream);
            callBackInfo.pos += encode.length();
            writeBytes(HttpMultipart.CR_LF, outputStream);
            callBackInfo.pos += HttpMultipart.CR_LF.length();
            final MinimalFieldHeader header = formBodyPart.getHeader();
            switch ($SWITCH_TABLE$com$lidroid$xutils$http$client$multipart$HttpMultipartMode()[httpMultipartMode.ordinal()]) {
                case 1: {
                    for (final MinimalField minimalField : header) {
                        writeField(minimalField, outputStream);
                        callBackInfo.pos += encode(MIME.DEFAULT_CHARSET, String.valueOf(minimalField.getName()) + minimalField.getBody()).length() + HttpMultipart.FIELD_SEP.length() + HttpMultipart.CR_LF.length();
                    }
                    break;
                }
                case 2: {
                    final MinimalField field = header.getField("Content-Disposition");
                    writeField(field, this.charset, outputStream);
                    callBackInfo.pos += encode(this.charset, String.valueOf(field.getName()) + field.getBody()).length() + HttpMultipart.FIELD_SEP.length() + HttpMultipart.CR_LF.length();
                    if (formBodyPart.getBody().getFilename() != null) {
                        final MinimalField field2 = header.getField("Content-Type");
                        writeField(field2, this.charset, outputStream);
                        callBackInfo.pos += encode(this.charset, String.valueOf(field2.getName()) + field2.getBody()).length() + HttpMultipart.FIELD_SEP.length() + HttpMultipart.CR_LF.length();
                        break;
                    }
                    break;
                }
            }
            writeBytes(HttpMultipart.CR_LF, outputStream);
            callBackInfo.pos += HttpMultipart.CR_LF.length();
            if (b) {
                final ContentBody body = formBodyPart.getBody();
                body.setCallBackInfo(callBackInfo);
                body.writeTo(outputStream);
            }
            writeBytes(HttpMultipart.CR_LF, outputStream);
            callBackInfo.pos += HttpMultipart.CR_LF.length();
        }
        writeBytes(HttpMultipart.TWO_DASHES, outputStream);
        callBackInfo.pos += HttpMultipart.TWO_DASHES.length();
        writeBytes(encode, outputStream);
        callBackInfo.pos += encode.length();
        writeBytes(HttpMultipart.TWO_DASHES, outputStream);
        callBackInfo.pos += HttpMultipart.TWO_DASHES.length();
        writeBytes(HttpMultipart.CR_LF, outputStream);
        callBackInfo.pos += HttpMultipart.CR_LF.length();
        callBackInfo.doCallBack(true);
    }
    
    private void doWriteTo(final HttpMultipartMode httpMultipartMode, final OutputStream outputStream, final boolean b) throws IOException {
        this.doWriteTo(httpMultipartMode, outputStream, MultipartEntity.CallBackInfo.DEFAULT, b);
    }
    
    private static ByteArrayBuffer encode(final Charset charset, final String s) {
        final ByteBuffer encode = charset.encode(CharBuffer.wrap(s));
        final ByteArrayBuffer byteArrayBuffer = new ByteArrayBuffer(encode.remaining());
        byteArrayBuffer.append(encode.array(), encode.position(), encode.remaining());
        return byteArrayBuffer;
    }
    
    private static void writeBytes(final String s, final OutputStream outputStream) throws IOException {
        writeBytes(encode(MIME.DEFAULT_CHARSET, s), outputStream);
    }
    
    private static void writeBytes(final String s, final Charset charset, final OutputStream outputStream) throws IOException {
        writeBytes(encode(charset, s), outputStream);
    }
    
    private static void writeBytes(final ByteArrayBuffer byteArrayBuffer, final OutputStream outputStream) throws IOException {
        outputStream.write(byteArrayBuffer.buffer(), 0, byteArrayBuffer.length());
        outputStream.flush();
    }
    
    private static void writeField(final MinimalField minimalField, final OutputStream outputStream) throws IOException {
        writeBytes(minimalField.getName(), outputStream);
        writeBytes(HttpMultipart.FIELD_SEP, outputStream);
        writeBytes(minimalField.getBody(), outputStream);
        writeBytes(HttpMultipart.CR_LF, outputStream);
    }
    
    private static void writeField(final MinimalField minimalField, final Charset charset, final OutputStream outputStream) throws IOException {
        writeBytes(minimalField.getName(), charset, outputStream);
        writeBytes(HttpMultipart.FIELD_SEP, outputStream);
        writeBytes(minimalField.getBody(), charset, outputStream);
        writeBytes(HttpMultipart.CR_LF, outputStream);
    }
    
    public void addBodyPart(final FormBodyPart formBodyPart) {
        if (formBodyPart == null) {
            return;
        }
        this.parts.add(formBodyPart);
    }
    
    public List<FormBodyPart> getBodyParts() {
        return this.parts;
    }
    
    public String getBoundary() {
        return this.boundary;
    }
    
    public Charset getCharset() {
        return this.charset;
    }
    
    public HttpMultipartMode getMode() {
        return this.mode;
    }
    
    public String getSubType() {
        return this.subType;
    }
    
    public long getTotalLength() {
        final long n = -1L;
        long n2 = 0L;
        final Iterator<FormBodyPart> iterator = this.parts.iterator();
    Block_4_Outer:
        while (true) {
            Label_0064: {
                if (iterator.hasNext()) {
                    break Label_0064;
                }
                final ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    this.doWriteTo(this.mode, byteArrayOutputStream, false);
                    long n3 = byteArrayOutputStream.toByteArray().length + n2;
                    Label_0061: {
                        return n3;
                    }
                    while (true) {
                        final long contentLength;
                        n2 += contentLength;
                        continue Block_4_Outer;
                        contentLength = iterator.next().getBody().getContentLength();
                        n3 = n;
                        continue;
                    }
                }
                // iftrue(Label_0061:, contentLength < 0L)
                catch (Throwable t) {
                    return -1L;
                }
            }
        }
    }
    
    public void setSubType(final String subType) {
        this.subType = subType;
    }
    
    public void writeTo(final OutputStream outputStream, final MultipartEntity.CallBackInfo callBackInfo) throws IOException {
        this.doWriteTo(this.mode, outputStream, callBackInfo, true);
    }
}
