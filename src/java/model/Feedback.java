/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author tungn
 */
public class Feedback {

    private int feedbackID;
    private int productID;
    private int userID;
    private int rating;
    private String description;
    private Timestamp fDate;

    public Feedback() {
    }

    public Feedback(int feedbackID, int productID, int userID, int rating, String description, Timestamp fDate) {
        this.feedbackID = feedbackID;
        this.productID = productID;
        this.userID = userID;
        this.rating = rating;
        this.description = description;
        this.fDate = fDate;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getfDate() {
        return fDate;
    }

    public String getFDateFormat() {
        String s = "";
        long millis = System.currentTimeMillis();
        Timestamp now = new Timestamp(millis);
        if ((TimeUnit.MILLISECONDS.toDays(now.getTime() - fDate.getTime()) <= 7) && (TimeUnit.MILLISECONDS.toDays(now.getTime() - fDate.getTime()) > 1)) {
            s = TimeUnit.MILLISECONDS.toDays(now.getTime() - fDate.getTime()) + " days ago";
        } else if ((TimeUnit.MILLISECONDS.toDays(now.getTime() - fDate.getTime()) <= 1) && (TimeUnit.MILLISECONDS.toHours(now.getTime() - fDate.getTime()) > 1)) {
            s = TimeUnit.MILLISECONDS.toHours(now.getTime() - fDate.getTime()) + " hours ago";
        } else if (TimeUnit.MILLISECONDS.toHours(now.getTime() - fDate.getTime()) <= 1) {
            s = TimeUnit.MILLISECONDS.toMinutes(now.getTime() - fDate.getTime()) + " minutes ago";
        } else {
            SimpleDateFormat df = new SimpleDateFormat("MMMM dd, yyyy");
            return df.format(fDate);
        }
        return s;
    }

    public void setfDate(Timestamp fDate) {
        this.fDate = fDate;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackID=" + feedbackID + ", productID=" + productID + ", userID=" + userID + ", rating=" + rating + ", description=" + description + ", fDate=" + fDate + '}';
    }

}
