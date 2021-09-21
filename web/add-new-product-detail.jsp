<%-- 
    Document   : add-new-product-detail
    Created on : Aug 17, 2021, 12:20:47 AM
    Author     : tungn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .form-group col-md-6 {
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
                <c:if test="${laptop != null}">
                    <form action="manageProduct?action=addProduct2" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add New Laptop</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group col-md-6">
                                <label>Memory Size: </label>
                                <input type="text" class="form-control" name="p1" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>CPU Model: </label>
                                <input type="text" class="form-control" name="p2" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>CPU Speed: </label>
                                <input type="text" class="form-control" name="p3" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Display Resolution: </label>
                                <input type="text" class="form-control" name="p4" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Screen Size:</label>
                                <input type="text" class="form-control" name="p5" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Item Weight:</label>
                                <input type="text" class="form-control" name="p6" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Graphics Coprocessor:</label>
                                <input type="text" class="form-control" name="p7" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Operating System:</label>
                                <input type="text" class="form-control" name="p8" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>RAM Type:</label>
                                <input type="text" class="form-control" name="p9" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="${laptop}" name="type">
                            <input type="submit" class="btn btn-success" value="Next">
                        </div>
                    </form>
                </c:if>
                <c:if test="${sphone != null}">
                    <form action="manageProduct?action=addProduct2" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add New Smart Phone</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group col-md-6">
                                <label>Screen:</label>
                                <input type="text" class="form-control" name="p1" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Operating system:</label>
                                <input type="text" class="form-control" name="p2" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Rear camera:</label>
                                <input type="text" class="form-control" name="p3" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Front camera:</label>
                                <input type="text" class="form-control" name="p4" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>CPU:</label>
                                <input type="text" class="form-control" name="p5" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>RAM:</label>
                                <input type="text" class="form-control" name="p6" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Internal memory:</label>
                                <input type="text" class="form-control" name="p7" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>SIM:</label>
                                <input type="text" class="form-control" name="p8" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Battery capacity:</label>
                                <input type="text" class="form-control" name="p9" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="${sphone}" name="type">
                            <input type="submit" class="btn btn-success" value="Next">
                        </div>
                    </form>
                </c:if>
                <c:if test="${camera != null}">
                    <form action="manageProduct?action=addProduct2" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add New Camera</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group col-md-6">
                                <label>Model Number:</label>
                                <input type="text" class="form-control" name="p1" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Eye Autofocus (Eye AF):</label>
                                <input type="text" class="form-control" name="p2" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Image Sensor Type:</label>
                                <input type="text" class="form-control" name="p3" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Image Sensor Size:</label>
                                <input type="text" class="form-control" name="p4" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Maximum Focal Length:</label>
                                <input type="text" class="form-control" name="p5" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Minimum Focal Length:</label>
                                <input type="text" class="form-control" name="p6" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Maximum Aperture:</label>
                                <input type="text" class="form-control" name="p7" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Effective Pixels:</label>
                                <input type="text" class="form-control" name="p8" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Wi-Fi Enabled:</label>
                                <input type="text" class="form-control" name="p9" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="${camera}" name="type">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </c:if>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>