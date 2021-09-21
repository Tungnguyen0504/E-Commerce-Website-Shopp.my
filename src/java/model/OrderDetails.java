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
public class OrderDetails {

    private int OrderDetailID;
    private int orderID;
    private int productID;
    private int odQuantity;
    private double subTotal;

    public OrderDetails() {
    }

    public OrderDetails(int OrderDetailID, int orderID, int productID, int odQuantity, double subTotal) {
        this.OrderDetailID = OrderDetailID;
        this.orderID = orderID;
        this.productID = productID;
        this.odQuantity = odQuantity;
        this.subTotal = subTotal;
    }

    public int getOrderDetailID() {
        return OrderDetailID;
    }

    public void setOrderDetailID(int OrderDetailID) {
        this.OrderDetailID = OrderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getOdQuantity() {
        return odQuantity;
    }

    public void setOdQuantity(int odQuantity) {
        this.odQuantity = odQuantity;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "OrderDetailID=" + OrderDetailID + ", orderID=" + orderID + ", productID=" + productID + ", odQuantity=" + odQuantity + ", subTotal=" + subTotal + '}';
    }

   
}
