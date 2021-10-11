<%-- 
    Document   : admin-navbar
    Created on : Oct 3, 2021, 2:45:22 AM
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
          <nav class="navbar navbar-expand-lg fixed-top shadow">
            <div class="container-fluid">
                <a class="navbar-brand" href="home"><img src="assets/images/icons/1-removebg-preview.png" alt=""/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="search-control d-flex me-auto ms-auto">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                        <i class="bi bi-search"></i>
                    </form>
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item notice dropdown">
                            <span class="navbar-badge">15</span>
                            <i class="bi bi-bell-fill nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"></i>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-navbar" aria-labelledby="navbarDropdown">
                                <div class="header-notice">
                                    <span>Notifications</span>
                                </div>
                                <div class="see-all">
                                    <span>Earlier</span>
                                    <a href="">See all</a>
                                </div>
                                <li><hr class="dropdown-divider" style="margin: 0;"></li>
                                <div class="content-notice">
                                    <li>
                                        <a class="dropdown-item item-navbar" href="#">
                                            <div>
                                                <i class="bi bi-bell-fill"></i>
                                            </div>
                                            <span>
                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit.<br>
                                                <small>15/07/2020</small>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item item-navbar" href="#">
                                            <div>
                                                <i class="bi bi-bell-fill"></i>
                                            </div>
                                            <span>
                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit.<br>
                                                <small>15/07/2020</small>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item item-navbar" href="#">
                                            <div>
                                                <i class="bi bi-bell-fill"></i>
                                            </div>
                                            <span>
                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit.<br>
                                                <small>15/07/2020</small>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item item-navbar" href="#">
                                            <div>
                                                <i class="bi bi-bell-fill"></i>
                                            </div>
                                            <span>
                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit.<br>
                                                <small>15/07/2020</small>
                                            </span>
                                        </a>
                                    </li>
                                </div>
                            </ul>
                        </li>
                        <li class="nav-item avt-user dropdown">
                            <img src="assets/images/user/account-image-placeholder.jpg" alt="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"/>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-navbar" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item item-navbar item-navbar" href="myAccount?uid=${sessionScope.acc.userID}&action=viewAccount">
                                        <div>
                                            <i class="bi bi-person-circle"></i>
                                        </div>
                                        <span>My Account</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item item-navbar" href="myAccount?uid=${sessionScope.acc.userID}&action=viewPassword">
                                        <div>
                                            <i class="bi bi-gear-fill"></i>
                                        </div>
                                        <span>Change Password</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item item-navbar" href="orderHistory?uid=${sessionScope.acc.userID}">
                                        <div>
                                            <i class="bi bi-cart-check-fill"></i>
                                        </div>
                                        <span>Order History</span>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider" style="margin: 0;"></li>
                                <li>
                                    <a class="dropdown-item item-navbar" href="logout">
                                        <div>
                                            <i class="bi bi-box-arrow-right"></i>
                                        </div>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="sidebar">
            <div class="logo-details">
                <div class="logo_name">E-commerce</div>
                <i class="bi bi-list" id="btn"></i>
            </div>
            <ul class="nav-list">
                <li>
                    <a href="manageDashboard">
                        <i class="bi bi-grid"></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="manageAccount">
                        <i class="bi bi-person-square"></i>
                        <span class="links_name">Manage Account</span>
                    </a>
                    <span class="tooltip">Manage Account</span>
                </li>
                <li>
                    <a href="manageProduct?cid=1">
                        <i class="bi bi-laptop-fill"></i>
                        <span class="links_name">Manage Product</span>
                    </a>
                    <span class="tooltip">Manage Product</span>
                </li>
                <li>
                    <a href="manageBill">
                        <i class="bi bi-cart-dash"></i>
                        <span class="links_name">Manage Order</span>
                    </a>
                    <span class="tooltip">Manage Order</span>
                </li>
                <li class="profile" onclick="window.location.assign('home')" style="cursor: pointer;">
                    <div class="profile-details">
                        <img src="assets/images/icons/house-logos.jpg" alt="profileImg"/>
                        <div class="name_job">
                            <div class="name">Home</div>
                        </div>
                    </div>
                    <i class="bi bi-box-arrow-left" id="log_out"></i>
                </li>
            </ul>
        </div>
    </body>
</html>
