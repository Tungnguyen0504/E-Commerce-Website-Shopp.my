<%-- 
    Document   : login.jsp
    Created on : Feb 23, 2021, 12:59:09 AM
    Author     : tungn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Login Form Template</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link href="designLogin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="designLogin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="designLogin/css/form-elements.css" rel="stylesheet" type="text/css"/>
        <link href="designLogin/css/style.css" rel="stylesheet" type="text/css"/>

        <style>
            .button-box {
                width: 220px;
                margin: 35px auto;
                position: relative;
                box-shadow: 0 0 20px 9px #ff61241f;
                border-radius: 30px;
            }
            #login {
                left: 50px;
                width: 354px;
            }
            #register {
                left: 650px;
            }
            .login-form {
                position: absolute;
                width: 350px;
                transition: .5s;
            }
            #btn {
                top: 0;
                left: 0;
                position: absolute;
                width: 110px;
                height: 100%;
                background: linear-gradient(to right, #ff105f,#ffad06);
                border-radius: 30px;
                transition: .5s;
            }
            .toggle-btn {
                padding: 10px 28px;
                cursor: pointer;
                background: transparent;
                border: 0;
                outline: none;
                position: relative;
            }
            .form-box {
                height: 450px;
                width: 450px;
                background: #444;
                background: rgba(0, 0, 0, 0.3);
                border-radius: 20px;
                overflow: hidden;
            }
            .col-sm-offset-3 {
                margin-left: 31%;
            }
            .form-bottom form button.btn {
                width: 85%;
                border-radius: 45px;
                margin-left: 27px;
                border-radius: 30px;
            }
            .form-bottom {
                background-color: transparent;
            }
            .social-login {
                padding-right: 151px;
            }
            .check-box {
                margin: 30px 10px 30px 0;
            }
            body {
                background-image: url(designLogin/img/backgrounds/1@2x.jpg);
            }
            .strong {
                font-weight: 500;
                font-family: auto;
                font-size: 40px;
            }
            .alert-warning {
                color: #8a6d3b;
                background-color: transparent;
                border-color: #faebcc;
                max-width: 8px;
                max-height: 8px;
                display: inline;
                border: none;
                padding-left: 22px;
            }
            #warning {
                max-width: 9%;
            }
            #capcha {
                width: 50%;
                height: 37px;
                margin-right: 15px;
            }
        </style>
        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="designLogin/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="designLogin/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="designLogin/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="designLogin/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">

            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Welcome Back!!</strong></h1>
                            <div class="description">
                                <p>
                                    Please enter to your Username and Password to log on:
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-bottom">
                                <div class="button-box">
                                    <div id="btn"></div>
                                    <button type="button" class="toggle-btn" onclick="login()">Log In</button>
                                    <button type="button" class="toggle-btn" onclick="register()"> Register </button>
                                </div>
                                <form id="login" role="form" action="login" method="post" class="login-form">
                                    <input type="hidden" name="url" value="${url}">
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Username</label>
                                        <input type="text" name="user" placeholder="Username..." class="form-username form-control" id="form-username" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-password">Password</label>
                                        <input type="password" name="pass" placeholder="Password..." class="form-password form-control" id="form-password" required>
                                    </div>
                                    <input id="capcha" type="text" name="captcha"/>
                                    <img src="captcha-image"/>
                                    <br/>
                                    <input name="remember" type="checkbox" class="check-box"><span>Remember Password</span>
                                    <button type="submit" class="btn">Sign in!</button>
                                    <p id="mess">
                                        ${mess}
                                        ${error}
                                    </p>
                                </form>
                                <form id="register" role="form" action="signUp" method="post" class="login-form">
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Username</label>
                                        <input type="text" name="user" placeholder="Username..." class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-password">Password</label>
                                        <input type="password" name="pass" placeholder="Password..." class="form-password form-control" id="form-password">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-password">Password</label>
                                        <input type="password" name="re-pass" placeholder="Confirm again..." class="form-password form-control" id="form-password">
                                    </div>
                                    <input type="checkbox" class="check-box"><a href="terms-conditions.html">I agree to the terms & conditions</a>
                                    <button type="submit" class="btn">Register!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                            <h3>...or login with:</h3>
                            <div class="social-login-buttons">
                                <a class="btn btn-link-2" href="#">
                                    <i class="fa fa-facebook"></i> Facebook
                                </a>
                                <a class="btn btn-link-2" href="#">
                                    <i class="fa fa-twitter"></i> Twitter
                                </a>
                                <a class="btn btn-link-2" href="#">
                                    <i class="fa fa-google-plus"></i> Google Plus
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- Javascript -->
        <script src="designLogin/js/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="designLogin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="designLogin/js/jquery.backstretch.js" type="text/javascript"></script>
        <script src="designLogin/js/scripts.js" type="text/javascript"></script>
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
        <script>
                                        var x = document.getElementById("login");
                                        var y = document.getElementById("register");
                                        var z = document.getElementById("btn");

                                        function register() {
                                            x.style.left = "-400px";
                                            y.style.left = "50px";
                                            z.style.left = "110px";
                                        }
                                        function login() {
                                            x.style.left = "50px";
                                            y.style.left = "450px";
                                            z.style.left = "0px";
                                        }
        </script>
    </body>

</html>
