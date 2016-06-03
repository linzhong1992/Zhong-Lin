package com.zebra.adc.decoder;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

class BarCodeReader
{
  static final int BCRDR_ERROR_SERVER_DIED = 100;
  static final int BCRDR_ERROR_UNKNOWN = 1;
  static final int BCRDR_EVENT_MOTION_DETECTED = 6;
  static final int BCRDR_EVENT_SCANNER_RESET = 7;
  static final int BCRDR_EVENT_SCAN_MODE_CHANGED = 5;
  private static final int BCRDR_MSG_ALL_MSGS = 4129791;
  private static final int BCRDR_MSG_COMPRESSED_IMAGE = 256;
  private static final int BCRDR_MSG_DECODE_CANCELED = 262144;
  private static final int BCRDR_MSG_DECODE_COMPLETE = 65536;
  private static final int BCRDR_MSG_DECODE_ERROR = 524288;
  private static final int BCRDR_MSG_DECODE_EVENT = 1048576;
  private static final int BCRDR_MSG_DECODE_TIMEOUT = 131072;
  private static final int BCRDR_MSG_DEC_COUNT = 1024;
  private static final int BCRDR_MSG_ERROR = 1;
  private static final int BCRDR_MSG_FOCUS = 4;
  private static final int BCRDR_MSG_FRAME_ERROR = 2097152;
  private static final int BCRDR_MSG_LAST_DEC_IMAGE = 512;
  private static final int BCRDR_MSG_POSTVIEW_FRAME = 64;
  private static final int BCRDR_MSG_PREVIEW_FRAME = 16;
  private static final int BCRDR_MSG_RAW_IMAGE = 128;
  private static final int BCRDR_MSG_SHUTTER = 2;
  private static final int BCRDR_MSG_VIDEO_FRAME = 32;
  private static final int BCRDR_MSG_ZOOM = 8;
  static final int BCR_ERROR = -1;
  static final int BCR_SUCCESS = 0;
  private static final int DECODE_MODE_PREVIEW = 1;
  private static final int DECODE_MODE_VIDEO = 3;
  private static final int DECODE_MODE_VIEWFINDER = 2;
  static final int DECODE_STATUS_CANCELED = -1;
  static final int DECODE_STATUS_ERROR = -2;
  static final int DECODE_STATUS_MULTI_DEC_COUNT = -3;
  static final int DECODE_STATUS_TIMEOUT = 0;
  private static final String TAG = "BarCodeReader";
  private AutoFocusCallback mAutoFocusCallback = null;
  private DecodeCallback mDecodeCallback = null;
  private ErrorCallback mErrorCallback = null;
  private EventHandler mEventHandler = null;
  private int mNativeContext;
  private boolean mOneShot;
  private PreviewCallback mPreviewCallback = null;
  private PictureCallback mSnapshotCallback = null;
  private VideoCallback mVideoCallback = null;
  private boolean mWithBuffer;
  private OnZoomChangeListener mZoomListener = null;
  
  BarCodeReader(int paramInt)
  {
    Looper localLooper2 = Looper.myLooper();
    Looper localLooper1 = localLooper2;
    if (localLooper2 == null) {
      localLooper1 = Looper.getMainLooper();
    }
    if (localLooper1 != null) {
      this.mEventHandler = new EventHandler(this, localLooper1);
    }
    native_setup(new WeakReference(this), paramInt);
  }
  
  BarCodeReader(int paramInt, Context paramContext)
  {
    Looper localLooper2 = Looper.myLooper();
    Looper localLooper1 = localLooper2;
    if (localLooper2 == null) {
      localLooper1 = Looper.getMainLooper();
    }
    if (localLooper1 != null) {
      this.mEventHandler = new EventHandler(this, localLooper1);
    }
    native_setup(new WeakReference(this), paramInt, paramContext);
  }
  
  static native int getNumberOfReaders();
  
  static native void getReaderInfo(int paramInt, ReaderInfo paramReaderInfo);
  
  private final native void native_autoFocus();
  
  private final native void native_cancelAutoFocus();
  
  private final native String native_getParameters();
  
  private final native void native_release();
  
  private final native void native_setParameters(String paramString);
  
  private final native void native_setup(Object paramObject, int paramInt);
  
  private final native void native_setup(Object paramObject1, int paramInt, Object paramObject2);
  
  private final native void native_startPreview(int paramInt);
  
  private final native void native_takePicture();
  
  static BarCodeReader open()
  {
    for (;;)
    {
      int i;
      try
      {
        int j = getNumberOfReaders();
        ReaderInfo localReaderInfo = new ReaderInfo();
        i = 0;
        if (i >= j) {
          return null;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return null;
      }
      getReaderInfo(i, localException);
      if (localException.facing == 1) {
        return new BarCodeReader(i);
      }
      i += 1;
    }
  }
  
  static BarCodeReader open(int paramInt)
  {
    return new BarCodeReader(paramInt);
  }
  
  static BarCodeReader open(int paramInt, Context paramContext)
  {
    return new BarCodeReader(paramInt, paramContext);
  }
  
  static BarCodeReader open(Context paramContext)
  {
    for (;;)
    {
      ReaderInfo localReaderInfo;
      int i;
      try
      {
        int j = getNumberOfReaders();
        localReaderInfo = new ReaderInfo();
        i = 0;
        if (i >= j) {
          return null;
        }
      }
      catch (Exception paramContext)
      {
        paramContext.printStackTrace();
        return null;
      }
      getReaderInfo(i, localReaderInfo);
      if (localReaderInfo.facing == 1) {
        return new BarCodeReader(i, paramContext);
      }
      i += 1;
    }
  }
  
  private static void postEventFromNative(Object paramObject1, int paramInt1, int paramInt2, int paramInt3, Object paramObject2)
  {
    paramObject1 = (BarCodeReader)((WeakReference)paramObject1).get();
    if ((paramObject1 != null) && (((BarCodeReader)paramObject1).mEventHandler != null))
    {
      paramObject2 = ((BarCodeReader)paramObject1).mEventHandler.obtainMessage(paramInt1, paramInt2, paramInt3, paramObject2);
      ((BarCodeReader)paramObject1).mEventHandler.sendMessage((Message)paramObject2);
    }
  }
  
  private final native void setHasPreviewCallback(boolean paramBoolean1, boolean paramBoolean2);
  
  private final native int setNumParameter(int paramInt1, int paramInt2);
  
  private final native void setPreviewDisplay(Surface paramSurface);
  
  private final native int setStrParameter(int paramInt, String paramString);
  
  public final native int FWUpdate(String paramString, boolean paramBoolean1, boolean paramBoolean2);
  
  public final native void addCallbackBuffer(byte[] paramArrayOfByte);
  
  public final void autoFocus(AutoFocusCallback paramAutoFocusCallback)
  {
    this.mAutoFocusCallback = paramAutoFocusCallback;
    native_autoFocus();
  }
  
  public final void cancelAutoFocus()
  {
    this.mAutoFocusCallback = null;
    native_cancelAutoFocus();
  }
  
  public final native void disableAllCodeTypes();
  
  public final native void enableAllCodeTypes();
  
  protected void finalize()
  {
    native_release();
  }
  
  public final native int getDecodeCount();
  
  public final native byte[] getLastDecImage();
  
  public final native int getNumParameter(int paramInt);
  
  public final native int getNumProperty(int paramInt);
  
  public Parameters getParameters()
  {
    Parameters localParameters = new Parameters(null);
    localParameters.unflatten(native_getParameters());
    return localParameters;
  }
  
  public final native String getStrParameter(int paramInt);
  
  public final native String getStrProperty(int paramInt);
  
  public final native void lock();
  
  public final native boolean previewEnabled();
  
  public final native void reconnect()
    throws IOException;
  
  public final void release()
  {
    native_release();
  }
  
  public final native void setAutoFocusDelay(int paramInt1, int paramInt2);
  
  public final void setDecodeCallback(DecodeCallback paramDecodeCallback)
  {
    this.mDecodeCallback = paramDecodeCallback;
  }
  
  public final native void setDefaultParameters();
  
  public final native void setDisplayOrientation(int paramInt);
  
  public final void setErrorCallback(ErrorCallback paramErrorCallback)
  {
    this.mErrorCallback = paramErrorCallback;
  }
  
  public final void setOneShotPreviewCallback(PreviewCallback paramPreviewCallback)
  {
    boolean bool = true;
    this.mPreviewCallback = paramPreviewCallback;
    this.mOneShot = true;
    this.mWithBuffer = false;
    if (paramPreviewCallback != null) {}
    for (;;)
    {
      setHasPreviewCallback(bool, false);
      return;
      bool = false;
    }
  }
  
  public final int setParameter(int paramInt1, int paramInt2)
  {
    return setNumParameter(paramInt1, paramInt2);
  }
  
  public final int setParameter(int paramInt, String paramString)
  {
    return setStrParameter(paramInt, paramString);
  }
  
  public void setParameters(Parameters paramParameters)
  {
    native_setParameters(paramParameters.flatten());
  }
  
  public final void setPreviewCallbackWithBuffer(PreviewCallback paramPreviewCallback)
  {
    boolean bool = false;
    this.mPreviewCallback = paramPreviewCallback;
    this.mOneShot = false;
    this.mWithBuffer = true;
    if (paramPreviewCallback != null) {
      bool = true;
    }
    setHasPreviewCallback(bool, true);
  }
  
  public final void setPreviewDisplay(SurfaceHolder paramSurfaceHolder)
    throws IOException
  {
    if (paramSurfaceHolder != null)
    {
      setPreviewDisplay(paramSurfaceHolder.getSurface());
      return;
    }
    setPreviewDisplay(null);
  }
  
  public final void setZoomChangeListener(OnZoomChangeListener paramOnZoomChangeListener)
  {
    this.mZoomListener = paramOnZoomChangeListener;
  }
  
  public final native void startDecode();
  
  public final native int startHandsFreeDecode(int paramInt);
  
  public final void startPreview()
  {
    native_startPreview(1);
  }
  
  public final native void startSmoothZoom(int paramInt);
  
  public final void startVideoCapture(VideoCallback paramVideoCallback)
  {
    this.mVideoCallback = paramVideoCallback;
    native_startPreview(3);
  }
  
  public final void startViewFinder(VideoCallback paramVideoCallback)
  {
    this.mVideoCallback = paramVideoCallback;
    native_startPreview(2);
  }
  
  public final native void stopDecode();
  
  public final native void stopPreview();
  
  public final native void stopSmoothZoom();
  
  public final void takePicture(PictureCallback paramPictureCallback)
  {
    this.mSnapshotCallback = paramPictureCallback;
    try
    {
      native_takePicture();
      return;
    }
    catch (Throwable paramPictureCallback) {}
  }
  
  public final native void unlock();
  
  static abstract interface AutoFocusCallback
  {
    public abstract void onAutoFocus(boolean paramBoolean, BarCodeReader paramBarCodeReader);
  }
  
  static abstract interface DecodeCallback
  {
    public abstract void onDecodeComplete(int paramInt1, int paramInt2, byte[] paramArrayOfByte, BarCodeReader paramBarCodeReader);
    
    public abstract void onEvent(int paramInt1, int paramInt2, byte[] paramArrayOfByte, BarCodeReader paramBarCodeReader);
  }
  
  static abstract interface ErrorCallback
  {
    public abstract void onError(int paramInt, BarCodeReader paramBarCodeReader);
  }
  
  private class EventHandler
    extends Handler
  {
    private BarCodeReader mReader;
    
    public EventHandler(BarCodeReader paramBarCodeReader, Looper paramLooper)
    {
      super();
      this.mReader = paramBarCodeReader;
    }
    
    public void handleMessage(Message paramMessage)
    {
      boolean bool2 = true;
      boolean bool1 = true;
      Log.v("BarCodeReader", String.format("Event message: %X, arg1=%d, arg2=%d", new Object[] { Integer.valueOf(paramMessage.what), Integer.valueOf(paramMessage.arg1), Integer.valueOf(paramMessage.arg2) }));
      switch (paramMessage.what)
      {
      default: 
        Log.e("BarCodeReader", "Unknown message type " + paramMessage.what);
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          return;
                        } while (BarCodeReader.this.mDecodeCallback == null);
                        BarCodeReader.this.mDecodeCallback.onDecodeComplete(paramMessage.arg1, paramMessage.arg2, (byte[])paramMessage.obj, this.mReader);
                        return;
                      } while (BarCodeReader.this.mDecodeCallback == null);
                      BarCodeReader.this.mDecodeCallback.onDecodeComplete(0, 0, (byte[])paramMessage.obj, this.mReader);
                      return;
                    } while (BarCodeReader.this.mDecodeCallback == null);
                    BarCodeReader.this.mDecodeCallback.onDecodeComplete(0, -1, (byte[])paramMessage.obj, this.mReader);
                    return;
                  } while (BarCodeReader.this.mDecodeCallback == null);
                  BarCodeReader.this.mDecodeCallback.onDecodeComplete(0, -2, (byte[])paramMessage.obj, this.mReader);
                  return;
                } while (BarCodeReader.this.mDecodeCallback == null);
                BarCodeReader.this.mDecodeCallback.onEvent(paramMessage.arg1, paramMessage.arg2, (byte[])paramMessage.obj, this.mReader);
                return;
                int j;
                if (BarCodeReader.this.mSnapshotCallback != null)
                {
                  i = paramMessage.arg1;
                  j = paramMessage.arg1;
                  BarCodeReader.this.mSnapshotCallback.onPictureTaken(paramMessage.arg2, i & 0xFFFF, j >> 16 & 0xFFFF, (byte[])paramMessage.obj, this.mReader);
                  return;
                }
                Log.e("BarCodeReader", "BCRDR_MSG_COMPRESSED_IMAGE event with no snapshot callback");
                return;
                if (BarCodeReader.this.mVideoCallback != null)
                {
                  i = paramMessage.arg1;
                  j = paramMessage.arg1;
                  BarCodeReader.this.mVideoCallback.onVideoFrame(paramMessage.arg2, i & 0xFFFF, j >> 16 & 0xFFFF, (byte[])paramMessage.obj, this.mReader);
                  return;
                }
                Log.e("BarCodeReader", "BCRDR_MSG_VIDEO_FRAME event with no video callback");
                return;
              } while (BarCodeReader.this.mPreviewCallback == null);
              localObject = BarCodeReader.this.mPreviewCallback;
              if (BarCodeReader.this.mOneShot) {
                BarCodeReader.this.mPreviewCallback = null;
              }
              for (;;)
              {
                ((BarCodeReader.PreviewCallback)localObject).onPreviewFrame((byte[])paramMessage.obj, this.mReader);
                return;
                if (!BarCodeReader.this.mWithBuffer) {
                  BarCodeReader.this.setHasPreviewCallback(true, false);
                }
              }
            } while (BarCodeReader.this.mAutoFocusCallback == null);
            localObject = BarCodeReader.this.mAutoFocusCallback;
            if (paramMessage.arg1 == 0) {
              bool1 = false;
            }
            ((BarCodeReader.AutoFocusCallback)localObject).onAutoFocus(bool1, this.mReader);
            return;
          } while (BarCodeReader.this.mZoomListener == null);
          Object localObject = BarCodeReader.this.mZoomListener;
          int i = paramMessage.arg1;
          if (paramMessage.arg2 != 0) {}
          for (bool1 = bool2;; bool1 = false)
          {
            ((BarCodeReader.OnZoomChangeListener)localObject).onZoomChange(i, bool1, this.mReader);
            return;
          }
          Log.e("BarCodeReader", "Error " + paramMessage.arg1);
        } while (BarCodeReader.this.mErrorCallback == null);
        BarCodeReader.this.mErrorCallback.onError(paramMessage.arg1, this.mReader);
        return;
      } while (BarCodeReader.this.mDecodeCallback == null);
      BarCodeReader.this.mDecodeCallback.onDecodeComplete(paramMessage.arg1, -3, (byte[])paramMessage.obj, this.mReader);
    }
  }
  
  static abstract interface OnZoomChangeListener
  {
    public abstract void onZoomChange(int paramInt, boolean paramBoolean, BarCodeReader paramBarCodeReader);
  }
  
  static class ParamNum
  {
    public static final short AIMID_SUPP_FORMAT = 672;
    public static final short AIMMODEHANDSFREE = 590;
    public static final short AZTEC = 574;
    public static final short AZTEC_INVERSE = 589;
    public static final short BOOKLAND = 83;
    public static final short BOOKLAND_FORMAT = 576;
    public static final short C11_CHK_TYPE = 52;
    public static final short C11_LEN1 = 28;
    public static final short C11_LEN2 = 29;
    public static final short C128_LEN1 = 209;
    public static final short C128_LEN2 = 210;
    public static final short C25 = 408;
    public static final short C32_PREFIX = 231;
    public static final short C39_CHK_EN = 48;
    public static final short C39_FULL_ASCII = 17;
    public static final short C39_LEN1 = 18;
    public static final short C39_LEN2 = 19;
    public static final short C93_LEN1 = 26;
    public static final short C93_LEN2 = 27;
    public static final short CBR_LEN1 = 24;
    public static final short CBR_LEN2 = 25;
    public static final short CCAB_ENABLE = 342;
    public static final short CCC_ENABLE = 341;
    public static final short CELL_DISPLAY_MODE = 716;
    public static final short CHECK_ISBT_TABLE = 578;
    public static final short CLSI = 54;
    public static final short CODABAR = 7;
    public static final short CODE11 = 10;
    public static final short CODE128 = 8;
    public static final short CODE32 = 86;
    public static final short CODE39 = 0;
    public static final short CODE93 = 9;
    public static final short COUPON = 85;
    public static final short COUPON_REPORT = 730;
    public static final short D25 = 5;
    public static final short D25_LEN1 = 20;
    public static final short D25_LEN2 = 21;
    public static final short DATABAR_LIM_SEC_LEV = 728;
    public static final short DATAMATRIX = 292;
    public static final short DATAMATRIX_INVERSE = 588;
    public static final short DEMOTE_RSS = 397;
    public static final short EAN128 = 14;
    public static final short EAN13 = 3;
    public static final short EAN8 = 4;
    public static final short EAN8_TO_13 = 39;
    public static final short EMUL_EAN128 = 123;
    public static final short EMUL_UCCEAN128 = 427;
    public static final short ENABLE_HANXIN = 1167;
    public static final short FULL_READ_MODE = 901;
    public static final short HANXIN_INVERSE = 1168;
    public static final short I25 = 6;
    public static final short I25_CHK_TYPE = 49;
    public static final short I25_LEN1 = 22;
    public static final short I25_LEN2 = 23;
    public static final short I25_TO_EAN13 = 82;
    public static final short IMAGE_SIG_JPEG_QUALITY = 421;
    public static final short IMG_AIM_MODE = 306;
    public static final short IMG_AIM_SNAPSHOT = 300;
    public static final short IMG_BPP = 303;
    public static final short IMG_CROP = 301;
    public static final short IMG_CROP_BOT = 317;
    public static final short IMG_CROP_LEFT = 316;
    public static final short IMG_CROP_RIGHT = 318;
    public static final short IMG_CROP_TOP = 315;
    public static final short IMG_ENHANCEMENT = 564;
    public static final short IMG_FILE_FORMAT = 304;
    public static final short IMG_ILLUM = 298;
    public static final short IMG_IMAGE_ILLUM = 361;
    public static final short IMG_JPEG_QUAL = 305;
    public static final short IMG_MOTIONILLUM = 762;
    public static final short IMG_SIG_BPP = 314;
    public static final short IMG_SIG_FMT = 313;
    public static final short IMG_SNAPTIMEOUT = 323;
    public static final short IMG_SUBSAMPLE = 302;
    public static final short IMG_VIDEOVF = 324;
    public static final short ISBT_128 = 84;
    public static final short ISBT_CONCAT_MODE = 577;
    public static final short ISBT_MAX_TRY = 223;
    public static final short ISSN_EAN_EN = 617;
    public static final short K35 = 581;
    public static final short LASER_OFF_PRIM = 137;
    public static final short LASER_ON_PRIM = 136;
    public static final short LIN_SEC_LEV = 78;
    public static final short MARGIN_RATIO = 381;
    public static final short MATRIX_25_CHK_EN = 622;
    public static final short MATRIX_25_EN = 618;
    public static final short MATRIX_25_LEN1 = 619;
    public static final short MATRIX_25_LEN2 = 620;
    public static final short MATRIX_25_REDUN = 621;
    public static final short MATRIX_25_XMIT_CHK = 623;
    public static final short MAXICODE = 294;
    public static final short MIRROR_IMAGE = 537;
    public static final short MSI = 11;
    public static final short MSI_CHK_1_2 = 50;
    public static final short MSI_CHK_SCHEME = 51;
    public static final short MSI_LEN1 = 30;
    public static final short MSI_LEN2 = 31;
    public static final short MULTI_DECODE = 900;
    public static final short NOTIS = 55;
    public static final short NUM_BR_TO_READ = 902;
    public static final short ONE_D_INVERSE = 586;
    public static final short PDF = 15;
    public static final short PICKLIST_MODE = 402;
    public static final short POSTAL_AUS = 291;
    public static final short POSTAL_DUTCH = 326;
    public static final short POSTAL_JAP = 290;
    public static final short POST_AUS_FMT = 718;
    public static final short POST_UK = 91;
    public static final short POST_UK_PARITY = 96;
    public static final short POST_US1 = 89;
    public static final short POST_US2 = 90;
    public static final short POST_US3 = 592;
    public static final short POST_US4 = 611;
    public static final short POST_US_PARITY = 95;
    public static final short PRIM_TRIG_MODE = 138;
    public static final short QRCODE = 293;
    public static final short QR_INVERSE = 587;
    public static final short RETRIEVE_LAST_DECODE = 905;
    public static final short RSS_14 = 338;
    public static final short RSS_EXP = 340;
    public static final short RSS_LIM = 339;
    public static final short SECURITY_LEVEL = 1121;
    public static final short SIGCAP_HEIGHT = 367;
    public static final short SIGCAP_WIDTH = 366;
    public static final short SIGNATURE = 93;
    public static final short SUPPS = 16;
    public static final short SUPP_REDUN = 80;
    public static final short SUPP_USER_1 = 579;
    public static final short SUPP_USER_2 = 580;
    public static final short TCIF = 371;
    public static final short TRIOPTIC = 13;
    public static final short UPCA = 1;
    public static final short UPCA_CHK = 40;
    public static final short UPCA_PREAM = 34;
    public static final short UPCE = 2;
    public static final short UPCE1 = 12;
    public static final short UPCE1_CHK = 42;
    public static final short UPCE1_PREAM = 36;
    public static final short UPCE1_TO_A = 38;
    public static final short UPCE_CHK = 41;
    public static final short UPCE_PREAM = 35;
    public static final short UPCE_TO_A = 37;
    public static final short UPC_COMPOSITE = 344;
    public static final short UPC_SEC_LEV = 77;
    public static final short UPDF = 227;
    public static final short UQR_EN = 573;
    public static final short VIDEO_SUBSMAPLE = 761;
    public static final short XMIT_C11_CHK = 47;
    public static final short XMIT_C39_CHK = 43;
    public static final short XMIT_CODE_ID = 45;
    public static final short XMIT_I25_CHK = 44;
    public static final short XMIT_MSI_CHK = 46;
    public static final short XMIT_NO_READ = 94;
  }
  
  static class ParamVal
  {
    public static final byte AIM_OFF = 0;
    public static final byte AIM_ON = 1;
    public static final byte AIM_ON_ALWAYS = 2;
    public static final byte AUTO_AIM = 9;
    public static final byte HANDSFREE = 7;
    public static final byte IMG_BPP_1 = 0;
    public static final byte IMG_BPP_4 = 1;
    public static final byte IMG_BPP_8 = 2;
    public static final byte IMG_ENHANCE_CUSTOM = 4;
    public static final byte IMG_ENHANCE_HIGH = 3;
    public static final byte IMG_ENHANCE_LOW = 1;
    public static final byte IMG_ENHANCE_MED = 2;
    public static final byte IMG_ENHANCE_OFF = 0;
    public static final byte IMG_FORMAT_BMP = 3;
    public static final byte IMG_FORMAT_JPEG = 1;
    public static final byte IMG_FORMAT_TIFF = 4;
    public static final byte IMG_SUBSAMPLE_FACTOR_1 = 0;
    public static final byte IMG_SUBSAMPLE_FACTOR_2 = 1;
    public static final byte IMG_SUBSAMPLE_FACTOR_3 = 2;
    public static final byte IMG_SUBSAMPLE_FACTOR_4 = 3;
    public static final byte INVERSE_AUTOD = 2;
    public static final byte INVERSE_ONLY = 1;
    public static final byte ISBT_CONCAT_AUTOD = 2;
    public static final byte ISBT_CONCAT_NONE = 0;
    public static final byte ISBT_CONCAT_ONLY = 1;
    public static final byte LEVEL = 0;
    public static final byte MIRROR_ALWAYS = 1;
    public static final byte MIRROR_AUTO = 2;
    public static final byte MIRROR_NEVER = 0;
    public static final byte PDF_CWLEN_ZERO_OK = 1;
    public static final byte PDF_SECURITY_STRICT = 0;
    public static final byte PICKLIST_ALWAYS = 1;
    public static final byte PICKLIST_NEVER = 0;
    public static final byte PICKLIST_OUT_OF_SCANSTAND = 1;
    public static final byte REGULAR_ONLY = 0;
    public static final byte SUPP_378_379 = 4;
    public static final byte SUPP_414_419_434_439 = 6;
    public static final byte SUPP_491 = 8;
    public static final byte SUPP_977 = 7;
    public static final byte SUPP_978_979 = 5;
    public static final byte SUPP_AUTOD = 2;
    public static final byte SUPP_NONE = 0;
    public static final byte SUPP_ONLY = 1;
    public static final byte SUPP_PROG_1 = 9;
    public static final byte SUPP_PROG_1_AND_2 = 10;
    public static final byte SUPP_SMART = 3;
    public static final byte SUPP_SMART_PLUS_1 = 11;
    public static final byte SUPP_SMART_PLUS_1_2 = 12;
    public static final byte UPC_ALWAYS = 1;
    public static final byte UPC_AUTOD = 2;
    public static final byte UPC_NEVER = 0;
  }
  
  class Parameters
  {
    static final String ANTIBANDING_50HZ = "50hz";
    static final String ANTIBANDING_60HZ = "60hz";
    static final String ANTIBANDING_AUTO = "auto";
    static final String ANTIBANDING_OFF = "off";
    static final String EFFECT_AQUA = "aqua";
    static final String EFFECT_BLACKBOARD = "blackboard";
    static final String EFFECT_MONO = "mono";
    static final String EFFECT_NEGATIVE = "negative";
    static final String EFFECT_NONE = "none";
    static final String EFFECT_POSTERIZE = "posterize";
    static final String EFFECT_SEPIA = "sepia";
    static final String EFFECT_SOLARIZE = "solarize";
    static final String EFFECT_WHITEBOARD = "whiteboard";
    static final String FLASH_MODE_AUTO = "auto";
    static final String FLASH_MODE_OFF = "off";
    static final String FLASH_MODE_ON = "on";
    static final String FLASH_MODE_RED_EYE = "red-eye";
    static final String FLASH_MODE_TORCH = "torch";
    static final int FOCUS_DISTANCE_FAR_INDEX = 2;
    static final int FOCUS_DISTANCE_NEAR_INDEX = 0;
    static final int FOCUS_DISTANCE_OPTIMAL_INDEX = 1;
    static final String FOCUS_MODE_AUTO = "auto";
    static final String FOCUS_MODE_CONTINUOUS_VIDEO = "continuous-video";
    static final String FOCUS_MODE_EDOF = "edof";
    static final String FOCUS_MODE_FIXED = "fixed";
    static final String FOCUS_MODE_INFINITY = "infinity";
    static final String FOCUS_MODE_MACRO = "macro";
    private static final String KEY_ANTIBANDING = "antibanding";
    private static final String KEY_EFFECT = "effect";
    private static final String KEY_EXPOSURE_COMPENSATION = "exposure-compensation";
    private static final String KEY_EXPOSURE_COMPENSATION_STEP = "exposure-compensation-step";
    private static final String KEY_FLASH_MODE = "flash-mode";
    private static final String KEY_FOCAL_LENGTH = "focal-length";
    private static final String KEY_FOCUS_DISTANCES = "focus-distances";
    private static final String KEY_FOCUS_MODE = "focus-mode";
    private static final String KEY_GPS_ALTITUDE = "gps-altitude";
    private static final String KEY_GPS_LATITUDE = "gps-latitude";
    private static final String KEY_GPS_LONGITUDE = "gps-longitude";
    private static final String KEY_GPS_PROCESSING_METHOD = "gps-processing-method";
    private static final String KEY_GPS_TIMESTAMP = "gps-timestamp";
    private static final String KEY_HORIZONTAL_VIEW_ANGLE = "horizontal-view-angle";
    private static final String KEY_JPEG_QUALITY = "jpeg-quality";
    private static final String KEY_JPEG_THUMBNAIL_HEIGHT = "jpeg-thumbnail-height";
    private static final String KEY_JPEG_THUMBNAIL_QUALITY = "jpeg-thumbnail-quality";
    private static final String KEY_JPEG_THUMBNAIL_SIZE = "jpeg-thumbnail-size";
    private static final String KEY_JPEG_THUMBNAIL_WIDTH = "jpeg-thumbnail-width";
    private static final String KEY_MAX_EXPOSURE_COMPENSATION = "max-exposure-compensation";
    private static final String KEY_MAX_ZOOM = "max-zoom";
    private static final String KEY_MIN_EXPOSURE_COMPENSATION = "min-exposure-compensation";
    private static final String KEY_PICTURE_FORMAT = "picture-format";
    private static final String KEY_PICTURE_SIZE = "picture-size";
    private static final String KEY_PREVIEW_FORMAT = "preview-format";
    private static final String KEY_PREVIEW_FPS_RANGE = "preview-fps-range";
    private static final String KEY_PREVIEW_FRAME_RATE = "preview-frame-rate";
    private static final String KEY_PREVIEW_SIZE = "preview-size";
    private static final String KEY_ROTATION = "rotation";
    private static final String KEY_SCENE_MODE = "scene-mode";
    private static final String KEY_SMOOTH_ZOOM_SUPPORTED = "smooth-zoom-supported";
    private static final String KEY_VERTICAL_VIEW_ANGLE = "vertical-view-angle";
    private static final String KEY_WHITE_BALANCE = "whitebalance";
    private static final String KEY_ZOOM = "zoom";
    private static final String KEY_ZOOM_RATIOS = "zoom-ratios";
    private static final String KEY_ZOOM_SUPPORTED = "zoom-supported";
    private static final String PIXEL_FORMAT_JPEG = "jpeg";
    private static final String PIXEL_FORMAT_RGB565 = "rgb565";
    private static final String PIXEL_FORMAT_YUV420SP = "yuv420sp";
    private static final String PIXEL_FORMAT_YUV422I = "yuv422i-yuyv";
    private static final String PIXEL_FORMAT_YUV422SP = "yuv422sp";
    static final int PREVIEW_FPS_MAX_INDEX = 1;
    static final int PREVIEW_FPS_MIN_INDEX = 0;
    static final String SCENE_MODE_ACTION = "action";
    static final String SCENE_MODE_AUTO = "auto";
    static final String SCENE_MODE_BARCODE = "barcode";
    static final String SCENE_MODE_BEACH = "beach";
    static final String SCENE_MODE_CANDLELIGHT = "candlelight";
    static final String SCENE_MODE_FIREWORKS = "fireworks";
    static final String SCENE_MODE_LANDSCAPE = "landscape";
    static final String SCENE_MODE_NIGHT = "night";
    static final String SCENE_MODE_NIGHT_PORTRAIT = "night-portrait";
    static final String SCENE_MODE_PARTY = "party";
    static final String SCENE_MODE_PORTRAIT = "portrait";
    static final String SCENE_MODE_SNOW = "snow";
    static final String SCENE_MODE_SPORTS = "sports";
    static final String SCENE_MODE_STEADYPHOTO = "steadyphoto";
    static final String SCENE_MODE_SUNSET = "sunset";
    static final String SCENE_MODE_THEATRE = "theatre";
    private static final String SUPPORTED_VALUES_SUFFIX = "-values";
    private static final String TRUE = "true";
    static final String WHITE_BALANCE_AUTO = "auto";
    static final String WHITE_BALANCE_CLOUDY_DAYLIGHT = "cloudy-daylight";
    static final String WHITE_BALANCE_DAYLIGHT = "daylight";
    static final String WHITE_BALANCE_FLUORESCENT = "fluorescent";
    static final String WHITE_BALANCE_INCANDESCENT = "incandescent";
    static final String WHITE_BALANCE_SHADE = "shade";
    static final String WHITE_BALANCE_TWILIGHT = "twilight";
    static final String WHITE_BALANCE_WARM_FLUORESCENT = "warm-fluorescent";
    private HashMap mMap = new HashMap();
    
    private Parameters() {}
    
    private float getFloat(String paramString, float paramFloat)
    {
      try
      {
        float f = Float.parseFloat((String)this.mMap.get(paramString));
        return f;
      }
      catch (Throwable paramString) {}
      return paramFloat;
    }
    
    private int getInt(String paramString, int paramInt)
    {
      try
      {
        int i = Integer.parseInt((String)this.mMap.get(paramString));
        return i;
      }
      catch (Throwable paramString) {}
      return paramInt;
    }
    
    private int pixelFormatForReaderFormat(String paramString)
    {
      if (paramString == null) {}
      do
      {
        return 0;
        if (paramString.equals("yuv422sp")) {
          return 16;
        }
        if (paramString.equals("yuv420sp")) {
          return 17;
        }
        if (paramString.equals("yuv422i-yuyv")) {
          return 20;
        }
        if (paramString.equals("rgb565")) {
          return 4;
        }
      } while (!paramString.equals("jpeg"));
      return 256;
    }
    
    private String readerFormatForPixelFormat(int paramInt)
    {
      switch (paramInt)
      {
      default: 
        return null;
      case 16: 
        return "yuv422sp";
      case 17: 
        return "yuv420sp";
      case 20: 
        return "yuv422i-yuyv";
      case 4: 
        return "rgb565";
      }
      return "jpeg";
    }
    
    private ArrayList split(String paramString)
    {
      if (paramString == null)
      {
        paramString = null;
        return paramString;
      }
      StringTokenizer localStringTokenizer = new StringTokenizer(paramString, ",");
      ArrayList localArrayList = new ArrayList();
      for (;;)
      {
        paramString = localArrayList;
        if (!localStringTokenizer.hasMoreElements()) {
          break;
        }
        localArrayList.add(localStringTokenizer.nextToken());
      }
    }
    
    private void splitFloat(String paramString, float[] paramArrayOfFloat)
    {
      if (paramString == null) {}
      for (;;)
      {
        return;
        paramString = new StringTokenizer(paramString, ",");
        int i = 0;
        while (paramString.hasMoreElements())
        {
          paramArrayOfFloat[i] = Float.parseFloat(paramString.nextToken());
          i += 1;
        }
      }
    }
    
    private ArrayList splitInt(String paramString)
    {
      if (paramString == null) {
        return null;
      }
      paramString = new StringTokenizer(paramString, ",");
      ArrayList localArrayList = new ArrayList();
      for (;;)
      {
        if (!paramString.hasMoreElements())
        {
          if (localArrayList.size() == 0) {
            break;
          }
          return localArrayList;
        }
        localArrayList.add(Integer.valueOf(Integer.parseInt(paramString.nextToken())));
      }
    }
    
    private void splitInt(String paramString, int[] paramArrayOfInt)
    {
      if (paramString == null) {}
      for (;;)
      {
        return;
        paramString = new StringTokenizer(paramString, ",");
        int i = 0;
        while (paramString.hasMoreElements())
        {
          paramArrayOfInt[i] = Integer.parseInt(paramString.nextToken());
          i += 1;
        }
      }
    }
    
    private ArrayList splitRange(String paramString)
    {
      if ((paramString == null) || (paramString.charAt(0) != '(') || (paramString.charAt(paramString.length() - 1) != ')'))
      {
        Log.e("BarCodeReader", "Invalid range list string=" + paramString);
        return null;
      }
      ArrayList localArrayList = new ArrayList();
      int i = 1;
      int j;
      do
      {
        int[] arrayOfInt = new int[2];
        int k = paramString.indexOf("),(", i);
        j = k;
        if (k == -1) {
          j = paramString.length() - 1;
        }
        splitInt(paramString.substring(i, j), arrayOfInt);
        localArrayList.add(arrayOfInt);
        i = j + 3;
      } while (j != paramString.length() - 1);
      if (localArrayList.size() == 0) {
        return null;
      }
      return localArrayList;
    }
    
    private ArrayList splitSize(String paramString)
    {
      if (paramString == null) {
        return null;
      }
      paramString = new StringTokenizer(paramString, ",");
      ArrayList localArrayList = new ArrayList();
      for (;;)
      {
        if (!paramString.hasMoreElements())
        {
          if (localArrayList.size() == 0) {
            break;
          }
          return localArrayList;
        }
        BarCodeReader.Size localSize = strToSize(paramString.nextToken());
        if (localSize != null) {
          localArrayList.add(localSize);
        }
      }
    }
    
    private BarCodeReader.Size strToSize(String paramString)
    {
      if (paramString == null) {
        return null;
      }
      int i = paramString.indexOf('x');
      if (i != -1)
      {
        String str = paramString.substring(0, i);
        paramString = paramString.substring(i + 1);
        return new BarCodeReader.Size(BarCodeReader.this, Integer.parseInt(str), Integer.parseInt(paramString));
      }
      Log.e("BarCodeReader", "Invalid size parameter string=" + paramString);
      return null;
    }
    
    public void dump()
    {
      Log.e("BarCodeReader", "dump: size=" + this.mMap.size());
      Iterator localIterator = this.mMap.keySet().iterator();
      for (;;)
      {
        if (!localIterator.hasNext()) {
          return;
        }
        String str = (String)localIterator.next();
        Log.e("BarCodeReader", "dump: " + str + "=" + (String)this.mMap.get(str));
      }
    }
    
    public String flatten()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      Iterator localIterator = this.mMap.keySet().iterator();
      for (;;)
      {
        if (!localIterator.hasNext())
        {
          localStringBuilder.deleteCharAt(localStringBuilder.length() - 1);
          return localStringBuilder.toString();
        }
        String str = (String)localIterator.next();
        localStringBuilder.append(str);
        localStringBuilder.append("=");
        localStringBuilder.append((String)this.mMap.get(str));
        localStringBuilder.append(";");
      }
    }
    
    public String get(String paramString)
    {
      return (String)this.mMap.get(paramString);
    }
    
    public String getAntibanding()
    {
      return get("antibanding");
    }
    
    public String getColorEffect()
    {
      return get("effect");
    }
    
    public int getExposureCompensation()
    {
      return getInt("exposure-compensation", 0);
    }
    
    public float getExposureCompensationStep()
    {
      return getFloat("exposure-compensation-step", 0.0F);
    }
    
    public String getFlashMode()
    {
      return get("flash-mode");
    }
    
    public float getFocalLength()
    {
      return Float.parseFloat(get("focal-length"));
    }
    
    public void getFocusDistances(float[] paramArrayOfFloat)
    {
      if ((paramArrayOfFloat == null) || (paramArrayOfFloat.length != 3)) {
        throw new IllegalArgumentException("output must be an float array with three elements.");
      }
      splitFloat(get("focus-distances"), paramArrayOfFloat);
    }
    
    public String getFocusMode()
    {
      return get("focus-mode");
    }
    
    public float getHorizontalViewAngle()
    {
      return Float.parseFloat(get("horizontal-view-angle"));
    }
    
    public int getInt(String paramString)
    {
      return getInt(paramString, -1);
    }
    
    public int getJpegQuality()
    {
      return getInt("jpeg-quality");
    }
    
    public int getJpegThumbnailQuality()
    {
      return getInt("jpeg-thumbnail-quality");
    }
    
    public BarCodeReader.Size getJpegThumbnailSize()
    {
      return new BarCodeReader.Size(BarCodeReader.this, getInt("jpeg-thumbnail-width"), getInt("jpeg-thumbnail-height"));
    }
    
    public int getMaxExposureCompensation()
    {
      return getInt("max-exposure-compensation", 0);
    }
    
    public int getMaxZoom()
    {
      return getInt("max-zoom", 0);
    }
    
    public int getMinExposureCompensation()
    {
      return getInt("min-exposure-compensation", 0);
    }
    
    public int getPictureFormat()
    {
      return pixelFormatForReaderFormat(get("picture-format"));
    }
    
    public BarCodeReader.Size getPictureSize()
    {
      return strToSize(get("picture-size"));
    }
    
    public int getPreviewFormat()
    {
      return pixelFormatForReaderFormat(get("preview-format"));
    }
    
    public void getPreviewFpsRange(int[] paramArrayOfInt)
    {
      if ((paramArrayOfInt == null) || (paramArrayOfInt.length != 2)) {
        throw new IllegalArgumentException("range must be an array with two elements.");
      }
      splitInt(get("preview-fps-range"), paramArrayOfInt);
    }
    
    @Deprecated
    public int getPreviewFrameRate()
    {
      return getInt("preview-frame-rate");
    }
    
    public BarCodeReader.Size getPreviewSize()
    {
      return strToSize(get("preview-size"));
    }
    
    public String getSceneMode()
    {
      return get("scene-mode");
    }
    
    public List getSupportedAntibanding()
    {
      return split(get("antibanding-values"));
    }
    
    public List getSupportedColorEffects()
    {
      return split(get("effect-values"));
    }
    
    public List getSupportedFlashModes()
    {
      return split(get("flash-mode-values"));
    }
    
    public List getSupportedFocusModes()
    {
      return split(get("focus-mode-values"));
    }
    
    public List getSupportedJpegThumbnailSizes()
    {
      return splitSize(get("jpeg-thumbnail-size-values"));
    }
    
    public List getSupportedPictureFormats()
    {
      Object localObject = get("picture-format-values");
      ArrayList localArrayList = new ArrayList();
      localObject = split((String)localObject).iterator();
      for (;;)
      {
        if (!((Iterator)localObject).hasNext()) {
          return localArrayList;
        }
        int i = pixelFormatForReaderFormat((String)((Iterator)localObject).next());
        if (i != 0) {
          localArrayList.add(Integer.valueOf(i));
        }
      }
    }
    
    public List getSupportedPictureSizes()
    {
      return splitSize(get("picture-size-values"));
    }
    
    public List getSupportedPreviewFormats()
    {
      Object localObject = get("preview-format-values");
      ArrayList localArrayList = new ArrayList();
      localObject = split((String)localObject).iterator();
      for (;;)
      {
        if (!((Iterator)localObject).hasNext()) {
          return localArrayList;
        }
        int i = pixelFormatForReaderFormat((String)((Iterator)localObject).next());
        if (i != 0) {
          localArrayList.add(Integer.valueOf(i));
        }
      }
    }
    
    public List getSupportedPreviewFpsRange()
    {
      return splitRange(get("preview-fps-range-values"));
    }
    
    @Deprecated
    public List getSupportedPreviewFrameRates()
    {
      return splitInt(get("preview-frame-rate-values"));
    }
    
    public List getSupportedPreviewSizes()
    {
      return splitSize(get("preview-size-values"));
    }
    
    public List getSupportedSceneModes()
    {
      return split(get("scene-mode-values"));
    }
    
    public List getSupportedWhiteBalance()
    {
      return split(get("whitebalance-values"));
    }
    
    public float getVerticalViewAngle()
    {
      return Float.parseFloat(get("vertical-view-angle"));
    }
    
    public String getWhiteBalance()
    {
      return get("whitebalance");
    }
    
    public int getZoom()
    {
      return getInt("zoom", 0);
    }
    
    public List getZoomRatios()
    {
      return splitInt(get("zoom-ratios"));
    }
    
    public boolean isSmoothZoomSupported()
    {
      return "true".equals(get("smooth-zoom-supported"));
    }
    
    public boolean isZoomSupported()
    {
      return "true".equals(get("zoom-supported"));
    }
    
    public void remove(String paramString)
    {
      this.mMap.remove(paramString);
    }
    
    public void removeGpsData()
    {
      remove("gps-latitude");
      remove("gps-longitude");
      remove("gps-altitude");
      remove("gps-timestamp");
      remove("gps-processing-method");
    }
    
    public void set(String paramString, int paramInt)
    {
      if ((paramString.indexOf('=') != -1) || (paramString.indexOf(';') != -1))
      {
        Log.e("BarCodeReader", "Key \"" + paramString + "\" contains invalid character (= or ;)");
        return;
      }
      this.mMap.put(paramString, Integer.toString(paramInt));
    }
    
    public void set(String paramString1, String paramString2)
    {
      if ((paramString1.indexOf('=') != -1) || (paramString1.indexOf(';') != -1))
      {
        Log.e("BarCodeReader", "Key \"" + paramString1 + "\" contains invalid character (= or ;)");
        return;
      }
      if ((paramString2.indexOf('=') != -1) || (paramString2.indexOf(';') != -1))
      {
        Log.e("BarCodeReader", "Value \"" + paramString2 + "\" contains invalid character (= or ;)");
        return;
      }
      this.mMap.put(paramString1, paramString2);
    }
    
    public void setAntibanding(String paramString)
    {
      set("antibanding", paramString);
    }
    
    public void setColorEffect(String paramString)
    {
      set("effect", paramString);
    }
    
    public void setExposureCompensation(int paramInt)
    {
      set("exposure-compensation", paramInt);
    }
    
    public void setFlashMode(String paramString)
    {
      set("flash-mode", paramString);
    }
    
    public void setFocusMode(String paramString)
    {
      set("focus-mode", paramString);
    }
    
    public void setGpsAltitude(double paramDouble)
    {
      set("gps-altitude", Double.toString(paramDouble));
    }
    
    public void setGpsLatitude(double paramDouble)
    {
      set("gps-latitude", Double.toString(paramDouble));
    }
    
    public void setGpsLongitude(double paramDouble)
    {
      set("gps-longitude", Double.toString(paramDouble));
    }
    
    public void setGpsProcessingMethod(String paramString)
    {
      set("gps-processing-method", paramString);
    }
    
    public void setGpsTimestamp(long paramLong)
    {
      set("gps-timestamp", Long.toString(paramLong));
    }
    
    public void setJpegQuality(int paramInt)
    {
      set("jpeg-quality", paramInt);
    }
    
    public void setJpegThumbnailQuality(int paramInt)
    {
      set("jpeg-thumbnail-quality", paramInt);
    }
    
    public void setJpegThumbnailSize(int paramInt1, int paramInt2)
    {
      set("jpeg-thumbnail-width", paramInt1);
      set("jpeg-thumbnail-height", paramInt2);
    }
    
    public void setPictureFormat(int paramInt)
    {
      String str = readerFormatForPixelFormat(paramInt);
      if (str == null) {
        throw new IllegalArgumentException("Invalid pixel_format=" + paramInt);
      }
      set("picture-format", str);
    }
    
    public void setPictureSize(int paramInt1, int paramInt2)
    {
      set("picture-size", Integer.toString(paramInt1) + "x" + Integer.toString(paramInt2));
    }
    
    public void setPreviewFormat(int paramInt)
    {
      String str = readerFormatForPixelFormat(paramInt);
      if (str == null) {
        throw new IllegalArgumentException("Invalid pixel_format=" + paramInt);
      }
      set("preview-format", str);
    }
    
    public void setPreviewFpsRange(int paramInt1, int paramInt2)
    {
      set("preview-fps-range", paramInt1 + "," + paramInt2);
    }
    
    @Deprecated
    public void setPreviewFrameRate(int paramInt)
    {
      set("preview-frame-rate", paramInt);
    }
    
    public void setPreviewSize(int paramInt1, int paramInt2)
    {
      set("preview-size", Integer.toString(paramInt1) + "x" + Integer.toString(paramInt2));
    }
    
    public void setRotation(int paramInt)
    {
      if ((paramInt == 0) || (paramInt == 90) || (paramInt == 180) || (paramInt == 270))
      {
        set("rotation", Integer.toString(paramInt));
        return;
      }
      throw new IllegalArgumentException("Invalid rotation=" + paramInt);
    }
    
    public void setSceneMode(String paramString)
    {
      set("scene-mode", paramString);
    }
    
    public void setWhiteBalance(String paramString)
    {
      set("whitebalance", paramString);
    }
    
    public void setZoom(int paramInt)
    {
      set("zoom", paramInt);
    }
    
    public void unflatten(String paramString)
    {
      this.mMap.clear();
      paramString = new StringTokenizer(paramString, ";");
      for (;;)
      {
        if (!paramString.hasMoreElements()) {
          return;
        }
        String str = paramString.nextToken();
        int i = str.indexOf('=');
        if (i != -1) {
          this.mMap.put(str.substring(0, i), str.substring(i + 1));
        }
      }
    }
  }
  
  static abstract interface PictureCallback
  {
    public abstract void onPictureTaken(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte, BarCodeReader paramBarCodeReader);
  }
  
  static abstract interface PreviewCallback
  {
    public abstract void onPreviewFrame(byte[] paramArrayOfByte, BarCodeReader paramBarCodeReader);
  }
  
  static class PropertyNum
  {
    public static final int BTLD_FW_VER = 11;
    public static final int ENGINE_VER = 7;
    public static final int HORIZONTAL_RES = 4;
    public static final int IMGKIT_VER = 6;
    public static final int MAX_FRAME_BUFFER_SIZE = 3;
    public static final int MODEL_NUMBER = 1;
    public static final int SDL_VER = 99;
    public static final int SERIAL_NUM = 2;
    public static final int VERTICAL_RES = 5;
  }
  
  static class ReaderInfo
  {
    static final int BCRDR_FACING_BACK = 0;
    static final int BCRDR_FACING_FRONT = 1;
    public int facing;
    public int orientation;
  }
  
  class Size
  {
    public int height;
    public int width;
    
    public Size(int paramInt1, int paramInt2)
    {
      this.width = paramInt1;
      this.height = paramInt2;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof Size)) {}
      do
      {
        return false;
        paramObject = (Size)paramObject;
      } while ((this.width != ((Size)paramObject).width) || (this.height != ((Size)paramObject).height));
      return true;
    }
    
    public int hashCode()
    {
      return this.width * 32713 + this.height;
    }
  }
  
  static abstract interface VideoCallback
  {
    public abstract void onVideoFrame(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte, BarCodeReader paramBarCodeReader);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\zebra\adc\decoder\BarCodeReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */