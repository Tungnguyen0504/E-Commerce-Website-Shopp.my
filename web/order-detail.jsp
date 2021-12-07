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
        <link href="assets/css/admin/progress-wizard.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <link href="assets/css/admin.css" rel="stylesheet" type="text/css"/>
        <style>
            /* A totally custom override */

            .progress-indicator.custom-complex {
                background-color: #f1f1f1;
                padding: 10px 5px;
                border: 1px solid #ddd;
                border-radius: 10px;
            }
            .progress-indicator.custom-complex > li .bubble {
                height: 12px;
                width: 99%;
                border-radius: 2px;
                box-shadow: inset -5px 0 12px rgba(0, 0, 0, 0.2);
            }
            .progress-indicator.custom-complex > li .bubble:before,
            .progress-indicator.custom-complex > li .bubble:after {
                display: none;
            }

            /* Demo for vertical bars */
            .progress-indicator.stacked .stacked-text {
                margin-left: 80%!important;
                width: 100%!important;
                top: -15px;
            }
            .progress-indicator.stepped.stacked {
                width: 48%;
                display: inline-block;
            }
            .progress-indicator.stepped.stacked > li {
                height: 150px;
            }
            .progress-indicator.stepped.stacked > li .bubble {
                padding: 0.1em;
            }
            .progress-indicator.stepped.stacked > li:first-of-type .bubble {
                padding: 0.5em;
            }
            .progress-indicator.stepped.stacked > li:last-of-type .bubble {
                padding: 0em;
            }
            .progress-indicator.stacked>li {
                text-indent: 0;
            }
            .progress-indicator.stacked>li .bubble:after, 
            .progress-indicator.stacked>li .bubble:before {
                margin-left: -4.5px;
                width: 9px;
            }
            .progress-indicator>li .bubble {
                width: 35px;
                height: 35px;
            }

            /* Nocenter */

            .progress-indicator.nocenter.stacked > li {
                min-height: 100px;
            }
            .progress-indicator.nocenter.stacked > li span {
                display: block;
            }

            /* Demo for Timeline vertical bars */

            #timeline-speaker-example {
                background-color: #2b4a6d;
                color: white;
                padding: 1em 2em;
                text-align: center;
                border-radius: 10px;
            }
            #timeline-speaker-example .progress-indicator {
                width: 100%;
            }
            #timeline-speaker-example .bubble {
                padding: 0;
            }
            #timeline-speaker-example .progress-indicator > li {
                color: white;
            }
            #timeline-speaker-example .time {
                position: relative;
                left: -80px;
                top: 30px;
                font-size: 130%;
                text-align: right;
                opacity: 0.6;
                font-weight: 100;
            }
            #timeline-speaker-example .current-time .time {
                font-size: 170%;
                opacity: 1;
            }
            #timeline-speaker-example .stacked-text {
                top: -37px;
                left: -50px;
            }
            #timeline-speaker-example .subdued {
                font-size: 10px;
                display: block;
            }
            #timeline-speaker-example > li:hover {
                color: #ff3d54;
            }
            #timeline-speaker-example > li:hover .bubble,
            #timeline-speaker-example > li:hover .bubble:before,
            #timeline-speaker-example > li:hover .bubble:after {
                background-color: #ff3d54;
            }
            #timeline-speaker-example .current-time .sub-info {
                font-size: 60%;
                line-height: 0.2em;
                text-transform: capitalize;
                color: #6988be;
            }
            @media handheld, screen and (max-width: 400px) {
                .container {
                    margin: 0;
                    width: 100%;
                }
                .progress-indicator.stacked {
                    display: block;
                    width: 100%;
                }
                .progress-indicator.stacked > li {
                    height: 80px;
                }
            }
            .progress-indicator i {
                position: absolute;
                z-index: 1;
                font-size: 22px;
                color: #fff;
                left: 50%;
                top: 12%;
                transform: translate(-50%, -50%);
            }
            .icon-content .icon {
                width: 50px;
                height: 50px;
                padding: 0;
            }

            .icon-content {
                padding-bottom: 20px;
                width: 180px;
                align-items: center;
            }

            @media screen and (max-width: 992px) {
                .icon-content {
                    width: 50%
                }
            }

            /*informatio*/
            .information div {
                margin-bottom: 20px;
            }
            .info-left {
                width: 120px;
            }
            .info-right {
                border-bottom: 1px solid #cfd1d8;
            }

            .progress-indicator>li.warning, 
            .progress-indicator>li.warning .bubble {
                color: #edb10a;
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
                    <div class="col-md-12 mb-3 row">
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-header" style="padding: 1.1rem 3rem;">
                                    <span><i class="bi bi-table me-2"></i></span> Order <strong>Detail</strong>
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
                                                    <th>Product Image</th>
                                                    <th>Product Name</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="s" value="0"/>
                                                <c:forEach items="${listOrderDetail}" var="od">
                                                    <c:set value="${d.findOrder(od.orderID)}" var="o"/>
                                                    <c:set value="${d.findAccount(o.userID)}" var="u"/>
                                                    <c:set value="${d.getProductByID(od.productID)}" var="p"/>
                                                    <tr>
                                                        <td>${od.orderDetailID}</td>
                                                        <td id="img" style="width: 150px">
                                                            <img src="assets/images/products/${p.image1}">
                                                        </td>
                                                        <td class="text-start" style="max-width: 250px;">${p.productName}</td>
                                                        <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${p.priceDiscount}" type="currency"/></td>
                                                        <td>${od.odQuantity}</td>
                                                        <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${od.subTotal}" type="currency"/></td>
                                                    </tr>
                                                    <c:set value="${s + od.subTotal}" var="s"/>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <th colspan="5" class="text-end">Total: </th>
                                            <th colspan="1"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.total}" type="currency"/></th>
                                            </tfoot>
                                            <tfoot>
                                            <th colspan="5" class="text-end">Discount: </th>
                                            <th colspan="1"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s-o.total}" type="currency"/></th>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <ul class="progress-indicator stepped stacked">
                                <li class="${order.billStatus != 0 ? "completed":"completed warning"}">
                                    <i class="${order.billStatus != 0 ? "fas fa-check":"fas fa-sync-alt"}"></i>
                                    <span class="bubble"></span>
                                    <span class="stacked-text">
                                        <div class="row d-flex icon-content"> 
                                            <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                                            <div class="d-flex flex-column" style="width: fit-content;">
                                                <p class="mb-0 lh-base fs-6" style="font-weight: 600;">Order<br>Processed</p>
                                            </div>
                                        </div>
                                    </span>
                                </li>
                                <li class="${order.billStatus == 1 ? "completed warning": (order.billStatus == 2 || order.billStatus == 3 || order.billStatus == -1 ? "completed":"")}">
                                    <i class="${order.billStatus == 1 ? "fas fa-sync-alt": (order.billStatus == 2 || order.billStatus == 3 || order.billStatus == -1 ? "fas fa-check":"far fa-hourglass")}"></i>
                                    <span class="bubble"></span>
                                    <span class="stacked-text">
                                        <div class="row d-flex icon-content subdued"> 
                                            <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                                            <div class="d-flex flex-column" style="width: fit-content;">
                                                <p class="mb-0 lh-base fs-6" style="font-weight: 600;">Order<br>Shipped</p>
                                            </div>
                                        </div>
                                    </span>
                                </li>
                                <li class="${order.billStatus == 2 ? "completed warning": (order.billStatus == 3 || order.billStatus == -1 ? "completed":"")}">
                                    <i class="${order.billStatus == 2 ? "fas fa-sync-alt": (order.billStatus == 3 || order.billStatus == -1 ? "fas fa-check":"far fa-hourglass")}"></i>
                                    <span class="bubble"></span>
                                    <span class="stacked-text">
                                        <div class="row d-flex icon-content subdued"> 
                                            <img class="icon" src="https://i.imgur.com/TkPm63y.png">
                                            <div class="d-flex flex-column" style="width: fit-content;">
                                                <p class="mb-0 lh-base fs-6" style="font-weight: 600;">On the <br>Way</p>
                                            </div>
                                        </div>
                                    </span>
                                </li>
                                <c:if test="${order.billStatus != -1}">
                                <li class="${order.billStatus == 3 ? "completed":""}">
                                    <i class="${order.billStatus == 3 ? "fas fa-check":"far fa-hourglass"}"></i>
                                    <span class="bubble"></span>
                                    <span class="stacked-text">
                                        <div class="row d-flex icon-content subdued"> 
                                            <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                                            <div class="d-flex flex-column" style="width: fit-content;">
                                                <p class="mb-0 lh-base fs-6" style="font-weight: 600;">Order<br>Arrived</p>
                                            </div>
                                        </div>
                                    </span>
                                </li>
                                </c:if>
                                <c:if test="${order.billStatus == -1}">
                                <li class="${order.billStatus == -1 ? "":"completed warning"}">
                                    <i class="${order.billStatus == -1 ? "fas fa-times":"far fa-hourglass"}"></i>
                                    <span class="bubble"></span>
                                    <span class="stacked-text">
                                        <div class="row d-flex icon-content subdued"> 
                                            <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                                            <div class="d-flex flex-column" style="width: fit-content;">
                                                <p class="mb-0 lh-base fs-6" style="font-weight: 600;">Order<br>Canceled</p>
                                            </div>
                                        </div>
                                    </span>
                                </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="row information" style="padding: 0 50px;">
                            <div class="col-12" style="margin-top: 40px;">
                                <h3 class="ms-5">Information Client: </h3>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">Username: </label>
                                <label class="info-right">${user.userName} </label>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">Password: </label>
                                <label class="info-right">${user.password} </label>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">Full Name: </label>
                                <label class="info-right">${user.fullName} </label>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">Email: </label>
                                <label class="info-right">${user.email} </label>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">Address: </label>
                                <label class="info-right">${user.address} </label>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">City: </label>
                                <label class="info-right">${user.city} </label>
                            </div>
                            <div class="col-md-6 d-flex">
                                <label class="info-left text-start">Telephone: </label>
                                <label class="info-right">${user.telephone} </label>
                            </div>
                        </div>
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
                $('#table-data').DataTable({
                    lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    columnDefs: [
                        {orderable: false, targets: [1]}
                    ]
                });
            });
        </script>
    </body>
</html>
