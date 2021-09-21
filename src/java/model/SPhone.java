/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class SPhone {
    private int sphoneID;
    private String screen;
    private String OS;
    private String rearCam;
    private String frontCam;
    private String cpu;
    private String ram;
    private String IMemory;
    private String sim;
    private String battery;

    public SPhone() {
    }

    public SPhone(int sphoneID, String screen, String OS, String rearCam, String frontCam, String cpu, String ram, String IMemory, String sim, String battery) {
        this.sphoneID = sphoneID;
        this.screen = screen;
        this.OS = OS;
        this.rearCam = rearCam;
        this.frontCam = frontCam;
        this.cpu = cpu;
        this.ram = ram;
        this.IMemory = IMemory;
        this.sim = sim;
        this.battery = battery;
    }

    public int getSphoneID() {
        return sphoneID;
    }

    public void setSphoneID(int sphoneID) {
        this.sphoneID = sphoneID;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getRearCam() {
        return rearCam;
    }

    public void setRearCam(String rearCam) {
        this.rearCam = rearCam;
    }

    public String getFrontCam() {
        return frontCam;
    }

    public void setFrontCam(String frontCam) {
        this.frontCam = frontCam;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getIMemory() {
        return IMemory;
    }

    public void setIMemory(String IMemory) {
        this.IMemory = IMemory;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    @Override
    public String toString() {
        return "SPhone{" + "sphoneID=" + sphoneID + ", screen=" + screen + ", OS=" + OS + ", rearCam=" + rearCam + ", frontCam=" + frontCam + ", cpu=" + cpu + ", ram=" + ram + ", IMemory=" + IMemory + ", sim=" + sim + ", battery=" + battery + '}';
    }
    
}
