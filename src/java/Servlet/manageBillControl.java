/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import java.io.IOException;
import java.io.PrintWriter;
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
            } else if (action.equalsIgnoreCase("delete")) {
                doPost_delete(request, response);
            } else if (action.equalsIgnoreCase("changeST")) {
                doPost_changeST(request, response);
            }
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");

        AllDao dao = new AllDao();

        int count = dao.countOrder();   
        int endPage = count / 8;   
        if (count % 8 != 0) {
            endPage++;   
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Order> list = dao.paggingOrder(index);
        
        request.setAttribute("indexPage", indexPage);
        request.setAttribute("listOrder", list);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);    //index active
        request.setAttribute("count", count);
        request.getRequestDispatcher("manage-bill.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        AllDao dao = new AllDao();
        dao.deleteOrder(id);
    }

    protected void doPost_changeST(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        //b2: call dao
        AllDao dao = new AllDao();
        dao.changeStatus(id, status);
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
