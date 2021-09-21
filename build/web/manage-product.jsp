<%-- 
    Document   : account
    Created on : Mar 11, 2021, 2:29:58 PM
    Author     : tungn
--%>

<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

        <!-- CSS
            ============================================ -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- CSS only -->
        <!-- Icon Font CSS -->
        <link rel="stylesheet" href="assets/css/icon-font.min.css">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
                max-width: 1450px;
                margin: 80px 95px;
            }
            .table-title {        
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 0px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
                color: white;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
                margin-top: 7px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                text-align: center;
                border-color: #e9e9e9;
                padding: 12px 12px;
                vertical-align: middle;
                max-width: 250px;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }    
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {    
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
            .table-title h2 b {
                color: lightsalmon;
                font-size: 26px;
            }
            .fa-user-plus:before {
                margin-left: -10px;
                margin-right: 5px;  
                font-size: 17px;
            }
            .table td img {
                width: 95px;
                max-width: 185px;
            }
            #img {
                padding-right: 20px;
            }
            .category-menu ul i {
                width: 195px;
                text-align: center;
            }
            .category-menu ul i:hover {
                background-color: white;
                border-radius: 5px;
            }
            .category-menu .active {
                background-color: white;
            }

            .table-filter .filter-group {
                float: right;
                margin-left: 20px;
            }
            .filter-group select.form-control {
                width: max-content;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 60px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                color: #566787;
                background: white;
                font-family: 'Varela Round', sans-serif;
                font-size: 18px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .table-filter button {
                color: #fff;
                background: #03A9F4;
                border-radius: 3px;
                height: 34px;
                float: right;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-filter .filter-icon {
                font-size: 22px;
                opacity: 0.7;
                float: right;
                margin-top: 5px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .disabled {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
            }
            #action a {
                margin: 0 6px;
            }
        </style>
        <!-- Modernizer JS -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>

    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:useBean scope="page" id="d" class="dao.AllDao"/>
        <c:set value="${d.getCategoryByID(cid)}" var="c"/>

        <!-- Page Banner Section Start -->
        <div class="page-banner-section section">
            <div class="page-banner-wrap row row-0 d-flex align-items-center ">
                <!-- Banner -->
                <!-- Page Banner -->
                <div class="col-lg-12 col-12 order-lg-2 d-flex align-items-center justify-content-center">
                    <div class="page-banner">
                        <h1>Manage Products Page</h1>
                        <div class="breadcrumb">
                            <ul>
                                <li><a href="home">HOME</a></li>
                                <li><a href="#">Manage Products</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Banner -->

            </div>
        </div><!-- Page Banner Section End -->

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-3">
                                <h2>Manage <b>Products</b></h2>
                            </div>
                            <div class="col-sm-9">
                                <a href="manageProduct?action=getPath" class="btn btn-success"><i class="fas fa-user-plus"></i> <span>Add New Product</span></a>
                            </div>
                        </div>
                    </div>
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
                                <i class="fas fa-laptop ${cid == 1?"active":""}"><li><a href="manageProduct?cid=1">LAPTOP</a></li></i>
                                <i class="fas fa-camera ${cid == 2?"active":""}"><li><a href="manageProduct?cid=2">SMARTPHONE</a></li></i>
                                <i class="fas fa-mobile-alt ${cid == 3?"active":""}"><li><a href="manageProduct?cid=3">CAMERA</a></li></i>
                            </ul>
                        </nav>
                    </div>
                    <div class="table-filter">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="show-entries" style="margin-top: 4px; margin-left: 4px; width: max-content;">
                                    <span>Show <b>${count}</b> Products</span>
                                </div>
                            </div>
                            <div class="col-sm-10">
                                <form action="filterManageProduct?action=search" method="post">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Name</label>
                                        <input type="text" name="name" value="${txtH}" placeholder="Search..." class="form-control">
                                        <input type="hidden" name="cid" value="${cid}">
                                    </div>
                                </form>
                                <div class="filter-group">
                                    <label>Sort Product</label>
                                    <select onchange="if (this.value)
                                                window.location.href = this.value" class="form-control" style="height: 34px;">
                                        <option value="manageProduct?cid=1">Any</option>
                                        <option ${type == "sortPriceASC"?"selected":""} value="filterManageProduct?action=sort&type=sortPriceASC&cid=${cid}">Price: low to high</option>
                                        <option ${type == "sortPriceDESC"?"selected":""} value="filterManageProduct?action=sort&type=sortPriceDESC&cid=${cid}">Price: high to low</option>
                                        <option ${type == "sortNewArrival"?"selected":""} value="filterManageProduct?action=sort&type=sortNewArrival&cid=${cid}">Newest items</option>
                                        <option ${type == "sortBestSeller"?"selected":""} value="filterManageProduct?action=sort&type=sortBestSeller&cid=${cid}">Best Seller</option>
                                    </select>
                                </div>
                                <span class="filter-icon"><i class="fa fa-filter"></i></span>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th style="text-align: left;">Product Name</th>
                                <th>Category</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Price Discount</th>
                                <th>Customer Rating</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listProduct}" var="o">
                                <tr>
                                    <td id="img"><img src="assets/images/products/${o.image1}"></td>
                                    <td style="text-align: left;">${o.productName}</td>
                                    <td>${c.categoryName}</td>
                                    <td>${o.PQuantity}</td>
                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.price}" type="currency"/></td>
                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.priceDiscount}" type="currency"/></td>
                                    <td>
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
                                    </td>
                                    <td>
                                        <div id="action" style="display: flex; justify-content: center;">
                                            <a href="manageProduct?action=view&id=${o.productID}" class="edit" style="font-size: 24px;"><i class="fas fa-edit" data-toggle="tooltip" title="Edit"></i></a>
                                            <a onclick="deleteRow(this, ${o.productID})" class="delete" style="font-size: 22px;"><i class="fas fa-trash-alt" data-toggle="tooltip" title="Delete"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>${tag}</b> out of <b>${end}</b> entries</div>
                        <c:if test="${end == null}"></c:if>
                        <c:if test="${end != null}">
                            <ul class="pagination">
                                <c:if test="${type == null && txtH == null}">
                                    <li class="page-item ${indexPage>1?"":"disabled"}"><a href="manageProduct?cid=${cid}&index=${indexPage-1}">Previous</a></li>
                                        <c:forEach begin="1" end="${end}" var="i">
                                        <li class="page-item ${tag == i?"active":""}"><a href="manageProduct?cid=${cid}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item ${indexPage<end?"":"disabled"}"><a href="manageProduct?cid=${cid}&index=${indexPage+1}" class="page-link">Next</a></li>
                                    </c:if>
                                    <c:if test="${type != null}">
                                    <li class="page-item ${indexPage>1?"":"disabled"}"><a href="filterManageProduct?action=sort&cid=${cid}&index=${indexPage-1}&type=${type}">Previous</a></li>
                                        <c:forEach begin="1" end="${end}" var="i">
                                        <li class="${tag == i?"active":""}"><a href="filterManageProduct?action=sort&cid=${cid}&index=${i}&type=${type}">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item ${indexPage<end?"":"disabled"}"><a href="filterManageProduct?action=sort&cid=${cid}&index=${indexPage+1}&type=${type}" class="page-link">Next</a></li>
                                    </c:if>
                                    <c:if test="${txtH != null}">
                                    <li class="page-item ${indexPage>1?"":"disabled"}"><a href="filterManageProduct?action=search&cid=${cid}&index=${indexPage-1}&name=${txtH}">Previous</a></li>
                                        <c:forEach begin="1" end="${end}" var="i">
                                        <li class="page-item ${tag == i?"active":""}"><a href="filterManageProduct?action=search&cid=${cid}&index=${i}&name=${txtH}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item ${indexPage<end?"":"disabled"}"><a href="filterManageProduct?action=search&cid=${cid}&index=${indexPage+1}&name=${txtH}" class="page-link">Next</a></li>
                                    </c:if>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>        
        </div>

        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="manageProduct?action=deleteProduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                            <input type="hidden" name="id" id="id">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

        <script type="text/javascript">
            function deleteRow(btn, productID) {
                //td là cha btn => tr là ông btn
                //b1: remove row in table(cho ông biến mất)
                btn.parentElement.parentElement.style.display = "none";
                //b2: remove in database => servlet
                $.ajax({
                    url: '/Project/manageProduct',
                    type: 'GET', //method
                    data: {//truyen id va status
                        //param:
                        id: productID,
                        action: 'deleteProduct'
                    }
                });
            }
        </script>

        <!-- jQuery JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>       <!-- Plugins JS -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
