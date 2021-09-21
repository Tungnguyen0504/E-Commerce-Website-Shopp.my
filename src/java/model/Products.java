/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author tungn
 */
public class Products implements Comparable<Products> {

    private int ProductID;
    private int categoryID;
    private String productName;
    private String tittle;
    private String Description;
    private int PQuantity;
    private String color;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private String brand;
    private double price;
    private double priceDiscount;
    private int discountPercent;

    public Products() {
    }

    public Products(int ProductID, int categoryID, String productName, String tittle, String Description, int PQuantity, String color, String image1, String image2, String image3, String image4, String brand, double price, double priceDiscount, int discountPercent) {
        this.ProductID = ProductID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.tittle = tittle;
        this.Description = Description;
        this.PQuantity = PQuantity;
        this.color = color;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.brand = brand;
        this.price = price;
        this.priceDiscount = priceDiscount;
        this.discountPercent = discountPercent;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getPQuantity() {
        return PQuantity;
    }

    public void setPQuantity(int PQuantity) {
        this.PQuantity = PQuantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPriceDiscount() {
        return priceDiscount;
    }

    public void setPriceDiscount(double priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    @Override
    public String toString() {
        return "Products{" + "ProductID=" + ProductID + ", categoryID=" + categoryID + ", productName=" + productName + ", tittle=" + tittle + ", Description=" + Description + ", PQuantity=" + PQuantity + ", color=" + color + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4 + ", brand=" + brand + ", price=" + price + ", priceDiscount=" + priceDiscount + ", discountPercent=" + discountPercent + '}';
    }

    @Override
    public int compareTo(Products p) {
        return this.ProductID - p.ProductID;
    }

}
