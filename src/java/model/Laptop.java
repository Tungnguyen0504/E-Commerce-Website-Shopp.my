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
public class Laptop {
    private int laptopID;
    private String memorySize;
    private String cpuModel;
    private String cpuSpeed;
    private String displayR;
    private String screenSize;
    private String itemWeight;
    private String graphic;
    private String os;
    private String ramType;

    public Laptop() {
    }

    public Laptop(int laptopID, String memorySize, String cpuModel, String cpuSpeed, String displayR, String screenSize, String itemWeight, String graphic, String os, String ramType) {
        this.laptopID = laptopID;
        this.memorySize = memorySize;
        this.cpuModel = cpuModel;
        this.cpuSpeed = cpuSpeed;
        this.displayR = displayR;
        this.screenSize = screenSize;
        this.itemWeight = itemWeight;
        this.graphic = graphic;
        this.os = os;
        this.ramType = ramType;
    }

    public int getLaptopID() {
        return laptopID;
    }

    public void setLaptopID(int laptopID) {
        this.laptopID = laptopID;
    }

    public String getMemorySize() {
        return memorySize;
    }

    public void setMemorySize(String memorySize) {
        this.memorySize = memorySize;
    }

    public String getCpuModel() {
        return cpuModel;
    }

    public void setCpuModel(String cpuModel) {
        this.cpuModel = cpuModel;
    }

    public String getCpuSpeed() {
        return cpuSpeed;
    }

    public void setCpuSpeed(String cpuSpeed) {
        this.cpuSpeed = cpuSpeed;
    }

    public String getDisplayR() {
        return displayR;
    }

    public void setDisplayR(String displayR) {
        this.displayR = displayR;
    }

    public String getScreenSize() {
        return screenSize;
    }

    public void setScreenSize(String screenSize) {
        this.screenSize = screenSize;
    }

    public String getItemWeight() {
        return itemWeight;
    }

    public void setItemWeight(String itemWeight) {
        this.itemWeight = itemWeight;
    }

    public String getGraphic() {
        return graphic;
    }

    public void setGraphic(String graphic) {
        this.graphic = graphic;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getRamType() {
        return ramType;
    }

    public void setRamType(String ramType) {
        this.ramType = ramType;
    }

    @Override
    public String toString() {
        return "Laptop{" + "laptopID=" + laptopID + ", memorySize=" + memorySize + ", cpuModel=" + cpuModel + ", cpuSpeed=" + cpuSpeed + ", displayR=" + displayR + ", screenSize=" + screenSize + ", itemWeight=" + itemWeight + ", graphic=" + graphic + ", os=" + os + ", ramType=" + ramType + '}';
    }
}
