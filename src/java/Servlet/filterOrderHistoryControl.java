/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.paggingDAO;
import generic.getUrl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderHistory;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "filterOrderHistoryControl", urlPatterns = {"/filterOrderHistory"})
public class filterOrderHistoryControl extends HttpServlet {

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
            out.println("<title>Servlet filterOrderHistoryControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterOrderHistoryControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u == null) {
            getUrl.getUrl(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String name = request.getParameter("name");
            int uid = Integer.parseInt(request.getParameter("uid"));
            String indexPage = request.getParameter("index");

            paggingDAO dao = new paggingDAO();

            int count = dao.countFilterOrderHistory(uid, name);
            int endPage = count / 9;
            if (count % 9 != 0) {
                endPage++;
            }
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            List<OrderHistory> list1 = dao.paggingFilterOrderHistory(uid, name, index);

            request.setAttribute("indexPage", indexPage);
            request.setAttribute("end", endPage);
            request.setAttribute("tag", index);
            request.setAttribute("count", count);
            request.setAttribute("txtH", name);
            request.setAttribute("listOd", list1);
            request.getRequestDispatcher("order-history.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
