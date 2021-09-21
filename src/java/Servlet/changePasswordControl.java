/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "changePasswordControl", urlPatterns = {"/changePassword"})
public class changePasswordControl extends HttpServlet {

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
        String name = request.getParameter("name");
        AllDao dao = new AllDao();
        User u1 = dao.findAccount1(name);
        request.setAttribute("view", u1);
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
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
        String userName = request.getParameter("userName");
        String currentPass = request.getParameter("currentPass");
        String newPass = request.getParameter("newPass");
        String rePass = request.getParameter("rePass");
        String name = request.getParameter("name");
        AllDao dao = new AllDao();

        User u = dao.Login(userName, currentPass);
        User u1 = dao.findAccount1(name);
        if (u == null) {
            request.setAttribute("mess", "<div class=\"alert alert-warning\" role=\"alert\">\n"
                    + "<img id=\"warning\" src=\"assets/images/icons/alert-icon-red-11.png\" alt=\"warnning\">Incorrect account !!\n"
                    + "</div>");
            request.setAttribute("view", u1);
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
        } else {
            if (!newPass.equals(rePass)) {
                request.setAttribute("error", "<div class=\"alert alert-warning\" role=\"alert\">\n"
                        + "<img id=\"warning\" src=\"assets/images/icons/alert-icon-red-11.png\" alt=\"warnning\">Password didn't match, Try again!!\n"
                        + "</div>");
                request.setAttribute("view", u1);
                request.getRequestDispatcher("change-password.jsp").forward(request, response);
            } else {
                dao.updatePassword(rePass, userName);
                response.sendRedirect("home");
            }
        }
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
