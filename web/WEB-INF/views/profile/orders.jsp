<%-- 
    Document   : personal
    Created on : Mar 15, 2023, 7:26:48 PM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container p-5">
    <h2 class="mb-5">Recently Orders</h2>

    <c:forEach var="fo" items="${list}">
        <div class="card shadow border-0 mb-5">
            <div class="row card-body d-flex justify-content-between">
                <div class="col">${fo.oh.id}</div>
                <div class="col"><fmt:formatDate value="${fo.oh.date}" pattern="dd/MM/yyyy" /></div>
                <c:if test="${fo.oh.status == null}">
                    <div class="col"><span class="badge badge-warning">Pending</span></div>
                </c:if>
                <c:if test="${fo.oh.status != null}">
                    <div class="col"><span class="badge badge-${fo.oh.status == "Completed" ? "success" : "danger"}">${fo.oh.status}</span></div>
                </c:if>
                
                <div class="col"><strong><fmt:formatNumber value="${fo.total}" type="currency" /></strong></div>
                <div data-toggle="collapse" data-target="#demo-${fo.oh.id}"><i class="fa fa-chevron-down"></i></div>
            </div>
            <div id="demo-${fo.oh.id}" class="collapse shop__cart__table p-3">
                <hr/>
                <table class="table-responsive">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="od" items="${fo.od}">
                        <tr>
                            <td class="cart__product__item">
                                <img src="<c:url value="/assets/img/product/product-${od.key.productId}_2.jpg" />"  alt="">
                                     <div class="cart__product__item__title">
                                    <h6>${od.value}</h6>
                                </div>
                            </td>
                            <td class="cart__price"><fmt:formatNumber value="${od.key.price}" type="currency" /></td>
                        <td class="cart__quantity">
                            ${od.key.quantity}
                        </td>
                        <td class="cart__total">
                        <fmt:formatNumber value="${od.key.quantity * od.key.price}" type="currency" />
                        </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </c:forEach>
</div>
