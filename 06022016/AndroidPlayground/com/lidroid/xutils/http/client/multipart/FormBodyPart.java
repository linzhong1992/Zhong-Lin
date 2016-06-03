package com.lidroid.xutils.http.client.multipart;

import com.lidroid.xutils.http.client.multipart.content.ContentBody;

public class FormBodyPart
{
  private final ContentBody body;
  private final MinimalFieldHeader header;
  private final String name;
  
  public FormBodyPart(String paramString, ContentBody paramContentBody)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("Name may not be null");
    }
    if (paramContentBody == null) {
      throw new IllegalArgumentException("Body may not be null");
    }
    this.name = paramString;
    this.body = paramContentBody;
    this.header = new MinimalFieldHeader();
    generateContentDisposition(paramContentBody);
    generateContentType(paramContentBody);
    generateTransferEncoding(paramContentBody);
  }
  
  public FormBodyPart(String paramString1, ContentBody paramContentBody, String paramString2)
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("Name may not be null");
    }
    if (paramContentBody == null) {
      throw new IllegalArgumentException("Body may not be null");
    }
    this.name = paramString1;
    this.body = paramContentBody;
    this.header = new MinimalFieldHeader();
    if (paramString2 != null) {
      addField("Content-Disposition", paramString2);
    }
    for (;;)
    {
      generateContentType(paramContentBody);
      generateTransferEncoding(paramContentBody);
      return;
      generateContentDisposition(paramContentBody);
    }
  }
  
  public void addField(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("Field name may not be null");
    }
    this.header.addField(new MinimalField(paramString1, paramString2));
  }
  
  protected void generateContentDisposition(ContentBody paramContentBody)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("form-data; name=\"");
    localStringBuilder.append(getName());
    localStringBuilder.append("\"");
    if (paramContentBody.getFilename() != null)
    {
      localStringBuilder.append("; filename=\"");
      localStringBuilder.append(paramContentBody.getFilename());
      localStringBuilder.append("\"");
    }
    addField("Content-Disposition", localStringBuilder.toString());
  }
  
  protected void generateContentType(ContentBody paramContentBody)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramContentBody.getMimeType());
    if (paramContentBody.getCharset() != null)
    {
      localStringBuilder.append("; charset=");
      localStringBuilder.append(paramContentBody.getCharset());
    }
    addField("Content-Type", localStringBuilder.toString());
  }
  
  protected void generateTransferEncoding(ContentBody paramContentBody)
  {
    addField("Content-Transfer-Encoding", paramContentBody.getTransferEncoding());
  }
  
  public ContentBody getBody()
  {
    return this.body;
  }
  
  public MinimalFieldHeader getHeader()
  {
    return this.header;
  }
  
  public String getName()
  {
    return this.name;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\multipart\FormBodyPart.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */