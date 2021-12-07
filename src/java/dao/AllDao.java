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
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import model.Brand;
import model.Camera;
import model.Coupon;
import model.Laptop;
import model.Order;
import model.OrderDetails;
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
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
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
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
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
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
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

    public List<Products> getTop4BestSellers() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT TOP 4 p.ProductID, p.CategoryID, p.ProductName, p.Tittle, p.Description, p.Quantity, p.Color, p.Image1, p.Image2, p.Image3, p.Image4, p.Brand, p.Price, p.PriceDiscount, p.DiscountPercent, SUM(od.Quantity) AS qt\n"
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

    public void deleteAccount(String id) {
        String query = "DELETE FROM dbo.Order_Details WHERE OrderID IN (SELECT o.OrderID FROM dbo.Orders o JOIN dbo.Users u ON u.UserID = o.UserID WHERE u.UserID IN (?))\n"
                + "DELETE FROM dbo.Orders WHERE userID = ?\n"
                + "DELETE FROM dbo.Feedback WHERE UserID = ?\n"
                + "DELETE FROM dbo.Users WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, id);
            ps.setString(3, id);
            ps.setString(4, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void addNewAccount(User u) {
        String query = "INSERT INTO dbo.Users ( UserName, Password, IsAdmin, isActive, Image, FullName, Email, Address, City, Telephone) \n"
                + "VALUES ('" + u.getUserName() + "' , '" + u.getPassword() + "' , '" + u.isIsAdmin() + "' , 'true' , '" + u.getImage() + "' , '" + u.getFullName() + "' , '" + u.getEmail() + "' , '" + u.getAddress() + "' , '" + u.getCity() + "' , '" + u.getTelephone() + "' )";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateAccount(User u) {
        String query = "UPDATE dbo.Users \n"
                + "SET UserName = ?, Password = ?, IsAdmin = ?, IsActive = ?, Image = ?, FullName = ?, Email = ?, Address = ?, City = ?, Telephone = ?\n"
                + "WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassword());
            ps.setBoolean(3, u.isIsAdmin());
            ps.setBoolean(4, u.isIsActive());
            ps.setString(5, u.getImage());
            ps.setString(6, u.getFullName());
            ps.setString(7, u.getEmail());
            ps.setString(8, u.getAddress());
            ps.setString(9, u.getCity());
            ps.setString(10, u.getTelephone());
            ps.setInt(11, u.getUserID());
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

    public User findAccount(int userID) {
        String query = "SELECT * FROM dbo.Users WHERE UserID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteProduct(int pid) {
        String query = "DELETE dbo.Product_Laptops WHERE ProductID = ?\n"
                + "DELETE dbo.Product_SmartPhones WHERE ProductID = ?\n"
                + "DELETE dbo.Product_Camera WHERE ProductID = ?\n"
                + "DELETE dbo.Order_Details WHERE ProductID = ?\n"
                + "DELETE dbo.Feedback WHERE ProductID = ?\n"
                + "DELETE dbo.Products WHERE ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, pid);
            ps.setInt(3, pid);
            ps.setInt(4, pid);
            ps.setInt(5, pid);
            ps.setInt(6, pid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateProduct(int cid, int pid, String productName, String tittle, String des, int quantity, String color, String image1, String image2, String image3, String image4, String brand, double price, double priceDiscount, int discountPercent) {
        String query = "UPDATE dbo.Products\n"
                + "SET CategoryID = ? , ProductName = ? , Tittle = ? , Description = ? , Quantity = ? , Color = ? , Image1 = ? , Image2 = ? , Image3 = ? , Image4 = ? ,\n"
                + "	Brand = ? , Price = ? , PriceDiscount = ? , DiscountPercent = ?\n"
                + "WHERE ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cid);
            ps.setString(2, productName);
            ps.setString(3, tittle);
            ps.setString(4, des);
            ps.setInt(5, quantity);
            ps.setString(6, color);
            ps.setString(7, image1);
            ps.setString(8, image2);
            ps.setString(9, image3);
            ps.setString(10, image4);
            ps.setString(11, brand);
            ps.setDouble(12, price);
            ps.setDouble(13, priceDiscount);
            ps.setDouble(14, discountPercent);
            ps.setInt(15, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProductDetail(int productID, int cid, String p1, String p2, String p3, String p4, String p5, String p6, String p7, String p8, String p9) {
        String query = "";
        if (cid == 1) {
            query += "UPDATE dbo.Product_Laptops\n"
                    + "SET MemorySize = ? , CPUModel = ? , CPUSpeed = ? , DisplayResolution = ? , ScreenSize = ? , ItemWeight = ? , GraphicsCoprocessor = ? , OS = ? , RAMType = ? \n";
        } else if (cid == 2) {
            query += "UPDATE dbo.Product_SmartPhones\n"
                    + "SET Screen = ? , OS = ? , RearCamera = ? , FrontCamera = ? , CPU = ? , RAM = ? , InternalMemory = ? , Sim = ? , Battery = ? \n";
        } else {
            query += "UPDATE dbo.Product_Camera\n"
                    + "SET ModelNumber = ? , EyeAF = ? , ImageSensorType = ? , ImageSensorSize = ? , MaxFocalLength = ? , MinFocalLength = ? , MaxAperture = ? , EffectivePixels = ? , WifiEnabled = ? \n";
        }
        query += "WHERE ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, p1);
            ps.setString(2, p2);
            ps.setString(3, p3);
            ps.setString(4, p4);
            ps.setString(5, p5);
            ps.setString(6, p6);
            ps.setString(7, p7);
            ps.setString(8, p8);
            ps.setString(9, p9);
            ps.setInt(10, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //order
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

    public List<OrderDetails> getOrderDetailByID(int oid) {
        List<OrderDetails> list = new ArrayList<OrderDetails>();
        String query = "SELECT * FROM dbo.Order_Details WHERE OrderID = " + oid;
        try {
            //mo ket noi voi sql server
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void changeStatus(int oid, String status) {
        String query = "UPDATE dbo.Orders\n"
                + "SET billStatus = ?\n"
                + "WHERE OrderID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, oid);
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

    public void addNewProduct2(int productID, String p1, String p2, String p3, String p4, String p5, String p6, String p7, String p8, String p9, int cid) {
        String query = "";
        if (cid == 1) {
            query += "INSERT INTO dbo.Product_Laptops( ProductID , MemorySize , CPUModel , CPUSpeed , DisplayResolution , ScreenSize , ItemWeight , GraphicsCoprocessor , OS , RAMType )\n"
                    + "VALUES  ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )";
        } else if (cid == 2) {
            query += "INSERT INTO dbo.Product_SmartPhones( ProductID , Screen , OS , RearCamera , FrontCamera , CPU , RAM , InternalMemory , Sim , Battery )\n"
                    + "VALUES  ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )";
        } else if (cid == 3) {
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

    public int addProduct(Products p) {
        int n = 0;
        String query = "INSERT INTO dbo.Products ( CategoryID , ProductName , Tittle , Description , Quantity , Color , \n"
                + "			Image1 , Image2 , Image3 , Image4 , Brand , Price , PriceDiscount , DiscountPercent)\n"
                + "VALUES  ( '" + p.getCategoryID() + "' , '" + p.getProductName() + "' , '" + p.getTittle() + "' , '" + p.getDescription()
                + "' , '" + p.getPQuantity() + "' , '" + p.getColor() + "' , '" + p.getImage1() + "' , '" + p.getImage2() + "' , '" + p.getImage3()
                + "' , '" + p.getImage4() + "' , '" + p.getBrand() + "' , '" + p.getPrice() + "' , '" + p.getPriceDiscount() + "' , '" + p.getDiscountPercent() + "' )";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception ex) {
        }
        return n;
    }

    public Order findOrder(int oid) {
        String query = "SELECT * FROM dbo.Orders WHERE OrderID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4),
                        rs.getDouble(5), rs.getInt(6));
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
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
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
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> filterPriceShop(String cid, String min, String max) {
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

    public Coupon getCoupon(String couName) {
        String query = "SELECT * FROM dbo.Coupon WHERE CouponName = '" + couName + "'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Coupon(rs.getInt(1), rs.getString(2), rs.getInt(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Users\n"
                + "ORDER BY UserID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<Order>();
        String query = "SELECT * FROM dbo.Orders";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4),
                        rs.getDouble(5), rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //admin dashboard
    public String earnMonthly(int date) {
        double earn = 0;
        long millis = System.currentTimeMillis();
        Timestamp now = new Timestamp(millis);
        AllDao dao1 = new AllDao();
        for (Order o : dao1.getAllOrder()) {
            if (TimeUnit.MILLISECONDS.toDays(now.getTime() - o.getOrderDate().getTime()) >= date && TimeUnit.MILLISECONDS.toDays(now.getTime() - o.getOrderDate().getTime()) <= (date + 30)) {
                earn += o.getTotal();
            }
        }
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");
        decimalFormat.format(earn);
        return decimalFormat.format(earn);
    }

    public String monthFromNow(int count) {
        SimpleDateFormat df = new SimpleDateFormat("MMM yyyy");
        Date start = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(start);
        c.add(Calendar.MONTH, count);
        Date dateFrom = c.getTime();
        return df.format(dateFrom);
    }

    public List<Order> getRecentOrder() {
        List<Order> list = new ArrayList<Order>();
        String query = "SELECT TOP 5 * FROM dbo.Orders";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4),
                        rs.getDouble(5), rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //end admin dashboard
    public static void main(String[] args) {
        AllDao dao = new AllDao();
        List<OrderDetails> list = dao.getOrderDetailByID(1);
        for (OrderDetails User : list) {
            System.out.println(User);
        }
    }
}
