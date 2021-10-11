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
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Camera;
import model.Feedback;
import model.Laptop;
import model.Products;
import model.SPhone;
import model.User;

/**
 *
 * @author tungn
 */
@WebServlet(name = "singleProductControl", urlPatterns = {"/singleProduct"})
public class singleProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet singleProductControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet singleProductControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getUrl.getUrl(request, response);
        String indexPage = request.getParameter("index");
        AllDao dao = new AllDao();
        paggingDAO dao2 = new paggingDAO();

        int pid = Integer.parseInt(request.getParameter("pid"));
        Products p = dao.getProductByID(pid);
        Laptop l = dao.getLaptop(pid);
        SPhone sp = dao.getSPhone(pid);
        Camera cam = dao.getCamera(pid);

        int cid = p.getCategoryID();
        List<Products> listRelate = dao.getRelateProduct(cid);

        int count = dao2.countAllFeedbackByPid(pid);
        int endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Feedback> listF = dao2.PaggingAllFeedbackByPid(pid, index);

        request.setAttribute("pid", pid);
        request.setAttribute("p", p);
        request.setAttribute("lap", l);
        request.setAttribute("sphone", sp);
        request.setAttribute("cam", cam);
        request.setAttribute("listRelate", listRelate);
        request.setAttribute("listF", listF);
        request.setAttribute("count", count);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("indexPage", indexPage);

        request.getRequestDispatcher("single-product.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            doGet_load(request, response);
        }
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
            int pid = Integer.parseInt(request.getParameter("pid"));
            int uid = u.getUserID();
            int rate = Integer.parseInt(request.getParameter("rate"));
            String review = request.getParameter("review");
            long millis = System.currentTimeMillis();
            Timestamp fbDate = new Timestamp(millis);
            AllDao dao = new AllDao();
            dao.addFeedback(pid, uid, rate, review, fbDate);

            response.sendRedirect("singleProduct?pid=" + pid);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
