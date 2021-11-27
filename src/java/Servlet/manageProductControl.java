/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import dao.paggingDAO;
import generic.getUrl;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Camera;
import model.Category;
import model.Laptop;
import model.Products;
import model.SPhone;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "manageProductControl", urlPatterns = {"/manageProduct"})
public class manageProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u == null) {
            getUrl.getUrl(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action == null) {
                doGet_load(request, response);
            }
            if (action.equalsIgnoreCase("view")) {
                doGet_view(request, response);
            }
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));

        paggingDAO dao = new paggingDAO();

        List<Products> list = dao.getAllProductByCid(cid);

        request.setAttribute("cid", cid);
        request.setAttribute("listProduct", list);

        request.getRequestDispatcher("manage-product.jsp").forward(request, response);
    }

    protected void doGet_view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("pid"));
        AllDao dao = new AllDao();
        Products product = dao.getProductByID(productID);
        if (product.getCategoryID() == 1) {
            Laptop l = dao.getLaptop(productID);
            request.setAttribute("lap", l);
        } else if (product.getCategoryID() == 2) {
            SPhone sp = dao.getSPhone(productID);
            request.setAttribute("sp", sp);
        } else {
            Camera cam = dao.getCamera(productID);
            request.setAttribute("cam", cam);
        }
        request.setAttribute("pro", product);
        request.getRequestDispatcher("update-product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u == null) {
            getUrl.getUrl(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("addProduct")) {
                doPost_add(request, response);
            }
            if (action.equalsIgnoreCase("updateProduct")) {
                doPost_update(request, response);
            }
            if (action.equalsIgnoreCase("deleteProduct")) {
                doPost_delete(request, response);
            }
        }
    }

    protected void doPost_add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double price = Double.parseDouble(request.getParameter("price"));
        int percent = Integer.parseInt(request.getParameter("percent"));

        Products p = new Products();
        p.setCategoryID(Integer.parseInt(request.getParameter("cid")));
        p.setProductName(request.getParameter("productName"));
        p.setTittle(request.getParameter("tittle"));
        p.setDescription(request.getParameter("description"));
        p.setPQuantity(Integer.parseInt(request.getParameter("quantity")));
        p.setImage1(request.getParameter("image1"));
        p.setImage2(request.getParameter("image2"));
        p.setImage3(request.getParameter("image3"));
        p.setImage4(request.getParameter("image4"));
        p.setColor(request.getParameter("color"));
        p.setBrand(request.getParameter("brand"));
        p.setPrice(price);
        p.setPriceDiscount(price - price * percent / 100);
        p.setDiscountPercent(percent);

        AllDao dao = new AllDao();
        dao.addProduct(p);

        String p1 = request.getParameter("p1");
        String p2 = request.getParameter("p2");
        String p3 = request.getParameter("p3");
        String p4 = request.getParameter("p4");
        String p5 = request.getParameter("p5");
        String p6 = request.getParameter("p6");
        String p7 = request.getParameter("p7");
        String p8 = request.getParameter("p8");
        String p9 = request.getParameter("p9");
        int cid = Integer.parseInt(request.getParameter("cid"));

        int productID = dao.getLastProductID();
        dao.addNewProduct2(productID, p1, p2, p3, p4, p5, p6, p7, p8, p9, cid);

        response.sendRedirect("manageProduct?cid=1");
    }

    protected void doPost_update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();
        int pid = Integer.parseInt(request.getParameter("pid"));
        Products p = dao.getProductByID(pid);
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");
        String image4 = request.getParameter("image4");
        if (image1 == null || image1.equals("")) {
            image1 = p.getImage1();
        }
        if (image2 == null || image2.equals("")) {
            image2 = p.getImage2();
        }
        if (image3 == null || image3.equals("")) {
            image3 = p.getImage3();
        }
        if (image4 == null || image4.equals("")) {
            image4 = p.getImage4();
        }
        String productName = request.getParameter("productName");
        String tittle = request.getParameter("tittle");
        String des = request.getParameter("des");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        int percent = Integer.parseInt(request.getParameter("percent"));
        double priceDiscount = price - price * percent / 100;
        int cid = Integer.parseInt(request.getParameter("cid"));

        dao.updateProduct(cid, pid, productName, tittle, des, quantity, color, image1, image2, image3, image4, brand, price, priceDiscount, percent);

        String p1 = request.getParameter("p1");
        String p2 = request.getParameter("p2");
        String p3 = request.getParameter("p3");
        String p4 = request.getParameter("p4");
        String p5 = request.getParameter("p5");
        String p6 = request.getParameter("p6");
        String p7 = request.getParameter("p7");
        String p8 = request.getParameter("p8");
        String p9 = request.getParameter("p9");

        dao.updateProductDetail(pid, cid, p1, p2, p3, p4, p5, p6, p7, p8, p9);

        response.sendRedirect("manageProduct?cid=1");
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        AllDao dao = new AllDao();

        dao.deleteProduct(pid);
        response.sendRedirect("manageProduct?cid=1");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
