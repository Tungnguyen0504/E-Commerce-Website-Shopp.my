<%-- 
    Document   : admin
    Created on : Oct 1, 2021, 9:24:46 AM
    Author     : tungn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ee3bc02316.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <link href="assets/css/admin.css" rel="stylesheet" type="text/css"/>
        <title>Frontendfunn - Bootstrap 5 Admin Dashboard Template</title>
    </head>
    <body>
        <jsp:useBean scope="page" id="d" class="dao.AllDao"/>

        <jsp:include page="generalJsp/admin-header-sidebar.jsp" />

        <main class="mt-5 pt-4" id="home-section">
            <div class="container-fluid" style="margin-bottom: 10px;">
                <jsp:include page="generalJsp/admin-card.jsp" />
                <div style="padding: 0 25px; margin-bottom: 10px;">
                    <div class="row gutters">
                        <div class="col-xl col-lg col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <form action="manageAccount?action=updateAccount" method="post">
                                    <div class="card-body">
                                        <div class="row gutters">
                                            <div class="card-header" style="padding: 1.1rem 3rem; margin-bottom: 30px;">
                                                <span><i class="bi bi-table me-2"></i></span> Manage <strong>Account</strong>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group ">
                                                    <span class="input-group-text" id="basic-addon1">User Name</span>
                                                    <input type="text" name="userName" value="${user.userName}" class="form-control" placeholder="Enter User Name ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Password</span>
                                                    <input type="text" name="password" value="${user.password}" class="form-control" placeholder="Enter Password ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon3">Is Admin</span>
                                                    <select class="form-select" name="isAdmin" aria-label="Default select example" aria-describedby="basic-addon3" required>
                                                        <option ${user.isAdmin?"selected":""} value="true">Yes</option>
                                                        <option ${user.isAdmin?"":"selected"} value="false">No</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon3">Is Active</span>
                                                    <select class="form-select" name="isActive" aria-label="Default select example" aria-describedby="basic-addon3" required>
                                                        <option ${user.isActive?"selected":""} value="true">Yes</option>
                                                        <option ${user.isActive?"":"selected"} value="false">No</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Full Name</span>
                                                    <input type="text" name="fullName" value="${user.fullName}" class="form-control" placeholder="Enter Full Name ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Email</span>
                                                    <input type="text" name="email" value="${user.email}" class="form-control" placeholder="Enter Email ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Address</span>
                                                    <input type="text" name="address" value="${user.address}" class="form-control" placeholder="Enter Address ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">City</span>
                                                    <input type="text" name="city" value="${user.city}" class="form-control" placeholder="Enter City ..." required>
                                                </div>
                                            </div>

                                            <!--start image-->
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group label-image">
                                                    <input id="input-b8" name="image" type="file" class="file" data-show-caption="true"
                                                           data-show-upload="false" data-show-remove="false" data-msg-placeholder="Upload for image ...">
                                                </div>
                                            </div>
                                            <!--end image-->
                                            
                                             <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Telephone</span>
                                                    <input type="text" name="phone" value="${user.telephone}" class="form-control" placeholder="Enter Telephone ..." required>
                                                </div>
                                            </div>

                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="text-right float-end" style="margin-right: 38px">
                                                    <a href="manageAccount" class="btn btn-secondary">Cancel</a>
                                                    <input type="hidden" name="uid" value="${user.userID}">
                                                    <input type="submit" class="btn btn-primary" value="Update Account">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="generalJsp/admin-footer.jsp" />
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script>
            $(document).ready(function () {
                $("#input-b8").fileinput({
                    allowedFileExtensions: ["jpg", "png", "gif"],
                    initialPreview: 'assets/images/user/${user.image}',
                    initialPreviewAsData: true,
                    initialCaption: '${user.image}'
                });
            });

            $(document).ready(function () {
                $("#feedback-down").click(function () {
                    $("#feedback-form").slideToggle("slow");
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="assets/js/admin.js" type="text/javascript"></script>
    </body>
</html>
