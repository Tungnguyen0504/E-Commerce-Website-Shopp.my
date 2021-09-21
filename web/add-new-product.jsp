<%-- 
    Document   : add-new-product
    Created on : Aug 17, 2021, 12:19:22 AM
    Author     : tungn
--%>

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
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Add <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-content" style="margin: 0px 95px;">
                <form action="${pageContext.request.contextPath }/manageProduct?action=addProduct1" method="post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add New Products</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body" style="height: 480px;">					
                        <div class="form-group col-md-6">
                            <label for="formFile" class="form-label">Image 1</label>
                            <input class="form-control" type="file" name="image1" required id="formFile">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="formFile" class="form-label">Image 2</label>
                            <input class="form-control" type="file" name="image2" required id="formFile">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="formFile" class="form-label">Image 3</label>
                            <input class="form-control" type="file" name="image3" required id="formFile">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="formFile" class="form-label">Image 4</label>
                            <input class="form-control" type="file" name="image4" required id="formFile">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Product Name</label>
                            <input type="text" class="form-control" name="productName" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Color</label>
                            <input type="text" class="form-control" name="color" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Brand</label>
                            <input type="text" class="form-control" name="brand" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Price</label>
                            <input type="number" class="form-control" name="price" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Price Discount</label>
                            <input type="number" class="form-control" name="priceDiscount" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Category Product</label>
                            <select name="category" class="form-select" aria-label="Default select example" style="width: 35%; padding: 3px; margin-left: 15px;margin-top: 7px;">
                                <option value="1">Laptop</option>
                                <option value="2">SmartPhone</option>
                                <option value="3">Camera</option>
                            </select>
                        </div>					
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="Next">
                    </div>
                </form>
            </div>

        </div>
    </body>
</html>