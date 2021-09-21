/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetails;

public class orderDetailDAO {

    public static void addOrderDetail(OrderDetails oDetail) {
        try {
            DBContext dbconn = new DBContext();
            Connection myconnection = dbconn.getConnection();
            String querry = "INSERT INTO dbo.Order_Details\n"
                    + "        ( OrderID ,\n"
                    + "          ProductID ,\n"
                    + "          Quantity ,\n"
                    + "          SubTotal\n"
                    + "        )\n"
                    + "VALUES  ( '" + oDetail.getOrderID() + "' , -- OrderID - int\n"
                    + "          '" + oDetail.getProductID() + "' , -- ProductID - int\n"
                    + "          '" + oDetail.getOdQuantity() + "', -- Quantity - varchar(100)\n"
                    + "          '" + oDetail.getSubTotal() + "'  -- SubTotal - float\n"
                    + "        )";

            Statement myStatement = myconnection.createStatement();
            try {
                myStatement.executeUpdate(querry);
                myStatement.close();
                myconnection.close();
            } catch (SQLException e) {
                Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, e);
            }
        } catch (Exception ex) {
            Logger.getLogger(orderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
