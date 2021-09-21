<%-- 
    Document   : contact
    Created on : Mar 19, 2021, 12:18:34 PM
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
                            <h1>Contact Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="#">HOME</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div><!-- Page Banner Section End -->

            <!-- Contact Section Start -->
            <div class="contact-section section mt-90 mb-40">
                <div class="container">
                    <div class="row">

                        <!-- Contact Page Title -->
                        <div class="contact-page-title col mb-40">
                            <h1>Hi, Howdy <br>Let’s Connect us</h1>
                        </div>
                    </div>
                    <div class="row">

                        <!-- Contact Tab List -->
                        <div class="col-lg-4 col-12 mb-50">
                            <ul class="contact-tab-list nav">
                                <li><a class="active" data-toggle="tab" href="#contact-address">Contact us</a></li>
                                <li><a data-toggle="tab" href="#contact-form-tab">Leave us a message</a></li>
                                <li><a data-toggle="tab" href="#store-location">All Store location</a></li>
                            </ul>
                        </div>

                        <!-- Contact Tab Content -->
                        <div class="col-lg-8 col-12">
                            <div class="tab-content">

                                <!-- Contact Address Tab -->
                                <div class="tab-pane fade show active row d-flex" id="contact-address">

                                    <div class="col-lg-4 col-md-6 col-12 mb-50">
                                        <div class="contact-information">
                                            <h4>Address</h4>
                                            <p>You address will be here Lorem Ipsum text</p>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-12 mb-50">
                                        <div class="contact-information">
                                            <h4>Phone</h4>
                                            <p><a href="tel:01234567890">01234 567 890</a><a href="tel:01234567891">01234 567 891</a></p>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-12 mb-50">
                                        <div class="contact-information">
                                            <h4>Web</h4>
                                            <p><a href="mailto:info@example.com">info@example.com</a><a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                </div>

                                <!-- Contact Form Tab -->
                                <div class="tab-pane fade row d-flex" id="contact-form-tab">
                                    <div class="col">

                                        <form id="contact-form" action="" method="post" class="contact-form mb-50">
                                            <div class="row">
                                                <div class="col-md-6 col-12 mb-25">
                                                    <label for="first_name">First Name*</label>
                                                    <input id="first_name" type="text" name="first_name">
                                                </div>
                                                <div class="col-md-6 col-12 mb-25">
                                                    <label for="last_name">Last Name*</label>
                                                    <input id="last_name" type="text" name="last_name">
                                                </div>
                                                <div class="col-md-6 col-12 mb-25">
                                                    <label for="email_address">Email*</label>
                                                    <input id="email_address" type="email" name="email_address">
                                                </div>
                                                <div class="col-md-6 col-12 mb-25">
                                                    <label for="phone_number">Phone</label>
                                                    <input id="phone_number" type="text" name="phone_number">
                                                </div>
                                                <div class="col-12 mb-25">
                                                    <label for="message">Message*</label>
                                                    <textarea id="message" name="message"></textarea>
                                                </div>
                                                <div class="col-12">
                                                    <input type="submit" value="SEND NOW">
                                                </div>
                                            </div>
                                        </form>
                                        <p class="form-messege"></p>

                                    </div>
                                </div>

                                <!-- Contact Stores Tab -->
                                <div class="tab-pane fade row d-flex" id="store-location">

                                    <div class="col-md-6 col-12 mb-50">
                                        <div class="single-store">
                                            <h3>E&E Australia</h3>
                                            <p>You address will be here Lorem Ipsum is simply dummy text.</p>
                                            <p><a href="tel:01234567890">01234 567 890</a> / <a href="tel:01234567891">01234 567 891</a></p>
                                            <p><a href="mailto:info@example.com">info@example.com</a> / <a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-12 mb-50">
                                        <div class="single-store">
                                            <h3>E&E England</h3>
                                            <p>You address will be here Lorem Ipsum is simply dummy text.</p>
                                            <p><a href="tel:01234567890">01234 567 890</a> / <a href="tel:01234567891">01234 567 891</a></p>
                                            <p><a href="mailto:info@example.com">info@example.com</a> / <a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-12 mb-50">
                                        <div class="single-store">
                                            <h3>E&E Germany</h3>
                                            <p>You address will be here Lorem Ipsum is simply dummy text.</p>
                                            <p><a href="tel:01234567890">01234 567 890</a> / <a href="tel:01234567891">01234 567 891</a></p>
                                            <p><a href="mailto:info@example.com">info@example.com</a> / <a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-12 mb-50">
                                        <div class="single-store">
                                            <h3>E&E France</h3>
                                            <p>You address will be here Lorem Ipsum is simply dummy text.</p>
                                            <p><a href="tel:01234567890">01234 567 890</a> / <a href="tel:01234567891">01234 567 891</a></p>
                                            <p><a href="mailto:info@example.com">info@example.com</a> / <a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-12 mb-50">
                                        <div class="single-store">
                                            <h3>E&E Canada</h3>
                                            <p>You address will be here Lorem Ipsum is simply dummy text.</p>
                                            <p><a href="tel:01234567890">01234 567 890</a> / <a href="tel:01234567891">01234 567 891</a></p>
                                            <p><a href="mailto:info@example.com">info@example.com</a> / <a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-12 mb-50">
                                        <div class="single-store">
                                            <h3>E&E Denmark</h3>
                                            <p>You address will be here Lorem Ipsum is simply dummy text.</p>
                                            <p><a href="tel:01234567890">01234 567 890</a> / <a href="tel:01234567891">01234 567 891</a></p>
                                            <p><a href="mailto:info@example.com">info@example.com</a> / <a href="#">www.example.com</a></p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Contact Section End -->

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
