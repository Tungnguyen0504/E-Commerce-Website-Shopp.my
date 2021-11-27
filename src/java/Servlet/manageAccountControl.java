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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author tungn
 */
public class manageAccountControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();

        List<User> list = dao.getAllUser();
        request.setAttribute("listAccount", list);

        request.getRequestDispatcher("manage-account.jsp").forward(request, response);
    }

    protected void doGet_view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("uid"));
        AllDao dao = new AllDao();
        User user = dao.findAccount(userID);

        request.setAttribute("user", user);
        request.getRequestDispatcher("update-account.jsp").forward(request, response);
    }

    protected void doPost_add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = new User();
        u.setUserName(request.getParameter("userName"));
        u.setPassword(request.getParameter("password"));
        u.setIsAdmin(Boolean.parseBoolean(request.getParameter("isAdmin")));
        u.setImage(request.getParameter("image"));
        u.setFullName(request.getParameter("fullName"));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setCity(request.getParameter("city"));
        u.setTelephone(request.getParameter("phone"));

        AllDao dao = new AllDao();

        dao.addNewAccount(u);
        response.sendRedirect("manageAccount");
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("uid");
        AllDao dao = new AllDao();

        dao.deleteAccount(uid);
        response.sendRedirect("manageAccount");
    }

    protected void doPost_update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();
        int uid = Integer.parseInt(request.getParameter("uid"));
        User u = dao.findAccount(uid);

        u.setUserName(request.getParameter("userName"));
        u.setPassword(request.getParameter("password"));
        u.setIsAdmin(Boolean.parseBoolean(request.getParameter("isAdmin")));
        u.setIsActive(Boolean.parseBoolean(request.getParameter("isActive")));
        String image = request.getParameter("image");
        if (image == null || image.equals("")) {
            image = u.getImage();
        }
        u.setImage(image);
        u.setFullName(request.getParameter("fullName"));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setCity(request.getParameter("city"));
        u.setTelephone(request.getParameter("phone"));

        dao.updateAccount(u);
        response.sendRedirect("manageAccount");
    }

    protected void doPost_activeAcc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();

        String userID = request.getParameter("id");
        String status = request.getParameter("status");
        dao.activeAcc(userID, status);

        response.sendRedirect("manageAccount");
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
            }
            if (action.equalsIgnoreCase("view")) {
                doGet_view(request, response);
            }

            if (action.equalsIgnoreCase("activeAcc")) {
                doPost_activeAcc(request, response);
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
            if (action.equalsIgnoreCase("addAccount")) {
                doPost_add(request, response);
            }
            if (action.equalsIgnoreCase("updateAccount")) {
                doPost_update(request, response);
            }
            if (action.equalsIgnoreCase("deleteAccount")) {
                doPost_delete(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
