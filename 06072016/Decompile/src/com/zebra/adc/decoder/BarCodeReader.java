package com.zebra.adc.decoder;

import java.lang.ref.*;
import android.content.*;
import android.view.*;
import android.os.*;
import android.util.*;
import java.util.*;
import java.io.*;

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
    private AutoFocusCallback mAutoFocusCallback;
    private DecodeCallback mDecodeCallback;
    private ErrorCallback mErrorCallback;
    private EventHandler mEventHandler;
    private int mNativeContext;
    private boolean mOneShot;
    private PreviewCallback mPreviewCallback;
    private PictureCallback mSnapshotCallback;
    private VideoCallback mVideoCallback;
    private boolean mWithBuffer;
    private OnZoomChangeListener mZoomListener;
    
    BarCodeReader(final int n) {
        this.mEventHandler = null;
        this.mAutoFocusCallback = null;
        this.mDecodeCallback = null;
        this.mErrorCallback = null;
        this.mPreviewCallback = null;
        this.mSnapshotCallback = null;
        this.mVideoCallback = null;
        this.mZoomListener = null;
        Looper looper;
        if ((looper = Looper.myLooper()) == null) {
            looper = Looper.getMainLooper();
        }
        if (looper != null) {
            this.mEventHandler = new EventHandler(this, looper);
        }
        this.native_setup(new WeakReference(this), n);
    }
    
    BarCodeReader(final int n, final Context context) {
        this.mEventHandler = null;
        this.mAutoFocusCallback = null;
        this.mDecodeCallback = null;
        this.mErrorCallback = null;
        this.mPreviewCallback = null;
        this.mSnapshotCallback = null;
        this.mVideoCallback = null;
        this.mZoomListener = null;
        Looper looper;
        if ((looper = Looper.myLooper()) == null) {
            looper = Looper.getMainLooper();
        }
        if (looper != null) {
            this.mEventHandler = new EventHandler(this, looper);
        }
        this.native_setup(new WeakReference(this), n, context);
    }
    
    static /* synthetic */ void access$5(final BarCodeReader barCodeReader, final PreviewCallback mPreviewCallback) {
        barCodeReader.mPreviewCallback = mPreviewCallback;
    }
    
    static native int getNumberOfReaders();
    
    static native void getReaderInfo(final int p0, final ReaderInfo p1);
    
    private final native void native_autoFocus();
    
    private final native void native_cancelAutoFocus();
    
    private final native String native_getParameters();
    
    private final native void native_release();
    
    private final native void native_setParameters(final String p0);
    
    private final native void native_setup(final Object p0, final int p1);
    
    private final native void native_setup(final Object p0, final int p1, final Object p2);
    
    private final native void native_startPreview(final int p0);
    
    private final native void native_takePicture();
    
    static BarCodeReader open() {
        int n;
        while (true) {
            while (true) {
                ReaderInfo readerInfo;
                try {
                    final int numberOfReaders = getNumberOfReaders();
                    readerInfo = new ReaderInfo();
                    n = 0;
                    if (n >= numberOfReaders) {
                        return null;
                    }
                }
                catch (Exception ex) {
                    ex.printStackTrace();
                    return null;
                }
                getReaderInfo(n, readerInfo);
                if (readerInfo.facing == 1) {
                    break;
                }
                ++n;
                continue;
            }
        }
        return new BarCodeReader(n);
    }
    
    static BarCodeReader open(final int n) {
        return new BarCodeReader(n);
    }
    
    static BarCodeReader open(final int n, final Context context) {
        return new BarCodeReader(n, context);
    }
    
    static BarCodeReader open(final Context context) {
        int n;
        while (true) {
            while (true) {
                ReaderInfo readerInfo;
                try {
                    final int numberOfReaders = getNumberOfReaders();
                    readerInfo = new ReaderInfo();
                    n = 0;
                    if (n >= numberOfReaders) {
                        return null;
                    }
                }
                catch (Exception ex) {
                    ex.printStackTrace();
                    return null;
                }
                getReaderInfo(n, readerInfo);
                if (readerInfo.facing == 1) {
                    break;
                }
                ++n;
                continue;
            }
        }
        return new BarCodeReader(n, context);
    }
    
    private static void postEventFromNative(final Object o, final int n, final int n2, final int n3, final Object o2) {
        final BarCodeReader barCodeReader = (BarCodeReader)((WeakReference)o).get();
        if (barCodeReader != null && barCodeReader.mEventHandler != null) {
            barCodeReader.mEventHandler.sendMessage(barCodeReader.mEventHandler.obtainMessage(n, n2, n3, o2));
        }
    }
    
    private final native void setHasPreviewCallback(final boolean p0, final boolean p1);
    
    private final native int setNumParameter(final int p0, final int p1);
    
    private final native void setPreviewDisplay(final Surface p0);
    
    private final native int setStrParameter(final int p0, final String p1);
    
    public final native int FWUpdate(final String p0, final boolean p1, final boolean p2);
    
    public final native void addCallbackBuffer(final byte[] p0);
    
    public final void autoFocus(final AutoFocusCallback mAutoFocusCallback) {
        this.mAutoFocusCallback = mAutoFocusCallback;
        this.native_autoFocus();
    }
    
    public final void cancelAutoFocus() {
        this.mAutoFocusCallback = null;
        this.native_cancelAutoFocus();
    }
    
    public final native void disableAllCodeTypes();
    
    public final native void enableAllCodeTypes();
    
    @Override
    protected void finalize() {
        this.native_release();
    }
    
    public final native int getDecodeCount();
    
    public final native byte[] getLastDecImage();
    
    public final native int getNumParameter(final int p0);
    
    public final native int getNumProperty(final int p0);
    
    public Parameters getParameters() {
        final Parameters parameters = new Parameters((Parameters)null);
        parameters.unflatten(this.native_getParameters());
        return parameters;
    }
    
    public final native String getStrParameter(final int p0);
    
    public final native String getStrProperty(final int p0);
    
    public final native void lock();
    
    public final native boolean previewEnabled();
    
    public final native void reconnect() throws IOException;
    
    public final void release() {
        this.native_release();
    }
    
    public final native void setAutoFocusDelay(final int p0, final int p1);
    
    public final void setDecodeCallback(final DecodeCallback mDecodeCallback) {
        this.mDecodeCallback = mDecodeCallback;
    }
    
    public final native void setDefaultParameters();
    
    public final native void setDisplayOrientation(final int p0);
    
    public final void setErrorCallback(final ErrorCallback mErrorCallback) {
        this.mErrorCallback = mErrorCallback;
    }
    
    public final void setOneShotPreviewCallback(final PreviewCallback mPreviewCallback) {
        boolean b = true;
        this.mPreviewCallback = mPreviewCallback;
        this.mOneShot = true;
        this.mWithBuffer = false;
        if (mPreviewCallback == null) {
            b = false;
        }
        this.setHasPreviewCallback(b, false);
    }
    
    public final int setParameter(final int n, final int n2) {
        return this.setNumParameter(n, n2);
    }
    
    public final int setParameter(final int n, final String s) {
        return this.setStrParameter(n, s);
    }
    
    public void setParameters(final Parameters parameters) {
        this.native_setParameters(parameters.flatten());
    }
    
    public final void setPreviewCallbackWithBuffer(final PreviewCallback mPreviewCallback) {
        boolean b = false;
        this.mPreviewCallback = mPreviewCallback;
        this.mOneShot = false;
        this.mWithBuffer = true;
        if (mPreviewCallback != null) {
            b = true;
        }
        this.setHasPreviewCallback(b, true);
    }
    
    public final void setPreviewDisplay(final SurfaceHolder surfaceHolder) throws IOException {
        if (surfaceHolder != null) {
            this.setPreviewDisplay(surfaceHolder.getSurface());
            return;
        }
        this.setPreviewDisplay((Surface)null);
    }
    
    public final void setZoomChangeListener(final OnZoomChangeListener mZoomListener) {
        this.mZoomListener = mZoomListener;
    }
    
    public final native void startDecode();
    
    public final native int startHandsFreeDecode(final int p0);
    
    public final void startPreview() {
        this.native_startPreview(1);
    }
    
    public final native void startSmoothZoom(final int p0);
    
    public final void startVideoCapture(final VideoCallback mVideoCallback) {
        this.mVideoCallback = mVideoCallback;
        this.native_startPreview(3);
    }
    
    public final void startViewFinder(final VideoCallback mVideoCallback) {
        this.mVideoCallback = mVideoCallback;
        this.native_startPreview(2);
    }
    
    public final native void stopDecode();
    
    public final native void stopPreview();
    
    public final native void stopSmoothZoom();
    
    public final void takePicture(final PictureCallback mSnapshotCallback) {
        this.mSnapshotCallback = mSnapshotCallback;
        try {
            this.native_takePicture();
        }
        catch (Throwable t) {}
    }
    
    public final native void unlock();
    
    interface AutoFocusCallback
    {
        void onAutoFocus(final boolean p0, final BarCodeReader p1);
    }
    
    interface DecodeCallback
    {
        void onDecodeComplete(final int p0, final int p1, final byte[] p2, final BarCodeReader p3);
        
        void onEvent(final int p0, final int p1, final byte[] p2, final BarCodeReader p3);
    }
    
    interface ErrorCallback
    {
        void onError(final int p0, final BarCodeReader p1);
    }
    
    private class EventHandler extends Handler
    {
        private BarCodeReader mReader;
        
        public EventHandler(final BarCodeReader mReader, final Looper looper) {
            super(looper);
            this.mReader = mReader;
        }
        
        public void handleMessage(final Message message) {
            final boolean b = true;
            boolean b2 = true;
            Log.v("BarCodeReader", String.format("Event message: %X, arg1=%d, arg2=%d", message.what, message.arg1, message.arg2));
            switch (message.what) {
                default: {
                    Log.e("BarCodeReader", "Unknown message type " + message.what);
                }
                case 2: {}
                case 65536: {
                    if (BarCodeReader.this.mDecodeCallback != null) {
                        BarCodeReader.this.mDecodeCallback.onDecodeComplete(message.arg1, message.arg2, (byte[])message.obj, this.mReader);
                    }
                }
                case 131072: {
                    if (BarCodeReader.this.mDecodeCallback != null) {
                        BarCodeReader.this.mDecodeCallback.onDecodeComplete(0, 0, (byte[])message.obj, this.mReader);
                    }
                }
                case 262144: {
                    if (BarCodeReader.this.mDecodeCallback != null) {
                        BarCodeReader.this.mDecodeCallback.onDecodeComplete(0, -1, (byte[])message.obj, this.mReader);
                    }
                }
                case 524288:
                case 2097152: {
                    if (BarCodeReader.this.mDecodeCallback != null) {
                        BarCodeReader.this.mDecodeCallback.onDecodeComplete(0, -2, (byte[])message.obj, this.mReader);
                    }
                }
                case 1048576: {
                    if (BarCodeReader.this.mDecodeCallback != null) {
                        BarCodeReader.this.mDecodeCallback.onEvent(message.arg1, message.arg2, (byte[])message.obj, this.mReader);
                    }
                }
                case 256: {
                    if (BarCodeReader.this.mSnapshotCallback != null) {
                        BarCodeReader.this.mSnapshotCallback.onPictureTaken(message.arg2, message.arg1 & 0xFFFF, message.arg1 >> 16 & 0xFFFF, (byte[])message.obj, this.mReader);
                        return;
                    }
                    Log.e("BarCodeReader", "BCRDR_MSG_COMPRESSED_IMAGE event with no snapshot callback");
                }
                case 32: {
                    if (BarCodeReader.this.mVideoCallback != null) {
                        BarCodeReader.this.mVideoCallback.onVideoFrame(message.arg2, message.arg1 & 0xFFFF, message.arg1 >> 16 & 0xFFFF, (byte[])message.obj, this.mReader);
                        return;
                    }
                    Log.e("BarCodeReader", "BCRDR_MSG_VIDEO_FRAME event with no video callback");
                }
                case 16: {
                    if (BarCodeReader.this.mPreviewCallback != null) {
                        final PreviewCallback access$3 = BarCodeReader.this.mPreviewCallback;
                        if (BarCodeReader.this.mOneShot) {
                            BarCodeReader.access$5(BarCodeReader.this, null);
                        }
                        else if (!BarCodeReader.this.mWithBuffer) {
                            BarCodeReader.this.setHasPreviewCallback(true, false);
                        }
                        access$3.onPreviewFrame((byte[])message.obj, this.mReader);
                    }
                }
                case 4: {
                    if (BarCodeReader.this.mAutoFocusCallback != null) {
                        final AutoFocusCallback access$4 = BarCodeReader.this.mAutoFocusCallback;
                        if (message.arg1 == 0) {
                            b2 = false;
                        }
                        access$4.onAutoFocus(b2, this.mReader);
                    }
                }
                case 8: {
                    if (BarCodeReader.this.mZoomListener != null) {
                        BarCodeReader.this.mZoomListener.onZoomChange(message.arg1, message.arg2 != 0 && b, this.mReader);
                    }
                }
                case 1: {
                    Log.e("BarCodeReader", "Error " + message.arg1);
                    if (BarCodeReader.this.mErrorCallback != null) {
                        BarCodeReader.this.mErrorCallback.onError(message.arg1, this.mReader);
                    }
                }
                case 1024: {
                    if (BarCodeReader.this.mDecodeCallback != null) {
                        BarCodeReader.this.mDecodeCallback.onDecodeComplete(message.arg1, -3, (byte[])message.obj, this.mReader);
                    }
                }
            }
        }
    }
    
    interface OnZoomChangeListener
    {
        void onZoomChange(final int p0, final boolean p1, final BarCodeReader p2);
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
        private HashMap mMap;
        
        private Parameters() {
            this.mMap = new HashMap();
        }
        
        private float getFloat(final String s, final float n) {
            try {
                return Float.parseFloat(this.mMap.get(s));
            }
            catch (Throwable t) {
                return n;
            }
        }
        
        private int getInt(final String s, final int n) {
            try {
                return Integer.parseInt(this.mMap.get(s));
            }
            catch (Throwable t) {
                return n;
            }
        }
        
        private int pixelFormatForReaderFormat(final String s) {
            if (s != null) {
                if (s.equals("yuv422sp")) {
                    return 16;
                }
                if (s.equals("yuv420sp")) {
                    return 17;
                }
                if (s.equals("yuv422i-yuyv")) {
                    return 20;
                }
                if (s.equals("rgb565")) {
                    return 4;
                }
                if (s.equals("jpeg")) {
                    return 256;
                }
            }
            return 0;
        }
        
        private String readerFormatForPixelFormat(final int n) {
            switch (n) {
                default: {
                    return null;
                }
                case 16: {
                    return "yuv422sp";
                }
                case 17: {
                    return "yuv420sp";
                }
                case 20: {
                    return "yuv422i-yuyv";
                }
                case 4: {
                    return "rgb565";
                }
                case 256: {
                    return "jpeg";
                }
            }
        }
        
        private ArrayList split(final String s) {
            ArrayList<String> list;
            if (s == null) {
                list = null;
            }
            else {
                final StringTokenizer stringTokenizer = new StringTokenizer(s, ",");
                final ArrayList<String> list2 = new ArrayList<String>();
                while (true) {
                    list = list2;
                    if (!stringTokenizer.hasMoreElements()) {
                        break;
                    }
                    list2.add(stringTokenizer.nextToken());
                }
            }
            return list;
        }
        
        private void splitFloat(final String s, final float[] array) {
            if (s != null) {
                final StringTokenizer stringTokenizer = new StringTokenizer(s, ",");
                int n = 0;
                while (stringTokenizer.hasMoreElements()) {
                    array[n] = Float.parseFloat(stringTokenizer.nextToken());
                    ++n;
                }
            }
        }
        
        private ArrayList splitInt(final String s) {
            if (s != null) {
                final StringTokenizer stringTokenizer = new StringTokenizer(s, ",");
                final ArrayList<Integer> list = new ArrayList<Integer>();
                while (stringTokenizer.hasMoreElements()) {
                    list.add(Integer.parseInt(stringTokenizer.nextToken()));
                }
                if (list.size() != 0) {
                    return list;
                }
            }
            return null;
        }
        
        private void splitInt(final String s, final int[] array) {
            if (s != null) {
                final StringTokenizer stringTokenizer = new StringTokenizer(s, ",");
                int n = 0;
                while (stringTokenizer.hasMoreElements()) {
                    array[n] = Integer.parseInt(stringTokenizer.nextToken());
                    ++n;
                }
            }
        }
        
        private ArrayList splitRange(final String s) {
            if (s == null || s.charAt(0) != '(' || s.charAt(s.length() - 1) != ')') {
                Log.e("BarCodeReader", "Invalid range list string=" + s);
                return null;
            }
            final ArrayList<int[]> list = new ArrayList<int[]>();
            int n = 1;
            int i;
            do {
                final int[] array = new int[2];
                if ((i = s.indexOf("),(", n)) == -1) {
                    i = s.length() - 1;
                }
                this.splitInt(s.substring(n, i), array);
                list.add(array);
                n = i + 3;
            } while (i != s.length() - 1);
            if (list.size() == 0) {
                return null;
            }
            return list;
        }
        
        private ArrayList splitSize(final String s) {
            if (s != null) {
                final StringTokenizer stringTokenizer = new StringTokenizer(s, ",");
                final ArrayList<Size> list = new ArrayList<Size>();
                while (stringTokenizer.hasMoreElements()) {
                    final Size strToSize = this.strToSize(stringTokenizer.nextToken());
                    if (strToSize != null) {
                        list.add(strToSize);
                    }
                }
                if (list.size() != 0) {
                    return list;
                }
            }
            return null;
        }
        
        private Size strToSize(String substring) {
            if (substring == null) {
                return null;
            }
            final int index = substring.indexOf(120);
            if (index != -1) {
                final String substring2 = substring.substring(0, index);
                substring = substring.substring(index + 1);
                return new Size(Integer.parseInt(substring2), Integer.parseInt(substring));
            }
            Log.e("BarCodeReader", "Invalid size parameter string=" + substring);
            return null;
        }
        
        public void dump() {
            Log.e("BarCodeReader", "dump: size=" + this.mMap.size());
            for (final String s : this.mMap.keySet()) {
                Log.e("BarCodeReader", "dump: " + s + "=" + (String)this.mMap.get(s));
            }
        }
        
        public String flatten() {
            final StringBuilder sb = new StringBuilder();
            for (final String s : this.mMap.keySet()) {
                sb.append(s);
                sb.append("=");
                sb.append((String)this.mMap.get(s));
                sb.append(";");
            }
            sb.deleteCharAt(sb.length() - 1);
            return sb.toString();
        }
        
        public String get(final String s) {
            return this.mMap.get(s);
        }
        
        public String getAntibanding() {
            return this.get("antibanding");
        }
        
        public String getColorEffect() {
            return this.get("effect");
        }
        
        public int getExposureCompensation() {
            return this.getInt("exposure-compensation", 0);
        }
        
        public float getExposureCompensationStep() {
            return this.getFloat("exposure-compensation-step", 0.0f);
        }
        
        public String getFlashMode() {
            return this.get("flash-mode");
        }
        
        public float getFocalLength() {
            return Float.parseFloat(this.get("focal-length"));
        }
        
        public void getFocusDistances(final float[] array) {
            if (array == null || array.length != 3) {
                throw new IllegalArgumentException("output must be an float array with three elements.");
            }
            this.splitFloat(this.get("focus-distances"), array);
        }
        
        public String getFocusMode() {
            return this.get("focus-mode");
        }
        
        public float getHorizontalViewAngle() {
            return Float.parseFloat(this.get("horizontal-view-angle"));
        }
        
        public int getInt(final String s) {
            return this.getInt(s, -1);
        }
        
        public int getJpegQuality() {
            return this.getInt("jpeg-quality");
        }
        
        public int getJpegThumbnailQuality() {
            return this.getInt("jpeg-thumbnail-quality");
        }
        
        public Size getJpegThumbnailSize() {
            return new Size(this.getInt("jpeg-thumbnail-width"), this.getInt("jpeg-thumbnail-height"));
        }
        
        public int getMaxExposureCompensation() {
            return this.getInt("max-exposure-compensation", 0);
        }
        
        public int getMaxZoom() {
            return this.getInt("max-zoom", 0);
        }
        
        public int getMinExposureCompensation() {
            return this.getInt("min-exposure-compensation", 0);
        }
        
        public int getPictureFormat() {
            return this.pixelFormatForReaderFormat(this.get("picture-format"));
        }
        
        public Size getPictureSize() {
            return this.strToSize(this.get("picture-size"));
        }
        
        public int getPreviewFormat() {
            return this.pixelFormatForReaderFormat(this.get("preview-format"));
        }
        
        public void getPreviewFpsRange(final int[] array) {
            if (array == null || array.length != 2) {
                throw new IllegalArgumentException("range must be an array with two elements.");
            }
            this.splitInt(this.get("preview-fps-range"), array);
        }
        
        @Deprecated
        public int getPreviewFrameRate() {
            return this.getInt("preview-frame-rate");
        }
        
        public Size getPreviewSize() {
            return this.strToSize(this.get("preview-size"));
        }
        
        public String getSceneMode() {
            return this.get("scene-mode");
        }
        
        public List getSupportedAntibanding() {
            return this.split(this.get("antibanding-values"));
        }
        
        public List getSupportedColorEffects() {
            return this.split(this.get("effect-values"));
        }
        
        public List getSupportedFlashModes() {
            return this.split(this.get("flash-mode-values"));
        }
        
        public List getSupportedFocusModes() {
            return this.split(this.get("focus-mode-values"));
        }
        
        public List getSupportedJpegThumbnailSizes() {
            return this.splitSize(this.get("jpeg-thumbnail-size-values"));
        }
        
        public List getSupportedPictureFormats() {
            final String value = this.get("picture-format-values");
            final ArrayList<Integer> list = new ArrayList<Integer>();
            final Iterator iterator = this.split(value).iterator();
            while (iterator.hasNext()) {
                final int pixelFormatForReaderFormat = this.pixelFormatForReaderFormat(iterator.next());
                if (pixelFormatForReaderFormat != 0) {
                    list.add(pixelFormatForReaderFormat);
                }
            }
            return list;
        }
        
        public List getSupportedPictureSizes() {
            return this.splitSize(this.get("picture-size-values"));
        }
        
        public List getSupportedPreviewFormats() {
            final String value = this.get("preview-format-values");
            final ArrayList<Integer> list = new ArrayList<Integer>();
            final Iterator iterator = this.split(value).iterator();
            while (iterator.hasNext()) {
                final int pixelFormatForReaderFormat = this.pixelFormatForReaderFormat(iterator.next());
                if (pixelFormatForReaderFormat != 0) {
                    list.add(pixelFormatForReaderFormat);
                }
            }
            return list;
        }
        
        public List getSupportedPreviewFpsRange() {
            return this.splitRange(this.get("preview-fps-range-values"));
        }
        
        @Deprecated
        public List getSupportedPreviewFrameRates() {
            return this.splitInt(this.get("preview-frame-rate-values"));
        }
        
        public List getSupportedPreviewSizes() {
            return this.splitSize(this.get("preview-size-values"));
        }
        
        public List getSupportedSceneModes() {
            return this.split(this.get("scene-mode-values"));
        }
        
        public List getSupportedWhiteBalance() {
            return this.split(this.get("whitebalance-values"));
        }
        
        public float getVerticalViewAngle() {
            return Float.parseFloat(this.get("vertical-view-angle"));
        }
        
        public String getWhiteBalance() {
            return this.get("whitebalance");
        }
        
        public int getZoom() {
            return this.getInt("zoom", 0);
        }
        
        public List getZoomRatios() {
            return this.splitInt(this.get("zoom-ratios"));
        }
        
        public boolean isSmoothZoomSupported() {
            return "true".equals(this.get("smooth-zoom-supported"));
        }
        
        public boolean isZoomSupported() {
            return "true".equals(this.get("zoom-supported"));
        }
        
        public void remove(final String s) {
            this.mMap.remove(s);
        }
        
        public void removeGpsData() {
            this.remove("gps-latitude");
            this.remove("gps-longitude");
            this.remove("gps-altitude");
            this.remove("gps-timestamp");
            this.remove("gps-processing-method");
        }
        
        public void set(final String s, final int n) {
            if (s.indexOf(61) != -1 || s.indexOf(59) != -1) {
                Log.e("BarCodeReader", "Key \"" + s + "\" contains invalid character (= or ;)");
                return;
            }
            this.mMap.put(s, Integer.toString(n));
        }
        
        public void set(final String s, final String s2) {
            if (s.indexOf(61) != -1 || s.indexOf(59) != -1) {
                Log.e("BarCodeReader", "Key \"" + s + "\" contains invalid character (= or ;)");
                return;
            }
            if (s2.indexOf(61) != -1 || s2.indexOf(59) != -1) {
                Log.e("BarCodeReader", "Value \"" + s2 + "\" contains invalid character (= or ;)");
                return;
            }
            this.mMap.put(s, s2);
        }
        
        public void setAntibanding(final String s) {
            this.set("antibanding", s);
        }
        
        public void setColorEffect(final String s) {
            this.set("effect", s);
        }
        
        public void setExposureCompensation(final int n) {
            this.set("exposure-compensation", n);
        }
        
        public void setFlashMode(final String s) {
            this.set("flash-mode", s);
        }
        
        public void setFocusMode(final String s) {
            this.set("focus-mode", s);
        }
        
        public void setGpsAltitude(final double n) {
            this.set("gps-altitude", Double.toString(n));
        }
        
        public void setGpsLatitude(final double n) {
            this.set("gps-latitude", Double.toString(n));
        }
        
        public void setGpsLongitude(final double n) {
            this.set("gps-longitude", Double.toString(n));
        }
        
        public void setGpsProcessingMethod(final String s) {
            this.set("gps-processing-method", s);
        }
        
        public void setGpsTimestamp(final long n) {
            this.set("gps-timestamp", Long.toString(n));
        }
        
        public void setJpegQuality(final int n) {
            this.set("jpeg-quality", n);
        }
        
        public void setJpegThumbnailQuality(final int n) {
            this.set("jpeg-thumbnail-quality", n);
        }
        
        public void setJpegThumbnailSize(final int n, final int n2) {
            this.set("jpeg-thumbnail-width", n);
            this.set("jpeg-thumbnail-height", n2);
        }
        
        public void setPictureFormat(final int n) {
            final String readerFormatForPixelFormat = this.readerFormatForPixelFormat(n);
            if (readerFormatForPixelFormat == null) {
                throw new IllegalArgumentException("Invalid pixel_format=" + n);
            }
            this.set("picture-format", readerFormatForPixelFormat);
        }
        
        public void setPictureSize(final int n, final int n2) {
            this.set("picture-size", String.valueOf(Integer.toString(n)) + "x" + Integer.toString(n2));
        }
        
        public void setPreviewFormat(final int n) {
            final String readerFormatForPixelFormat = this.readerFormatForPixelFormat(n);
            if (readerFormatForPixelFormat == null) {
                throw new IllegalArgumentException("Invalid pixel_format=" + n);
            }
            this.set("preview-format", readerFormatForPixelFormat);
        }
        
        public void setPreviewFpsRange(final int n, final int n2) {
            this.set("preview-fps-range", n + "," + n2);
        }
        
        @Deprecated
        public void setPreviewFrameRate(final int n) {
            this.set("preview-frame-rate", n);
        }
        
        public void setPreviewSize(final int n, final int n2) {
            this.set("preview-size", String.valueOf(Integer.toString(n)) + "x" + Integer.toString(n2));
        }
        
        public void setRotation(final int n) {
            if (n == 0 || n == 90 || n == 180 || n == 270) {
                this.set("rotation", Integer.toString(n));
                return;
            }
            throw new IllegalArgumentException("Invalid rotation=" + n);
        }
        
        public void setSceneMode(final String s) {
            this.set("scene-mode", s);
        }
        
        public void setWhiteBalance(final String s) {
            this.set("whitebalance", s);
        }
        
        public void setZoom(final int n) {
            this.set("zoom", n);
        }
        
        public void unflatten(final String s) {
            this.mMap.clear();
            final StringTokenizer stringTokenizer = new StringTokenizer(s, ";");
            while (stringTokenizer.hasMoreElements()) {
                final String nextToken = stringTokenizer.nextToken();
                final int index = nextToken.indexOf(61);
                if (index != -1) {
                    this.mMap.put(nextToken.substring(0, index), nextToken.substring(index + 1));
                }
            }
        }
    }
    
    interface PictureCallback
    {
        void onPictureTaken(final int p0, final int p1, final int p2, final byte[] p3, final BarCodeReader p4);
    }
    
    interface PreviewCallback
    {
        void onPreviewFrame(final byte[] p0, final BarCodeReader p1);
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
        
        public Size(final int width, final int height) {
            this.width = width;
            this.height = height;
        }
        
        @Override
        public boolean equals(final Object o) {
            if (o instanceof Size) {
                final Size size = (Size)o;
                if (this.width == size.width && this.height == size.height) {
                    return true;
                }
            }
            return false;
        }
        
        @Override
        public int hashCode() {
            return this.width * 32713 + this.height;
        }
    }
    
    interface VideoCallback
    {
        void onVideoFrame(final int p0, final int p1, final int p2, final byte[] p3, final BarCodeReader p4);
    }
}
