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
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.OrderDetails;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "manageBillControl", urlPatterns = {"/manageBill"})
public class manageBillControl extends HttpServlet {

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

    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();

        List<Order> list = dao.getAllOrder();

        request.setAttribute("listOrder", list);
        request.getRequestDispatcher("manage-order.jsp").forward(request, response);
    }

    protected void doGet_view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int oid = Integer.parseInt(request.getParameter("oid"));
        AllDao dao = new AllDao();

        List<OrderDetails> list = dao.getOrderDetailByID(oid);
        Order o = dao.findOrder(oid);
        User u = dao.findAccount(o.getUserID());

        SimpleDateFormat df = new SimpleDateFormat("MMM dd, yyyy");
        String orderDate = df.format(o.getOrderDate());

        request.setAttribute("user", u);
        request.setAttribute("order", o);
        request.setAttribute("orderDate", orderDate);
        request.setAttribute("listOrderDetail", list);
        request.getRequestDispatcher("order-detail.jsp").forward(request, response);
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        AllDao dao = new AllDao();
        dao.deleteOrder(id);
    }

    protected void doPost_changeST(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int oid = Integer.parseInt(request.getParameter("oid"));
        String status = request.getParameter("st");
        //b2: call dao
        AllDao dao = new AllDao();
        dao.changeStatus(oid, status);
        response.sendRedirect("manageBill");
    }

    @Override
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
            } else if (action.equalsIgnoreCase("delete")) {
                doPost_delete(request, response);
            } else if (action.equalsIgnoreCase("changeStatus")) {
                doPost_changeST(request, response);
            } else if (action.equalsIgnoreCase("view")) {
                doGet_view(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u == null) {
            getUrl.getUrl(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("changeStatus")) {
                doPost_changeST(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
