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
                            <c:forEach var="product" items="${list}">
                                <tr>
                                    <td class="cart__product__item">
                                        <img src="<c:url value="/assets/img/product/product-${p.id}_2.jpg" />" alt="">
                                        <div class="cart__product__item__title">
                                            <h6>${p.name}</h6>
                                        </div>
                                    </td>
                                    <td class="cart__price">${p.price} VNĐ</td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </td>
                                    <td class="cart__total">$ 300.0</td>
                                    <td class="cart__close"><span class="icon_close"></span></td>
                                </tr>
                            </c:forEach>
                            <!-- <tr>
                                <!-- <c:forEach var="product" items="${displayList}">
                                         <div class="col-lg-4 col-md-6">
                                             <div class="product__item">
                                                 <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-${product.id}_1.jpg" />">
                                                     <div class="label new">New</div>
                                                     <ul class="product__hover">
                                                         <li><a href="<c:url value="/assets/img/product/product-${product.id}_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                         <li><a href="<c:url value="/cart/index.do?id=${product.id}" />"><span class="icon_bag_alt"></span></a></li>
                                                     </ul>
                                                 </div>
                                                 <div class="product__item__text">
                                                     <h6><a href="<c:url value="/shop/detail.do?id=${product.id}"/>">${product.name}</a></h6>
                                                     <div class="product__price">${product.price} VND</div>
                                                 </div>
                                             </div>
                                         </div>
                                </c:forEach> 
                                <td class="cart__product__item">
                                    <img src="<c:url value="/assets/img/product/product-${p.id}_2.jpg" />" alt="">
                                    <div class="cart__product__item__title">
                                        <h6>${p.name}</h6>
                                    </div>
                                </td>
                                <td class="cart__price">${p.price} VNĐ</td>
                                <td class="cart__quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </td>
                                <td class="cart__total">$ 300.0</td>
                                <td class="cart__close"><span class="icon_close"></span></td>
                            </tr>
                            <tr>
                                <td class="cart__product__item">
                                    <img src="<c:url value="/assets/img/product/product-4_2.jpg" />" alt="">
                                    <div class="cart__product__item__title">
                                        <h6>Chain bucket bag</h6>
                                    </div>
                                </td>
                                <td class="cart__price">$ 170.0</td>
                                <td class="cart__quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </td>
                                <td class="cart__total">$ 170.0</td>
                                <td class="cart__close"><span class="icon_close"></span></td>
                            </tr>
                            <tr>
                                <td class="cart__product__item">
                                    <img src="<c:url value="/assets/img/product/product-4_2.jpg" />" alt="">
                                    <div class="cart__product__item__title">
                                        <h6>Chain bucket bag</h6>
                                    </div>
                                </td>
                                <td class="cart__price">$ 85.0</td>
                                <td class="cart__quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </td>
                                <td class="cart__total">$ 170.0</td>
                                <td class="cart__close"><span class="icon_close"></span></td>
                            </tr>
                            <tr>
                                <td class="cart__product__item">
                                    <img src="<c:url value="/assets/img/product/product-4_2.jpg" />" alt="">
                                    <div class="cart__product__item__title">
                                        <h6>Chain bucket bag</h6>
                                    </div>
                                </td>
                                <td class="cart__price">$ 55.0</td>
                                <td class="cart__quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </td>
                                <td class="cart__total">$ 110.0</td>
                                <td class="cart__close"><span class="icon_close"></span></td>
                            </tr> -->
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
                    <a href="#"><span class="icon_loading"></span> Update cart</a>
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
