<%-- 
    Document   : index
    Created on : Feb 13, 2023, 4:35:14 PM
    Author     : Beyond Nguyen
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--hiển thị và chỉnh sửa giỏ giỏ hàng ở đây-->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                    <span>Shopping cart</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Cart Section Begin -->
<section class="shop-cart spad">
    <div class="container">
        <form action="<c:url value="/cart/update.do"/>" method="post">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>                           
                                <c:forEach var="p" items="${sessionScope.cart.items}">
                                    <tr>
                                        <td class="cart__product__item">
                                            <img src="<c:url value="/assets/img/product/product-${p.product.id}_2.jpg" />" alt="">
                                            <div class="cart__product__item__title">
                                                <h6>${p.product.name}</h6>
                                            </div>
                                        </td>
                                        <td class="cart__price">
                                            <fmt:formatNumber value="${p.product.price}" type="currency" />
                                        </td>
                                        <td class="cart__quantity">

                                            <div class="pro-qty">
                                                <input type="text" name="newQuantity_${p.product.id}" value="${p.quantity}" />
                                            </div>

                                        </td>
                                        <td class="cart__total">
                                            <fmt:formatNumber value="${p.cost}" type="currency" />
                                        </td>
                                        <td class="cart__close">     
                                            <a href="<c:url value="/cart/delete.do?idneedtodelete=${p.product.id}"/>" class="icon_close"></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="cart__btn">
                        <a href="<c:url value="/shop/list.do" />">Continue Shopping</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 text-center">
                    <div class="cart__btn">
                        <a href="<c:url value="/cart/clearCart.do" />">Clear all products</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="cart__btn update__btn">
                        <button type="submit" class="btn"><span class="icon_loading"></span> Update cart</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="row">
            <div class="col-lg-6">
            </div>
            <div class="col-lg-4 offset-lg-2">
                <div class="cart__total__procced">
                    <h6>Cart total</h6>
                    <ul>
                        <!--                        <li>Subtotal <span>$ 750.0</span></li>-->
                        <li>Total 
                            <span>
                                <script>
                                    document.write(Number(${cart.totalCart}).toLocaleString() + " VNĐ");
                                </script>
                            </span>
                        </li>
                    </ul>
                    <a href="<c:url value="/cart/checkout.do" />" class="primary-btn text-white">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Cart Section End -->
