package com.alien.demo;

public class Constants
{
  public static class Bank
  {
    public static final int EPC = 1;
    public static final String[] NAMES = { "RESERVED", "EPC", "TID", "USER" };
    public static final int RESERVED = 0;
    public static final int TID = 2;
    public static final int USER = 3;
  }
  
  public static class MaskParams
  {
    public static final String ASSET_DATA = "asset_data";
    public static final String FILTER_DATA = "filter_data";
    public static final String LOCAL_SETTINGS = "local_settings";
    public static final String MASK_INFO = "mask_info";
  }
  
  public static class Requests
  {
    public static final int REQUEST_ASSET = 4;
    public static final int REQUEST_FILE = 2;
    public static final int REQUEST_MASK = 1;
    public static final int REQUEST_PHOTO = 3;
  }
  
  public static class RfidFieldOffsets
  {
    public static final int ACCESS_PASSWORD_WORD_OFFSET = 2;
    public static final int EPC_ID_BIT_OFFSET = 32;
    public static final int KILL_PASSWORD_WORD_OFFSET = 0;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\Constants.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */