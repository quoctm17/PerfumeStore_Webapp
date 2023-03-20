<%-- 
    Document   : detail
    Created on : Feb 13, 2023, 5:11:18 PM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--hiển thị thông tin chi tiết về một sản phẩm-->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="<c:url value="/" />"><i class="fa fa-home"></i> Home</a>
                    <a href="<c:url value="/shop/list.do"/>">Shop </a>
                    <span>${p.name}</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
<!--                 <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-${product.id}_1.jpg" />">-->
                <div class="product__details__pic">
                    <div class="product__details__pic__left product__thumb nice-scroll">
                        <a class="pt active" href="#product-1">
                            <img src="<c:url value="/assets/img/product/product-${p.id}_1.jpg" />" alt="">
                        </a>
                        <a class="pt" href="#product-2">
                            <img src="<c:url value="/assets/img/product/product-${p.id}_2.jpg" />" alt="">
                        </a>
                        <a class="pt" href="#product-3">
                            <img src="<c:url value="/assets/img/product/product-${p.id}_3.jpg" />" alt="">
                        </a>
                    </div>
                    <div class="product__details__slider__content">
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-hash="product-1" class="product__big__img" src="<c:url value="/assets/img/product/product-${p.id}_1.jpg"/>" alt="">
                            <img data-hash="product-2" class="product__big__img" src="<c:url value="/assets/img/product/product-${p.id}_2.jpg"/>" alt="">
                            <img data-hash="product-3" class="product__big__img" src="<c:url value="/assets/img/product/product-${p.id}_3.jpg"/>" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="product__details__text">
                    <h3>${p.name} <span>Brand: ${category.name}</span></h3>
                    <!--rating-->
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <span>( 138 reviews )</span>
                    </div>
                    <div class="product__details__price">
                        <fmt:setLocale value="vi-VN"/>
                        <fmt:formatNumber value = "${p.price}" type = "currency"/> 
                        <span>
                            <fmt:formatNumber value = "${p.beforeDiscount()}" type = "currency"/>
                        </span> 
                    </div>
                    <p>${category.description}</p>
                    <div class="product__details__button">
                        <div class="quantity">
                            <span>Quantity:</span>
                            <div class="pro-qty">
                                <input type="text" name="quantity" value="1" min="1">
                            </div>
                        </div>
                        <a href="#!" onclick="addCartHandler(${p.id})" class="cart-btn ${p.enabled == true ? "" : "disabled"}"><span class="icon_bag_alt"></span> Add to cart</a>
                    </div>
                    <div class="product__details__widget">
                        <ul>
                            <li>
                                <span>Availability:</span>
                                <div class="stock__checkbox">
                                    <label for="stockin">
                                        ${p.enabled == true ? 'In Stock' : 'Out of stock'}
                                        <input type="checkbox" id="stockin" checked >
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </li>

                            <li>
                                <span>Promotions:</span>
                                <p>Free shipping</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            ${p.description}
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="related__title">
                    <h5>RELATED PRODUCTS</h5>
                </div>
            </div>
            <c:forEach var="product" items="${list}" >
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-${product.id}_1.jpg"/>">
                            <div class="label new">New</div>
                            <ul class="product__hover">
                                <li><a href="<c:url value="/assets/img/product/product-${product.id}_1.jpg"/>" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#!" onclick="addToCart(${product.id}, 1)"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="<c:url value="/shop/detail.do?id=${product.id}" />">${product.name}</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><fmt:formatNumber value="${product.price}" type="currency" /></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Product Details Section End -->
<script>
    const addCartHandler = id => {
        const quantity = document.querySelector('input[name=quantity]').value;
        
        addToCart(id, quantity);
    }
</script>
