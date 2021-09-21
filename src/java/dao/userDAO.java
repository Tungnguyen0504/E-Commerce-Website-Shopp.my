/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.User;

/**
 *
 * @author tungn
 */
public class userDAO {

    public static int addUser(User user) {
        int ID = -1;
        try {
            DBContext dbconn = new DBContext();
            Connection myconnection = dbconn.getConnection();
            String querry = "INSERT INTO dbo.Users ( FullName , Email , Address , City , Telephone )\n"
                    + "VALUES  ( '" + user.getFullName()+ "' ,'" + user.getEmail()+ "' ,'" + user.getAddress()+ "' ,'" + user.getCity()+ "' ,'" + user.getTelephone()+ "' )";
            Statement myStatement = myconnection.createStatement();
            try {
                ID = myStatement.executeUpdate(querry);
                myStatement.close();
                myconnection.close();
            } catch (SQLException e) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, e);
                e.printStackTrace();
            }
        } catch (Exception ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ID;
    }

    public static int getLastUserID() {
        int ID = -1;
        try {
            DBContext dbconn = new DBContext();
            Connection myconnection = dbconn.getConnection();
            String querry = "SELECT TOP 1 * FROM dbo.Users ORDER BY UserID DESC";
            Statement myStatement = myconnection.createStatement();
            try {
                ResultSet rs = myStatement.executeQuery(querry);
                rs.next();
                ID = rs.getInt("UserID");
                myStatement.close();
                myconnection.close();
            } catch (SQLException e) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, e);
                e.printStackTrace();
            }
        } catch (Exception ex) {
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ID;
    }

}
