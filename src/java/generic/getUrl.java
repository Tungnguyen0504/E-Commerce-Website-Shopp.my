/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package generic;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tungn
 */
public class getUrl {

    public static void getUrl(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String url = request.getRequestURI();
        if (request.getQueryString() != null) {
            url += "?" + request.getQueryString();
        } else {
        }
        request.setAttribute("url", url);
    }
}
