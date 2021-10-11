<%-- 1
    Document   : cart.jsp
    Created on : Feb 26, 2021, 9:01:34 AM
    Author     : tungn
--%>

<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Map"%>
<%@page import="model.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icon-font.min.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

        <!--<link href="assets/js/cart/jquery.nice-number.css" rel="stylesheet" type="text/css"/>-->
        <style>
            .update-btn {
                border: none;
                background-color: transparent;
            }
            .cart-summary a {
                float: right;
                padding: 7px 26px;
                border-radius: 30px;
                font-size: 18px;
                font-weight: 600;
                background-color: gold;
                margin-right: 17px;
            }.shopping-now a {
                margin-top: 6px;
                padding: 10px 65px;
                font-size: 20px;
                border-radius: 10px;
                font-weight: 500;
                font-family: Arial,Helvetica,sans-serif;
            }
            tr td input[type="text"] {
                width: 28px;
                text-align: center;
                border-left: none;
                border-right: none;
                border-top: 2px solid;
                border-bottom: 2px solid;
            }
            tr td button {
                background: transparent;
                color: black;
            }
            .btn-left {
                font-size: 20px;
                padding: 0px 11px;
                border-radius: 35px 0 0 35px; 
                border: 2px solid;
                border-right: none; 
            }
            .btn-right {
                font-size: 20px;
                padding: 0px 11px;
                border-radius: 0 35px 35px 0; 
                border: 2px solid;
                border-left: none;
            }
            .search-coupon {
                position: relative;
            }
            .search-coupon button {
                position: absolute;
                border: none;
                display: block;
                width: 27px;
                height: 27px;
                line-height: 16px;
                font-size: 23px;
                border-radius: 50%;
                top: 0;
                bottom: 0;
                right: 22px;
                margin: auto;
                background: transparent;
                padding: 0;
                outline: none;
                cursor: pointer;
                transition: .1s;
            }
            .search-coupon button:hover {
                background: #ddd;
                transition: ease 1s;
            }
        </style>
        <!-- Modernizer JS -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>

    </head>

    <body id="body">
        <jsp:include page="header.jsp"></jsp:include>

            <!-- Page Banner Section Start -->
            <div class="page-banner-section section">
                <div class="page-banner-wrap row row-0 d-flex align-items-center ">

                    <!-- Page Banner -->
                    <div class="col-lg col-12 order-lg-1 d-flex align-items-center justify-content-center">
                        <div class="page-banner">
                            <h1>Cart Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="#">CART</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- Page Banner Section End -->

        <!-- Cart Page Start -->
        <div class="page-section section pt-50 pb-50">
            <div class="container">
                <div class="row">
                    <div class="col-12" id="qt">
                        <!-- Cart Table -->
                    <c:if test="${sessionScope.cart == null}">
                        <div class="shopping-now" style="text-align: center;">
                            <i class="fas fa-cart-arrow-down" style="color: red; font-size: 100px;"></i><br><br>
                            <label style="font-size: 26px; font-family: auto;">There are no products in the cart</label><br>
                            <a href="category?id=1" class="btn btn-primary" role="button">Shopping Now</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.cart != null}">
                        <div class="cart-table table-responsive mb-40">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="pro-thumbnail">Image</th>
                                        <th class="pro-title" style="text-align: left;">Product</th>
                                        <th class="pro-price">Price</th>
                                        <th class="pro-quantity">Quantity</th>                                
                                        <th class="pro-subtotal">Total</th>
                                        <th class="pro-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="s" value="0"></c:set>
                                    <c:forEach var="o" items="${sessionScope.cart}">
                                        <c:set var="s" value="${s + o.p.priceDiscount * o.quantity}"></c:set>
                                            <tr>
                                                <td class="pro-thumbnail"><a href="singleProduct?pid=${o.p.productID}"><img src="assets/images/products/${o.p.image1}" alt="Product"></a></td>
                                            <td class="pro-title" style="width: 35%; text-align: left;"><a href="singleProduct?pid=${o.p.productID}">${o.p.productName}</a></td>
                                            <td class="pro-price"><span>$${o.p.priceDiscount}</span></td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button onclick="updownQt(-1, ${o.p.productID})" class="btn-left" id="qty">-</button>
                                                    <input type="text" value="${o.quantity}" id="qty" readonly>
                                                    <button onclick="updownQt(1, ${o.p.productID})" class="btn-right" id="qty">+</button>
                                                </div>
                                            </td>
                                            <td class="pro-subtotal"><span id="total-price"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.p.priceDiscount * o.quantity}" type="currency"/></span></td>
                                            <!--<td class="pro-remove"><a onclick="deleteRow(this, ${o.p.productID})"><i class="fas fa-trash-alt" style="color: red; font-size: 22px;"></i></a></td>-->
                                            <td class="pro-remove"><a href="shoppingCart?action=delete&id=${o.p.productID}"><i class="fas fa-trash-alt" style="color: red; font-size: 22px;"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="row" id="down-cart">

                            <div class="col-lg-6 col-12 mb-15">
                                <div class="discount-coupon" style="margin-bottom: 50px;">
                                    <h4 style="margin-bottom: 15px;">FREE* STANDARD DELIVERY</h4>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="assets/images/icons/cart-delivery.png" alt="" style="max-width: 80px;"/>
                                        </div>
                                        <div class="col-md-10" style="font-weight: 600; align-self: center;">
                                            <p style="margin-bottom: 5px;">Faster delivery options available to most countries</p>
                                            <a href="#" style="text-decoration: underline 2px;">More info</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Discount Coupon -->
                                <div class="discount-coupon">
                                    <h4>Discount Coupon Code</h4>
                                    <form action="shoppingCart" method="post">
                                        <div class="row">
                                            <div class="search-coupon col-md-6 col-12 mb-25">
                                                <input type="text" name="couName" value="${sessionScope.coupon.couName}" placeholder="Coupon Code">
                                                <button onclick="removeCoupon()" type="reset">&times;</button>
                                            </div>
                                            <div class="col-md-6 col-12 mb-25">
                                                <input type="submit" value="Apply Code">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- Cart Summary -->
                            <div class="col-lg-6 col-12 mb-40 d-flex">
                                <div class="cart-summary">
                                    <div id="total" class="cart-summary-wrap">
                                        <h4>Cart Summary</h4>

                                        <c:if test="${sessionScope.coupon != null}">
                                            <c:set value="${sessionScope.coupon.discountPercent}" var="discount"/>
                                        </c:if>
                                        <c:if test="${sessionScope.coupon == null}">
                                            <c:set value="${0}" var="discount"/>
                                        </c:if>

                                        <p>Sub Total <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s}" type="currency"/></span></p>
                                        <p>Discount <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s*discount/100}" type="currency"/></span></p>
                                        <p>Shipping Cost <span>$00.00</span></p>
                                        <h2>Grand Total <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s-s*discount/100}" type="currency"/></span></h2>
                                    </div>
                                    <a href="checkout?action=checkout">Checkout</a>
                                </div>
                            </div>

                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    <script>
    </script>
    <script>
//        function deleteRow(btn, cartID) {
//            //td là cha btn => tr là ông btn
//            //b1: remove row in table(cho ông biến mất)
//            btn.parentElement.parentElement.style.display = "none";
//            //b2: remove in database => servlet
//            $.ajax({
//                url: 'shoppingCart',
//                type: 'GET', //method
//                data: {//truyen id va status
//                    //param:
//                    id: cartID,
//                    action: 'delete'
//                },
//                success: function (data) {
//                    $(".header-shop-links").html(data);
//                },
//                error: function (xhr) {
//                    //Do Something to handle error
//                }
//            });
//        }

        function updownQt(st, pid) {
            if (st === -1) {
                st = 'des';
            } else {
                st = 'inc';
            }
            $.ajax({
                url: "updownQuantity?action=update",
                type: "POST", //send it through get method
                data: {
                    change: st,
                    pid: pid
                },
                success: function (data) {
                    $("#qt").html(data);
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });

        }

        function removeCoupon() {
            $.ajax({
                url: "shoppingCart",
                type: "GET", //send it through get method
                data: {
                    action: "removeCou"
                },
                success: function (data) {
                    $("#down-cart").html(data);
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>

    <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>
