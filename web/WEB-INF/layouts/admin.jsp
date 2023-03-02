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
        <link rel="stylesheet" href="<c:url value="/assets/css/styles.css?v=1.2" />" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/assets/css/admin-page.css?v=1.2" />" type="text/css" />
    </head>
    <body>

        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div id="sidebar-wrapper">
                <div class="sidebar-heading"><a href="/psephora/"><img src="<c:url value="/assets/img/logo.png" />" alt="logo"/></a></div>
                <div class="border p-3">
                    <img class="w-100" src="<c:url value="/assets/img/user-avatar.png" />" alt=""/>
                    <div class="text-center mt-2">Hello <strong>Administrator</strong>  <i class="fa-solid fa-heart"></i></div>
                </div>
                <div class="sidebar-list">
                    <a class="sidebar-item active p-3" href="<c:url value="/admin/dashboard.do" />"><i class="fa-solid fa-chart-line"></i>Dashboard</a>
                    <a class="sidebar-item p-3" href="<c:url value="/admin/product/list.do" />"><i class="fa-solid fa-gear"></i>Manage Product</a>
                    <c:if test="${sessionScope.acc.role == 'ROLE_ADMIN'}">
                        <a class="sidebar-item p-3" href="<c:url value="/admin/category/list.do" />"><i class="fa-solid fa-list-check"></i>Manage Category</a>
                        <a class="sidebar-item p-3" href="<c:url value="/admin/revenue.do" />"><i class="fa-solid fa-money-bill-trend-up"></i>Revenue</a>
                        <a class="sidebar-item p-3" href="<c:url value="/admin/customer/list.do" />"><i class="fa-solid fa-user"></i></i>Manage customer</a>
                    </c:if>
                    <a class="sidebar-item p-3" href="<c:url value="/admin/orders/list.do" />"><i class="fa-solid fa-file-invoice"></i>Orders list</a>
                    <a class="sidebar-item p-3" href="<c:url value="/profile/info.do" />"><i class="fa-solid fa-address-card"></i>View profile</a>
                    <a class="sidebar-item p-3" href="<c:url value="/account/logout.do" />"><i class="fa-solid fa-right-from-bracket"></i>Log out</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div class="bg-light" id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid header">
                        <div class="toggle-btn" id="sidebarToggle">Toggle Menu <i class="fa-solid fa-toggle-on"></i></div>
                        <h2>Admin page</h2>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
                </div>
            </div>
        </div>

        <!-- Js Plugins -->
        <script src="<c:url value="/assets/js/jquery-3.3.1.min.js" />"></script>
        <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
        <script>window.addEventListener('DOMContentLoaded', event => {

                // Toggle the side navigation
                const sidebarToggle = document.body.querySelector('#sidebarToggle');
                if (sidebarToggle) {
                    // Uncomment Below to persist sidebar toggle between refreshes
                    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                    //     document.body.classList.toggle('sb-sidenav-toggled');
                    // }
                    sidebarToggle.addEventListener('click', event => {
                        event.preventDefault();
                        document.body.classList.toggle('sb-sidenav-toggled');
                        localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                    });
                }

            });</script>
    </body>
</html>
