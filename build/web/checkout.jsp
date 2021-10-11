<%-- 
    Document   : checkout
    Created on : Mar 11, 2021, 10:44:19 AM
    Author     : tungn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>E&E - Electronics eCommerce Bootstrap4 HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

        <!-- CSS
            ============================================ -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Icon Font CSS -->
        <link rel="stylesheet" href="assets/css/icon-font.min.css">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

        <!-- Modernizer JS -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <!-- Page Banner Section Start -->
            <div class="page-banner-section section">
                <div class="page-banner-wrap row row-0 d-flex align-items-center ">
                    <!-- Banner -->
                    <!-- Page Banner -->
                    <div class="col-lg-12 col-12 order-lg-2 d-flex align-items-center justify-content-center">
                        <div class="page-banner">
                            <h1>Checkout Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="listProduct">Checkout</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Banner -->

                </div>
            </div><!-- Page Banner Section End -->

            <!-- Checkout Page Start -->
            <div class="page-section section mt-90 mb-30">
                <div class="container">
                    <div class="row">
                        <div class="col-12">

                            <!-- Checkout Form s-->
                            <form action="checkout?action=saveorder" class="checkout-form" method="POST">
                                <div class="row row-40">

                                    <div class="col-lg-7 mb-20">

                                        <!-- Billing Address -->
                                        <div id="billing-form" class="mb-40">
                                            <h4 class="checkout-title">Billing Address</h4>

                                            <div class="row">
                                                <input type="hidden" value="${sessionScope.acc.userName}" name="userName">
                                            <input type="hidden" value="${sessionScope.acc.password}" name="password">
                                            <input type="hidden" value="${sessionScope.acc.isAdmin}" name="isAdmin">

                                            <div class="col-md-10    col-12 mb-20">
                                                <label>Full Name*</label>
                                                <input type="text" placeholder="Full Name" name="fullName" value="${sessionScope.acc.fullName}" required>
                                            </div>

                                            <div class="col-md-10 col-12 mb-20">
                                                <label>Email Address*</label>
                                                <input type="email" placeholder="Email Address" name="email" value="${sessionScope.acc.email}" required>
                                            </div>

                                            <div class="col-md-10 col-12 mb-20">
                                                <label>Phone no*</label>
                                                <input type="text" placeholder="Phone number" name="phone" value="${sessionScope.acc.telephone}" required>
                                            </div>

                                            <div class="col-10 mb-20">
                                                <label>Address*</label>
                                                <input type="text" placeholder="house number, street name .." name="address" value="${sessionScope.acc.address}" required>
                                            </div>

                                            <div class="col-md-10 col-12 mb-20">
                                                <label>Town/City*</label>
                                                <input type="text" placeholder="Town/City" name="city" value="${sessionScope.acc.city}" required>
                                            </div>

                                            <div class="col-10 mb-20">
                                                <div class="check-box">
                                                    <input type="checkbox" id="create_account">
                                                    <label for="create_account">Create an Acount?</label>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>

                                <div class="col-lg-5">
                                    <div class="row">

                                        <!-- Cart Total -->
                                        <div class="col-12 mb-60">

                                            <h4 class="checkout-title">Cart Total</h4>

                                            <div class="checkout-cart-total">

                                                <h4>Product <span>Total</span></h4>
                                                <c:set var="s" value="0"></c:set>
                                                <c:forEach var="o" items="${sessionScope.cart}">
                                                    <c:set var="s" value="${s + o.p.priceDiscount * o.quantity}"></c:set>
                                                        <ul>
                                                            <li>${o.p.productName} X ${o.quantity}</li>
                                                        <span style="margin-left: auto;"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.p.priceDiscount * o.quantity}" type="currency"/></span>
                                                    </ul>
                                                </c:forEach>

                                                <c:if test="${sessionScope.coupon != null}">
                                                    <c:set value="${sessionScope.coupon.discountPercent}" var="discount"/>
                                                </c:if>
                                                <c:if test="${sessionScope.coupon == null}">
                                                    <c:set value="${0}" var="discount"/>
                                                </c:if>

                                                <p>Sub Total <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s}" type="currency"/></span></p>
                                                <p>Discount <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s*discount/100}" type="currency"/></span></p>
                                                <p>Shipping Fee <span>$00.00</span></p>

                                                <h4>Grand Total <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s-s*discount/100}" type="currency"/></span></h4>
                                            </div>

                                        </div>

                                        <!-- Payment Method -->
                                        <div class="col-12 mb-60">

                                            <h4 class="checkout-title">Payment Method</h4>

                                            <div class="checkout-payment-method">

                                                <div class="single-method">
                                                    <input type="radio" id="payment_check" name="payment-method" value="Cheque Payment" required>
                                                    <label for="payment_check">Cheque Payment</label>
                                                    <p data-method="check">Please send a Check to Store name with Store Street, Store Town, Store State, Store Postcode, Store Country.</p>
                                                </div>

                                                <div class="single-method">
                                                    <input type="radio" id="payment_bank" name="payment-method" value="Direct Bank Transfer">
                                                    <label for="payment_bank">Direct Bank Transfer</label>
                                                    <p data-method="bank">Please send a Check to Store name with Store Street, Store Town, Store State, Store Postcode, Store Country.</p>
                                                </div>

                                                <div class="single-method">
                                                    <input type="radio" id="payment_paypal" name="payment-method" value="Paypal System">
                                                    <label for="payment_paypal">Paypal System</label>
                                                    <p data-method="bank">Please send a Check to Store name with Store Street, Store Town, Store State, Store Postcode, Store Country.</p>
                                                </div>

                                                <div class="single-method">
                                                    <input type="radio" id="payment_cash" name="payment-method" value="Cash on Delivery">
                                                    <label for="payment_cash">Cash on Delivery</label>
                                                    <p data-method="cash">Please send a Check to Store name with Store Street, Store Town, Store State, Store Postcode, Store Country.</p>
                                                </div>
                                                <div class="single-method">
                                                    <input type="checkbox" id="accept_terms" required>
                                                    <label for="accept_terms">I’ve read and accept the terms & conditions</label>
                                                </div>

                                            </div>

                                            <input type="hidden" name="uid" value="${sessionScope.acc.userID}">
                                            <button class="place-order">Place order</button>

                                        </div>

                                    </div>
                                </div>

                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- Checkout Page End --> 

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery JS -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- Popper JS -->
        <script src="assets/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
