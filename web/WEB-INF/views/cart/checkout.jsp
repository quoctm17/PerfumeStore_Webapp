<%-- 
    Document   : checkout
    Created on : Feb 13, 2023, 4:36:56 PM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--thanh toán ở đây-->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="<c:url value="/" />"><i class="fa fa-home"></i> Home</a>
                    <span>Shopping cart</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <form action="<c:url value="/cart/order.do" />" class="checkout__form" method="post">
            <div class="row">
                <div class="col-lg-7">
                    <h5>Billing detail</h5>
                    <div class="row">
                        <c:if test="${sessionScope.acc == null}">
                            <div class="col-lg-12">
                                <div class="checkout__form__checkbox">
                                    <label for="acc">
                                        Create an acount?
                                        <input type="checkbox" id="acc" name="newAccount" value="true">
                                        <span class="checkmark"></span>
                                    </label>
                                    <p>Create an acount by entering the information below. If you are a returing
                                        customer, please <a href="<c:url value="/account/login.do">
                                                                <c:param name="redirect" value="/cart/checkout.do"/>
                                                            </c:url>">login here</a>
                                </div>
                            </div>
                        </c:if>
<!--                        String name = request.getParameter("name");
                        String address = request.getParameter("address");
                        String deliveryAddress = request.getParameter("deliveryAddress");
                        String phone = request.getParameter("phone");
                        String email = request.getParameter("email");-->

                        <div class="col-lg-12">
                            <div class="checkout__form__input">
                                <p>Username <span>*</span></p>
                                <input type="text" name="name" value="${sessionScope.acc.user}" ${sessionScope.acc != null ? "disabled" : ""}>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="checkout__form__input">
                                <p>Address <span>*</span></p>
                                <input type="text" name="address" value="${sessionScope.acc.address}" ${sessionScope.acc != null ? "disabled" : ""}>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="checkout__form__input">
                                <p>Delivery Address <span>*</span></p>
                                <input type="text" name="deliveryAddress" value="${sessionScope.acc.address}" ${sessionScope.acc != null ? "disabled" : ""}>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="checkout__form__input">
                                <p>Phone <span>*</span></p>
                                <input type="text" name="phone" value="${sessionScope.acc.phone}" ${sessionScope.acc != null ? "disabled" : ""}>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="checkout__form__input">
                                <p>Email <span>*</span></p>
                                <input type="text" name="email" value="${sessionScope.acc.email}" ${sessionScope.acc != null ? "disabled" : ""}>
                            </div>
                        </div>
                        <div class="col-lg-12">                           
                            <div class="checkout__form__input">
                                <p>Oder notes <span></span></p>
                                <input type="text" name="noteOfDetailHeader"
                                       placeholder="Note about your order, e.g, special noe for delivery">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="checkout__order">
                        <h5>Your order</h5>
                        <div class="checkout__order__product">
                            <ul>
                                <li>
                                    <span class="top__text">Product</span>
                                    <span class="top__text__right">Total</span>
                                </li>
                                <c:forEach var="p" items="${sessionScope.cart.items}" varStatus="loop">
                                    <li>${loop.count}. ${p.product.name} 
                                        <span>
                                            <script>
                                                document.write(Number(${p.cost}).toLocaleString() + " VNĐ");
                                            </script>
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="checkout__order__total">
                            <ul>
                                <li>Total 
                                    <span>
                                        <script>
                                    document.write(Number(${cart.totalCart}).toLocaleString() + " VNĐ");
                                        </script>
                                    </span>
                                </li>
                            </ul>
                        </div>
                        <button type="submit" class="site-btn">Place order</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Checkout Section End -->

