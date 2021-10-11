<%-- 
    Document   : header.jsp
    Created on : Mar 12, 2021, 2:55:52 AM
    Author     : tungn
--%>

<%@page import="dao.AllDao"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>E&E - Electronics eCommerce Bootstrap4 HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <style>
            .form-select {
                padding: 0;
                font-size: 14px;
            }
            .btn {
                border-radius: 5px;
                padding: 2px 15px;
            }
            .btn i {
                margin-right: 13px;
                margin-left: -3px;
                color: whitesmoke;
            }
        </style>
    </head>
    <body>
        <%
            AllDao dao = new AllDao();
            List<Category> listC = dao.getCategory();
            request.setAttribute("listC", listC);
        %>
        <!-- Header Top Start -->
        <div class="header-top header-top-one header-top-border pt-10 pb-10">
            <div class="container">
                <div class="row align-items-center justify-content-between">

                    <div class="col mt-10 mb-10" style="width: 25%;">
                        <!-- Header Links Start -->
                        <div class="header-links">
                            <a href="track-order.jsp"><span>Track your order</span></a>
                            <a href="locale-store.jsp"><span>Locate Store</span></a>
                        </div><!-- Header Links End -->
                    </div>

                    <div class="col-md-6 order-10 order-xs-1 order-lg-2 mt-10 mb-10" style="text-align: center; width: 50%;">
                        <!-- Header Advance Search Start -->
                        <div class="header-advance-search">
                            <form action="search" method="post">
                                <div class="input"><input type="text" name="txt" value="${txt}" placeholder="Search your product"></div>
                                <div class="select">
                                    <select class="nice-select" name="choose">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.categoryID}">${o.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="submit"><button><i class="icofont icofont-search-alt-1"></i></button></div>
                            </form>
                        </div><!-- Header Advance Search End -->
                    </div>

                    <div class="col-md-3 order-2 mt-10 mb-10" style="display: flex; justify-content: end; width: 25%;">
                        <!-- Header Account Links Start -->
                        <c:if test="${sessionScope.acc == null}">
                            <!--<a class="btn btn-primary" href="login" role="button" style="border-radius: 25px">Login</a>-->
                            <form action="login" method="get">
                                <input type="hidden" name="url" value="${url}">
                                <button class="btn btn-primary" role="button" style="border-radius: 25px">Login</button>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="icofont icofont-user-alt-7"></i><span>${sessionScope.acc.fullName}</span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton2">
                                    <li><a class="dropdown-item" href="myAccount?uid=${sessionScope.acc.userID}&action=viewAccount">My Account</a></li>
                                    <li><a class="dropdown-item" href="myAccount?uid=${sessionScope.acc.userID}&action=viewPassword">Change Password</a></li>
                                    <li><a class="dropdown-item" href="orderHistory?uid=${sessionScope.acc.userID}">Order History</a></li>
                                        <c:if test="${sessionScope.acc.isAdmin}">
                                        <li><a class="dropdown-item" href="manageDashboard">Manage Page</a></li>
                                        </c:if>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                                </ul>
                            </div>
                        </c:if>
                    </div>


                </div>
            </div>
        </div><!-- Header Top End -->

        <!-- Header Bottom Start -->
        <div class="header-bottom header-bottom-one header-sticky" id="main-menu" style="background-color: white;">
            <div class="container">
                <div class="row align-items-center justify-content-between" id="main-menu-2">

                    <div class="col mt-15 mb-15">
                        <!-- Logo Start -->
                        <div class="header-logo">
                            <a href="home">
                                <img src="assets/images/icons/1-removebg-preview.png" alt="E&E - Electronics eCommerce Bootstrap4 HTML Template">
                                <img class="theme-dark" src="assets/images/icons/1-removebg-preview.png" alt="E&E - Electronics eCommerce Bootstrap4 HTML Template">
                            </a>
                        </div><!-- Logo End -->
                    </div>

                    <div class="col order-12 order-lg-2 order-xl-2 d-none d-lg-block">
                        <!-- Main Menu Start -->
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li class="active"><a href="home"><strong>HOME</strong></a></li>
                                    <li class="active"><a href="category?id=1"><strong>Shop</strong></a>
                                    </li>
                                    <li class="menu-item-has-children"><a href="#"><strong>PAGES</strong></a>
                                        <ul class="mega-menu three-column">
                                            <li><a href="#"></a>
                                                <ul>
                                                    <li><a href="about-us.jsp">About us</a></li>
                                                    <li><a href="cart.jsp">Cart</a></li>
                                                    <li><a href="locale-store.jsp">Store</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#"></a>
                                                <ul>
                                                    <li><a href="faq.jsp">Faq</a></li>
                                                    <li><a href="feature.jsp">Feature</a></li>
                                                    <li><a href="login">Login</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#"></a>
                                                <ul>
                                                    <li><a href="term-conditions.jsp">Terms & Conditions</a></li>
                                                    <li><a href="track-order.jsp">Track Order</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="active"><a href="blog.jsp"><strong>BLOG</strong></a>
                                    </li>
                                    <li><a href="contact.jsp"><strong>CONTACT</strong></a></li>
                                </ul>
                            </nav>
                        </div><!-- Main Menu End -->

                    </div>

                    <div class="col order-2 order-lg-12 order-xl-12">
                        <!-- Header Shop Links Start -->
                        <div class="header-shop-links">
                            <c:if test="${sessionScope.cart.size() == null}"><a href="shoppingCart" class="header-cart" title="Cart"><i class="ti-shopping-cart"></i><span class="number">0</span> </a></c:if>
                            <c:if test="${sessionScope.cart.size() != null}"><a href="shoppingCart" class="header-cart" title="Cart"><i class="ti-shopping-cart"></i><span class="number">${sessionScope.cart.size()}</span> </a></c:if>
                        </div><!-- Header Shop Links End -->
                    </div>

                    <!-- Mobile Menu -->
                    <div class="mobile-menu order-12 d-block d-lg-none col"></div>

                </div>
            </div>
        </div><!-- Header Bottom End -->

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>
