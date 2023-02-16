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
        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />

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

        <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
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
