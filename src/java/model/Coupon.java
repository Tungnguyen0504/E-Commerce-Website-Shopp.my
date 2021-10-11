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
public class Coupon {

    private int couID;
    private String couName;
    private int discountPercent;

    public Coupon() {
    }

    public Coupon(int couID, String couName, int discountPercent) {
        this.couID = couID;
        this.couName = couName;
        this.discountPercent = discountPercent;
    }

    public int getCouID() {
        return couID;
    }

    public void setCouID(int couID) {
        this.couID = couID;
    }

    public String getCouName() {
        return couName;
    }

    public void setCouName(String couName) {
        this.couName = couName;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    @Override
    public String toString() {
        return "Coupon{" + "couID=" + couID + ", couName=" + couName + ", discountPercent=" + discountPercent + '}';
    }

    
}
