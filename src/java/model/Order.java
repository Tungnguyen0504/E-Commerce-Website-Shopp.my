/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author tungn
 */
public class Order {

    private int orderID;
    private int userID;
    private String payment;
    private Timestamp orderDate;
    private double total;
    private int billStatus;
    User u;

    public Order() {
    }

    public Order(int orderID, int userID, String payment, Timestamp orderDate, double total, int billStatus, User u) {
        this.orderID = orderID;
        this.userID = userID;
        this.payment = payment;
        this.orderDate = orderDate;
        this.total = total;
        this.billStatus = billStatus;
        this.u = u;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderDateFormat() {
        SimpleDateFormat df = new SimpleDateFormat("MMMM dd, yyyy");
        return df.format(orderDate);
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getBillStatus() {
        return billStatus;
    }

    public void setBillStatus(int billStatus) {
        this.billStatus = billStatus;
    }

    public User getU() {
        return u;
    }

    public void setU(User u) {
        this.u = u;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", userID=" + userID + ", payment=" + payment + ", orderDate=" + orderDate + ", total=" + total + ", billStatus=" + billStatus + ", u=" + u + '}';
    }

}
