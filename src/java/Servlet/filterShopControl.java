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
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Products;

/**
 *
 * @author tungnguyen
 */
@WebServlet(name = "filterShopControl", urlPatterns = {"/filterShop"})
public class filterShopControl extends HttpServlet {

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
            out.println("<title>Servlet filterShopControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterShopControl at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("filterPrice")) {
            doGet_filterPrice(request, response);
        }
        if (action.equalsIgnoreCase("sort")) {
            doGet_sort(request, response);
        }
        getUrl.getUrl(request, response);
        request.getRequestDispatcher("shop-grid.jsp").forward(request, response);
    }

    protected void doGet_filterPrice(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        String cid = request.getParameter("id");
        String min = request.getParameter("min");
        String max = request.getParameter("max");
        String st = request.getParameter("st");

        AllDao dao1 = new AllDao();
        paggingDAO dao2 = new paggingDAO();
        List<Brand> listB = dao1.getBrandByCid(cid);

        int count = dao2.countFilterPriceShop(cid, min, max);
        int endPage = count / 9;
        if (count % 9 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Products> list1 = dao2.paggingFilterPriceShop(cid, min, max, index);

        request.setAttribute("st", st);
        request.setAttribute("listP", list1);
        request.setAttribute("listB", listB);
        request.setAttribute("cid", cid);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("indexPage", indexPage);
    }

    protected void doGet_sort(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        String cid = request.getParameter("id");
        String brand = request.getParameter("brand");
        String indexPage = request.getParameter("index");

        AllDao dao = new AllDao();
        paggingDAO dao2 = new paggingDAO();
        List<Brand> listB = dao.getBrandByCid(cid);

        int count = dao2.countProduct(cid);
        int endPage = count / 9;
        if (count % 9 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Products> list1 = dao2.paggingSortProduct(cid, index, type);

        request.setAttribute("indexPage", indexPage);
        request.setAttribute("sort", type);
        request.setAttribute("listP", list1);
        request.setAttribute("brand", brand);
        request.setAttribute("cid", cid);
        request.setAttribute("listB", listB);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
