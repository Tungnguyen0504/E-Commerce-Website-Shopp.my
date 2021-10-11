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
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import model.Order;
import model.OrderHistory;
import model.Products;
import model.User;

/**
 *
 * @author tungn
 */
public class paggingDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int countFilterPriceShop(String cid, String min, String max) {
        String query = "SELECT COUNT(*) FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.CategoryID =" + cid + "\n";
        if (min == null) {
            query += "AND p.PriceDiscount < " + max;
        } else if (max == null) {
            query += "AND p.PriceDiscount > " + min;
        } else {
            query += "AND p.PriceDiscount > " + min + " AND p.PriceDiscount < " + max;
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Products> paggingFilterPriceShop(String cid, String min, String max, int index) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.CategoryID = " + cid + "\n";
        if (min == null) {
            query += "AND p.PriceDiscount < " + max + "\n"
                    + "ORDER BY p.ProductID\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        } else if (max == null) {
            query += "AND p.PriceDiscount > " + min + "\n"
                    + "ORDER BY p.ProductID\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        } else {
            query += "AND p.PriceDiscount > " + min + " AND p.PriceDiscount < " + max + "\n"
                    + "ORDER BY p.ProductID\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countSearchProduct(String txtSearch, String choose) {
        String query = "SELECT COUNT(*) FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.ProductName LIKE ? AND c.CategoryID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, choose);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Products> paggingSearchProduct(String txtSearch, String choose, int index) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.ProductName LIKE ? AND c.CategoryID = ?\n"
                + "ORDER BY p.ProductID\n"
                + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, choose);
            ps.setInt(3, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countProduct(String cid) {
        String query = "SELECT COUNT(*) FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.CategoryID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Products> paggingProduct(String cid, int index, int num) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products\n"
                + "WHERE CategoryID = ?\n"
                + "ORDER BY ProductID\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ps.setInt(2, (index - 1) * 9);
            ps.setInt(3, num);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> getAllProductByCid(int cid) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products WHERE CategoryID = " + cid;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> paggingSortProduct(String cid, int index, String sort) {
        List<Products> list = new ArrayList<>();
        String query = "";
        if (sort.equalsIgnoreCase("sortPriceASC")) {
            query += "SELECT * FROM dbo.Products p JOIN dbo.Category c\n"
                    + "ON c.CategoryID = p.CategoryID\n"
                    + "WHERE p.CategoryID = ?\n"
                    + "ORDER BY p.PriceDiscount ASC\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        } else if (sort.equalsIgnoreCase("sortPriceDESC")) {
            query += "SELECT * FROM dbo.Products p JOIN dbo.Category c\n"
                    + "ON c.CategoryID = p.CategoryID\n"
                    + "WHERE p.CategoryID = ?\n"
                    + "ORDER BY p.PriceDiscount DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        } else if (sort.equalsIgnoreCase("sortNewArrival")) {
            query += "SELECT * FROM dbo.Products p JOIN dbo.Category c\n"
                    + "ON c.CategoryID = p.CategoryID\n"
                    + "WHERE p.CategoryID = ?\n"
                    + "ORDER BY p.ProductID DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        } else if (sort.equalsIgnoreCase("sortBestSeller")) {
            query += "SELECT p.ProductID, p.SupplierID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent, p.Rating, c.CategoryID, c.CategoryName, SUM(od.Quantity) AS qt\n"
                    + "FROM dbo.Order_Details od JOIN dbo.Products p ON p.ProductID = od.ProductID JOIN dbo.Category c ON c.CategoryID = p.CategoryID\n"
                    + "WHERE c.CategoryID = ?\n"
                    + "GROUP BY p.ProductID, p.SupplierID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent, p.Rating, c.CategoryID, c.CategoryName\n"
                    + "ORDER BY qt DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ps.setInt(2, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countAllOrderHistory(int uid) {
        String query = "SELECT COUNT(*) FROM dbo.Users u JOIN dbo.Orders o\n"
                + "ON o.UserID = u.UserID JOIN dbo.Order_Details od\n"
                + "ON od.OrderID = o.OrderID JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "WHERE u.UserID =" + uid;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<OrderHistory> paggingAllOrderHistory(int uid, int index) {
        AllDao dao = new AllDao();
        List<OrderHistory> list = new ArrayList<OrderHistory>();
        String query = "SELECT * FROM dbo.Users u JOIN dbo.Orders o\n"
                + "ON o.UserID = u.UserID JOIN dbo.Order_Details od\n"
                + "ON od.OrderID = o.OrderID JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "WHERE u.UserID = ?\n"
                + "ORDER BY od.OrderID DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setInt(2, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderHistory(dao.getProductByID(rs.getInt("ProductID")), dao.findOrderDetail(rs.getString("OrderDetailsID")), dao.findOrder(rs.getInt("OrderID")), dao.findAccount(uid)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countFilterOrderHistory(int uid, String txt) {
        String query = "SELECT COUNT(*) FROM dbo.Users u JOIN dbo.Orders o\n"
                + "ON o.UserID = u.UserID JOIN dbo.Order_Details od\n"
                + "ON od.OrderID = o.OrderID JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "WHERE u.UserID = " + uid + "\n"
                + "AND p.ProductName LIKE '%" + txt + "%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<OrderHistory> paggingFilterOrderHistory(int uid, String txt, int index) {
        AllDao dao = new AllDao();
        List<OrderHistory> list = new ArrayList<OrderHistory>();
        String query = "SELECT * FROM dbo.Users u JOIN dbo.Orders o\n"
                + "ON o.UserID = u.UserID JOIN dbo.Order_Details od\n"
                + "ON od.OrderID = o.OrderID JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "WHERE u.UserID = ?\n"
                + "AND p.ProductName LIKE ?\n"
                + "ORDER BY o.OrderDate DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        try {
            //mo ket noi voi sql server
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setString(2, "%" + txt + "%");
            ps.setInt(3, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderHistory(dao.getProductByID(rs.getInt("ProductID")), dao.findOrderDetail(rs.getString("OrderDetailsID")), dao.findOrder(rs.getInt("OrderID")), dao.findAccount(uid)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countAllFeedbackByPid(int pid) {
        String query = "SELECT COUNT(*) FROM dbo.Feedback\n"
                + "WHERE ProductID = " + pid;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Feedback> PaggingAllFeedbackByPid(int pid, int index) {
        List<Feedback> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Feedback\n"
                + "WHERE ProductID = ? \n"
                + "ORDER BY FeedbackDate DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getTimestamp(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        paggingDAO dao = new paggingDAO();
        List<OrderHistory> l = dao.paggingAllOrderHistory(1, 1);
        for (OrderHistory orderHistory : l) {
            System.out.println(orderHistory);
        }
    }
}
