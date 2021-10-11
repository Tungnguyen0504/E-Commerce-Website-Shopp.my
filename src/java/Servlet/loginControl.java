/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "loginControl", urlPatterns = {"/login"})
public class loginControl extends HttpServlet {

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
        String url = request.getParameter("url");
        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("userC")) {
                    request.setAttribute("username", o.getValue());
                }
                if (o.getName().equals("passC")) {
                    request.setAttribute("password", o.getValue());
                }
            }
        }
        request.setAttribute("url", url);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getParameter("url");
        String userName = request.getParameter("user");
        String passWord = request.getParameter("pass");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();
        String captcha = session.getAttribute("captcha_security").toString();
        String verifyCaptcha = request.getParameter("captcha");
        AllDao dao = new AllDao();
        User u = dao.Login(userName, passWord);
        if (u == null) {
            request.setAttribute("mess", "<div class=\"alert alert-warning\" role=\"alert\">\n"
                    + "<img id=\"warning\" src=\"assets/images/icons/alert-icon-red-11.png\" alt=\"warnning\">Coundn't find your Account!!\n"
                    + "</div>");
            request.getRequestDispatcher("login.jsp").forward(request, response);    //khong truyen du lieu
        } else {
            if (captcha.equals(verifyCaptcha)) {
                if (u.isIsActive()) {
                    Cookie us = new Cookie("userC", u.getUserName());
                    Cookie pa = new Cookie("passC", u.getPassword());
                    us.setMaxAge(3600);
                    if (remember != null) {
                        us.setMaxAge(3600);
                    } else {
                        pa.setMaxAge(0);
                    }
                    response.addCookie(us);
                    response.addCookie(pa);
                    
                    session.setAttribute("acc", u);
                    if (url.isEmpty()) {
                        response.sendRedirect("home");
                    } else {
                        response.sendRedirect(url);
                    }
                } else {                    
                    request.setAttribute("error", "<div class=\"alert alert-warning\" role=\"alert\">\n"
                            + "<img id=\"warning\" src=\"assets/images/icons/alert-icon-red-11.png\" alt=\"warnning\">Your account is not active!!\n"
                            + "</div>");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "<div class=\"alert alert-warning\" role=\"alert\">\n"
                        + "<img id=\"warning\" src=\"assets/images/icons/alert-icon-red-11.png\" alt=\"warnning\">Captcha Invalid!!\n"
                        + "</div>");
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
