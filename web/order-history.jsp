<%-- 
    Document   : order-history
    Created on : Aug 22, 2021, 9:04:07 AM
    Author     : tungn
--%>

<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap Order Details Table with Search Filter</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/icon-font.min.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                color: #566787;
                background: white;
                font-family: "Open Sans", sans-serif;
                font-size: 14px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 4px;
                border: 1px solid black;
                display: block;
                width: 100%;
                overflow-x: auto;
                margin: 75px 0;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {		
                font-size: 13px;
                border: none;
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
            .table-title {
                color: #fff;
                background: #4b5366;		
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {        
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
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
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }	
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
                text-align: center;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
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
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {        
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }   
            table.table .avatar {
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 5px 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
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
            .pagination li.active a {
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
            .disabled {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
            }
            .shopping-now a {
                margin-top: 6px;
                padding: 10px 65px;
                font-size: 20px;
                border-radius: 10px;
                font-weight: 500;
                font-family: Arial,Helvetica,sans-serif;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
                            <h1>Manage Accounts Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="category?id=1">Manage Accounts</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Banner -->

                </div>
            </div><!-- Page Banner Section End -->
            <div class="container-xl">
                <div class="table-responsive">
                <c:if test="${listOd.size() == 0}">
                    <div class="shopping-now pb-50 pt-50" style="text-align: center;">
                        <i class="fas fa-cart-arrow-down" style="color: red; font-size: 100px;"></i><br><br>
                        <label style="font-size: 26px; font-family: auto;">You haven't bought anything yet</label><br>
                        <a href="category?id=1" class="btn btn-primary" role="button">Shopping Now</a>
                    </div>
                </c:if>
                <c:if test="${listOd.size() != 0}">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h2 style="color: white;">Order <b style="color: lightsalmon;">History</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                    <a href="category?id=1" class="btn btn-primary"><i class="fas fa-shopping-cart" style="font-size: 20px; margin-top: 2px;"></i><span>Continue Shopping</span></a>
                                </div>
                            </div>
                        </div>
                        <div class="table-filter">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="show-entries">
                                        <span>Show <b>${count}</b> Products</span>
                                    </div>
                                </div>
                                <div class="col-sm-9">
                                    <form action="filterOrderHistory" method="post">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                        <div class="filter-group">
                                            <label>Name</label>
                                            <input type="text" name="name" value="${txtH}" class="form-control">
                                            <input type="hidden" value="${sessionScope.acc.userID}" name="uid">
                                        </div>
                                        <span class="filter-icon"><i class="fa fa-filter"></i></span>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 40%; text-align: left;">Product Name</th>
                                    <th>Quantity</th>
                                    <th>Order Date</th>						
                                    <th>Status</th>						
                                    <th>Net Amount</th>
                                    <th>Repurchase</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listOd}" var="od">
                                    <tr>
                                        <td style="text-align: left; display: flex; vertical-align: middle;">
                                            <div><img src="assets/images/products/${od.p.image1}" class="avatar" alt="Avatar" style="width: 75px;"></div>
                                            <div style=" display: flex; flex-direction: column; justify-content: center;"><a href="singleProduct?pid=${od.p.productID}">${od.p.productName}</a></div>
                                        </td>
                                        <td>${od.od.odQuantity}</td>
                                        <td>${od.o.orderDateFormat}</td>   
                                        <td>
                                            <div>
                                                <c:if test="${od.o.billStatus == 1}"><span class="status text-success">&bull;</span>Delivered</c:if>
                                                <c:if test="${od.o.billStatus == 0}"><span class="status text-info">&bull;</span> Shipping</c:if>
                                                <c:if test="${od.o.billStatus == -1}"><span class="status text-danger">&bull;</span> Cancelled</c:if>
                                                </div>
                                            </td>
                                            <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${od.od.subTotal}" type="currency"/></td>
                                        <td><a href="shoppingCart?id=${od.p.productID}&action=ordernow" class="view" title="repurchase" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="clearfix">
                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                            <c:if test="${end == null}"></c:if>
                            <c:if test="${end != null}">
                                <ul class="pagination">
                                    <c:if test="${txtH == null}">
                                        <li class="page-item ${indexPage>1?"":"disabled"}"><a href="orderHistory?index=${indexPage-1}&uid=${sessionScope.acc.userID}">Previous</a></li>
                                            <c:forEach begin="1" end="${end}" var="i">
                                            <li class="page-item ${tag == i?"active":""}"><a href="orderHistory?index=${i}&uid=${sessionScope.acc.userID}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item ${indexPage<end?"":"disabled"}"><a href="orderHistory?index=${indexPage+1}&uid=${sessionScope.acc.userID}" class="page-link">Next</a></li>
                                        </c:if>
                                        <c:if test="${txtH != null}">
                                        <li class="page-item ${indexPage>1?"":"disabled"}"><a href="filterOrderHistory?index=${indexPage-1}&uid=${sessionScope.acc.userID}&name=${txtH}">Previous</a></li>
                                            <c:forEach begin="1" end="${end}" var="i">
                                            <li class="page-item ${tag == i?"active":""}"><a href="filterOrderHistory?index=${i}&uid=${sessionScope.acc.userID}&name=${txtH}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item ${indexPage<end?"":"disabled"}"><a href="filterOrderHistory?index=${indexPage+1}&uid=${sessionScope.acc.userID}&name=${txtH}" class="page-link">Next</a></li>
                                        </c:if>
                                </ul>
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </div>        
        </div>  
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>
