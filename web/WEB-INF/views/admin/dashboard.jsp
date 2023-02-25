<%-- 
    Document   : dashboard
    Created on : Feb 24, 2023, 6:58:34 AM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row p-5">
    <div class="col-md-6 mt-4">
        <a href="<c:url value="/admin/product.do" />" class="card-admin-item">
            <div class="card-icon"><i class="fa-solid fa-gear"></i></div>
            <div>
                <h1>Manage product</h1>
                <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
            </div>
        </a>
    </div>
    <c:if test="${sessionScope.acc.role == 'ROLE_ADMIN'}">
        <div class="col-md-6 mt-4">
            <a href="<c:url value="/admin/category.do" />" class="card-admin-item">
                <div class="card-icon"><i class="fa-solid fa-list-check"></i></div>
                <div>
                    <h1>Manage category</h1>
                    <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
                </div>
            </a>
        </div>
        <div class="col-md-6 mt-4">
            <a href="<c:url value="/admin/revenue.do" />" class="card-admin-item">
                <div class="card-icon"><i class="fa-solid fa-money-bill-trend-up"></i></div>
                <div>
                    <h1>Revenue</h1>
                    <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
                </div>
            </a>
        </div> 
    </c:if>

</div>
