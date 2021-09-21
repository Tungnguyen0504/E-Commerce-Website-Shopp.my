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
public class OrderHistory {

    public Products p;
    public OrderDetails od;
    public Order o;
    public User u;

    public OrderHistory() {
    }

    public OrderHistory(Products p, OrderDetails od, Order o, User u) {
        this.p = p;
        this.od = od;
        this.o = o;
        this.u = u;
    }

    public Products getP() {
        return p;
    }

    public void setP(Products p) {
        this.p = p;
    }

    public OrderDetails getOd() {
        return od;
    }

    public void setOd(OrderDetails od) {
        this.od = od;
    }

    public Order getO() {
        return o;
    }

    public void setO(Order o) {
        this.o = o;
    }

    public User getU() {
        return u;
    }

    public void setU(User u) {
        this.u = u;
    }

    @Override
    public String toString() {
        return "OrderHistory{" + "p=" + p + ", od=" + od + ", o=" + o + ", u=" + u + '}';
    }

}
