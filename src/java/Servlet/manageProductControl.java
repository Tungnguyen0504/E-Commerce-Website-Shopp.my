/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Products;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "manageProductControl", urlPatterns = {"/manageProduct"})
public class manageProductControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            String url = request.getRequestURI() + "?" + request.getQueryString();
            request.setAttribute("url", url);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action == null) {
                doGet_load(request, response);
            }
            if (action.equalsIgnoreCase("view")) {
                doGet_view(request, response);
            }
            if (action.equalsIgnoreCase("deleteProduct")) {
                doPost_delete(request, response);
            }
            if (action.equalsIgnoreCase("getPath")) {
                request.getRequestDispatcher("add-new-product.jsp").forward(request, response);
            }
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        String cid = request.getParameter("cid");

        AllDao dao = new AllDao();

        int count = dao.countProduct(cid);   //65
        int endPage = count / 9;   //endPage = 12
        if (count % 9 != 0) {
            endPage++;   //endPage = 13
        }
        //lấy index từ trang jsp, sau đó get ra list theo index trong dao

        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Products> list = dao.paggingProduct(cid, index);

        request.setAttribute("cid", cid);
        request.setAttribute("listProduct", list);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);    //index active
        request.setAttribute("count", count);
        request.setAttribute("indexPage", indexPage);

        request.getRequestDispatcher("manage-product.jsp").forward(request, response);
    }

    protected void doGet_view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        AllDao dao = new AllDao();
        Products product = dao.getProductByID(productID);

        request.setAttribute("view", product);
        request.getRequestDispatcher("edit-product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("addProduct1")) {
            doPost_add1(request, response);
        }
        if (action.equalsIgnoreCase("addProduct2")) {
            doPost_add2(request, response);
        }
        if (action.equalsIgnoreCase("updateProduct")) {
            doPost_update(request, response);
        }
    }

    protected void doPost_add1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");
        String image4 = request.getParameter("image4");
        String productName = request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        double priceDiscount = Double.parseDouble(request.getParameter("priceDiscount"));
        String category = request.getParameter("category");

        AllDao dao = new AllDao();
        dao.addNewProduct1(category, productName, quantity, color, image1, image2, image3, image4, brand, price, priceDiscount);

        if (category.equalsIgnoreCase("1")) {
            request.setAttribute("laptop", "laptop");
        } else if (category.equalsIgnoreCase("2")) {
            request.setAttribute("sphone", "sphone");
        } else if (category.equalsIgnoreCase("3")) {
            request.setAttribute("camera", "camera");
        }
        request.getRequestDispatcher("add-new-product-detail.jsp").forward(request, response);
    }

    protected void doPost_add2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String p1 = request.getParameter("p1");
        String p2 = request.getParameter("p2");
        String p3 = request.getParameter("p3");
        String p4 = request.getParameter("p4");
        String p5 = request.getParameter("p5");
        String p6 = request.getParameter("p6");
        String p7 = request.getParameter("p7");
        String p8 = request.getParameter("p8");
        String p9 = request.getParameter("p9");
        String type = request.getParameter("type");

        AllDao dao = new AllDao();
        int productID = dao.getLastProductID();
        dao.addNewProduct2(productID, p1, p2, p3, p4, p5, p6, p7, p8, p9, type);

        response.sendRedirect("manageProduct?cid=1");
    }

    protected void doPost_update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();

        String image = request.getParameter("image");
        String productName = request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        double priceDiscount = Double.parseDouble(request.getParameter("priceDiscount"));
        String category = request.getParameter("category");
        int id = Integer.parseInt(request.getParameter("productID"));

        dao.updateProduct(image, productName, quantity, color, brand, price, priceDiscount, category, id);
        response.sendRedirect("manageProduct?cid=1");
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productID = request.getParameter("id");
        AllDao dao = new AllDao();

        dao.deleteProduct(productID);
        response.sendRedirect("manageProduct?cid=1");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
