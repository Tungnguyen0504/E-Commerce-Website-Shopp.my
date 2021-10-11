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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Products;

/**
 *
 * @author tungn
 */
@WebServlet(name = "categoryControl", urlPatterns = {"/category"})
public class categoryControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getUrl.getUrl(request, response);
        String indexPage = request.getParameter("index");
        String cid = request.getParameter("id");
        String st = request.getParameter("st");
        int num = 9;
        
        AllDao dao = new AllDao();
        paggingDAO dao2 = new paggingDAO();
        
        List<Brand> listB = dao.getBrandByCid(cid);

        int count = dao2.countProduct(cid);
        int endPage = count / num;
        if (count % num != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Products> list = dao2.paggingProduct(cid, index, num);
        
        request.setAttribute("indexPage", indexPage);
        request.setAttribute("st", st);
        request.setAttribute("listP", list);
        request.setAttribute("listB", listB);
        request.setAttribute("cid", cid);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("shop-grid.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
