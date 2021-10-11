/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Coupon;
import model.Item;

/**
 *
 * @author tungnguyen
 */
@WebServlet(name = "updownQuantityControl", urlPatterns = {"/updownQuantity"})
public class updownQuantityControl extends HttpServlet {

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

        if (action.equalsIgnoreCase("update")) {
            String change = request.getParameter("change");
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExisting(Integer.parseInt(request.getParameter("pid")), cart);
            PrintWriter out = response.getWriter();

            DecimalFormat decimalFormat = new DecimalFormat("#0.00");

            int quantity = cart.get(index).getQuantity();

            if (change.equalsIgnoreCase("des") && cart.get(index).getQuantity() > 1) {
                quantity--;
                cart.get(index).setQuantity(quantity);
            } else if (change.equalsIgnoreCase("inc") && cart.get(index).getP().getPQuantity() > quantity) {
                quantity++;
                cart.get(index).setQuantity(quantity);
            }
            out.println("<div class=\"cart-table table-responsive mb-40\">\n"
                    + "                            <table class=\"table\">\n"
                    + "                                <thead>\n"
                    + "                                    <tr>\n"
                    + "                                        <th class=\"pro-thumbnail\">Image</th>\n"
                    + "                                        <th class=\"pro-title\" style=\"text-align: left;\">Product</th>\n"
                    + "                                        <th class=\"pro-price\">Price</th>\n"
                    + "                                        <th class=\"pro-quantity\">Quantity</th>                                \n"
                    + "                                        <th class=\"pro-subtotal\">Total</th>\n"
                    + "                                        <th class=\"pro-remove\">Remove</th>\n"
                    + "                                    </tr>\n"
                    + "                                </thead>\n"
                    + "                                <tbody>");
            for (Item o : cart) {
                out.println("<tr>\n"
                        + "                                                <td class=\"pro-thumbnail\"><a href=\"single-product.jsp?id=" + o.getP().getProductID() + "\"><img src=\"assets/images/products/" + o.getP().getImage1() + "\" alt=\"Product\"></a></td>\n"
                        + "                                            <td class=\"pro-title\" style=\"width: 35%; text-align: left;\"><a href=\"single-product.jsp?id=" + o.getP().getProductID() + "\">" + o.getP().getProductName() + "</a></td>\n"
                        + "                                            <td class=\"pro-price\"><span>$" + o.getP().getPriceDiscount() + "</span></td>\n"
                        + "                                            <td>\n"
                        + "                                                <div style=\"display: flex; justify-content: center;\">\n"
                        + "                                                    <button onclick=\"updownQt(-1, " + o.getP().getProductID() + ")\" class=\"btn-left\" id=\"qty\">-</button>\n"
                        + "                                                    <input type=\"text\" value=\"" + o.getQuantity() + "\" id=\"qty\" readonly>\n"
                        + "                                                    <button onclick=\"updownQt(1, " + o.getP().getProductID() + ")\" class=\"btn-right\" id=\"qty\">+</button>\n"
                        + "                                                </div>\n"
                        + "                                            </td>\n"
                        + "                                            <td class=\"pro-subtotal\"><span id=\"total-price\">$" + decimalFormat.format(o.getP().getPriceDiscount() * o.getQuantity()) + "</span></td>\n"
                        + "                                            <td class=\"pro-remove\"><a href=\"shoppingCart?action=delete&id=" + o.getP().getProductID() + "\"><i class=\"fas fa-trash-alt\" style=\"color: red; font-size: 22px;\"></i></a></td>\n"
                        + "                                        </tr>");
            }
            out.println("</tbody>\n"
                    + "                            </table>\n"
                    + "                        </div>");
            double total = 0;
            for (Item o : cart) {
                total += o.getQuantity() * o.getP().getPriceDiscount();
            }

            Coupon cou = (Coupon) session.getAttribute("coupon");
            out.println("<div class=\"row\">\n"
                    + "\n"
                    + "                            <div class=\"col-lg-6 col-12 mb-15\">\n"
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
                    + "                                                <input type=\"text\" name=\"couName\" value=\"" + (cou != null ? cou.getCouName() : "") + "\" placeholder=\"Coupon Code\">\n"
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
                    + "\n");
            int discountPercent = 0;
            if (cou != null) {
                discountPercent = cou.getDiscountPercent();
            }
            out.println("<p>Sub Total <span>" + decimalFormat.format(total) + "</span></p>\n"
                    + "                                        <p>Discount <span>" + decimalFormat.format(total * discountPercent / 100) + "</span></p>\n"
                    + "                                        <p>Shipping Cost <span>$00.00</span></p>\n"
                    + "                                        <h2>Grand Total <span>" + decimalFormat.format(total - total * discountPercent / 100) + "</span></h2>\n"
                    + "                                    </div>\n"
                    + "                                    <a href=\"checkout?action=checkout\">Checkout</a>\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                        </div>");
//            session.setAttribute("cart", cart);
//            request.getRequestDispatcher("cart.jsp").forward(request, response);
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
