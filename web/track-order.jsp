<%-- 
    Document   : track-order
    Created on : Apr 1, 2021, 4:03:18 PM
    Author     : tungn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>E&E - Electronics eCommerce Bootstrap4 HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

        <!-- CSS
            ============================================ -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Icon Font CSS -->
        <link rel="stylesheet" href="assets/css/icon-font.min.css">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Modernizer JS -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Page Banner Section Start -->
            <div class="page-banner-section section">
                <div class="page-banner-wrap row row-0 d-flex align-items-center ">

                    <!-- Page Banner -->
                    <div class="col-lg col-12 order-lg-2 d-flex align-items-center justify-content-center">
                        <div class="page-banner">
                            <h1>Track your order page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="#">Track your order</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div><!-- Page Banner Section End -->

            <!-- Track Order Section Start -->
            <div class="track-order-section section mt-90 mb-50">
                <div class="container">
                    <div class="row align-items-center">

                        <div class="track-order-title text-center col-12 mb-80">
                            <h2>Track your order...</h2>
                            <p>To track your order please enter your Order ID in the box below and press the “Track” button. This was give to you on your receipt and in the confirmation email you should have reveived</p>
                        </div>

                        <div class="col-lg-6 col-md-7 col-12 mb-40">
                            <div class="track-order-form">
                                <form action="#">
                                    <label for="order_id">Order ID</label>
                                    <input type="text" id="order_id" placeholder="Find it in your order confirmation email">
                                    <label for="billing_email">Billing Email Address</label>
                                    <input type="email" id="billing_email" placeholder="Email you used during checkout">

                                    <input type="submit" value="Track Order">
                                </form>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-5 col-12 ml-auto mb-40">
                            <div class="banner"><a href="#"><img src="assets/images/banner/banner-33.jpg" alt="Banner"></a></div>
                        </div>

                    </div>
                </div>
            </div><!-- Track Order Section End -->

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery JS -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- Popper JS -->
        <script src="assets/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
