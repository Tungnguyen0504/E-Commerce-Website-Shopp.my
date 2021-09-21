/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tungn
 */
@WebServlet(name = "capchaControl", urlPatterns = {"/captcha-image"})
public class capchaControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
        response.setContentType("image/jpg");
        int iTotalChars = 6;
        int iHeight = 40;
        int iWidth = 150;
        Font font = new Font("Arial", Font.BOLD, 30);
        Random random = new Random();
        String sImageCode = (Long.toString(Math.abs(random.nextLong()), 36)).substring(0, iTotalChars);
        BufferedImage bufferedImage = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics2d = (Graphics2D) bufferedImage.getGraphics();
        int iCircle = 15;
        for (int i = 0; i < iCircle; i++) {
            graphics2d.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
        }
        graphics2d.setFont(font);
        for (int i = 0; i < iTotalChars; i++) {
            graphics2d.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
            if (i % 2 == 0) {
                graphics2d.drawString(sImageCode.substring(i, i + 1), 25 * i, 24);
            } else {
                graphics2d.drawString(sImageCode.substring(i, i + 1), 25 * i, 35);
            }
        }
        OutputStream outputStream = response.getOutputStream();
        ImageIO.write(bufferedImage, "jpeg", outputStream);
        graphics2d.dispose();
        HttpSession session = request.getSession();
        session.setAttribute("captcha_security", sImageCode);
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
        processRequest(request, response);
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
