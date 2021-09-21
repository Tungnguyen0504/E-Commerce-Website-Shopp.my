<%-- 
    Document   : account
    Created on : Mar 11, 2021, 2:29:58 PM
    Author     : tungn
--%>

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
                margin: -20px -25px 10px;
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
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin-right: 18px;
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
            table.table td i {
                font-size: 19px;
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
            .fa-trash-alt:before {
                content: "\f2ed";
                font-size: 19px;
                margin-left: -10px;
                margin-right: 5px;  
            }
            .fa-user-plus:before {
                margin-left: -10px;
                margin-right: 5px;  
                font-size: 17px;
            }
            table.table td:last-child i #edit-icon {
                font-size: 5px;
            }
            .table td img {
                width: 95px;
                max-width: 185px;
            }
            #img {
                padding-right: 20px;
            }
            #color {
                padding-top: 35px;
            }
            .disabled {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 5px 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
        </style>
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
                            <h1>Manage Bill Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="#">Manage Bill</a></li>
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
                                    <h2>Manage <b>Bill</b></h2>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th style="text-align: left;">User Name</th>
                                    <th>Payment</th>
                                    <th>Order Date</th>
                                    <th>Total</th>
                                    <th style="width: 20%;">Bill Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listOrder}" var="o">
                                <tr>
                                    <td>${o.orderID}</td>
                                    <td style="text-align: left;">${o.u.userName}</td>
                                    <td>${o.payment}</td>
                                    <td>${o.orderDateFormat}</td>
                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.total}" type="currency"/></td>
                                    <td style="font-size: 17px;">
                                        <c:if test="${o.billStatus == 1}">
                                            <span class="status text-success">&bull;</span>Delivered
                                        </c:if>
                                        <c:if test="${o.billStatus == -1}">
                                            <span class="status text-danger">&bull;</span>Cancelled
                                        </c:if>
                                        <c:if test="${o.billStatus == 0}">
                                            <button onclick="changeStatus(this, 1, ${o.orderID})" style="border-radius: 5px;">Delivered</button>
                                            <button onclick="changeStatus(this, -1, ${o.orderID})" style ="border-radius: 5px;"> Cancelled </button>
                                        </c:if>
                                    </td>
                                    <td style="display: inline-flex;">
                                        <a href="order-detail.jsp?id=${o.orderID}" class="edit"><i class="fas fa-info-circle" data-toggle="tooltip" title="View details"></i></a>
                                        <a onclick="deleteRow(this, ${o.orderID})" class="delete"><i class="fas fa-trash-alt" data-toggle="tooltip" title="Delete"></i></a>
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
                                <li class="page-item ${indexPage>1?"":"disabled"}"><a href="manageBill?index=${indexPage-1}" tabindex="-1" aria-disabled="true">Previous</a></li>
                                    <c:forEach begin="1" end="${end}" var="i">
                                    <li class="page-item ${tag == i?"active":""}"><a href="manageBill?index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item ${indexPage<end?"":"disabled"}"><a href="manageBill?index=${indexPage+1}" class="page-link">Next</a></li>
                            </ul>
                        </c:if>
                    </div>
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
                    url: '/Project/manageBill',
                    type: 'GET', //method
                    data: {//truyen id va status
                        //param:
                        id: productID,
                        action: 'delete'
                    }
                });
            }
            function changeStatus(btn, st, bid) {
                var txt = '';
                if (st === 1) {
                    txt = "Delivered";
                } else {
                    txt = "Cancelled";
                }
                //bao quanh 2 button là 1 thẻ td => td là cha của 2 button
                btn.parentElement.innerHTML = txt;
                $.ajax({
                    url: '/Project/manageBill?action=changeST',
                    type: 'GET', //method
                    data: {//truyen id va status
                        //param:
                        id: bid,
                        status: st
                    }
                });
            }
        </script>

        <!-- jQuery JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>       <!-- Plugins JS -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
