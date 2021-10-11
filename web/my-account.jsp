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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

        <style>
            .ee-register form input {
                line-height: 16px;
            }
            #register-btn {
                padding-bottom: 50px;
            }
            .file-caption-name {
                height: 38px;
            }
            .file-footer-caption {
                display: none;
            }
            .krajee-default .file-footer-caption {
                display: none;
            }
            .file-preview {
                margin: auto;
                margin-bottom: 10px;
            }
            .file-caption {
                margin: auto;
            }
            .file-drop-zone {
                border: 0;
                height: 200px;
                min-height: 200px;
                margin: 0;

            }
            .file-drop-zone-title {
                padding: 81px 10px;
                max-height: 200px;
            }
            .file-drop-zone .file-preview-thumbnails {
                margin-bottom: 0;
            }
            .krajee-default.file-preview-frame {
                width: 100%;
                height: 100%;
                margin: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            .krajee-default.file-preview-frame .kv-file-content {
                margin-bottom: 0;
            }
            .file-preview-image {
                max-width: 420px !important;
                max-height: 210px !important;
                width: auto !important;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
            }
            .file-preview .fileinput-remove {
                z-index: 1;
            }
            .label-image {
                text-align: center;
            }
            .label-image label {
                margin-bottom: 4px;
                font-size: 24px;
                font-weight: 500;
            }
            .form-action {
                margin-bottom: 30px;
                padding: 0 50px;
            }
            .form-group {
                align-items: center;
            }
            .input-name {
                width: 180px;
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
                            <h1>My Account Page</h1>
                            <div class="breadcrumb">
                                <ul>
                                    <li><a href="home">HOME</a></li>
                                    <li><a href="my-account.jsp">My Account</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div><!-- Page Banner Section End -->

            <!-- Register Section Start -->
            <div class="register-section section mt-90 mb-90">
                <div class="container">
                    <form action="myAccount?action=update" method="post">
                        <div class="row">
                            <h3>We will need for your registration</h3>
                            <p>E&E provide how all this mistaken idea of denouncing pleasure and sing pain born an will give you a complete account of the system, and expound</p>

                            <!-- Register -->
                            <div class="col-md-6 col-12 d-flex">
                                <div class="ee-register">

                                    <!-- Register Form -->
                                    <div class="row">
                                        <input value="${view.userID}" name="uid" type="hidden" class="form-control">
                                    <div class="col-12 mb-30">
                                        <label>User Name</label>
                                        <input type="text" value="${view.userName}" class="form-control" name="userName" readonly>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Full Name</label>
                                        <input type="text" value="${view.fullName}" class="form-control" name="fullName" required>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Email</label>
                                        <input type="email" value="${view.email}" class="form-control" name="email" required>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Telephone</label>
                                        <input type="text" value="${view.telephone}" class="form-control" name="telephone" required>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Address</label>
                                        <input type="text" value="${view.address}"class="form-control" name="address" required>
                                    </div>
                                    <div class="col-12 mb-30">
                                        <label>Town/City</label>
                                        <input type="text" value="${view.city}" class="form-control" name="city" required>
                                    </div>
                                    <div class="col-12" id="register-btn"><input type="submit" value="Update Account"></div>
                                </div>


                            </div>
                        </div>

                        <div class="col-md-1 col-12 d-flex">

                            <div class="login-reg-vertical-boder"></div>

                        </div>
                        <div class="form-action col-xl-5 col-lg-5 col-md-5 col-sm-5 col-12" style="margin: auto;">
                            <div class="form-group label-image">
                                <input id="input-b8" name="image" type="file" class="file" data-show-caption="true"
                                       data-show-upload="false" data-show-remove="false" data-msg-placeholder="Upload for image ..." required>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- Register Section End -->

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery JS -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- Popper JS -->
        <script src="assets/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
