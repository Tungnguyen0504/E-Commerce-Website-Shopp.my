<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="dao.AllDao"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="model.Camera"%>
<%@page import="model.SPhone"%>
<%@page import="model.Laptop"%>
<%@page import="model.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="assets/css/slick.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/icon-font.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/nouislider.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/style.css">

        <style>
            .breadcrumb {
                background-color: transparent;
            }
            .single-product-content .single-product-description .actions .add-to-cart {
                width: auto;
            }
            .single-product-content .single-product-description .actions .add-to-cart span {
                width: 100px;
            }
            .nav>li>a:focus, .nav>li>a:hover {
                background-color: whitesmoke;
                border-radius: 20px;
                padding: 1px 20px;
            }
            .table table-striped th {
                width: 50%;
            }
            #breadcrumb {
                padding: 10px 0px;
                background: #FBFBFC;
                border-bottom: 1px solid #E4E7ED;
                margin-bottom: 30px;
                float: left;
            }
            #breadcrumb-p {
                float: left;
                font-size: 17px;
                font-weight: 500;
                font-family: -webkit-pictograph;
            }
            .btn-primary {
                background-color: darkslategrey;
                border: 1px solid beige;
            }
            #product-main-img .slick-prev {
                -webkit-transform: translateX(-15px);
                -ms-transform: translateX(-15px);
                transform: translateX(-15px);
                left: 15px;
            }

            #product-main-img .slick-next {
                -webkit-transform: translateX(15px);
                -ms-transform: translateX(15px);
                transform: translateX(15px);
                right: 15px;
            }

            #product-main-img .slick-prev, #product-main-img .slick-next {
                opacity: 0;
                visibility: hidden;
                -webkit-transition: 0.2s all;
                transition: 0.2s all;
            }

            #product-main-img:hover .slick-prev, #product-main-img:hover .slick-next {
                -webkit-transform: translateX(0%);
                -ms-transform: translateX(0%);
                transform: translateX(0%);
                opacity: 1;
                visibility: visible;
            }

            #product-main-img .zoomImg {
                background-color: #FFF;
            }

            #product-imgs .product-preview {
                margin: 0px 5px;
                border: 1px solid #E4E7ED;
            }

            #product-imgs .product-preview.slick-current {
                border-color: #D10024;
            }

            #product-imgs .slick-prev {
                top: -20px;
                left: 50%;
                -webkit-transform: translateX(-50%);
                -ms-transform: translateX(-50%);
                transform: translateX(-50%);
            }

            #product-imgs .slick-next {
                top: calc(100% - 20px);
                left: 50%;
                -webkit-transform: translateX(-50%);
                -ms-transform: translateX(-50%);
                transform: translateX(-50%);
            }

            #product-imgs .slick-prev:before {
                content: "\f106";
            }

            #product-imgs .slick-next:before {
                content: "\f107";
            }

            .product-preview img {
                width: 100%;
            }
            .slick-prev, .slick-next {
                width: 40px;
                height: 40px;
                border: 1px solid #E4E7ED;
                background-color: #FFF;
                border-radius: 50%;
                z-index: 22;
                -webkit-transition: 0.2s all;
                transition: 0.2s all;
            }

            .slick-prev:hover, .slick-prev:focus, .slick-next:hover, .slick-next:focus {
                background-color: #D10024;
                border-color: #D10024;
            }

            .slick-prev:before, .slick-next:before {
                font-family: FontAwesome;
                color: #2B2D42;
            }

            .slick-prev:before {
                content: "\f104";
            }

            .slick-next:before {
                content: "\f105";
            }

            .slick-prev:hover:before, .slick-prev:focus:before, .slick-next:hover:before, .slick-next:focus:before {
                color: #FFF;
            }

            .slick-prev {
                left: -20px;
            }

            .slick-next {
                right: -20px;
            }
            .disabled {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
            }
            #feedback-form {
                padding: 15px 50px 50px 50px;
                display: none;
            }
            #feedback-down {
                font-size: 13px;
                padding: 7px 12px;
                font-family: Arial,Helvetica,sans-serif;
                background: #cb1c22;
                font-weight: 100;
            }
            .pro-avg-ratting {
                display: flex;
                border: 1px solid #99a2aa;
                background: #f8f9fa;
                padding: 20px 0;
            }
            .rating-progress {
                display: flex; 
                align-items: center; 
                max-height: 20px;
            }
            .rating-progress label i {
                margin: 0 4px; 
                color: #ea9d02;
            }
            .progress {
                width: 85%; 
                border-radius: 10px;
            }
            .center {
                height: 400px;
                position: relative;
            }
            .center #feedback-form {
                margin-top: 50%;
            }
            .empty-feedback {
                max-width: fit-content;
                margin: auto;
                padding-bottom: 36px;
                text-align: center;
            }
            .empty-feedback p {
                margin-top: 10px;
                font-size: 15px;
                color: #cd1817;
                font-weight: 500;
            }
            #emote{
                font-weight: bold;
                color: chocolate;
                font-family: "Amazon Ember",Arial,sans-serif;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:useBean scope="page" id="d" class="dao.AllDao"/>
        <c:set value="${d.getCategoryByID(p.categoryID)}" var="c"/>

        <!-- Page Banner Section Start -->
        <div class="page-banner-section section">
            <div class="page-banner-wrap row row-0 d-flex align-items-center ">
                <!-- Page Banner -->
                <div class="col-lg-12 col-12 order-lg-2 d-flex align-items-center justify-content-center">
                    <div class="page-banner">
                        <h1>Single Product</h1>
                        <div class="breadcrumb">
                            <ul>
                                <li><a href="home">HOME</a></li>
                                <li><a href="#">Single Product</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Banner -->

            </div>
        </div><!-- Page Banner Section End -->

        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb" id="breadcrumb-p">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="category?id=1">Category</a></li>
                                <li class="breadcrumb-item"><a href="category?id=${c.categoryID}">${c.categoryName}</a></li>
                                <li class="breadcrumb-item active" aria-current="page">View Product Detail</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>

        <!-- /BREADCRUMB -->

        <!-- Single Product Section Start -->
        <div class="product-section section mt-40 mb-90">
            <div class="container">
                <div class="row mb-90">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2 order-lg-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image1}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image2}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image3}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image4}" alt="">
                            </div>

                        </div>
                    </div>
                    <!-- /Product main img -->
                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5 order-lg-1">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image1}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image2}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image3}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="assets/images/products/${p.image4}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->
                    <div class="col-lg-5 col-12 mb-50 order-lg-3">

                        <!-- Content -->
                        <div class="single-product-content">

                            <!-- Category & Title -->
                            <div class="head-content">

                                <div class="category-title">
                                    <a href="#" class="cat">${c.categoryName}</a>
                                    <h5 class="title">${p.productName}</h5>
                                </div>

                                <h5 class="price"><span class="old">$${p.price}</span>$${p.priceDiscount}</h5>

                            </div>

                            <div class="single-product-description">



                                <div class="desc">
                                    <p>${p.tittle}</p>
                                </div>
                                <c:if test="${p.PQuantity > 0}"><span class="availability">Availability: <span style="font-weight: bold; color: #5ac478; font-size: 16px;">In Stock</span></span></c:if>
                                <c:if test="${p.PQuantity <= 0}"><span class="availability">Availability: <span style="font-weight: bold; color: red; font-size: 16px;">Out of Stock</span></span></c:if>

                                    <div class="quantity-colors">

                                        <div class="colors">
                                            <h5>Color:</h5>
                                            <p style="margin-top: 5px; font-size: 17px;">${p.color}</p>
                                    </div>                            

                                </div>

                                <div class="actions">

                                    <c:if test="${p.PQuantity > 0}"><a href="#" onclick="addToCart(${p.productID})" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>
                                    <c:if test="${p.PQuantity <= 0}"><button type="button" class="btn btn-danger" disabled data-bs-toggle="button" autocomplete="off" style="border-radius: 5px; padding: 7px 32px; background-color: red; float: left; margin-right: 15px;"><span>OUT OF STOCK</span></button></c:if>


                                        <div class="wishlist-compare">
                                            <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                            <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                        </div>

                                    </div>

                                    <div class="tags">

                                        <h5>Tags:</h5>
                                    <%
                                        AllDao dao = new AllDao();
                                        for (Category cate : dao.getCategory()) {
                                    %>
                                    <a href="category?id=<%=cate.getCategoryID()%>"><%=cate.getCategoryName()%></a>
                                    <% }
                                    %>
                                </div>

                                <div class="share">

                                    <h5>Share: </h5>
                                    <a href="#"><i class="fab fa-facebook"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                    <a href="#"><i class="fab fa-google"></i></a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>
                <div class="row">

                    <div class="col-lg-10 col-12 ml-auto mr-auto">

                        <ul class="single-product-tab-list nav">
                            <li><a href="#product-reviews" class="active" data-toggle="tab" >reviews</a></li>
                            <li><a href="#product-specifications" data-toggle="tab" >specifications</a></li>
                            <li><a href="#product-description" data-toggle="tab" >description</a></li>
                        </ul>

                        <div class="single-product-tab-content tab-content">

                            <div class="tab-pane fade show active" id="product-reviews">

                                <div class="product-ratting-wrap">
                                    <c:if test="${count == 0}">
                                        <div class="center">
                                            <div class="empty-feedback">
                                                <img src="assets/images/icons/empty-feedback.png" alt=""/>
                                                <p>There are no reviews yet</p>
                                            </div>
                                            <div class="ratting-form-wrapper fix">
                                                <form action="singleProduct?pid=${pid}" method="post">
                                                    <div class="ratting-form row" style="padding: 0 50px;">
                                                        <div class="col-12 mb-15" style="display: flex; align-items: center;">
                                                            <h5>How many stars do you rate this product?</h5>
                                                            <div class="star-widget">
                                                                <input type="radio" name="rate" value="5" id="rate-5">
                                                                <label for="rate-5" class="fas fa-star"></label>
                                                                <input type="radio" name="rate" value="4" id="rate-4">
                                                                <label for="rate-4" class="fas fa-star"></label>
                                                                <input type="radio" name="rate" value="3" id="rate-3">
                                                                <label for="rate-3" class="fas fa-star"></label>
                                                                <input type="radio" name="rate" value="2" id="rate-2">
                                                                <label for="rate-2" class="fas fa-star"></label>
                                                                <input type="radio" name="rate" value="1" id="rate-1">
                                                                <label for="rate-1" class="fas fa-star"></label>
                                                                <header id="emote" style="position: absolute; left: 80%; font-size: 18px;"></header>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 mb-15">
                                                            <label for="your-review">Your Review:</label>
                                                            <textarea name="review" id="your-review" placeholder="Write a review"></textarea>
                                                        </div>
                                                        <div class="col-12">
                                                            <input value="add review" type="submit">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${count >0}">
                                        <div class="pro-avg-ratting">
                                            <div class="col-md-4" style="margin: auto; text-align: center;">

                                                <c:set var="s5" value="${d.countRating(p.productID, 5)}"/>
                                                <c:set var="s4" value="${d.countRating(p.productID, 4)}"/>
                                                <c:set var="s3" value="${d.countRating(p.productID, 3)}"/>
                                                <c:set var="s2" value="${d.countRating(p.productID, 2)}"/>
                                                <c:set var="s1" value="${d.countRating(p.productID, 1)}"/>
                                                <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>

                                                <h4><fmt:formatNumber type = "number" maxFractionDigits="1" value = "${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}" /> / 5<span>(Overall)</span></h4> 
                                                <div class="ratting-star" style="font-size: 20px; color: #ea9d02;">
                                                    <c:forEach begin="1" end="${rateS}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${rateS + 1}" end="5">
                                                        <i class="far fa-star"></i>
                                                    </c:forEach>
                                                    <span style="font-size: 16px;">(${count})</span>
                                                </div>
                                                <span>Based on ${count} Comments</span>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="rating-progress">
                                                    <label>5<i class="fa fa-star"></i></label>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ${(s5/count)*100}%"></div>
                                                    </div>
                                                    <span style="margin-left: 3px;">${s5}</span>
                                                </div>
                                                <div class="rating-progress">
                                                    <label>4<i class="fa fa-star"></i></label>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ${(s4/count)*100}%"></div>
                                                    </div>
                                                    <span style="margin-left: 3px;">${s4}</span>
                                                </div>
                                                <div class="rating-progress">
                                                    <label>3<i class="fa fa-star"></i></label>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ${(s3/count)*100}%"></div>
                                                    </div>
                                                    <span style="margin-left: 3px;">${s3}</span>
                                                </div>
                                                <div class="rating-progress">
                                                    <label>2<i class="fa fa-star"></i></label>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ${(s2/count)*100}%"></div>
                                                    </div>
                                                    <span style="margin-left: 3px;">${s2}</span>
                                                </div>
                                                <div class="rating-progress">
                                                    <label>1<i class="fa fa-star"></i></label>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ${(s1/count)*100}%"></div>
                                                    </div>
                                                    <span style="margin-left: 3px;">${s1}</span>
                                                </div>
                                            </div>
                                            <div class="col-md-3" style="margin-top: 6px; text-align: center;">
                                                <span style="font-size: 12px; margin-right: 10px;">Have you used this product?</span>
                                                <input class="btn btn-primary" type="submit" value="Submit your review" id="feedback-down">
                                            </div>
                                        </div>

                                        <div class="ratting-form-wrapper fix" id="feedback-form">
                                            <form action="singleProduct?pid=${pid}" method="post">
                                                <div class="ratting-form row" onclick="warningLogin()">
                                                    <div class="col-12 mb-15" style="display: flex; align-items: center;">
                                                        <h5>How many stars do you rate this product?</h5>
                                                        <div class="star-widget">
                                                            <input type="radio" name="rate" value="5" id="rate-5">
                                                            <label for="rate-5" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" value="4" id="rate-4">
                                                            <label for="rate-4" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" value="3" id="rate-3">
                                                            <label for="rate-3" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" value="2" id="rate-2">
                                                            <label for="rate-2" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" value="1" id="rate-1">
                                                            <label for="rate-1" class="fas fa-star"></label>
                                                            <header id="emote" style="position: absolute; left: 80%; font-size: 18px;"></header>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 mb-15">
                                                        <label for="your-review">Your Review:</label>
                                                        <textarea name="review" id="your-review" placeholder="Write a review"></textarea>
                                                    </div>
                                                    <div class="col-12">
                                                        <label id="warning-login" style="display: flex; margin-bottom: 14px;"></label>
                                                        <input value="add review" type="submit">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="rattings-wrapper">
                                            <c:forEach items="${listF}" var="o">
                                                <div class="sin-rattings">
                                                    <div class="ratting-author" style="display: flex; align-items: center;">
                                                        <c:set value="${d.findAccount(o.userID)}" var="user"/>
                                                        <h3>${user.fullName}</h3>
                                                        <div class="ratting-star">
                                                            <c:forEach begin="1" end="${o.rating}">
                                                                <i class="fa fa-star"></i>
                                                            </c:forEach>
                                                            <c:forEach begin="${o.rating + 1}" end="5">
                                                                <i class="far fa-star"></i>
                                                            </c:forEach>
                                                        </div>
                                                        <p class="date-cmt" style="color: #99a2aa; font-size: 14px;">${o.FDateFormat}</p>
                                                    </div>
                                                    <p>${o.description}</p>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <div class="row mt-30">
                                            <div class="col">
                                                <c:if test="${end != null}">
                                                    <ul class="pagination">
                                                        <li class="${indexPage>1?"":"disabled"}"><a href="singleProduct?pid=${pid}&index=${indexPage-1}"><i class="fa fa-angle-left"></i>Back</a></li>
                                                            <c:forEach begin="1" end="${end}" var="i">
                                                            <li class="${tag == i?"active":""}"><a href="singleProduct?pid=${pid}&index=${i}">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="${indexPage<end?"":"disabled"}"><a href="singleProduct?pid=${pid}&index=${indexPage+1}">Next<i class="fa fa-angle-right"></i></a></li>
                                                    </ul>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="product-specifications">
                                <div class="single-product-specification">
                                    <c:if test="${c.categoryID == 1}">
                                        <table class="table table-striped">
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Memory Size:</th>
                                                    <td>${lap.memorySize}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">CPU Model:</th>
                                                    <td>${lap.cpuModel}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">CPU Speed:</th>
                                                    <td>${lap.cpuSpeed}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Display Resolution:</th>
                                                    <td>${lap.displayR}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Screen Size:</th>
                                                    <td>${lap.screenSize}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Item Weight:</th>
                                                    <td>${lap.itemWeight}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Graphics Coprocessor:</th>
                                                    <td>${lap.graphic}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Operating System:</th>
                                                    <td>${lap.os}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">RAM Type:</th>
                                                    <td>${lap.ramType}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${c.categoryID == 2}">
                                        <table class="table table-striped">
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Screen:</th>
                                                    <td>${sphone.screen}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Operating system:</th>
                                                    <td>${sphone.OS}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Rear camera:</th>
                                                    <td>${sphone.rearCam}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Front camera:</th>
                                                    <td>${sphone.frontCam}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">CPU:</th>
                                                    <td>${sphone.cpu}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">RAM:</th>
                                                    <td>${sphone.ram}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Internal memory:</th>
                                                    <td>${sphone.IMemory}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">SIM:</th>
                                                    <td>${sphone.sim}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Battery capacity:</th>
                                                    <td>${sphone.battery}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${c.categoryID == 3}">
                                        <table class="table table-striped">
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Model Number:</th>
                                                    <td>${cam.modelNum}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Eye Autofocus (Eye AF):</th>
                                                    <td>${cam.eyeAF}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Image Sensor Type:</th>
                                                    <td>${cam.imageType}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Image Sensor Size:</th>
                                                    <td>${cam.imageSize}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Maximum Focal Length:</th>
                                                    <td>${cam.maxFocal}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Minimum Focal Length:</th>
                                                    <td>${cam.minFocal}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Maximum Aperture:</th>
                                                    <td>${cam.maxAperture}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Effective Pixels:</th>
                                                    <td>${cam.effecPixel}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Wi-Fi Enabled:</th>
                                                    <td>${cam.wifiEnabled}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="product-description">

                                <div class="row">
                                    <div class="single-product-description-content col-lg-12 col-12">
                                        <c:forTokens items="${p.description}" delims="|" var="splitDes">
                                            <li class="mb-3"><c:out value="${splitDes}"/><br></li>
                                            </c:forTokens>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div><!-- Single Product Section End -->

        <!-- Related Product Section Start -->
        <div class="product-section section mb-70">
            <div class="container">
                <div class="row">

                    <!-- Section Title Start -->
                    <div class="col-12 mb-40">
                        <div class="section-title-one" data-title="RELATED PRODUCT"><h1>RELATED PRODUCT</h1></div>
                    </div><!-- Section Title End -->

                    <!-- Product Tab Content Start -->
                    <div class="col-12">
                        <!-- Product Slider Wrap Start -->
                        <!-- Product Slider Start -->
                        <div class="product-slider product-slider-4">
                            <c:forEach items="${listRelate}" var="o">
                                <div class="col pb-20 pt-10" style="padding: 0;">
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
                                            <c:if test="${o.PQuantity <= 0}"><span class="availability" style="background: #ed1d24;">Out of Stock</span></c:if>

                                            <c:if test="${o.PQuantity > 0}"><a href="#" onclick="addToCart(${o.productID})" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>

                                            </div>

                                            <!-- Content -->
                                            <div class="content">

                                                <!-- Category & Title -->
                                                <div class="category-title">

                                                    <a href="#" class="cat">${c.categoryName}</a>
                                                <h5 class="title"><a href="single-product.html">${o.productName}</a></h5>

                                            </div>

                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">

                                                <h5 class="price"><span class="old">$${o.price}</span>$${o.priceDiscount}</h5>
                                                <c:set var="st5" value="${d.countRating(o.productID, 5)}"/>
                                                <c:set var="st4" value="${d.countRating(o.productID, 4)}"/>
                                                <c:set var="st3" value="${d.countRating(o.productID, 3)}"/>
                                                <c:set var="st2" value="${d.countRating(o.productID, 2)}"/>
                                                <c:set var="st1" value="${d.countRating(o.productID, 1)}"/>
                                                <c:set var="rateS" value="${(st5*5+st4*4+st3*3+st2*2+st1*1)/(st5+st4+st3+st2+st1)}"/>
                                                <fmt:formatNumber var="rateSt" maxFractionDigits="0" value="${rateS}"/>
                                                <div class="ratting">
                                                    <c:forEach begin="1" end="${rateSt}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${rateSt + 1}" end="5">
                                                        <i class="far fa-star"></i>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/plugins.js"></script>
            <script src="assets/js/slick.min.js" type="text/javascript"></script>
            <script src="assets/js/nouislider.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.zoom.min.js" type="text/javascript"></script>
            <script src="assets/js/main.js" type="text/javascript"></script>
            <script>
                                                $(document).ready(function () {
                                                    $("#feedback-down").click(function () {
                                                        $("#feedback-form").slideToggle("slow");
                                                    });
                                                });

                                                function addToCart(pid) {
                                                    if (${sessionScope.acc == null}) {
                                                        window.location.assign('login?url=${url}');
                                                    } else {
                                                        $.ajax({
                                                            url: "shoppingCart",
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

                                                function warningLogin() {
                                                    if (${sessionScope.acc == null}) {
                                                        document.getElementById("warning-login").innerHTML = '<img src="assets/images/icons/alert-icon-red-11.png" alt="warnning" style="max-width: 26px;"><p>Please login before rating!</p>'
                                                    } else {

                                                    }
                                                }
        </script>

    </body>

</html>