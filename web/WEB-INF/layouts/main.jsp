<%-- 
    Document   : main
    Created on : Feb 2, 2023, 12:51:25 PM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>P-Sephora</title>
        <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/assets/img/favicon_io/apple-touch-icon.png" />">
        <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/assets/img/favicon_io/favicon-32x32.png"/>">
        <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/assets/img/favicon_io/favicon-16x16.png"/>">
        <link rel="manifest" href="<c:url value="/assets/img/favicon_io/site.webmanifest"/>">
        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />

        <!-- Css Styles -->
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/font-awesome.min.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/elegant-icons.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/jquery-ui.min.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/magnific-popup.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/slicknav.min.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/owl.carousel.min.css" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/styles.css?v=1.2" />" type="text/css" />
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__close">+</div>
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                <li>
                    <a href="<c:url value="/cart/index.do"/>"
                       ><span class="icon_bag_alt"></span>
                        <div class="tip">${cart.count}</div>
                    </a>
                </li>
            </ul>
            <div class="offcanvas__logo">
                <a href="./index.html"><img src="<c:url value="/assets/img/logo.png" />" alt="p-sephora" /></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__auth">
                <c:if test="${sessionScope.acc != null}">
                    <div class="greeting">Hello ${sessionScope.acc.user} </div>
                    <a href="<c:url  value="/account/logout.do" />">Logout</a>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <a href="<c:url  value="/account/login.do" />">Login</a>
                    <a href="<c:url  value="/account/signup.do" />">Register</a>
                </c:if>
            </div>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo">
                            <a href="<c:url value="/" />"><img src="<c:url value="/assets/img/logo.png" />" alt="p-sephora" /></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li class="${tab == "home" ? "active" : ""}"><a href="<c:url value="/"/>">Home</a></li>
                                <li class="${tab == "aboutus" ? "active" : ""}"><a href="<c:url value="/home/aboutus.do"/>">About us</a></li>
                                <li class="${tab == "shop" ? "active" : ""}"><a href="<c:url value="/shop/list.do"/>">Shop</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="<c:url value="/cart/index.do"/>">Shop Cart</a></li>
                                        <li><a href="<c:url value="/cart/checkout.do"/>">Checkout</a></li>
                                    </ul>
                                </li>
                                <c:if test="${sessionScope.acc != null}">
                                    <c:if test="${sessionScope.acc.role != 'ROLE_CUSTOMER'}">
                                        <li><a href="#">Admin pages</a>
                                            <ul class="dropdown">
                                                <li><a href="<c:url value="/admin/dashboard.do"/>">Dashboard</a></li>
                                                <li><a href="<c:url value="/admin/product/list.do"/>">Manage Product</a></li>
                                                    <c:if test="${sessionScope.acc.role == 'ROLE_ADMIN'}">
                                                    <li><a href="<c:url value="/admin/category.do"/>">Manage Category</a></li>
                                                    <li><a href="<c:url value="/admin/revenue.do"/>">Revenue</a></li>
                                                    <li><a href="<c:url value="/admin/customer/list.do"/>">Manage Customer</a></li>
                                                    <li><a href="<c:url value="/admin/orders/list.do"/>">Order List</a></li>
                                                    </c:if>
                                            </ul>
                                        </li>
                                    </c:if>
                                </c:if> 
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__right">
                            <div class="header__right__auth">
                                <c:if test="${sessionScope.acc == null}">
                                    <a style="text-decoration: underline" href="<c:url  value="/account/login.do" />">Login</a>
                                    <a style="text-decoration: underline" href="<c:url  value="/account/signup.do" />">Register</a>
                                </c:if>
                            </div>
                            <ul class="header__right__widget">
                                <c:if test="${sessionScope.acc != null}">
                                    <span class="greeting">Hello ${sessionScope.acc.user} </span>
                                    <li>
                                        <span class="icon_profile"></span>
                                        <ul class="dropdown">
                                            <li><a href="<c:url value="/profile/info.do"/>">View profile</a></li>
                                            <li><a href="<c:url  value="/account/logout.do" />">Logout</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <li><span class="icon_search search-switch"></span></li>
                                <li>
                                    <a href="<c:url  value="/cart/index.do" />"
                                       ><span class="icon_bag_alt"></span>
                                        <div class="tip">${cart.count}</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->


        <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />


        <!-- Services Section Begin -->
        <section class="services spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-car"></i>
                            <h6>Free Shipping</h6>
                            <p>For all oder over $99</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-money"></i>
                            <h6>Money Back Guarantee</h6>
                            <p>If good have Problems</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-support"></i>
                            <h6>Online Support 24/7</h6>
                            <p>Dedicated support</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-headphones"></i>
                            <h6>Payment Secure</h6>
                            <p>100% secure payment</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="<c:url value="/assets/img/logo.png" />" alt="p-sephora" /></a>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blogs</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="footer__widget">
                            <h6>Account</h6>
                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Orders Tracking</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Wishlist</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6 onclick="showSuccessToast();">NEWSLETTER</h6>
                            <form>
                                <input type="text" placeholder="Email" />
                                <button class="site-btn">Subscribe</button>
                            </form>
                        </div>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>
                                Copyright &copy;
                                <script>
                                    document.write(new Date().getFullYear());
                                </script> | made with
                                <i class="fa fa-heart" aria-hidden="true"></i> by
                                <a href="https://colorlib.com" target="_blank">P-Sephora</a>
                            </p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form action="<c:url value="/shop/list.do" />" class="search-model-form">
                    <input name="search" type="text" id="search-input" placeholder="Search here....." />
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!--toast-->
        <div id="toast"></div>

        <script>

            const toastObj = "${toast}";
            if (toastObj) {
                const message = "${toast.message}"
                const type = "${toast.type}"
                console.log(type)
                function toastCall() {
                    switch (type) {
                        case "success":
                            showSuccessToast(message, type);
                            break;
                        case "info":
                            showInfoToast(message, type);
                            break;
                        case "failed":
                            showFailedToast(message, type);
                            break;
                    }

                }
            }

            window.addEventListener('load', () => toastCall())
        </script>


        <!-- Js Plugins -->
        <script src="<c:url value="/assets/js/jquery-3.3.1.min.js" />"></script>
        <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/assets/js/jquery.magnific-popup.min.js"/>"></script>
        <script src="<c:url value="/assets/js/jquery-ui.min.js"/>"></script>
        <script src="<c:url value="/assets/js/mixitup.min.js"/>"></script>
        <script src="<c:url value="/assets/js/jquery.slicknav.js"/>"></script>
        <script src="<c:url value="/assets/js/jquery.nicescroll.min.js"/>"></script>
        <script src="<c:url value="/assets/js/owl.carousel.min.js"/>"></script>
        <script src="<c:url value="/assets/js/main.js"/>"></script>
    </body>
</html>
