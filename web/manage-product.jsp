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
        <jsp:useBean scope="page" id="d1" class="dao.paggingDAO"/>
        <c:set value="${d.getCategoryByID(cid)}" var="c"/>

        <jsp:include page="generalJsp/admin-header-sidebar.jsp" />
        <main class="mt-5 pt-4" id="home-section">
            <div class="container-fluid">

                <jsp:include page="generalJsp/admin-card.jsp" />

                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header" style="padding: 1.1rem 3rem;">
                                <span><i class="bi bi-table me-2"></i></span> Manage <strong>Product</strong>
                                <a href="add-product.jsp?cid=${cid}" class="btn btn-success float-end" style="border-radius: 20px; padding: 7px 20px;"><i class="bi bi-folder-plus" style="margin-right: 7px;"></i>Add New Product</a>
                            </div>
                            <div class="header-category">
                                <nav class="category-menu">
                                    <ul style="margin: 0;">
                                        <li><a href="manageProduct?cid=1"><i class="bi bi-laptop"></i>LAPTOP</a></i></li>
                                        <li><a href="manageProduct?cid=2"><i class="bi bi-phone-fill"></i>SMARTPHONE</a></i></li>
                                        <li><a href="manageProduct?cid=3"><i class="bi bi-camera-fill"></i>CAMERA</a></i></li>
                                    </ul>
                                </nav>
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
                                                <th style="text-align: left;">Product Name</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Price Discount</th>
                                                <th>Customer Rating</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listProduct}" var="o">
                                                <tr>
                                                    <td id="img"><img src="assets/images/products/${o.image1}"></td>
                                                    <td style="text-align: left;">${o.productName}</td>
                                                    <td class="${o.PQuantity <= 10 ? "text-warning":""}">${o.PQuantity}</td>
                                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.price}" type="currency"/></td>
                                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.priceDiscount}" type="currency"/></td>
                                                    <td>
                                                        <c:set var="s5" value="${d.countRating(o.productID, 5)}"/>
                                                        <c:set var="s4" value="${d.countRating(o.productID, 4)}"/>
                                                        <c:set var="s3" value="${d.countRating(o.productID, 3)}"/>
                                                        <c:set var="s2" value="${d.countRating(o.productID, 2)}"/>
                                                        <c:set var="s1" value="${d.countRating(o.productID, 1)}"/>

                                                        <c:if test="${s5 != 0 || s4 != 0 || s3 != 0 || s2 != 0 || s1 != 0}">
                                                            <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                            <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>
                                                            <div class="ratting">
                                                                <c:forEach begin="1" end="${rateS}">
                                                                    <i class="bi bi-star-fill"></i>
                                                                </c:forEach>
                                                                <c:forEach begin="${rateS + 1}" end="5">
                                                                    <i class="bi bi-star"></i>
                                                                </c:forEach>
                                                                <span style="margin-left: 4px;">(<c:out value="${d1.countAllFeedbackByPid(o.productID)}"/>)</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${s5 == 0 && s4 == 0 && s3 == 0 && s2 == 0 && s1 == 0}">
                                                            There are no reviews yet
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div id="action" style="display: flex; justify-content: center;">
                                                            <a href="manageProduct?action=view&pid=${o.productID}" class="edit" style="font-size: 24px; color: #FFC107;"><i class="bi bi-pencil-square" data-toggle="tooltip" title="Edit"></i></a>
                                                            <a href="#deleteProduct" data-bs-toggle="modal" class="delete" style="font-size: 22px; color: #F44336;"><i class="bi bi-trash" data-toggle="tooltip" title="Delete"></i></a>
                                                            <input type="hidden" name="pid" id="pid" value="${o.productID}">
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
                        <form action="manageProduct?action=deleteProduct" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure you want to delete this product?</p>
                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button class="btn btn-primary">Save changes</button>
                                    <input type="hidden" name="pid" id="pid">
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
                    var pid = $(this).parent().find('#pid').val();
                    $('#deleteProduct #pid').val(pid);
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
