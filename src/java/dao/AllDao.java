/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Products;
import model.Category;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Camera;
import model.Feedback;
import model.Laptop;
import model.Order;
import model.OrderDetails;
import model.OrderHistory;
import model.SPhone;
import model.User;

/**
 *
 * @author tungn
 */
public class AllDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //login
    public User Login(String user, String pass) {
        String query = "SELECT * FROM dbo.Users WHERE UserName = ? AND Password = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User LoginAdmin(String user, String pass) {
        String query = "SELECT * FROM dbo.Users WHERE UserName = ? AND Password = ? AND IsAdmin = 'true'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User checkAccountExist(String user, String pass) {
        String query = "SELECT * FROM dbo.Users WHERE UserName = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signUp(String userName, String password) {
        String query = "INSERT INTO dbo.Users ( UserName, Password, IsAdmin ) VALUES ( ?, ?, 'false')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePassword(String password, String userName) {
        String query = "UPDATE dbo.Users \n"
                + "SET Password = ?\n"
                + "WHERE UserName = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, userName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getCategoryByID(int cid) {
        String query = "SELECT * FROM dbo.Category WHERE CategoryID = " + cid;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Products> getTop5FeaturedItem() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 5 * FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "ORDER BY NEWID()";
        try {
            //mo ket noi voi sql server
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

    public List<Products> getTop8BestSellers() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 8 p.ProductID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent, SUM(od.Quantity) AS qt\n"
                + "FROM dbo.Order_Details od JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent\n"
                + "ORDER BY qt DESC";
        try {
            //mo ket noi voi sql server
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

    public List<Products> getTop3BestSellers() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 3 p.ProductID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent, SUM(od.Quantity) AS qt\n"
                + "FROM dbo.Order_Details od JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent\n"
                + "ORDER BY qt DESC";
        try {
            //mo ket noi voi sql server
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

    public List<Products> getTop6Sale() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 6 * FROM dbo.Products \n"
                + "ORDER BY DiscountPercent DESC";
        try {
            //mo ket noi voi sql server
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

    public List<Products> getTop8NewArrival() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM dbo.Products\n"
                + "ORDER BY ProductID DESC";
        try {
            //mo ket noi voi sql server
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

    public List<Products> paggingProduct(String cid, int index) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products\n"
                + "WHERE CategoryID = ?\n"
                + "ORDER BY ProductID\n"
                + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
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

    public Products getProductByID(int productID) {
        String query = "SELECT * FROM dbo.Products\n"
                + "WHERE ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Laptop getLaptop(int productID) {
        String query = "SELECT l.* FROM dbo.Product_Laptops l JOIN dbo.Products p\n"
                + "ON p.ProductID = l.ProductID\n"
                + "WHERE p.ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Laptop(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public SPhone getSPhone(int productID) {
        String query = "SELECT sp.* FROM dbo.Product_SmartPhones sp JOIN dbo.Products p\n"
                + "ON sp.ProductID = p.ProductID \n"
                + "WHERE p.ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new SPhone(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Camera getCamera(int productID) {
        String query = "SELECT c.* FROM dbo.Product_Camera c JOIN dbo.Products p\n"
                + "ON c.ProductID = p.ProductID \n"
                + "WHERE p.ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Camera(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Products> getRelateProduct(int cid) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM dbo.Products\n"
                + "WHERE CategoryID = " + cid + "\n"
                + "ORDER BY NEWID() ";
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

    public List<Products> relateSPhone() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID \n"
                + "WHERE p.CategoryID = 2";
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

    public List<Products> relateCamera() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID \n"
                + "WHERE p.CategoryID = 3";
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

//    account.jsp
    public List<User> getAllAccount() {
        List<User> list = new ArrayList<User>();
        String query = "SELECT * FROM dbo.Users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteAccount(String id) {
        String query = "DELETE FROM dbo.Order_Details WHERE OrderID IN (SELECT o.OrderID FROM dbo.Orders o JOIN dbo.Users u ON u.UserID = o.UserID WHERE u.UserID = ?)\n"
                + "DELETE FROM dbo.Orders WHERE userID = ?\n"
                + "DELETE FROM dbo.Users WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, id);
            ps.setString(3, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void addNewAccount(String userName, String password, boolean isAdmin, String fullName, String email, String address, String city, String telephone) {
        String query = "INSERT INTO dbo.Users ( UserName, Password, IsAdmin, isActive, FullName, Email, Address, City, Telephone) \n"
                + "VALUES ('" + userName + "' , '" + password + "' , '" + isAdmin + "' , 'true' , '" + fullName + "' , '" + email + "' , '" + address + "' , '" + city + "' , '" + telephone + "' )";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateAccount(String userName, String password, String isAdmin, String fullName, String email, String address, String city, String telephone, String userID) {
        String query = "UPDATE dbo.Users \n"
                + "SET UserName = ?, Password = ?, IsAdmin = ?, FullName = ?, Email = ?, Address = ?, City = ?, Telephone = ?\n"
                + "WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, isAdmin);
            ps.setString(4, fullName);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, city);
            ps.setString(8, telephone);
            ps.setString(9, userID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void activeAcc(String userID, String status) {
        String query = "UPDATE dbo.Users\n"
                + "SET IsActive = '" + status + "'\n"
                + "WHERE UserID = " + userID;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User findAccount(String userID) {
        String query = "SELECT * FROM dbo.Users WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteProduct(String productID) {
        String query = "DELETE dbo.Product_Laptops WHERE ProductID = ?\n"
                + "DELETE dbo.Product_SmartPhones WHERE ProductID = ?\n"
                + "DELETE dbo.Product_Camera WHERE ProductID = ?\n"
                + "DELETE dbo.Order_Details WHERE ProductID = ?\n"
                + "DELETE dbo.Products WHERE ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.setString(2, productID);
            ps.setString(3, productID);
            ps.setString(4, productID);
            ps.setString(5, productID);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateProduct(String image1, String productName, int quantity, String color, String brand, double price, double priceDiscount, String categoryID, int productID) {
        String query = "UPDATE dbo.Products \n"
                + "SET Image1 = ?, ProductName = ?, Quantity = ?, Color = ?, Brand = ?, Price = ?, PriceDiscount = ?, CategoryID = ?\n"
                + "WHERE ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, image1);
            ps.setString(2, productName);
            ps.setInt(3, quantity);
            ps.setString(4, color);
            ps.setString(5, brand);
            ps.setDouble(6, price);
            ps.setDouble(7, priceDiscount);
            ps.setString(8, categoryID);
            ps.setInt(9, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countAccount() {
        String query = "SELECT COUNT(*) FROM dbo.Users";
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

    public List<User> paggingAccount(int index) {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Users\n"
                + "ORDER BY UserID\n"
                + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 8);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //My Account
    public User findAccount1(String userName) {
        String query = "SELECT * FROM dbo.Users WHERE UserName = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //order
    public int countOrder() {
        String query = "SELECT COUNT(*) FROM dbo.Orders";
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

    public List<Order> paggingOrder(int index) {
        AllDao dao = new AllDao();
        List<Order> list = new ArrayList<Order>();
        String query = "SELECT * FROM dbo.Orders o JOIN dbo.Users u\n"
                + "ON u.UserID = o.UserID\n"
                + "ORDER BY o.OrderID\n"
                + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 8);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4),
                        rs.getDouble(5), rs.getInt(6), dao.findAccount(rs.getInt(2) + "")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteOrder(String orderID) {
        String query = "DELETE dbo.Order_Details WHERE OrderID = ?\n"
                + "DELETE dbo.Orders WHERE OrderID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, orderID);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<OrderHistory> getOrderDetailByID(int oid) {
        AllDao dao = new AllDao();
        List<OrderHistory> list = new ArrayList<OrderHistory>();
        String query = "SELECT * FROM dbo.Users u JOIN dbo.Orders o \n"
                + "ON o.UserID = u.UserID JOIN dbo.Order_Details od\n"
                + "ON od.OrderID = o.OrderID JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "WHERE od.OrderID = " + oid;
        try {
            //mo ket noi voi sql server
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderHistory(dao.getProductByID(rs.getInt(19)), dao.findOrderDetail(rs.getString(17)), dao.findOrder(rs.getString(11)), dao.findAccount(rs.getString(1))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void changeStatus(String id, String status) {
        String query = "UPDATE dbo.Orders\n"
                + "SET billStatus = ?\n"
                + "WHERE OrderID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addNewEmail(String email) {
        String query = "INSERT INTO dbo.Users (Email) VALUES( ? )";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Brand> getBrandByCid(String cid) {
        List<Brand> list = new ArrayList<>();
        String query = "SELECT DISTINCT p.brand, p.CategoryID FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE c.CategoryID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> getProductByBrand(String brand) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products\n"
                + "WHERE Brand LIKE '%" + brand + "%'";
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

    public int getLastProductID() {
        String query = "SELECT TOP 1 ProductID FROM dbo.Products ORDER BY ProductID DESC";
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

    public void addNewProduct1(String categoryID, String productName, int quantity, String color, String image1, String image2, String image3, String image4, String brand, double price, double priceDiscount) {
        String query = "INSERT INTO dbo.Products(CategoryID, ProductName, Quantity, Color, Image1, Image2, Image3, Image4, Brand, Price, PriceDiscount)\n"
                + "VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            ps.setString(2, productName);
            ps.setInt(3, quantity);
            ps.setString(4, color);
            ps.setString(5, image1);
            ps.setString(6, image2);
            ps.setString(7, image3);
            ps.setString(8, image4);
            ps.setString(9, brand);
            ps.setDouble(10, price);
            ps.setDouble(11, priceDiscount);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void addNewProduct2(int productID, String p1, String p2, String p3, String p4, String p5, String p6, String p7, String p8, String p9, String type) {
        String query = "";
        if (type.equalsIgnoreCase("laptop")) {
            query += "INSERT INTO dbo.Product_Laptops( ProductID , MemorySize , CPUModel , CPUSpeed , DisplayResolution , ScreenSize , ItemWeight , GraphicsCoprocessor , OS , RAMType )\n"
                    + "VALUES  ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )";
        } else if (type.equalsIgnoreCase("sphone")) {
            query += "INSERT INTO dbo.Product_SmartPhones( ProductID , Screen , OS , RearCamera , FrontCamera , CPU , RAM , InternalMemory , Sim , Battery )\n"
                    + "VALUES  ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )";
        } else if (type.equalsIgnoreCase("camera")) {
            query += "INSERT INTO dbo.Product_Camera( ProductID , ModelNumber , EyeAF , ImageSensorType , ImageSensorSize , MaxFocalLength , MinFocalLength , MaxAperture , EffectivePixels , WifiEnabled )\n"
                    + "VALUES  ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setString(2, p1);
            ps.setString(3, p2);
            ps.setString(4, p3);
            ps.setString(5, p4);
            ps.setString(6, p5);
            ps.setString(7, p6);
            ps.setString(8, p7);
            ps.setString(9, p8);
            ps.setString(10, p9);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Order findOrder(String oid) {
        AllDao dao = new AllDao();
        String query = "SELECT * FROM dbo.Orders WHERE OrderID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4),
                        rs.getDouble(5), rs.getInt(6), dao.findAccount(rs.getInt(2) + ""));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public OrderDetails findOrderDetail(String odid) {
        String query = "SELECT * FROM dbo.Order_Details WHERE OrderDetailsID = ?";
        try {
            //mo ket noi voi sql server
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, odid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new OrderDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int countAllOrderHistory(String uid) {
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

    public List<OrderHistory> paggingAllOrderHistory(String uid, int index) {
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
            ps.setString(1, uid);
            ps.setInt(2, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderHistory(dao.getProductByID(rs.getInt(19)), dao.findOrderDetail(rs.getString(17)), dao.findOrder(rs.getString(11)), dao.findAccount(uid)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderHistory> filterOrderHistory(String uid, String pid) {
        AllDao dao = new AllDao();
        List<OrderHistory> list = new ArrayList<OrderHistory>();
        String query = "SELECT * FROM dbo.Users u JOIN dbo.Orders o \n"
                + "ON o.UserID = u.UserID JOIN dbo.Order_Details od\n"
                + "ON od.OrderID = o.OrderID JOIN dbo.Products p\n"
                + "ON p.ProductID = od.ProductID\n"
                + "WHERE u.UserID = ? \n"
                + "AND p.ProductName LIKE ?";
        try {
            //mo ket noi voi sql server
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, uid);
            ps.setString(2, "%" + pid + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderHistory(dao.getProductByID(rs.getInt(19)), dao.findOrderDetail(rs.getString(17)), dao.findOrder(rs.getString(11)), dao.findAccount(uid)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<User> filterAccount(String type) {
        List<User> list = new ArrayList<>();
        String query = "";
        if (type.equalsIgnoreCase("1")) {
            query += "SELECT * FROM dbo.Users WHERE IsAdmin = 'true'";
        }
        if (type.equalsIgnoreCase("2")) {
            query += "SELECT * FROM dbo.Users WHERE IsAdmin = 'false'";
        }
        if (type.equalsIgnoreCase("3")) {
            query += "SELECT * FROM dbo.Users WHERE IsActive = 'true'";
        }
        if (type.equalsIgnoreCase("4")) {
            query += "SELECT * FROM dbo.Users WHERE IsActive = 'false'";
        }
        if (type.equalsIgnoreCase("5")) {
            query += "SELECT * FROM dbo.Users \n"
                    + "ORDER BY UserID DESC";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<User> searchAccount(String userName) {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Users WHERE UserName LIKE '%" + userName + "%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> filterShop(String cid, String min, String max) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products p JOIN dbo.Category c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.CategoryID = " + cid + "\n";
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
                list.add(new Products(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void setQuantityProduct(int pid, int quantity) {
        String query = "UPDATE dbo.Products SET Quantity = Quantity - " + quantity + " WHERE ProductID = " + pid;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void addFeedback(int pid, int uid, int rating, String des, Timestamp date) {
        String query = "INSERT INTO dbo.Feedback (ProductID, UserID, Rating , Description , FeedbackDate)\n"
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.setInt(3, rating);
            ps.setString(4, des);
            ps.setTimestamp(5, date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
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

    public int countRating(int pid, int rating) {
        String query = "SELECT COUNT(Rating), ProductID, Rating FROM dbo.Feedback \n"
                + "WHERE ProductID = " + pid + "\n";
        if (rating == 5) {
            query += "AND Rating = " + rating + "\n"
                    + "GROUP BY ProductID, Rating";
        }
        if (rating == 4) {
            query += "AND Rating = " + rating + "\n"
                    + "GROUP BY ProductID, Rating";
        }
        if (rating == 3) {
            query += "AND Rating = " + rating + "\n"
                    + "GROUP BY ProductID, Rating";
        }
        if (rating == 2) {
            query += "AND Rating = " + rating + "\n"
                    + "GROUP BY ProductID, Rating";
        }
        if (rating == 1) {
            query += "AND Rating = " + rating + "\n"
                    + "GROUP BY ProductID, Rating";
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

    public List<Feedback> getAllFeedbackByPid(int pid) {
        List<Feedback> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Feedback \n"
                + "WHERE ProductID = " + pid;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getTimestamp(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        AllDao dao = new AllDao();
        int f = dao.countRating(1, 4);
        System.out.println(f);
    }
}
