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
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
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
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-body">
                <div class="modal-content">
                    <form action="manageProduct?action=updateProduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                        </div>
                        <div class="modal-body" style="height: 42rem;">	
                            <div class="form-group col-md-6">
                                <label>Product ID</label><input value="${view.productID}" name="productID" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Image</label>
                                <input type="text" class="form-control" name="image" value="${view.image1}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Product Name</label>
                                <input type="text" class="form-control" name="productName" value="${view.productName}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Quantity</label>
                                <input type="text" class="form-control" name="quantity" value="${view.PQuantity}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Color</label>
                                <input type="text" class="form-control" name="color" value="${view.color}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Brand</label>
                                <input type="text" class="form-control" name="brand" value="${view.brand}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Price</label>
                                <input type="number" class="form-control" name="price" value="${view.price}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Price Discount</label>
                                <input type="number" class="form-control" name="priceDiscount" value="${view.priceDiscount}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Category Product</label>
                                <select name="category" class="form-select" aria-label="Default select example" style="padding: 3px; margin-left: 15px;margin-top: 7px;">
                                    <option value="1">Laptop</option>
                                    <option value="2">SmartPhone</option>
                                    <option value="3">Camera</option>
                                </select>
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