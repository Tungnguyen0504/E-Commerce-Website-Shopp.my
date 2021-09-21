<%-- 
    Document   : footer
    Created on : Apr 1, 2021, 5:37:11 PM
    Author     : tungn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Brands Section Start -->
        <div class="brands-section section mb-90">
            <div class="container">
                <div class="row">

                    <!-- Brand Slider Start -->
                    <div class="brand-slider col">
                        <div class="brand-item col"><img src="assets/images/brands/brand-1.png" alt="Brands"></div>
                        <div class="brand-item col"><img src="assets/images/brands/brand-2.png" alt="Brands"></div>
                        <div class="brand-item col"><img src="assets/images/brands/brand-3.png" alt="Brands"></div>
                        <div class="brand-item col"><img src="assets/images/brands/brand-4.png" alt="Brands"></div>
                        <div class="brand-item col"><img src="assets/images/brands/brand-5.png" alt="Brands"></div>
                    </div><!-- Brand Slider End -->

                </div>
            </div>
        </div><!-- Brands Section End -->

        <!-- Subscribe Section Start -->
        <div class="subscribe-section section bg-gray pt-55 pb-55">
            <div class="container">
                <div class="row align-items-center">

                    <!-- Mailchimp Subscribe Content Start -->
                    <div class="col-lg-6 col-12 mb-15 mt-15">
                        <div class="subscribe-content">
                            <h2>SUBSCRIBE <span>OUR NEWSLETTER</span></h2>
                            <h2><span>TO GET LATEST</span> PRODUCT UPDATE</h2>
                        </div>
                    </div><!-- Mailchimp Subscribe Content End -->


                    <!-- Mailchimp Subscribe Form Start -->
                    <div class="col-lg-6 col-12 mb-15 mt-15">

                        <form class="subscribe-form" action="email" method="post">
                            <input type="email" autocomplete="off" name="email" placeholder="Enter your email here" />
                            <button >subscribe</button>
                        </form>
                        <!-- mailchimp-alerts Start -->
                        <div class="mailchimp-alerts text-centre">
                            <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                            <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                            <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                        </div><!-- mailchimp-alerts end -->

                    </div><!-- Mailchimp Subscribe Form End -->

                </div>
            </div>
        </div><!-- Subscribe Section End -->
        <!-- Footer Section Start -->
        <div class="footer-section section bg-ivory">

            <!-- Footer Top Section Start -->
            <div class="footer-top-section section pt-90 pb-50">
                <div class="container">

                    <div class="row">

                        <!-- Footer Widget Start -->
                        <div class="col-lg-3 col-md-6 col-12 mb-40">
                            <div class="footer-widget">

                                <h4 class="widget-title">CONTACT INFO</h4>

                                <p class="contact-info">
                                    <span>Address</span>
                                    FU-Hoa Lac <br>
                                </p>

                                <p class="contact-info">
                                    <span>Phone</span>
                                    <a href="tel:01234567890">01234 567 890</a>
                                    <a href="tel:01234567891">01234 567 891</a>
                                </p>

                                <p class="contact-info">
                                    <span>Web</span>
                                    <a href="#">tungndhe141593@fpt.edu.com</a>
                                    <a href="home">www.e&e.com</a>
                                </p>

                            </div>
                        </div><!-- Footer Widget End -->

                        <!-- Footer Widget Start -->
                        <div class="col-lg-3 col-md-6 col-12 mb-40">
                            <div class="footer-widget">

                                <h4 class="widget-title">CUSTOMER CARE</h4>

                                <ul class="link-widget">
                                    <li><a href="about-us.jsp">About us</a></li>
                                    <li><a href="manageAccount">My Account</a></li>
                                    <li><a href="blog.jsp">blog</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                </ul>

                            </div>
                        </div><!-- Footer Widget End -->

                        <!-- Footer Widget Start -->
                        <div class="col-lg-3 col-md-6 col-12 mb-40">
                            <div class="footer-widget">

                                <h4 class="widget-title">INFORMATION</h4>

                                <ul class="link-widget">
                                    <li><a href="track-order.jsp">Track your order</a></li>
                                    <li><a href="locale-store.jsp">Locate Store</a></li>
                                    <li><a href="term-conditions">Terms & Conditions</a></li>
                                    <li><a href="#">Special coupon</a></li>
                                </ul>

                            </div>
                        </div><!-- Footer Widget End -->

                        <!-- Footer Widget Start -->
                        <div class="col-lg-3 col-md-6 col-12 mb-40">
                            <div class="footer-widget">

                                <h4 class="widget-title">LATEST TWEET</h4>

                                <div class="footer-tweet"></div>

                            </div>
                        </div><!-- Footer Widget End -->

                    </div>

                </div>
            </div><!-- Footer Bottom Section Start -->

            <!-- Footer Bottom Section Start -->
            <div class="footer-bottom-section section">
                <div class="container">
                    <div class="row">

                        <!-- Footer Copyright -->
                        <div class="col-lg-6 col-12">
                            <div class="footer-copyright"><p>&copy; Copyright, 2018 All Rights Reserved by <a href="https://freethemescloud.com/">Free themes Cloud</a></p></div>
                        </div>

                        <!-- Footer Payment Support -->
                        <div class="col-lg-6 col-12">
                            <div class="footer-payments-image"><img src="assets/images/payment-support.png" alt="Payment Support Image"></div>
                        </div>

                    </div>
                </div>
            </div><!-- Footer Bottom Section Start -->

        </div><!-- Footer Section End -->

    </body>
</html>
