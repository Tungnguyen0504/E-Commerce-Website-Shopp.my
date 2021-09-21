/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
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
            if (action.equalsIgnoreCase("view")) {
                doGet_view(request, response);
            }
            if (action.equalsIgnoreCase("deleteAccount")) {
                doPost_delete(request, response);
            }
            if (action.equalsIgnoreCase("activeAcc")) {
                doPost_activeAcc(request, response);
            }
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");

        AllDao dao = new AllDao();

        int count = dao.countAccount();   //65
        int endPage = count / 8;   //endPage = 12
        if (count % 8 != 0) {
            endPage++;   //endPage = 13
        }
        //lấy index từ trang jsp, sau đó get ra list theo index trong dao

        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<User> list = dao.paggingAccount(index);
        request.setAttribute("listAccount", list);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);    //index active
        request.setAttribute("count", count);
        request.setAttribute("indexPage", indexPage);

        request.getRequestDispatcher("manage-account.jsp").forward(request, response);
    }

    protected void doGet_view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("id");
        AllDao dao = new AllDao();
        User user = dao.findAccount(userID);

        request.setAttribute("view", user);
        request.getRequestDispatcher("edit-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("addAccount")) {
            doPost_add(request, response);
        }
        if (action.equalsIgnoreCase("updateAccount")) {
            doPost_update(request, response);
        }

    }

    protected void doPost_add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");

        AllDao dao = new AllDao();

        dao.addNewAccount(userName, password, isAdmin, fullName, email, address, city, telephone);
        response.sendRedirect("manageAccount");
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("id");
        AllDao dao = new AllDao();

        dao.deleteAccount(uid);
    }

    protected void doPost_update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AllDao dao = new AllDao();

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String isAdmin = request.getParameter("isAdmin");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String userID = request.getParameter("userID");

        dao.updateAccount(userName, password, isAdmin, fullName, email, address, city, telephone, userID);
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
