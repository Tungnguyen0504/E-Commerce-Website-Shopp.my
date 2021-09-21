<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            img{
                width: 200px;
                height: 120px;
            }
            #admin {
                padding-right: 20px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            input[type=checkbox], input[type=radio] {
                margin: 5px 0px 5px 15px;
                margin-top: 1px\9;
                line-height: normal;
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
            }
            .main-body {
                width: 90%;
                margin: auto;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-body">
                <div class="modal-content">
                    <form action="manageAccount?action=updateAccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                        </div>
                        <div class="modal-body" style="height: 42rem;">	
                            <div class="form-group col-md-6">
                                <label>ID</label><input value="${view.userID}" name="userID" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>User Name</label>
                                <input type="text" value="${view.userName}" class="form-control" name="userName" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Password</label>
                                <input type="text" value="${view.password}" class="form-control" name="password" required>
                            </div>

                            <div class="form-group col-md-6">
                                <label>Full Name</label>
                                <input type="text" value="${view.fullName}" class="form-control" name="fullName" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Email</label>
                                <input type="email" value="${view.email}" class="form-control" name="email" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Telephone</label>
                                <input type="text" value="${view.telephone}" class="form-control" name="telephone" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Address</label>
                                <input type="text" value="${view.address}" class="form-control" name="address" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Town/City</label>
                                <input type="text" value="${view.city}" class="form-control" name="city" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label id="admin">Is Admin</label>
                                <c:if test="${view.isAdmin}">
                                    <input class="form-check-input" type="radio" value="true" checked name="isAdmin">
                                    <label class="form-check-label" for="flexCheckDefault">Yes</label>
                                    <input class="form-check-input" type="radio" value="false" name="isAdmin">
                                    <label class="form-check-label" for="flexCheckChecked">No</label>
                                </c:if>
                                <c:if test="${!view.isAdmin}">
                                    <input class="form-check-input" type="radio" value="true" checked name="isAdmin">
                                    <label class="form-check-label" for="flexCheckDefault">Yes</label>
                                    <input class="form-check-input" type="radio" value="false" checked name="isAdmin">
                                    <label class="form-check-label" for="flexCheckChecked">No</label>
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label id="admin">Is Active</label>
                                <c:if test="${view.isActive}">
                                    <input class="form-check-input" type="radio" value="true" checked name="isActive">
                                    <label class="form-check-label" for="flexCheckDefault">Yes</label>
                                    <input class="form-check-input" type="radio" value="0" name="isActive">
                                    <label class="form-check-label" for="flexCheckChecked">No</label>
                                </c:if>
                                <c:if test="${!view.isActive}">
                                    <input class="form-check-input" type="radio" value="true" checked name="isActive">
                                    <label class="form-check-label" for="flexCheckDefault">Yes</label>
                                    <input class="form-check-input" type="radio" value="false" checked name="isActive">
                                    <label class="form-check-label" for="flexCheckChecked">No</label>
                                </c:if>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>