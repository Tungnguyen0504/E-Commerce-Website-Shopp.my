/*
 * To change this license header, cid License Headers in Project Properties.
 * To change this template file, cid Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import model.Products;
import dao.AllDao;
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
import model.Brand;
import model.Category;

/**
 *
 * @author tungn
 */
@WebServlet(name = "filterManageProductControl", urlPatterns = {"/filterManageProduct"})
public class filterManageProductControl extends HttpServlet {

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("sort")) {
            doGet_sort(request, response);
        }
        if (action.equalsIgnoreCase("search")) {
            doPost_search(request, response);
        }
        getUrl.getUrl(request, response);
        request.getRequestDispatcher("manage-product.jsp").forward(request, response);
    }

    protected void doGet_sort(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        String indexPage = request.getParameter("index");
        String cid = request.getParameter("cid");

        paggingDAO dao = new paggingDAO();
        int count = dao.countProduct(cid);
        int endPage = count / 9;
        if (count % 9 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Products> list1 = dao.paggingSortProduct(cid, index, type);

        request.setAttribute("count", count);
        request.setAttribute("type", type);
        request.setAttribute("listProduct", list1);
        request.setAttribute("cid", cid);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("indexPage", indexPage);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("search")) {
            doPost_search(request, response);
        }
        getUrl.getUrl(request, response);
        request.getRequestDispatcher("manage-product.jsp").forward(request, response);
    }

    protected void doPost_search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String txtSearch = request.getParameter("name");
        String cid = request.getParameter("cid");
        String indexPage = request.getParameter("index");

        paggingDAO dao2 = new paggingDAO();

        int count = dao2.countSearchProduct(txtSearch, cid);
        int endPage = count / 9;
        if (count % 9 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Products> list1 = dao2.paggingSearchProduct(txtSearch, cid, index);

        request.setAttribute("count", count);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("listProduct", list1);
        request.setAttribute("txtH", txtSearch);
        request.setAttribute("cid", cid);
        request.setAttribute("indexPage", indexPage);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
