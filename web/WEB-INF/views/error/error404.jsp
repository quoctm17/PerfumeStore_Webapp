<%-- 
    Document   : error
    Created on : Feb 13, 2023, 2:01:01 PM
    Author     : Beyond Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid p-5 text-center">
    <img src="<c:url value="/assets/img/404-error.gif" />" />
    <h1>Oops! Page not found</h1>
    <a href="<c:url value="/" />" class="btn btn-primary mt-4">Back to home</a>
</div>