<%-- 
    Document   : index
    Created on : Feb 13, 2023, 4:35:14 PM
    Author     : Beyond Nguyen
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <td class="cart__price">${p.product.price} VNĐ</td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            
                                            <input type="text" value="${p.quantity}">
                                        </div>
                                    </td>
                                    <td class="cart__total">
                                        <script>
                                            document.write(Number(${p.cost}).toLocaleString() + " VNĐ");
                                        </script>
                                    </td>
                                    <td class="cart__close"><span class="icon_close"></span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="cart__btn">
                    <a href="<c:url value="/shop/list.do" />">Continue Shopping</a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="cart__btn update__btn">
                    <a href="<c:url value="/cart/index.do" />"><span class="icon_loading"></span> Update cart</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="discount__content">
                    <h6>Discount codes</h6>
                    <form action="#">
                        <input type="text" placeholder="Enter your coupon code">
                        <button type="submit" class="site-btn">Apply</button>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 offset-lg-2">
                <div class="cart__total__procced">
                    <h6>Cart total</h6>
                    <ul>
                        <li>Subtotal <span>$ 750.0</span></li>
                        <li>Total <span>$ 750.0</span></li>
                    </ul>
                    <a href="<c:url value="/cart/checkout.do" />" class="primary-btn text-white">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Cart Section End -->
