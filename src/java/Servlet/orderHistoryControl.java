/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Order;
import model.OrderHistory;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "orderHistoryControl", urlPatterns = {"/orderHistory"})
public class orderHistoryControl extends HttpServlet {

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
            out.println("<title>Servlet orderHistoryControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderHistoryControl at " + request.getContextPath() + "</h1>");
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
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String indexPage = request.getParameter("index");

        AllDao dao = new AllDao();

        int count = dao.countAllOrderHistory(uid);
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<OrderHistory> list = dao.paggingAllOrderHistory(uid, index);
//        for (OrderHistory o : list) {
//            SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy");
//            String orderDateFormat = df.format(o.o.getOrderDate());
//            o.getO().setOrderDate(orderDateFormat);
//        }

        request.setAttribute("indexPage", indexPage);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("count", count);
        request.setAttribute("listOd", list);
        request.getRequestDispatcher("order-history.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
