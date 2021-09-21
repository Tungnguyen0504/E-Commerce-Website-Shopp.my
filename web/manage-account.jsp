<%-- 
    Document   : account
    Created on : Mar 11, 2021, 2:29:58 PM
    Author     : tungn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : order-history
    Created on : Aug 22, 2021, 9:04:07 AM
    Author     : tungn
--%>

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
                color: white;
                background: #f2f2f2;
            }
            .table-title .btn {
                color: #fff;
                background: forestgreen;
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
                color: #fff;
                background: #03A9F4;
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
            table.table td a i {
                font-size: 18px;
                margin: 4px 0 0 4px;
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
                margin: 2px 2px 0 0;
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
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
            }
            .disabled {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
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
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h2 style="color: white;">Order <b style="color: lightsalmon;">History</b></h2>
                                </div>
                                <div class="col-sm-8">	
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="fas fa-user-plus" style="margin-top: 2px;"></i> <span>Add New Employee</span></a>
                                </div>
                            </div>
                        </div>
                        <div class="table-filter">
                            <div class="row">
                                <div class="col-sm-2">
                                    <div class="show-entries" style="margin-top: 4px; margin-left: 4px; width: max-content;">
                                        <span>Show <b>${count}</b> Accounts</span>
                                </div>
                            </div>
                            <div class="col-sm-10">
                                <form action="filterManageAccount?action=search" method="post">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Name</label>
                                        <input type="text" name="name" value="${txtH}" placeholder="Search by username..." class="form-control">
                                    </div>
                                </form>
                                <div class="filter-group">
                                    <label>Filter Account</label>
                                    <select onchange="if (this.value)
                                                window.location.href = this.value" class="form-control" style="height: 34px; width: auto;">
                                        <option value="manageProduct?cid=1">Any</option>
                                        <option ${type == "1"?"selected":""} value="filterManageAccount?action=Filter&type=1">Admin</option>
                                        <option ${type == "2"?"selected":""} value="filterManageAccount?action=Filter&type=2">Not Admin</option>
                                        <option ${type == "3"?"selected":""} value="filterManageAccount?action=Filter&type=3">Activated</option>
                                        <option ${type == "4"?"selected":""} value="filterManageAccount?action=Filter&type=4">Not Activated </option>
                                        <option ${type == "5"?"selected":""} value="filterManageAccount?action=Filter&type=5">Newest User</option>
                                    </select>
                                </div>
                                <span class="filter-icon"><i class="fa fa-filter"></i></span>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th style="width: 25%;">User Name</th>
                                <th>Password</th>
                                <th>Admin</th>
                                <th>Full Name</th>					
                                <th>isActive</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listAccount}" var="o">
                                <tr>
                                    <td>${o.userName}</td>
                                    <td>${o.password}</td>
                                    <td>${o.isAdmin?"Yes":"No"}</td>
                                    <td>${o.fullName}</td>
                                    <td>
                                        <div class="form-check">
                                            <c:if test="${o.isActive}">
                                                <input onclick="location.href = 'manageAccount?action=activeAcc&id=${o.userID}&status=false'" class ="form-check-input" type="checkbox" title="active" checked style="width: 21px; height: 21px; margin: -7px 0 0 0;">
                                            </c:if>
                                            <c:if test="${!o.isActive}">
                                                <input onclick="location.href = 'manageAccount?action=activeAcc&id=${o.userID}&status=true'" class ="form-check-input" type="checkbox" title="active" style="width: 21px; height: 21px; margin: -7px 0 0 0;">
                                            </c:if>
                                        </div>
                                    </td>
                                    <td style="width: 105px;">
                                        <a href="manageAccount?action=view&id=${o.userID}" class="edit"><i id="edit-icon" class="fas fa-edit" data-toggle="tooltip" title="Edit" style="color: #FFC107;"></i></a>
                                        <a onclick="deleteRow(this, ${o.userID})" class="delete"><i class="fas fa-trash-alt" data-toggle="tooltip" title="Delete" style="color: #F44336;"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <c:if test="${end == null}"></c:if>
                        <c:if test="${end != null}">
                            <ul class="pagination">
                                <li class="page-item ${indexPage>1?"":"disabled"}"><a href="manageAccount?index=${indexPage-1}">Previous</a></li>
                                    <c:forEach begin="1" end="${end}" var="i">
                                    <li class="page-item ${tag == i?"active":""}"><a href="manageAccount?index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item ${indexPage<end?"":"disabled"}"><a href="manageAccount?index=${indexPage+1}" class="page-link">Next</a></li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>        
        </div>  
        <jsp:include page="footer.jsp"></jsp:include>
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath }/manageAccount?action=addAccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add New Accounts</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>User Name</label>
                                <input type="text" class="form-control" name="userName" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password" required>
                            </div>
                            <div class="form-group">
                                <label>Admin</label>
                                <select name="isAdmin" class="form-select" aria-label="Default select example" style="width: 35%; padding: 3px; margin-left: 15px;margin-top: 7px;">
                                    <option value="true">Yes</option>
                                    <option value="false">No</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" class="form-control" name="fullName" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                            <div class="form-group">
                                <label>Telephone</label>
                                <input type="text" class="form-control" name="telephone" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" name="address" required>
                            </div>
                            <div class="form-group">
                                <label>Town/City</label>
                                <input type="text" class="form-control" name="city" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" style="color: black;">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
//            $(document).ready(function () {
//                $('table .delete').on('click', function () {
//                    var id = $(this).parent().find('#id').val();
//                    $('#deleteEmployeeModal #id').val(id);
//                });
//            });
            function deleteRow(btn, userID) {
                //td là cha btn => tr là ông btn
                //b1: remove row in table(cho ông biến mất)
                btn.parentElement.parentElement.style.display = "none";
                //b2: remove in database => servlet
                $.ajax({
                    url: '/Project/manageAccount',
                    type: 'GET', //method
                    data: {//truyen id va status
                        //param:
                        id: userID,
                        action: 'deleteAccount'
                    }
                });
            }
        </script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>

