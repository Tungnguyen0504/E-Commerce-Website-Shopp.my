<%-- 
    Document   : register
    Created on : Feb 22, 2021, 2:40:26 AM
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

        <style>
            .ee-register form input {
                line-height: 16px;
            }
            #register-btn {
                padding-bottom: 50px;
            }
            #warning {
                max-width: 9%;
            }
        </style>

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
                            <h1>Change Password Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="change-password.jsp">My Account</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div><!-- Page Banner Section End -->

            <!-- Register Section Start -->
            <div class="register-section section mt-90 mb-90">
                <div class="container">
                    <div class="row">
                        <h3>We will need for your registration</h3>
                        <p>E&E provide how all this mistaken idea of denouncing pleasure and sing pain born an will give you a complete account of the system, and expound</p>

                        <!-- Register -->
                        <div class="col-md-6 col-12 d-flex">
                            <div class="ee-register">

                                <!-- Register Form -->
                                <form action="myAccount?action=changePass" method="post">
                                    <div class="row">
                                        <div class="col-12 mb-30">
                                            <label>User Name</label>
                                            <input type="text" class="form-control" name="userName" value="${view.userName}" readonly >
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Current Password</label>
                                        <input type="password" class="form-control" name="currentPass" required>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>New Password</label>
                                        <input type="password" id="newPassword" class="form-control" name="newPass" required>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Confirm password</label>
                                        <input type="password" id="confirmPassword" class="form-control" name="rePass" required>
                                    </div>
                                    <div class="col-12" id="register-btn"><input type="submit" value="confirm"></div>
                                    <p id="mess">
                                        ${mess}
                                        ${error}
                                    </p>
                                </div>
                            </form>


                        </div>
                    </div>

                    <div class="col-md-1 col-12 d-flex">

                        <div class="login-reg-vertical-boder"></div>

                    </div>

                    <!-- Account Image -->
                    <div class="col-md-5 col-12 d-flex">

                        <div class="ee-account-image">
                            <h3>Upload your Image</h3>
                            <img src="assets/images/user/account-image-placeholder.jpg" alt="Account Image Placeholder" class="image-placeholder">

                            <div class="account-image-upload">
                                <input type="file" name="chooseFile" id="account-image-upload">
                                <label class="account-image-label" for="account-image-upload">Choose your image</label>
                            </div>

                            <p>jpEG 250x250</p>

                        </div>

                    </div>

                </div>
            </div>
        </div><!-- Register Section End -->

        <jsp:include page="footer.jsp"></jsp:include>

    </script>-->
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
