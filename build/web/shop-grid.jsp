<%-- 
    Document   : shop-grid
    Created on : Feb 20, 2021, 8:10:43 PM
    Author     : tungn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="dao.AllDao"%>
<%@page import="model.Category"%>
<%@page import="model.Laptop"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <link href="assets/css/icon-font.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

        <style>

            .product-img a {
                display: block;
            }
            .product-img a img{
                display: block;
                vertical-align: middle;
                width: 77px ;
                float: left;
                max-width: 100%;
                margin-top: 15px;
            }
            .product-body {
                float: right;
                padding: 0 0 0 5px;
                max-width: 70%;
            }
            .product-widget {
                display: flex;
                border-bottom: 1px solid black;
            }
            .product-widget .product-body .product-category {
                text-transform: uppercase;
                font-size: 10px;
                color: #8D99AE;
                margin-bottom: 0;
            }
            .product-widget .product-body .product-name>a {
                font-weight: 700;
                line-height: 16px;
                font-size: 13px;
            }
            .product-widget .product-body .product-price {
                font-size: 11px;
                color: #D10024;
            }
            .product-old-price {
                padding-left: 10px;
            }
            #breadcrumb {
                padding: 10px 0px;
                background: #FBFBFC;
                border-bottom: 1px solid #E4E7ED;
                float: left;
            }
            #breadcrumb-p {
                float: left;
                font-size: 17px;
                font-weight: 500;
                font-family: -webkit-pictograph;
            }
            .disabled {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
            }
        </style>
        <!-- Modernizer JS -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:useBean scope="page" id="d" class="dao.AllDao"/>
        <c:set value="${d.getCategoryByID(cid)}" var="c"/>
        <%
            String rq = "http://localhost:8080" + request.getContextPath().toString();
            request.setAttribute("rq", rq);
        %>
        <!-- Page Banner Section Start -->
        <div class="page-banner-section section">
            <div class="page-banner-wrap row row-0 d-flex align-items-center ">
                <!-- Banner -->
                <!-- Page Banner -->
                <div class="col-lg-12 col-12 order-lg-2 d-flex align-items-center justify-content-center">
                    <div class="page-banner">
                        <h1>SHOP Grid VIEW</h1>
                        <div class="breadcrumb">
                            <ul>
                                <li><a href="home">HOME</a></li>
                                <li><a href="category?id=1">SHOP Grid VIEW</a></li>
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
                                <li class="breadcrumb-item active" aria-current="page">${c.categoryName}</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- Product Section Start -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row mb-50">
                    <div class="col">


                        <!-- Header Category -->
                        <div class="header-category">
                            <!-- Product View Mode -->
                            <div class="product-view-mode">
                                <a class="active" href="#" data-target="grid"><i class="fa fa-th"></i></a>
                                <a href="#" data-target="list"><i class="fa fa-list"></i></a>
                            </div>
                            <!-- Category Toggle Wrap -->
                            <div class="category-toggle-wrap d-block d-lg-none">
                                <!-- Category Toggle -->
                                <button class="category-toggle">Categories <i class="ti-menu"></i></button>
                            </div>

                            <!-- Category Menu -->
                            <nav class="category-menu">
                                <ul>
                                    <i class="fas fa-laptop ${cid == 1?"active":""}"><li><a href="category?id=1">LAPTOP</a></li></i>
                                    <i class="fas fa-camera ${cid == 2?"active":""}"><li><a href="category?id=2">SMARTPHONE</a></li></i>
                                    <i class="fas fa-mobile-alt ${cid == 3?"active":""}"><li><a href="category?id=3">CAMERA</a></li></i>
                                </ul>
                            </nav>
                        </div>

                        <!-- Shop Top Bar Start -->
                        <div class="shop-top-bar">

                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="border-radius: 4px;">
                                    <c:if test="${sort == null}">
                                        Sort Product
                                    </c:if>
                                    <c:if test="${sort != null}">
                                        ${sort}
                                    </c:if>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="filterShop?action=sort&type=sortPriceASC&id=${cid}">Price: low to high</a></li>
                                    <li><a class="dropdown-item" href="filterShop?action=sort&type=sortPriceDESC&id=${cid}">Price: high to low</a></li>
                                    <li><a class="dropdown-item" href="filterShop?action=sort&type=sortNewArrival&id=${cid}">Newest items</a></li>
                                </ul>
                            </div><i class="bi bi-laptop"></i>

                            <!-- Product Pages -->
                            <c:if test="${tag == null}">
                                <div class="product-pages">
                                    <p></p>
                                </div>
                            </c:if>
                            <c:if test="${tag != null}">
                                <div class="product-pages">
                                    <p>Pages ${tag} of ${end}</p>
                                </div>
                            </c:if>

                        </div><!-- Shop Top Bar End -->


                    </div>
                </div>
                <div class="row">

                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside" style="margin-bottom: 35px;">
                            <h3 class="aside-title">Price:</h3>
                            <div class="checkbox-filter">
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/category?id=${cid}&st=1")'>
                                    <input ${st == "1"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">All</label>
                                </div>
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/filterShop?action=filterPrice&id=${cid}&max=500&st=2")'>
                                    <input ${st == "2"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">Under 500$</label>
                                </div>
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/filterShop?action=filterPrice&id=${cid}&min=500&max=750&st=3")'>
                                    <input ${st == "3"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">500$ to 750$</label>
                                </div>
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/filterShop?action=filterPrice&id=${cid}&min=750&max=1000&st=4")'>
                                    <input ${st == "4"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">750$ to 1000$</label>
                                </div>
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/filterShop?action=filterPrice&id=${cid}&min=1000&max=1250&st=5")'>
                                    <input ${st == "5"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">1000$ to 1250$</label>
                                </div>
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/filterShop?action=filterPrice&id=${cid}&min=1250&max=1500&st=6")'>
                                    <input ${st == "6"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">1250$ to 1500$</label>
                                </div>
                                <div class="input-checkbox" onclick='window.location.assign("${rq}/filterShop?action=filterPrice&id=${cid}&min=1500&st=7")'>
                                    <input ${st == "7"?"checked":""} type="checkbox" name="check" style="width: 14px; height: 14px;">
                                    <label style="font-size: 17px;">1500$ and Above</label>
                                </div>
                            </div>
                        </div>

                        <div class="aside" style="margin-bottom: 30px;">
                            <h3 class="aside-title">Brand</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${listB}" var="br">
                                    <div class="input-checkbox" onclick='window.location.assign("${rq}/viewProductByBrand?brand=${br.bname}&id=${br.bid}")'>
                                        <input ${br.bname==brand?"checked":""} type="checkbox" id="brand-1" style="width: 14px; height: 14px;">
                                        <label style="font-size: 17px;">
                                            ${br.bname}
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top selling</h3>
                            <%
                                AllDao dao = new AllDao();
                                for (Products p : dao.getTop3BestSellers()) {
                            %>
                            <div class="product-widget">
                                <div class="product-img">
                                    <a href="singleProduct?pid=<%=p.getProductID()%>"><img src="assets/images/products/<%=p.getImage1()%>" alt=""></a>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${c.categoryName}</p>
                                    <h3 class="product-name"><a href="singleProduct?pid=<%=p.getProductID()%>"><%=p.getProductName()%></a></h3>
                                    <h4 class="product-price">$<%=p.getPriceDiscount()%> <del class="product-old-price">$<%=p.getPrice()%></del></h4>
                                </div>
                            </div>
                            <% }
                            %>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">

                        <!-- store products -->
                        <div class="shop-product-wrap grid row" id="cart">
                            <!-- product -->
                            <c:forEach items="${listP}" var="o" varStatus="loop">
                                <div class="ee-product">

                                    <!-- Image -->
                                    <div class="image">

                                        <span class="label sale"><i>-${o.discountPercent}%</i></span>
                                        <a href="singleProduct?pid=${o.productID}" class="img"><img src="${pageContext.request.contextPath}/assets/images/products/${o.image1}" alt="Product Image"></a>

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

                                            <c:if test="${s5 != 0 || s4 != 0 || s3 != 0 || s2 != 0 || s1 != 0}">
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
                                            </c:if>
                                        </div>

                                    </div>

                                </div>
                                <div class="ee-product-list">

                                    <!-- Image -->
                                    <div class="image">
                                        <span class="label sale"><i>-${o.discountPercent}%</i></span>
                                        <a href="singleProduct?pid=${o.productID}" class="img"><img src="assets/images/products/${o.image1}" alt="Product Image"></a>

                                    </div>

                                    <!-- Content -->
                                    <div class="content">

                                        <!-- Category & Title -->
                                        <div class="head-content">

                                            <div class="category-title">
                                                <a href="#" class="cat">${c.categoryName}</a>
                                                <h5 class="title"><a href="singleProduct?pid=${o.productID}">${o.productName}</a></h5>
                                            </div>

                                            <h5 class="price"><span class="old">$${o.price}</span>$${o.priceDiscount}</h5>

                                        </div>

                                        <div class="left-content">



                                            <div class="desc">
                                                <p>${o.tittle}</p>
                                            </div>

                                            <div class="actions">

                                                <c:if test="${o.PQuantity > 0}"><a href="shoppingCart?id=${o.productID}&action=ordernow" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a></c:if>
                                                <c:if test="${o.PQuantity <= 0}"><button type="button" class="btn btn-danger" disabled data-bs-toggle="button" autocomplete="off" style="border-radius: 5px; padding: 7px 32px; background-color: red;"><span>OUT OF STOCK</span></button></c:if>

                                                    <div class="wishlist-compare">
                                                        <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="right-content">
                                                <div class="specification">
                                                    <h5>Specifications</h5>
                                                    <ul>
                                                        <li>Intel Core i7 Processor</li>
                                                        <li>Zeon Z 170 Pro Motherboad</li>
                                                        <li>16 GB RAM</li>
                                                    </ul>
                                                </div>
                                            <c:if test="${o.PQuantity > 0}"><span class="availability">Availability: <span>In Stock</span></span></c:if>
                                            <c:if test="${o.PQuantity <= 0}"><span class="availability">Availability: <span style="font-weight: bold; color: red;">Out of Stock</span></span></c:if>

                                            </div>

                                        </div>

                                    </div>
                            </c:forEach>
                            <!-- /product -->

                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="row mt-30">
                            <div class="col">
                                <c:if test="${end != null}">
                                    <ul class="pagination">
                                        <c:if test="${sort == null && txt == null}">
                                            <li class="${indexPage>1?"":"disabled"}"><a href="category?id=${cid}&index=${indexPage-1}"><i class="fa fa-angle-left"></i>Back</a></li>
                                                <c:forEach begin="1" end="${end}" var="i">
                                                <li class="${tag == i?"active":""}"><a href="category?id=${cid}&index=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li class="${indexPage<end?"":"disabled"}"><a href="category?id=${cid}&index=${indexPage+1}">Next<i class="fa fa-angle-right"></i></a></li>
                                                </c:if>
                                                <c:if test="${sort != null}">
                                            <li class="${indexPage>1?"":"disabled"}"><a href="filterShop?action=sort&type=${sort}&id=${cid}&index=${indexPage-1}"><i class="fa fa-angle-left"></i>Back</a></li>
                                                <c:forEach begin="1" end="${end}" var="i">
                                                <li class="${tag == i?"active":""}"><a href="filterShop?action=sort&type=${sort}&id=${cid}&index=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li class="${indexPage<end?"":"disabled"}"><a href="filterShop?action=sort&type=${sort}&id=${cid}&index=${indexPage+1}">Next<i class="fa fa-angle-right"></i></a></li>
                                                </c:if>
                                                <c:if test="${txt != null}">
                                            <li class="${indexPage>1?"":"disabled"}"><a href="search?action=sort&txt=${txt}&choose=${cid}&index=${indexPage-1}"><i class="fa fa-angle-left"></i>Back</a></li>
                                                <c:forEach begin="1" end="${end}" var="i">
                                                <li class="${tag == i?"active":""}"><a href="search?action=sort&txt=${txt}&choose=${cid}&index=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li class="${indexPage<end?"":"disabled"}"><a href="search?action=sort&txt=${txt}&choose=${cid}&index=${indexPage+1}">Next<i class="fa fa-angle-right"></i></a></li>
                                                </c:if>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                        <!-- /store bottom filter -->
                    </div>

                    <!-- /STORE -->
                </div>

                <!-- /row -->
            </div>
            <!-- /container -->
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

            <!-- JS
            ============================================ -->
            <script>
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
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>