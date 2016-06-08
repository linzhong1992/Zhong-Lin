package com.alien.demo.feature.mask;

public class SpecifyInfo
{
    private int arbitraryBank;
    private String arbitraryData;
    private int arbitraryLen;
    private int arbitraryPtr;
    private String epcStartWithData;
    private SpecifyModeEnum specifyMode;
    
    public SpecifyInfo() {
        this.specifyMode = SpecifyModeEnum.START_WITH_EPC;
        this.epcStartWithData = "";
        this.arbitraryBank = 1;
        this.arbitraryPtr = 0;
        this.arbitraryLen = 0;
        this.arbitraryData = "";
    }
    
    public int getArbitraryBank() {
        return this.arbitraryBank;
    }
    
    public String getArbitraryData() {
        return this.arbitraryData;
    }
    
    public int getArbitraryLen() {
        return this.arbitraryLen;
    }
    
    public int getArbitraryPtr() {
        return this.arbitraryPtr;
    }
    
    public String getEpcStartWithData() {
        return this.epcStartWithData;
    }
    
    public SpecifyModeEnum getSpecifyMode() {
        return this.specifyMode;
    }
    
    public void setArbitraryBank(final int arbitraryBank) {
        this.arbitraryBank = arbitraryBank;
    }
    
    public void setArbitraryData(final String arbitraryData) {
        this.arbitraryData = arbitraryData;
    }
    
    public void setArbitraryLen(final int arbitraryLen) {
        this.arbitraryLen = arbitraryLen;
    }
    
    public void setArbitraryPtr(final int arbitraryPtr) {
        this.arbitraryPtr = arbitraryPtr;
    }
    
    public void setEpcStartWithData(final String epcStartWithData) {
        this.epcStartWithData = epcStartWithData;
    }
    
    public void setSpecifyMode(final SpecifyModeEnum specifyMode) {
        this.specifyMode = specifyMode;
    }
    
    public enum SpecifyModeEnum
    {
        ARBITRATY(1), 
        START_WITH_EPC(0);
        
        private final int value;
        
        private SpecifyModeEnum(final int value) {
            this.value = value;
        }
        
        public static SpecifyModeEnum fromInt(final int n) {
            switch (n) {
                default: {
                    return SpecifyModeEnum.START_WITH_EPC;
                }
                case 1: {
                    return SpecifyModeEnum.ARBITRATY;
                }
            }
        }
        
        public int getValue() {
            return this.value;
        }
    }
}
