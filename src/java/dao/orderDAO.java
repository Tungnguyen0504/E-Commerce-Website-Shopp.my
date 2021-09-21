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

/**
 *
 * @author tungn
 */
public class orderDAO {

    public static int addOrder(Order order) {
        int ID = -1;
        try {
            DBContext dbconn = new DBContext();
            Connection myconnection = dbconn.getConnection();
            String query = "INSERT INTO dbo.Orders ( UserID , Payment , OrderDate , Total , billStatus )\n"
                    + "VALUES ( '" + order.getUserID() + "' , '" + order.getPayment() + "' , '" + order.getOrderDate() + "' , '" + order.getTotal() + "' , 0 )";
            Statement myStatement = myconnection.createStatement();
            try {
                ID = myStatement.executeUpdate(query);
                myStatement.close();
                myconnection.close();
            } catch (SQLException e) {
                Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, e);
                e.printStackTrace();
            }
        } catch (Exception ex) {
            Logger.getLogger(orderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ID;
    }

    public static int getLastOrderID() {
        int ID = -1;
        try {
            DBContext dbconn = new DBContext();
            Connection myconnection = dbconn.getConnection();
            String query = "SELECT TOP 1 * FROM dbo.Orders ORDER BY OrderID DESC";
            Statement myStatement = myconnection.createStatement();
            try {
                ResultSet rs = myStatement.executeQuery(query);
                rs.next();
                ID = rs.getInt("orderID");
                myStatement.close();
                myconnection.close();
            } catch (SQLException e) {
                Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, e);
                e.printStackTrace();
            }
        } catch (Exception ex) {
            Logger.getLogger(orderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ID;
    }

}
