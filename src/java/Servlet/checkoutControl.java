/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import dao.orderDAO;
import dao.orderDetailDAO;
import generic.getUrl;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Coupon;
import model.Item;
import model.Order;
import model.OrderDetails;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "checkoutControl", urlPatterns = {"/checkout"})
public class checkoutControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u == null) {
            getUrl.getUrl(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("checkout")) {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
            if (action.equalsIgnoreCase("saveorder")) {
                int uid = Integer.parseInt(request.getParameter("uid"));
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                boolean isAdmin = u.isIsAdmin();
                boolean isActive = u.isIsActive();
                String image = u.getImage();
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                User user = new User(uid, userName, password, isAdmin, isActive, image, fullName, email, address, city, phone);
                AllDao dao = new AllDao();
                dao.updateAccount(user);

                Order order = new Order();
                List<Item> cart = (List<Item>) session.getAttribute("cart");

                float price = 0;
                for (int i = 0; i < cart.size(); i++) {
                    price += cart.get(i).getQuantity() * cart.get(i).getP().getPriceDiscount();
                }

                Coupon cou = (Coupon) session.getAttribute("coupon");
                if (cou != null) {
                    price = price - price * cou.getDiscountPercent() / 100;
                }
                if (cart.size() > 0) {
                    long millis = System.currentTimeMillis();
                    Timestamp orderDate = new Timestamp(millis);
                    order.setUserID(uid);
                    order.setOrderDate(orderDate);
                    order.setPayment(request.getParameter("payment-method"));
                    order.setTotal(price);
                    orderDAO.addOrder(order);
                    int orderID = orderDAO.getLastOrderID();
                    for (int i = 0; i < cart.size(); i++) {
                        OrderDetails oDetail = new OrderDetails();
                        oDetail.setOrderID(orderID);
                        oDetail.setProductID(cart.get(i).getP().getProductID());
                        oDetail.setOdQuantity(cart.get(i).getQuantity());
                        oDetail.setSubTotal(cart.get(i).getP().getPriceDiscount() * cart.get(i).getQuantity());
                        orderDetailDAO.addOrderDetail(oDetail);
                        dao.setQuantityProduct(cart.get(i).getP().getProductID(), cart.get(i).getQuantity());
                    }
                }

                request.getRequestDispatcher("success.jsp").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
