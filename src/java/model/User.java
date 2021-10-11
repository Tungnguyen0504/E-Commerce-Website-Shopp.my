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
public class User {

    private int userID;
    private String userName;
    private String password;
    private boolean isAdmin;
    private boolean isActive;
    private String image;
    private String fullName;
    private String email;
    private String address;
    private String city;
    private String telephone;

    public User() {
    }

    public User(int userID, String userName, String password, boolean isAdmin, boolean isActive, String image, String fullName, String email, String address, String city, String telephone) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.isAdmin = isAdmin;
        this.isActive = isActive;
        this.image = image;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.city = city;
        this.telephone = telephone;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", isAdmin=" + isAdmin + ", isActive=" + isActive + ", image=" + image + ", fullName=" + fullName + ", email=" + email + ", address=" + address + ", city=" + city + ", telephone=" + telephone + '}';
    }

}
