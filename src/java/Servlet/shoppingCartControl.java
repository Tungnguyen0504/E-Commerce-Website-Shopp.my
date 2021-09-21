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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
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
           String url = request.getRequestURI() + "?" + request.getQueryString();
            request.setAttribute("url", url);
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
                int total = cart.size();
                out.println("<a href=\"shoppingCart\" class=\"header-cart\"><i class=\"ti-shopping-cart\"></i><span class=\"number\">" + total + "</span> </a>");
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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action.equalsIgnoreCase("update")) {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            String[] quantity = request.getParameterValues("quantity");
            for (int i = 0; i < cart.size(); i++) {
                cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
            }
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
