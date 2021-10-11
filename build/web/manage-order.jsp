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
        <style>
            .status span {
                color: #FFF;
                padding: 1px 7px;
                border-radius: 5px;
            }
            #select-st {
                width: 165px; 
                margin: auto; 
                padding: 0.375rem 23px;
            }
        </style>
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
                                <span><i class="bi bi-table me-2"></i></span> Manage <strong>Orders</strong>
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
                                                <th>#</th>
                                                <th>Full Name</th>
                                                <th>Delivery Method</th>
                                                <th>Order Status</th>
                                                <th>Order Date</th>
                                                <th>Total</th>
                                                <th>Action</th>
                                                <th>View</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrder}" var="o">
                                                <c:set value="${d.findAccount(o.userID)}" var="u"/>
                                                <tr>
                                                    <td>${o.orderID}</td>
                                                    <td class="text-start"><img class="rounded-circle" src="assets/images/user/${u.image}" style="width: 40px; margin-right: 18px; margin-left: 35px;">${u.userName}</td>
                                                    <td>${o.payment}</td>
                                                    <td class="status">
                                                        <c:if test="${o.billStatus == 3}">
                                                            <span style="background: #27c24c;">Delivered</span>
                                                        </c:if>
                                                        <c:if test="${o.billStatus == 2}">
                                                            <span style="background: #988fcc;">On the Way</span>
                                                        </c:if>
                                                        <c:if test="${o.billStatus == 1}">
                                                            <span style="background: blue;">Order Shipped</span>
                                                        </c:if>
                                                        <c:if test="${o.billStatus == -1}">
                                                            <span style="background: #f05050;">Canceled</span>
                                                        </c:if>
                                                        <c:if test="${o.billStatus == 0}">
                                                            <span style="background: #ff902b;">Pending</span>
                                                        </c:if>
                                                    </td>
                                                    <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${o.orderDate}" /></p></td>
                                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.total}" type="currency"/></td>
                                                    <td style="width: 180px;">

                                                        <div class="dropdown" style="width: 165px;">
                                                            <button ${o.billStatus == 3 || o.billStatus == -1 ? "disabled":""} class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="width: 165px; background: #FFF; color: black; border: 1px solid #ced4da;">
                                                                ${o.billStatus == 3 ? "<span>Delivered<span>":""}
                                                                ${o.billStatus == 2 ? "<span>On the Way<span>":""}
                                                                ${o.billStatus == 1 ? "<span>Order Shipped<span>":""}
                                                                ${o.billStatus == 0 ? "<span>Pending<span>":""}
                                                                ${o.billStatus == -1 ? "<span>Canceled<span>":""}
                                                            </button>
                                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width: 165px; text-align: center;">
                                                                <li ${o.billStatus == 1 || o.billStatus == 2 ? "hidden":""}><a class="dropdown-item" href="manageBill?action=changeStatus&oid=${o.orderID}&st=1">Order Shipped</a></li>
                                                                <li ${o.billStatus == 2 ? "hidden":""}><a class="dropdown-item" href="manageBill?action=changeStatus&oid=${o.orderID}&st=2">On the Way</a></li>
                                                                <li><a class="dropdown-item delivered" href="#finish" data-bs-toggle="modal">Delivered</a></li>
                                                                <li><a class="dropdown-item canceled" href="#cancel" data-bs-toggle="modal">Canceled</a></li>
                                                                <input type="hidden" name="oid" id="oid" value="${o.orderID}">
                                                            </ul>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div id="action" class="d-flex" style="justify-content: center;">
                                                            <a href="manageBill?action=view&oid=${o.orderID}" class="edit" style="font-size: 24px;"><i class="bi bi-eye-fill" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <!--modal-->

                                                <!--end modal-->
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="finish" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <form action="manageBill?action=changeStatus&st=3" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Finish Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure the delivery was successful?</p>
                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <input type="hidden" name="oid" id="oid">
                                    <button class="btn btn-primary">Save changes</button>>
                                </div>
                            </div>
                        </form>
                    </div>             
                </div>
                <div class="modal fade" id="cancel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <form action="manageBill?action=changeStatus&st=-1" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Cancel Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure to cancel this order?</p>
                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <input type="hidden" name="oid" id="oid">
                                    <button class="btn btn-primary">Save changes</button>>
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
                $('.table .delivered').on('click', function () {
                    var oid = $(this).parent().parent().find('#oid').val();
                    $('#finish #oid').val(oid);
                });
                $('.table .canceled').on('click', function () {
                    var oid = $(this).parent().parent().find('#oid').val();
                    $('#cancel #oid').val(oid);
                });
                $('#table-data').DataTable({
                    lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                    columnDefs: [
                        {orderable: false, targets: [6, 7]}
                    ]
                });
            });
        </script>
    </body>
</html>
