/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import dao.AllDao;
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
            out.println("<title>Servlet singleProductControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet singleProductControl at " + request.getContextPath() + "</h1>");
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
        if (action == null) {
            doGet_load(request, response);
        }
    }

    protected void doGet_load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        AllDao dao = new AllDao();

        int pid = Integer.parseInt(request.getParameter("pid"));
        Products p = dao.getProductByID(pid);
        Laptop l = dao.getLaptop(pid);
        SPhone sp = dao.getSPhone(pid);
        Camera cam = dao.getCamera(pid);

        int cid = p.getCategoryID();
        List<Products> listRelate = dao.getRelateProduct(cid);

        int count = dao.countAllFeedbackByPid(pid);
        int endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Feedback> listF = dao.PaggingAllFeedbackByPid(pid, index);

        List<Feedback> list = dao.getAllFeedbackByPid(pid);

//        int s5, s4, s3, s2, s1;
//        s5 = s4 = s3 = s2 = s1 = 0;
//        for (int i = 0; i < list.size(); i++) {
//            if (list.get(i).getRating() == 5) {
//                s5++;
//            }
//            if (list.get(i).getRating() == 4) {
//                s4++;
//            }
//            if (list.get(i).getRating() == 3) {
//                s3++;
//            }
//            if (list.get(i).getRating() == 2) {
//                s2++;
//            }
//            if (list.get(i).getRating() == 1) {
//                s1++;
//            }
//        }

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        if (u == null) {
//            String url = request.getRequestURI() + "?" + request.getQueryString();
//            request.setAttribute("url", url);
//            request.getRequestDispatcher("login.jsp").forward(request, response);
            response.sendRedirect("login");
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
