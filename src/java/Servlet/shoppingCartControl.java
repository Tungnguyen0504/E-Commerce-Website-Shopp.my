/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import dao.orderDAO;
import dao.orderDetailDAO;
import dao.userDAO;
import generic.getUrl;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Coupon;
import model.Item;
import model.Order;
import model.OrderDetails;
import model.Products;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "shoppingCartControl", urlPatterns = {"/shoppingCart"})
public class shoppingCartControl extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet shoppingCartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shoppingCartControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();

        AllDao dao = new AllDao();

        if (u == null) {
            getUrl.getUrl(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action == null) {
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else if (action.equals("ordernow")) {
                if (session.getAttribute("cart") == null) {
                    Products p = dao.getProductByID(Integer.parseInt(request.getParameter("id")));
                    List<Item> cart = new ArrayList<Item>();
                    cart.add(new Item(p, 1));
                    session.setAttribute("cart", cart);
                    int total = cart.size();
                    out.println("<a href=\"shoppingCart\" class=\"header-cart\"><i class=\"ti-shopping-cart\"></i><span class=\"number\">" + total + "</span> </a>");
                } else {
                    List<Item> cart = (List<Item>) session.getAttribute("cart");
                    int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
                    if (index == -1) {
                        Products p = dao.getProductByID(Integer.parseInt(request.getParameter("id")));
                        cart.add(new Item(p, 1));
                    } else {
                        if (cart.get(index).getP().getPQuantity() > cart.get(index).getQuantity()) {
                            int quantity = cart.get(index).getQuantity() + 1;
                            cart.get(index).setQuantity(quantity);
                        }
                    }
                    session.setAttribute("cart", cart);

                    int total = cart.size();
                    out.println("<a href=\"shoppingCart\" class=\"header-cart\"><i class=\"ti-shopping-cart\"></i><span class=\"number\">" + total + "</span> </a>");
                }
            } else if (action.equals("delete")) {
                List<Item> cart = (List<Item>) session.getAttribute("cart");
                int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
                cart.remove(index);

                session.setAttribute("cart", cart);
                response.sendRedirect("cart.jsp");
            } else if (action.equals("removeCou")) {
                session.removeAttribute("coupon");
                request.removeAttribute("txt");

                DecimalFormat decimalFormat = new DecimalFormat("#0.00");

                List<Item> cart = (List<Item>) session.getAttribute("cart");
                double total = 0;
                for (Item o : cart) {
                    total += o.getQuantity() * o.getP().getPriceDiscount();
                }
                out.println("<div class=\"col-lg-6 col-12 mb-15\">\n"
                        + "                                <div class=\"discount-coupon\" style=\"margin-bottom: 50px;\">\n"
                        + "                                    <h4 style=\"margin-bottom: 15px;\">FREE* STANDARD DELIVERY</h4>\n"
                        + "                                    <div class=\"row\">\n"
                        + "                                        <div class=\"col-md-2\">\n"
                        + "                                            <img src=\"assets/images/icons/cart-delivery.png\" alt=\"\" style=\"max-width: 80px;\"/>\n"
                        + "                                        </div>\n"
                        + "                                        <div class=\"col-md-10\" style=\"font-weight: 600; align-self: center;\">\n"
                        + "                                            <p style=\"margin-bottom: 5px;\">Faster delivery options available to most countries</p>\n"
                        + "                                            <a href=\"#\" style=\"text-decoration: underline 2px;\">More info</a>\n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                                <!-- Discount Coupon -->\n"
                        + "                                <div class=\"discount-coupon\">\n"
                        + "                                    <h4>Discount Coupon Code</h4>\n"
                        + "                                    <form action=\"shoppingCart\" method=\"post\">\n"
                        + "                                        <div class=\"row\">\n"
                        + "                                            <div class=\"search-coupon col-md-6 col-12 mb-25\">\n"
                        + "                                                <input type=\"text\" name=\"couName\" value=\"\" placeholder=\"Coupon Code\">\n"
                        + "                                                <button onclick=\"removeCoupon()\" type=\"reset\">&times;</button>\n"
                        + "                                            </div>\n"
                        + "                                            <div class=\"col-md-6 col-12 mb-25\">\n"
                        + "                                                <input type=\"submit\" value=\"Apply Code\">\n"
                        + "                                            </div>\n"
                        + "                                        </div>\n"
                        + "                                    </form>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "\n"
                        + "                            <!-- Cart Summary -->\n"
                        + "                            <div class=\"col-lg-6 col-12 mb-40 d-flex\">\n"
                        + "                                <div class=\"cart-summary\">\n"
                        + "                                    <div id=\"total\" class=\"cart-summary-wrap\">\n"
                        + "                                        <h4>Cart Summary</h4>\n"
                        + "                                        <p>Sub Total <span>" + decimalFormat.format(total) + "</span></p>\n"
                        + "                                        <p>Discount <span>$00.00</span></p>\n"
                        + "                                        <p>Shipping Cost <span>$00.00</span></p>\n"
                        + "                                        <h2>Grand Total <span>" + decimalFormat.format(total) + "</span></h2>\n"
                        + "                                    </div>\n"
                        + "                                    <a href=\"checkout?action=checkout\">Checkout</a>\n"
                        + "                                </div>\n"
                        + "                            </div>");
            }
        }
    }

    private int isExisting(int id, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getP().getProductID() == id) {
                return i;
            }
        }
        return -1;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        HttpSession session = request.getSession();
//        if (action.equalsIgnoreCase("update")) {
//            List<Item> cart = (List<Item>) session.getAttribute("cart");
//            String[] quantity = request.getParameterValues("quantity");
//            for (int i = 0; i < cart.size(); i++) {
//                cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
//            }
//            session.setAttribute("cart", cart);
//            request.getRequestDispatcher("cart.jsp").forward(request, response);
//        }

        String couName = request.getParameter("couName");
        AllDao dao = new AllDao();
        Coupon cou = dao.getCoupon(couName);
        HttpSession session = request.getSession();
        session.setAttribute("coupon", cou);
        response.sendRedirect("cart.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
