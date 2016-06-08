package com.alien.demo.feature.mask;

public class MaskInfo
{
    private AssetsInfo assetsInfo;
    private MaskModeEnum maskMode;
    private PresetsInfo presetsInfo;
    private ScanInfo scanInfo;
    private SpecifyInfo specifyInfo;
    
    public MaskInfo() {
        this.maskMode = MaskModeEnum.SCAN;
        this.scanInfo = new ScanInfo();
        this.specifyInfo = new SpecifyInfo();
        this.presetsInfo = new PresetsInfo();
        this.assetsInfo = new AssetsInfo();
    }
    
    public AssetsInfo getAssetsInfo() {
        return this.assetsInfo;
    }
    
    public MaskModeEnum getMaskMode() {
        return this.maskMode;
    }
    
    public PresetsInfo getPresetsInfo() {
        return this.presetsInfo;
    }
    
    public ScanInfo getScanInfo() {
        return this.scanInfo;
    }
    
    public SpecifyInfo getSpecifyInfo() {
        return this.specifyInfo;
    }
    
    public void setMaskMode(final MaskModeEnum maskMode) {
        this.maskMode = maskMode;
    }
    
    public enum MaskModeEnum
    {
        ASSETS(3), 
        PRESET(2), 
        SCAN(0), 
        SPECIFY(1);
        
        private final int value;
        
        private MaskModeEnum(final int value) {
            this.value = value;
        }
        
        public static MaskModeEnum fromInt(final int n) {
            switch (n) {
                default: {
                    return MaskModeEnum.SCAN;
                }
                case 1: {
                    return MaskModeEnum.SPECIFY;
                }
                case 2: {
                    return MaskModeEnum.PRESET;
                }
                case 3: {
                    return MaskModeEnum.ASSETS;
                }
            }
        }
        
        public int getValue() {
            return this.value;
        }
    }
}
