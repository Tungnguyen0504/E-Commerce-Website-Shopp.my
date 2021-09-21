/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tungn
 */
public class Camera {
    private int cameraID;
    private String modelNum;
    private String eyeAF;
    private String imageType;
    private String imageSize;
    private String maxFocal;
    private String minFocal;
    private String maxAperture;
    private String effecPixel;
    private String wifiEnabled;

    public Camera() {
    }

    public Camera(int cameraID, String modelNum, String eyeAF, String imageType, String imageSize, String maxFocal, String minFocal, String maxAperture, String effecPixel, String wifiEnabled) {
        this.cameraID = cameraID;
        this.modelNum = modelNum;
        this.eyeAF = eyeAF;
        this.imageType = imageType;
        this.imageSize = imageSize;
        this.maxFocal = maxFocal;
        this.minFocal = minFocal;
        this.maxAperture = maxAperture;
        this.effecPixel = effecPixel;
        this.wifiEnabled = wifiEnabled;
    }

    public int getCameraID() {
        return cameraID;
    }

    public void setCameraID(int cameraID) {
        this.cameraID = cameraID;
    }

    public String getModelNum() {
        return modelNum;
    }

    public void setModelNum(String modelNum) {
        this.modelNum = modelNum;
    }

    public String getEyeAF() {
        return eyeAF;
    }

    public void setEyeAF(String eyeAF) {
        this.eyeAF = eyeAF;
    }

    public String getImageType() {
        return imageType;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }

    public String getImageSize() {
        return imageSize;
    }

    public void setImageSize(String imageSize) {
        this.imageSize = imageSize;
    }

    public String getMaxFocal() {
        return maxFocal;
    }

    public void setMaxFocal(String maxFocal) {
        this.maxFocal = maxFocal;
    }

    public String getMinFocal() {
        return minFocal;
    }

    public void setMinFocal(String minFocal) {
        this.minFocal = minFocal;
    }

    public String getMaxAperture() {
        return maxAperture;
    }

    public void setMaxAperture(String maxAperture) {
        this.maxAperture = maxAperture;
    }

    public String getEffecPixel() {
        return effecPixel;
    }

    public void setEffecPixel(String effecPixel) {
        this.effecPixel = effecPixel;
    }

    public String getWifiEnabled() {
        return wifiEnabled;
    }

    public void setWifiEnabled(String wifiEnabled) {
        this.wifiEnabled = wifiEnabled;
    }

    @Override
    public String toString() {
        return "Camera{" + "cameraID=" + cameraID + ", modelNum=" + modelNum + ", eyeAF=" + eyeAF + ", imageType=" + imageType + ", imageSize=" + imageSize + ", maxFocal=" + maxFocal + ", minFocal=" + minFocal + ", maxAperture=" + maxAperture + ", effecPixel=" + effecPixel + ", wifiEnabled=" + wifiEnabled + '}';
    }
    
}
