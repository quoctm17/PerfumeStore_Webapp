<%-- 
    Document   : dashboard
    Created on : Feb 24, 2023, 6:58:34 AM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row p-5">
    <div class="col-md-6 mt-4">
        <a href="<c:url value="/admin/product/list.do" />" class="card-admin-item">
            <div class="card-icon"><i class="fa-solid fa-gear"></i></div>
            <div>
                <h1>Manage product</h1>
                <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
            </div>
        </a>
    </div>
    <c:if test="${sessionScope.acc.role == 'ROLE_ADMIN'}">
        <div class="col-md-6 mt-4">
            <a href="<c:url value="/admin/category/list.do" />" class="card-admin-item">
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
        <div class="col-md-6 mt-4">
            <a href="<c:url value="/admin/customer/list.do" />" class="card-admin-item">
                <div class="card-icon"><i class="fa-solid fa-user"></i></div>
                <div>
                    <h1>Manage customer</h1>
                    <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
                </div>
            </a>
        </div>
    </c:if>
    <div class="col-md-6 mt-4">
        <a href="<c:url value="/admin/orders/list.do" />" class="card-admin-item">
            <div class="card-icon"><i class="fa-solid fa-file-invoice"></i></div>
            <div>
                <h1>Orders list</h1>
                <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
            </div>
        </a>
    </div>
    <div class="col-md-6 mt-4">
        <a href="<c:url value="/profile/info.do" />" class="card-admin-item">
            <div class="card-icon"><i class="fa-solid fa-address-card"></i></div>
            <div>
                <h1>Personal profile</h1>
                <span>view detais <i class="fa-solid fa-arrow-right"></i></span>
            </div>
        </a>
    </div>
</div>
