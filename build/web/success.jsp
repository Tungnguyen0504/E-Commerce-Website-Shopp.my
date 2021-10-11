<%-- 
    Document   : success
    Created on : Mar 21, 2021, 5:32:23 PM
    Author     : tungn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Snippet - BBBootstrap</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <style>
            body {
                background-color: #000
            }

            .padding {
                padding: 2rem !important
            }

            .card {
                margin-bottom: 30px;
                border: none;
                -webkit-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
                -moz-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
                box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22)
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid #e6e6f2
            }

            h3 {
                font-size: 20px
            }

            h5 {
                font-size: 15px;
                line-height: 26px;
                color: #3d405c;
                margin: 0px 0px 15px 0px;
                font-family: 'Circular Std Medium'
            }

            .text-dark {
                color: #3d405c !important
            }
            .table td, .table th {
                vertical-align: middle;
            }
            #img {
                width: 75px;
            }
            .btn-primary {
                color: #fff;
                background: #03A9F4;
                font-size: 17px;
                font-family: auto;
                line-height: 16px;
                float: right;
                position: absolute;
                bottom: 8px;
                right: 10px;
            }
        </style>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript'></script>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
            <div class="card">
                <div class="card-header p-4">
                    <a class="pt-2 d-inline-block" href="home" data-abc="true">e&e.com</a>
                    <div class="float-right">
                        <h3 class="mb-0">Invoice #BBB10234</h3>
                        Date: 12 Jun,2021
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-sm-2">
                            <h5 class="mb-2" style="font-size: 20px;">Customer:</h5>

                        </div>
                        <div class="col-sm-7">
                            <h3 class="text-dark mb-1">${sessionScope.acc.fullName}</h3>
                            <div>${sessionScope.acc.address}</div>
                            <div>Email: ${sessionScope.acc.email}</div>
                            <div>Phone: +${sessionScope.acc.telephone}</div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Description</th>
                                    <th>Color</th>
                                    <th class="right">Price</th>
                                    <th class="right">Price Discount</th>
                                    <th class="center">Qty</th>
                                    <th class="right">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="s" value="0"></c:set>
                                <c:forEach var="o" items="${sessionScope.cart}">
                                    <c:set var="s" value="${s + o.p.priceDiscount * o.quantity}"></c:set>
                                        <tr>
                                            <td class="left strong"><img id="img" src="assets/images/products/${o.p.image1}"</td>
                                        <td class="left" style="width: 35%;">${o.p.productName}</td>
                                        <td class="left" >${o.p.color}</td>
                                        <td class="right">$${o.p.price}</td>
                                        <td class="right">$${o.p.priceDiscount}</td>
                                        <td class="center">${o.quantity}</td>
                                        <td class="right"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${o.p.priceDiscount * o.quantity}" type="currency"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        </div>
                        <div class="col-md-6 ml-auto">
                            <table class="table table-clear">
                                <tbody>
                                    <c:if test="${sessionScope.coupon != null}">
                                        <c:set value="${sessionScope.coupon.discountPercent}" var="discount"/>
                                    </c:if>
                                    <c:if test="${sessionScope.coupon == null}">
                                        <c:set value="${0}" var="discount"/>
                                    </c:if>

                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Sub total</strong>
                                        </td>
                                        <td class="right"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s}" type="currency"/></td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Discount</strong>
                                        </td>
                                        <td class="right"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s*discount/100}" type="currency"/></td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Shipping Cost</strong>
                                        </td>
                                        <td class="right">$00.00</td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark" style="font-size: 24px; color: red !important;">Grand Total</strong>
                                        </td>
                                        <td class="right" style="font-size: 24px; color: mediumblue;"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${s-s*discount/100}" type="currency"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white">
                    <p class="mb-0">e&e.com, Sounth Block, New delhi, 110034</p>
                    <a href="success" class="btn btn-primary"><i class="fas fa-shopping-cart" style="font-size: 18px; margin-right: 4px;"></i><span>Continue Shopping</span></a>
                </div>
            </div>
        </div>
    </body>
</html>
