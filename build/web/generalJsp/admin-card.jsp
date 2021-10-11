<%-- 
    Document   : admin-sidebar
    Created on : Oct 3, 2021, 2:47:10 AM
    Author     : tungn
--%>

<%@page import="dao.paggingDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.AllDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="row">
            <!--card earning-->
            <%
                AllDao dao = new AllDao();

                long millis = System.currentTimeMillis();
                Timestamp now = new Timestamp(millis);

                double earn = 0;
                for (Order o : dao.getAllOrder()) {
                    if (TimeUnit.MILLISECONDS.toDays(now.getTime() - o.getOrderDate().getTime()) <= 30) {
                        earn += o.getTotal();
                    }
                }
                request.setAttribute("earn", earn);
            %> 
            <div class="col-lg-3 col-sm-6">
                <div class="card-box bg-yellow shadow">
                    <div class="inner">
                        <h3> <fmt:setLocale value = "en_US"/><fmt:formatNumber value="${earn}" type="currency"/></h3>
                        <p> Earning (Monthly) </p>
                    </div>
                    <div class="icon">
                        <i class="bi bi-cart-check-fill" aria-hidden="true"></i>
                    </div>
                    <a href="manageBill" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!--card order-->
            <%
                int countO = 0;
                for (Order o : dao.getAllOrder()) {
                    countO++;
                }
                request.setAttribute("countO", countO);
            %>
            <div class="col-lg-3 col-sm-6">
                <div class="card-box bg-pink shadow">
                    <div class="inner">
                        <h3> ${countO} </h3>
                        <p> Total of Orders </p>
                    </div>
                    <div class="icon">
                        <i class="far fa-calendar-check"></i>
                    </div>
                    <a href="manageBill" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!--card user-->
            <%
                int countU = 0;
                for (User u : dao.getAllUser()) {
                    countU++;
                }
                request.setAttribute("countU", countU);
            %>
            <div class="col-lg-3 col-sm-6">
                <div class="card-box bg-blue shadow">
                    <div class="inner">
                        <h3> ${countU} </h3>
                        <p> Total of Users </p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users" aria-hidden="true"></i>
                    </div>
                    <a href="manageAccount" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!--card product-->
            <%
                paggingDAO dao1 = new paggingDAO();
                int count = dao1.countProduct("1") + dao1.countProduct("2") + dao1.countProduct("3");
                request.setAttribute("countP", count);
            %>
            <div class="col-lg-3 col-sm-6">
                <div class="card-box bg-green shadow">
                    <div class="inner">
                        <h3> ${countP} </h3>
                        <p> Total of Products </p>
                    </div>
                    <div class="icon">
                        <i class="bi bi-camera" aria-hidden="true"></i>
                    </div>
                    <a href="manageProduct" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

        </div>
        <!--        <div class="row">
                    <div class="col-md-4 col-xl-3">
                        <div class="card bg-c-blue order-card">
                            <div class="card-block">
                                <h6 class="m-b-20">Laptop</h6>
                                <h2 class="text-right"><i class="bi bi-camera"></i></i><span>20</span></h2>
                                <p class="m-b-0">Total of Products<span class="f-right">65</span></p>
                            </div>
                        </div>
                    </div>
        
                  
                    <div class="col-md-4 col-xl-3">
                        <div class="card bg-c-green order-card">
                            <div class="card-block">
                                <h6 class="m-b-20">User Active</h6>
                                <h2 class="text-right"><i class="fas fa-users"></i><span>${countU} </span></h2>
                                <p class="m-b-0">Total of Users<span class="f-right"><strong>${countU1}</strong></span></p>
                            </div>
                        </div>
                    </div>
        
       
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Total Order</h6>
                    <h2 class="text-right"><i class="far fa-calendar-check"></i><span>${countO}</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">${countO1}</span></p>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Earning (Monthly)</h6>
                    <h2 class="text-right"><i class="bi bi-cart-check-fill"></i><span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${earn}" type="currency"/></span></h2>
                    <p class="m-b-0">Earning (Annual)<span class="f-right"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${earn1}" type="currency"/></span></p>
                </div>
            </div>
        </div>
    </div>-->
    </body>
</html>
