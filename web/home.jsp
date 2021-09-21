<%-- 
    Document   : home.jsp
    Created on : Feb 14, 2021, 8:52:48 PM
    Author     : tungn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Category"%>
<%@page import="java.text.NumberFormat"%>
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
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/icon-font.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!-- Header Section Start -->
        <div class="header-section section">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:useBean scope="page" id="d" class="dao.AllDao"></jsp:useBean>

                <!-- Header Category Start -->
                <div class="header-category-section">
                    <div class="container">
                        <div class="row">
                            <div class="col">

                                <div class="header-category">

                                    <!-- Category Toggle Wrap -->
                                    <div class="category-toggle-wrap d-block d-lg-none">
                                        <!-- Category Toggle -->
                                        <button class="category-toggle">Categories <i class="ti-menu"></i></button>
                                    </div>

                                    <!-- Category Menu -->
                                    <nav class="category-menu">
                                        <ul>
                                            <i class="fas fa-laptop ${active == 1?"active":""}"><li><a href="category?id=1">LAPTOP</a></li></i>
                                        <i class="fas fa-camera ${active == 2?"active":""}"><li><a href="category?id=2">SMARTPHONE</a></li></i>
                                        <i class="fas fa-mobile-alt ${active == 3?"active":""}"><li><a href="category?id=3">CAMERA</a></li></i>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Header Category End -->
        </div><!-- Header Section End -->

        <!-- Hero Section Start -->
        <div class="hero-section section mb-30">
            <div class="container">
                <div class="row">
                    <div class="col">

                        <!-- Hero Slider Start -->
                        <div class="hero-slider hero-slider-one">

                            <!-- Hero Item Start -->
                            <div class="hero-item">
                                <div class="row align-items-center justify-content-between">
                                    <!-- Hero Content -->
                                    <div class="hero-content col">

                                        <h2>HURRY UP!</h2>
                                        <h1><span>MSVII Case</span></h1>
                                        <h1>IT’S <span class="big">15%</span> OFF</h1>
                                        <a href="category?id=1">get it now</a>

                                    </div>

                                    <!-- Hero Image -->
                                    <div class="hero-image col">
                                        <img src="assets/images/products/209.jpg" alt="Hero Image">
                                    </div>

                                </div>     
                            </div><!-- Hero Item End -->

                            <!-- Hero Item Start -->
                            <div class="hero-item">
                                <div class="row align-items-center justify-content-between">
                                    <!-- Hero Image -->
                                    <div class="hero-image col">
                                        <img src="assets/images/products/29.jpg" alt="Hero Image">
                                    </div>
                                    <!-- Hero Content -->
                                    <div class="hero-content col">

                                        <h2>HURRY UP!</h2>
                                        <h1><span>GL G6</span></h1>
                                        <h1>IT’S <span class="big">35%</span> OFF</h1>
                                        <a href="category?id=1">get it now</a>

                                    </div>
                                </div>     
                            </div><!-- Hero Item End -->

                            <!-- Hero Item Start -->
                            <div class="hero-item">
                                <div class="row align-items-center justify-content-between">

                                    <!-- Hero Content -->
                                    <div class="hero-content col">
                                        <h2>HURRY UP!</h2>
                                        <h1><span>IPhone X</span></h1>
                                        <h1>IT’S <span class="big">29%</span> OFF</h1>
                                        <a href="category?id=1">get it now</a>
                                    </div>
                                    <!-- Hero Image -->
                                    <div class="hero-image col">
                                        <img src="assets/images/products/89.jpg" alt="Hero Image">
                                    </div>

                                </div>     
                            </div><!-- Hero Item End -->

                        </div><!-- Hero Slider End -->

                    </div>
                </div>
            </div>
        </div><!-- Hero Section End -->

        <!-- Banner Section Start -->
        <div class="banner-section section mb-60">
            <div class="container">
                <div class="row row-10">
                    <!-- Banner -->
                    <div class="col-md-12 col-12 mb-30">
                        <div class="banner"><a href="category?id=1"><img src="assets/images/banner/product4.png" alt="Banner"></a></div>
                    </div>
                </div>
            </div>
        </div><!-- Banner Section End -->

        <!-- Feature Product Section Start -->
        <div class="product-section section mb-70">
            <div class="container">
                <div class="row">

                    <!-- Section Title Start -->
                    <div class="col-12 mb-40">
                        <div class="section-title-one" data-title="FEATURED ITEMS"><h1>FEATURED ITEMS</h1></div>
                    </div><!-- Section Title End -->

                    <!-- Product Tab Filter Start -->
                    <div class="col-12 mb-30">
                        <div class="product-tab-filter">

                            <!-- Tab Filter Toggle -->
                            <button class="product-tab-filter-toggle">showing: <span></span><i class="icofont icofont-simple-down"></i></button>

                        </div>
                    </div><!-- Product Tab Filter End -->

                    <!-- Product Tab Content Start -->
                    <div class="col-12">
                        <div class="tab-content">

                            <!-- Tab Pane Start -->
                            <div class="tab-pane fade show active" id="tab-one">

                                <!-- Product Slider Wrap Start -->
                                <div class="product-slider-wrap product-slider-arrow-one">
                                    <!-- Product Slider Start -->
                                    <div class="product-slider product-slider-4">
                                        <c:forEach items="${list1}" var="o">
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 pb-30 pt-10">
                                                <!-- Product Start -->
                                                <div class="ee-product">

                                                    <!-- Image -->
                                                    <div class="image">
                                                        <span class="label sale"><i>-${o.discountPercent}%</i></span>
                                                        <a href="singleProduct?pid=${o.productID}" class="img"><img src="assets/images/products/${o.image1}" alt="Product Image"></a>

                                                        <div class="wishlist-compare">
                                                            <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                                            <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                        </div>

                                                        <c:if test="${o.PQuantity > 0}"><span class="availability" style="background: #5ac478;">In Stock</span></c:if>
                                                        <c:if test="${o.PQuantity <= 0}"><span class="availability" style="background: #c88956;">Out of Stock</span></c:if>

                                                        <c:if test="${o.PQuantity > 0}"><a href="#" onclick="addToCart(${o.productID})" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>
                                                        </div>

                                                        <!-- Content -->
                                                        <div class="content">

                                                            <!-- Category & Title -->
                                                            <div class="category-title">
                                                            <c:set value="${d.getCategoryByID(o.categoryID)}" var="c"/>
                                                            <a href="category?id=${c.categoryID}" class="cat">${c.categoryName}</a>
                                                            <h5 class="title"><a href="singleProduct?pid=${o.productID}">${o.productName}</a></h5>

                                                        </div>

                                                        <!-- Price & Ratting -->
                                                        <div class="price-ratting">

                                                            <h5 class="price"><span class="old">$${o.price}</span>$${o.priceDiscount}</h5>
                                                            <c:set var="s5" value="${d.countRating(o.productID, 5)}"/>
                                                            <c:set var="s4" value="${d.countRating(o.productID, 4)}"/>
                                                            <c:set var="s3" value="${d.countRating(o.productID, 3)}"/>
                                                            <c:set var="s2" value="${d.countRating(o.productID, 2)}"/>
                                                            <c:set var="s1" value="${d.countRating(o.productID, 1)}"/>
                                                            <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                            <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>
                                                            <div class="ratting">
                                                                <c:forEach begin="1" end="${rateS}">
                                                                    <i class="fa fa-star"></i>
                                                                </c:forEach>
                                                                <c:forEach begin="${rateS + 1}" end="5">
                                                                    <i class="far fa-star"></i>
                                                                </c:forEach>
                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>
                                                <!-- Product End -->
                                            </div>
                                        </c:forEach>


                                    </div>
                                    <!-- Product Slider End -->
                                </div>
                                <!-- Product Slider Wrap End -->

                            </div>
                            <!-- Tab Pane End -->

                        </div>
                    </div><!-- Product Tab Content End -->

                </div>
            </div>
        </div><!-- Feature Product Section End -->

        <!-- Best Sell Product Section Start -->
        <div class="product-section section mb-60">
            <div class="container">
                <div class="row">

                    <!-- Section Title Start -->
                    <div class="col-12 mb-40">
                        <div class="section-title-one" data-title="BEST SELLER">
                            <h1>BEST SELLERS</h1>
                        </div>
                    </div>
                    <!-- Section Title End -->

                    <div class="col-12">
                        <div class="row">
                            <c:forEach items="${list2}" var="o">
                                <div class="col-xl-3 col-lg-4 col-md-6 col-12 pb-30 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">

                                        <!-- Image -->
                                        <div class="image">
                                            <span class="label sale"><i>-${o.discountPercent}%</i></span>
                                            <a href="singleProduct?pid=${o.productID}" class="img"><img src="assets/images/products/${o.image1}" alt="Product Image"></a>

                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>

                                            <c:if test="${o.PQuantity > 0}"><span class="availability" style="background: #5ac478;">In Stock</span></c:if>
                                            <c:if test="${o.PQuantity <= 0}"><span class="availability" style="background: #c88956;">Out of Stock</span></c:if>

                                            <c:if test="${o.PQuantity > 0}"><a href="#" onclick="addToCart(${o.productID})" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>
                                            </div>

                                            <!-- Content -->
                                            <div class="content">

                                                <!-- Category & Title -->
                                                <div class="category-title">
                                                <c:set value="${d.getCategoryByID(o.categoryID)}" var="c"/>
                                                <a href="category?id=${c.categoryID}" class="cat">${c.categoryName}</a>
                                                <h5 class="title"><a href="singleProduct?pid=${o.productID}">${o.productName}</a></h5>

                                            </div>

                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">

                                                <h5 class="price"><span class="old">$${o.price}</span>$${o.priceDiscount}</h5>
                                                <c:set var="s5" value="${d.countRating(o.productID, 5)}"/>
                                                <c:set var="s4" value="${d.countRating(o.productID, 4)}"/>
                                                <c:set var="s3" value="${d.countRating(o.productID, 3)}"/>
                                                <c:set var="s2" value="${d.countRating(o.productID, 2)}"/>
                                                <c:set var="s1" value="${d.countRating(o.productID, 1)}"/>
                                                <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>
                                                <div class="ratting">
                                                    <c:forEach begin="1" end="${rateS}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${rateS + 1}" end="5">
                                                        <i class="far fa-star"></i>
                                                    </c:forEach>
                                                </div>

                                            </div>

                                        </div>

                                    </div>
                                    <!-- Product End -->
                                </div>
                            </c:forEach>


                        </div>
                    </div>

                </div>
            </div>
        </div><!-- Best Sell Product Section End -->

        <!-- Banner Section Start -->
        <div class="banner-section section mb-90">
            <div class="container">
                <div class="row">

                    <!-- Banner -->
                    <div class="col-12">
                        <div class="banner"><a href="category?id=1"><img src="assets/images/page/background.png" alt="Banner"></a></div>
                    </div>

                </div>
            </div>
        </div><!-- Banner Section End -->

        <!-- Feature Section Start -->
        <div class="feature-section section mb-60">
            <div class="container">
                <div class="row">

                    <div class="col-lg-4 col-md-6 col-12 mb-30">
                        <!-- Feature Start -->
                        <div class="feature feature-shipping">
                            <div class="feature-wrap">
                                <div class="icon"><img src="assets/images/icons/feature-van.png" alt="Feature"></div>
                                <h4>FREE SHIPPING</h4>
                                <p>Start from $100</p>
                            </div>
                        </div><!-- Feature End -->
                    </div>

                    <div class="col-lg-4 col-md-6 col-12 mb-30">
                        <!-- Feature Start -->
                        <div class="feature feature-guarantee">
                            <div class="feature-wrap">
                                <div class="icon"><img src="assets/images/icons/feature-walet.png" alt="Feature"></div>
                                <h4>MONEY BACK GUARANTEE</h4>
                                <p>Back within 15 days</p>
                            </div>
                        </div><!-- Feature End -->
                    </div>

                    <div class="col-lg-4 col-md-6 col-12 mb-30">
                        <!-- Feature Start -->
                        <div class="feature feature-security">
                            <div class="feature-wrap">
                                <div class="icon"><img src="assets/images/icons/feature-shield.png" alt="Feature"></div>
                                <h4>SECURE PAYMENTS</h4>
                                <p>Payment Security</p>
                            </div>
                        </div><!-- Feature End -->
                    </div>

                </div>
            </div>
        </div><!-- Feature Section End -->

        <!-- Best Deals Product Section Start -->
        <div class="product-section section mb-40">
            <div class="container">
                <div class="row">

                    <!-- Section Title Start -->
                    <div class="col-12 mb-40">
                        <div class="section-title-one" data-title="BEST DEALS"><h1>BEST DEALS</h1></div>
                    </div><!-- Section Title End -->

                    <!-- Product Tab Filter Start-->
                    <div class="col-12">
                        <div class="offer-product-wrap row">

                            <!-- Product Tab Filter Start -->
                            <div class="col mb-30">
                                <div class="product-tab-filter">
                                    <!-- Tab Filter Toggle -->
                                    <button class="product-tab-filter-toggle">showing: <span></span><i class="icofont icofont-simple-down"></i></button>

                                </div>
                            </div><!-- Product Tab Filter End -->

                            <!-- Offer Time Wrap Start -->
                            <div class="col mb-30">
                                <div class="offer-time-wrap" style="background-image: url(assets/images/bg/offer-products.jpg)">
                                    <h1><span>UP TO</span> 55%</h1>
                                    <h3>QUALITY & EXCLUSIVE <span>PRODUCTS</span></h3>
                                    <h4><span>LIMITED TIME OFFER</span> GET YOUR PRODUCT</h4>
                                    <div class="countdown" data-countdown="2019/06/20"></div>
                                </div>
                            </div><!-- Offer Time Wrap End -->

                            <!-- Product Tab Content Start -->
                            <div class="col-12 mb-30">
                                <div class="tab-content">

                                    <!-- Tab Pane Start -->
                                    <div class="tab-pane fade show active" id="tab-three">

                                        <!-- Product Slider Wrap Start -->
                                        <div class="product-slider-wrap product-slider-arrow-two">
                                            <!-- Product Slider Start -->
                                            <div class="product-slider product-slider-3">
                                                <c:forEach items="${list3}" var="o">
                                                    <div class="col pb-20 pt-10">
                                                        <!-- Product Start -->
                                                        <div class="ee-product">

                                                            <!-- Image -->
                                                            <div class="image">
                                                                <span class="label sale"><i>-${o.discountPercent}%</i></span>
                                                                <a href="singleProduct?pid=${o.productID}" class="img"><img src="assets/images/products/${o.image1}" alt="Product Image"></a>

                                                                <div class="wishlist-compare">
                                                                    <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                                                    <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                                </div>

                                                                <c:if test="${o.PQuantity > 0}"><span class="availability" style="background: #5ac478;">In Stock</span></c:if>
                                                                <c:if test="${o.PQuantity <= 0}"><span class="availability" style="background: #c88956;">Out of Stock</span></c:if>

                                                                <c:if test="${o.PQuantity > 0}"><a href="#" onclick="addToCart(${o.productID})" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>
                                                                </div>

                                                                <!-- Content -->
                                                                <div class="content">

                                                                    <!-- Category & Title -->
                                                                    <div class="category-title">
                                                                    <c:set value="${d.getCategoryByID(o.categoryID)}" var="c"/>
                                                                    <a href="category?id=${c.categoryID}" class="cat">${c.categoryName}</a>
                                                                    <h5 class="title"><a href="singleProduct?pid=${o.productID}">${o.productName}</a></h5>

                                                                </div>

                                                                <!-- Price & Ratting -->
                                                                <div class="price-ratting">

                                                                    <h5 class="price"><span class="old">$${o.price}</span>$${o.priceDiscount}</h5>
                                                                    <c:set var="s5" value="${d.countRating(o.productID, 5)}"/>
                                                                    <c:set var="s4" value="${d.countRating(o.productID, 4)}"/>
                                                                    <c:set var="s3" value="${d.countRating(o.productID, 3)}"/>
                                                                    <c:set var="s2" value="${d.countRating(o.productID, 2)}"/>
                                                                    <c:set var="s1" value="${d.countRating(o.productID, 1)}"/>
                                                                    <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                                    <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>
                                                                    <div class="ratting">
                                                                        <c:forEach begin="1" end="${rateS}">
                                                                            <i class="fa fa-star"></i>
                                                                        </c:forEach>
                                                                        <c:forEach begin="${rateS + 1}" end="5">
                                                                            <i class="far fa-star"></i>
                                                                        </c:forEach>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                        </div><!-- Product End -->
                                                    </div>
                                                </c:forEach>

                                            </div><!-- Product Slider End -->
                                        </div><!-- Product Slider Wrap End -->

                                    </div><!-- Tab Pane End -->

                                </div>
                            </div><!-- Product Tab Content End -->

                        </div>
                    </div><!-- Product Tab Filter End-->

                </div>
            </div>
        </div><!-- Best Deals Product Section End -->

        <!-- New Arrival Product Section Start -->
        <div class="product-section section mb-60">
            <div class="container">
                <div class="row">

                    <!-- Section Title Start -->
                    <div class="col-12 mb-40">
                        <div class="section-title-one" data-title="NEW ARRIVAL"><h1>NEW ARRIVAL</h1></div>
                    </div><!-- Section Title End -->

                    <div class="col-12">
                        <div class="row">
                            <c:forEach items="${list4}" var="o">
                                <div class="col-xl-3 col-lg-4 col-md-6 col-12 pb-30 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">

                                        <!-- Image -->
                                        <div class="image">

                                            <span class="label sale"><i>-${o.discountPercent}%</i></span>
                                            <a href="singleProduct?pid=${o.productID}" class="img"><img src="assets/images/products/${o.image1}" alt="Product Image"></a>

                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>

                                            <c:if test="${o.PQuantity > 0}"><span class="availability" style="background: #5ac478;">In Stock</span></c:if>
                                            <c:if test="${o.PQuantity <= 0}"><span class="availability" style="background: #c88956;">Out of Stock</span></c:if>

                                            <c:if test="${o.PQuantity > 0}"><a href="#" onclick="addToCart(${o.productID})" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>
                                            </div>

                                            <!-- Content -->
                                            <div class="content">

                                                <!-- Category & Title -->
                                                <div class="category-title">
                                                <c:set value="${d.getCategoryByID(o.categoryID)}" var="c"/>
                                                <a href="category?id=${c.categoryID}" class="cat">${c.categoryName}</a>
                                                <h5 class="title"><a href="singleProduct?pid=${o.productID}">${o.productName}</a></h5>

                                            </div>

                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">

                                                <h5 class="price"><span class="old">$${o.price}</span>$${o.priceDiscount}</h5>
                                                <c:set var="s5" value="${d.countRating(o.productID, 5)}"/>
                                                <c:set var="s4" value="${d.countRating(o.productID, 4)}"/>
                                                <c:set var="s3" value="${d.countRating(o.productID, 3)}"/>
                                                <c:set var="s2" value="${d.countRating(o.productID, 2)}"/>
                                                <c:set var="s1" value="${d.countRating(o.productID, 1)}"/>
                                                <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>
                                                <div class="ratting">
                                                    <c:forEach begin="1" end="${rateS}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${rateS + 1}" end="5">
                                                        <i class="far fa-star"></i>
                                                    </c:forEach>
                                                </div>

                                            </div>

                                        </div>

                                    </div><!-- Product End -->
                                </div>
                            </c:forEach>

                        </div>
                    </div>

                </div>
            </div>
        </div><!-- New Arrival Product Section End -->

        <jsp:include page="footer.jsp"></jsp:include>
            <script>
                function addToCart(pid) {
                    if (${sessionScope.acc == null}) {
                        window.location.assign('login');
                    } else {
                        $.ajax({
                            url: "/Project/shoppingCart",
                            type: "GET",
                            data: {
                                action: 'ordernow',
                                id: pid
                            },
                            success: function (data) {
                                $(".header-shop-links").html(data);
                            },
                            error: function (xhr) {
                                //Do Something to handle error
                            }
                        });
                    }
                }
        </script>
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>
