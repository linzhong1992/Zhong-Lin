package com.lidroid.xutils.http.client.multipart;

import com.lidroid.xutils.http.client.multipart.content.*;

public class FormBodyPart
{
    private final ContentBody body;
    private final MinimalFieldHeader header;
    private final String name;
    
    public FormBodyPart(final String name, final ContentBody body) {
        if (name == null) {
            throw new IllegalArgumentException("Name may not be null");
        }
        if (body == null) {
            throw new IllegalArgumentException("Body may not be null");
        }
        this.name = name;
        this.body = body;
        this.header = new MinimalFieldHeader();
        this.generateContentDisposition(body);
        this.generateContentType(body);
        this.generateTransferEncoding(body);
    }
    
    public FormBodyPart(final String name, final ContentBody body, final String s) {
        if (name == null) {
            throw new IllegalArgumentException("Name may not be null");
        }
        if (body == null) {
            throw new IllegalArgumentException("Body may not be null");
        }
        this.name = name;
        this.body = body;
        this.header = new MinimalFieldHeader();
        if (s != null) {
            this.addField("Content-Disposition", s);
        }
        else {
            this.generateContentDisposition(body);
        }
        this.generateContentType(body);
        this.generateTransferEncoding(body);
    }
    
    public void addField(final String s, final String s2) {
        if (s == null) {
            throw new IllegalArgumentException("Field name may not be null");
        }
        this.header.addField(new MinimalField(s, s2));
    }
    
    protected void generateContentDisposition(final ContentBody contentBody) {
        final StringBuilder sb = new StringBuilder();
        sb.append("form-data; name=\"");
        sb.append(this.getName());
        sb.append("\"");
        if (contentBody.getFilename() != null) {
            sb.append("; filename=\"");
            sb.append(contentBody.getFilename());
            sb.append("\"");
        }
        this.addField("Content-Disposition", sb.toString());
    }
    
    protected void generateContentType(final ContentBody contentBody) {
        final StringBuilder sb = new StringBuilder();
        sb.append(contentBody.getMimeType());
        if (contentBody.getCharset() != null) {
            sb.append("; charset=");
            sb.append(contentBody.getCharset());
        }
        this.addField("Content-Type", sb.toString());
    }
    
    protected void generateTransferEncoding(final ContentBody contentBody) {
        this.addField("Content-Transfer-Encoding", contentBody.getTransferEncoding());
    }
    
    public ContentBody getBody() {
        return this.body;
    }
    
    public MinimalFieldHeader getHeader() {
        return this.header;
    }
    
    public String getName() {
        return this.name;
    }
}
