<%-- 
    Document   : admin
    Created on : Oct 1, 2021, 9:24:46 AM
    Author     : tungn
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="model.Order"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="dao.paggingDAO"%>
<%@page import="model.Products"%>
<%@page import="dao.AllDao"%>
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
            body {
                background: #eee
            }

            .ratings i {
                font-size: 13px;
                color: red
            }

            .strike-text {
                color: red;
                text-decoration: line-through
            }

            .product-image {
                width: 70%
            }

            .dot {
                height: 7px;
                width: 7px;
                margin-left: 6px;
                margin-right: 6px;
                margin-top: 3px;
                background-color: blue;
                border-radius: 50%;
                display: inline-block
            }

            .spec-1 {
                color: #938787;
                font-size: 15px
            }

            h5 {
                font-weight: 400
            }

            .para {
                font-size: 16px
            }

            /*best seller*/
            .name-pro {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            /*order table*/
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
        <%
            paggingDAO dao = new paggingDAO();
            int countLap, countSp, countCam;
            countLap = countSp = countCam = 0;
            for (Products p : dao.getAllProductByCid(1)) {
                countLap++;
            }
            for (Products p : dao.getAllProductByCid(2)) {
                countSp++;
            }
            for (Products p : dao.getAllProductByCid(3)) {
                countCam++;
            }
            request.setAttribute("countLap", countLap);
            request.setAttribute("countSp", countSp);
            request.setAttribute("countCam", countCam);
        %>

        <%
            AllDao dao1 = new AllDao();

            request.setAttribute("b1", dao1.earnMonthly(0));
            request.setAttribute("b2", dao1.earnMonthly(30));
            request.setAttribute("b3", dao1.earnMonthly(60));
            request.setAttribute("b4", dao1.earnMonthly(90));
            request.setAttribute("b5", dao1.earnMonthly(120));
            request.setAttribute("b6", dao1.earnMonthly(150));
            request.setAttribute("b7", dao1.earnMonthly(180));
            request.setAttribute("b8", dao1.earnMonthly(210));
            request.setAttribute("b9", dao1.earnMonthly(240));
            request.setAttribute("b10", dao1.earnMonthly(270));
            request.setAttribute("b11", dao1.earnMonthly(300));
            request.setAttribute("b12", dao1.earnMonthly(330));

            request.setAttribute("m1", dao1.monthFromNow(-11));
            request.setAttribute("m2", dao1.monthFromNow(-10));
            request.setAttribute("m3", dao1.monthFromNow(-9));
            request.setAttribute("m4", dao1.monthFromNow(-8));
            request.setAttribute("m5", dao1.monthFromNow(-7));
            request.setAttribute("m6", dao1.monthFromNow(-6));
            request.setAttribute("m7", dao1.monthFromNow(-5));
            request.setAttribute("m8", dao1.monthFromNow(-4));
            request.setAttribute("m9", dao1.monthFromNow(-3));
            request.setAttribute("m10", dao1.monthFromNow(-2));
            request.setAttribute("m11", dao1.monthFromNow(-1));
            request.setAttribute("m12", dao1.monthFromNow(0));
        %> 

        <jsp:include page="generalJsp/admin-header-sidebar.jsp" />
        <main class="mt-5 pt-4" id="home-section">
            <div class="container-fluid">

                <jsp:include page="generalJsp/admin-card.jsp" />

                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-8 mb-3">
                        <div class="card h-100 shadow">
                            <div class="card-header">
                                <span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
                                Earning Summary
                            </div>
                            <div class="card-body">
                                <div id="chart1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card h-100 shadow">
                            <div class="card-header">
                                <span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
                                Total Products
                            </div>
                            <div class="card-body">
                                <div id="chart2" style="margin-top: 50px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-4 col-sm-12">
                        <!-- TOP PRODUCT -->
                        <div class="card shadow rounded-3">
                            <div class="card-body shadow">
                                <c:forEach items="${list1}" var="o">
                                    <div class="d-flex p-2 bg-white rounded">
                                        <div class="col-md-3 mt-1"><img class="img-fluid img-responsive rounded product-image" src="assets/images/products/${o.image1}"></div>
                                        <div class="col-md-6 mt-1 p-0">
                                            <h6 class="name-pro mb-1">${o.productName}</h6>
                                            <c:set value="${d.getCategoryByID(o.categoryID)}" var="c"/>
                                            <p class="mb-1">${c.categoryName}</p>


                                            <div class="d-flex flex-row">
                                                <c:set var="s5" value="${d.countRating(o.productID, 5)}"/>
                                                <c:set var="s4" value="${d.countRating(o.productID, 4)}"/>
                                                <c:set var="s3" value="${d.countRating(o.productID, 3)}"/>
                                                <c:set var="s2" value="${d.countRating(o.productID, 2)}"/>
                                                <c:set var="s1" value="${d.countRating(o.productID, 1)}"/>

                                                <c:if test="${s5 != 0 || s4 != 0 || s3 != 0 || s2 != 0 || s1 != 0}">
                                                    <c:set var="rate" value="${(s5*5+s4*4+s3*3+s2*2+s1*1)/(s5+s4+s3+s2+s1)}"/>
                                                    <fmt:formatNumber var="rateS" maxFractionDigits="0" value="${rate}"/>
                                                    <div class="ratings mr-2">
                                                        <c:forEach begin="1" end="${rateS}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="${rateS + 1}" end="5">
                                                            <i class="far fa-star"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <span class="ms-2" style="padding-top: 1px;">310</span>
                                                </c:if>

                                            </div>
                                        </div>
                                        <div class="align-items-center align-content-center col-md-3 border-left mt-1 p-0" style="padding-left: 7px !important;">
                                            <h6 class="text-success">Total Sales</h6>
                                            <div class="d-flex flex-row align-items-center">
                                                <h6 class="mr-1"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.priceDiscount}" type="currency"/></h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- TOP PRODUCT -->
                    </div>
                    <div class="col-md-8 col-sm-12">
                        <div class="card shadow">
                            <div class="card-header" style="padding: .7rem 3rem">
                                <span><i class="bi bi-table me-2"></i></span> Recent <strong>Orders</strong>
                                <div class="float-end" style="cursor: pointer;" onclick="window.location.assign('manageBill')">
                                    <span class="fs-6">See All</span>
                                    <i class="fas fa-angle-double-right fs-6"></i>
                                </div>
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
                                                <th>Order Date</th>
                                                <th>Delivery Method</th>
                                                <th>Order Status</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list2}" var="o">
                                                <c:set value="${d.findAccount(o.userID)}" var="u"/>
                                                <tr>
                                                    <td>${o.orderID}</td>
                                                    <td class="text-start"><img class="rounded-circle" src="assets/images/user/${u.image}" style="width: 40px; margin-right: 18px; margin-left: 35px;">${u.userName}</td>
                                                    <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${o.orderDate}" /></p></td>
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
                                                    <td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.total}" type="currency"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="assets/js/admin.js" type="text/javascript"></script>
        <script>
            var options = {
                series: [{
                        name: "Music",
                        data: [${b1}, ${b2}, ${b3}, ${b4}, ${b5}, ${b6}, ${b7}, ${b8}, ${b9}, ${b10}, ${b11}, ${b12}]
                    }
                ],
                title: {
                    text: 'Earning',
                    align: 'left',
                    offsetY: 10,
                    offsetX: 20,
                },
                chart: {
                    height: 350,
                    type: 'area',
                    zoom: {
                        enabled: false
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'smooth'
                },
                grid: {
                    show: true,
                    padding: {
                        bottom: 0
                    }
                },
                markers: {
                    size: 5,
                    strokeWidth: 0,
                    hover: {
                        size: 6
                    }
                },
                colors: ['#6283e3'],
                xaxis: {
                    type: 'string',
                    categories: ["${m1}", "${m2}", "${m3}", "${m4}", "${m5}", "${m6}", "${m7}", "${m8}", "${m9}", "${m10}", "${m11}", "${m12}"]
                },
                tooltip: {
                    y: {
                        formatter: function (series) {
                            return '$' + series;
                        }
                    }
                },
            };
            var chart = new ApexCharts(document.querySelector("#chart1"), options);
            chart.render();
            var options = {
                series: [${countLap}, ${countSp}, ${countCam}],
                labels: ['Laptop', 'Smartphone', 'Camera'],
                plotOptions: {
                    pie: {
                        startAngle: 0,
                        endAngle: 360,
                        expandOnClick: false,
                        offsetX: 0,
                        offsetY: 0,
                        customScale: 1,
                        dataLabels: {
                            offset: 0,
                            minAngleToShowLabel: 10
                        },
                        donut: {
                            size: '65%',
                            background: 'transparent',
                            labels: {
                                show: true,
                                name: {
                                    show: true,
                                    fontSize: '22px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 600,
                                    color: undefined,
                                    offsetY: -10,
                                },
                                value: {
                                    show: true,
                                    fontSize: '22px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 400,
                                    color: undefined,
                                    offsetY: 16,
                                },
                                total: {
                                    show: true,
                                    showAlways: true,
                                    label: 'Total',
                                    fontSize: '22px',
                                    fontFamily: 'Helvetica, Arial, sans-serif',
                                    fontWeight: 600,
                                    color: '#373d3f',
                                }
                            }
                        },
                    }
                },
                chart: {
                    type: 'donut',
                },

                responsive: [{
                        breakpoint: 480,
                        options: {
                            chart: {
                                width: 200
                            },
                            legend: {
                                position: 'bottom'
                            }
                        }
                    }]
            };
            var chart = new ApexCharts(document.querySelector("#chart2"), options);
            chart.render();
        </script>
    </body>
</html>
