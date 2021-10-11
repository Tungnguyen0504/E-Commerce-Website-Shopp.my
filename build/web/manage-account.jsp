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
            <div class="container-fluid">

                <jsp:include page="generalJsp/admin-card.jsp" />

                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header" style="padding: 1.1rem 3rem;">
                                <span><i class="bi bi-table me-2"></i></span> Manage <strong>Product</strong>
                                <a href="add-account.jsp" class="btn btn-success float-end" style="border-radius: 20px; padding: 7px 20px;"><i class="bi bi-folder-plus" style="margin-right: 7px;"></i>Add New Product</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table
                                        id="table-data"
                                        class="table table-striped data-table"
                                        style="width: 100%; margin:4px 0;"
                                        >
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>User Name</th>
                                                <th>Password</th>
                                                <th>Full Name</th>
                                                <th>isAdmin</th>
                                                <th>isActive</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listAccount}" var="o">
                                                <tr>
                                                    <td id="img" data-sortable="false">
                                                        <img src="assets/images/user/${o.image}">
                                                    </td>
                                                    <td>${o.userName}</td>
                                                    <td>${o.password}</td>
                                                    <td>${o.fullName}</td>
                                                    <td>
                                                        <div class="d-flex" style="justify-content: center; font-size: 24px;">
                                                            <input class ="form-check-input" type="checkbox" title="active" style="margin: 0; cursor: pointer;" ${o.isAdmin?"checked":""}>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex" style="justify-content: center; font-size: 24px;">
                                                            <input onclick="location.href = 'manageAccount?action=activeAcc&id=${o.userID}&status=false'" class ="form-check-input" type="checkbox" title="active" style="margin: 0; cursor: pointer;" ${o.isActive?"checked":""}>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div id="action" class="d-flex" style="justify-content: center;">
                                                            <a href="manageAccount?action=view&uid=${o.userID}" class="edit" style="font-size: 24px; color: #FFC107;"><i class="bi bi-pencil-square" data-toggle="tooltip" title="Edit"></i></a>
                                                            <a href="#deleteProduct" data-bs-toggle="modal" class="delete" style="font-size: 22px; color: #F44336;"><i class="bi bi-trash" data-toggle="tooltip" title="Delete"></i></a>
                                                            <input type="hidden" name="oid" id="uid" value="${o.userID}">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="deleteProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <form action="manageAccount?action=deleteAccount" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure you want to delete this account?</p>
                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button class="btn btn-primary">Save changes</button>
                                    <input type="hidden" name="uid" id="uid">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <jsp:include page="generalJsp/admin-footer.jsp"/>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="assets/js/admin.js" type="text/javascript"></script>
        <script>
                                                                $(document).ready(function () {
                                                                    $('.table .delete').on('click', function () {
                                                                        var uid = $(this).parent().find('#uid').val();
                                                                        $('#deleteProduct #uid').val(uid);
                                                                    });
                                                                    $('#table-data').DataTable({
                                                                        lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                                                                        columnDefs: [
                                                                            {orderable: false, targets: [0, 5, 6]}
                                                                        ]
                                                                    });
                                                                });
        </script>
    </body>
</html>
