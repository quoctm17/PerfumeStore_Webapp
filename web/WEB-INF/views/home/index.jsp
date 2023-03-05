<%-- 
    Document   : index
    Created on : Feb 6, 2023, 10:09:20 AM
    Author     : PHT
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Categories Section Begin -->
<section class="categories">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div
                    class="categories__item categories__large__item set-bg"
                    data-setbg="<c:url value="/assets/img/categories/category-1.jpg" />"
                    >
                    <div class="categories__text">
                        <h1>P-Sephora</h1>
                        <p>
                            Why wait? Give yourself the attraction you deserve!
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div
                            class="categories__item set-bg"
                            data-setbg="<c:url value="/assets/img/categories/chanel.jpg" />"
                            >
                            <div class="categories__text">
                                <h4>Chanel</h4>
                                <p>10+ items</p>
                                <a href="<c:url value="/shop/list.do?categoryId=1" />">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div
                            class="categories__item set-bg"
                            data-setbg="<c:url value="/assets/img/categories/gucci.jpg" />"
                            >
                            <div class="categories__text">
                                <h4>Gucci</h4>
                                <p>10+ items</p>
                                <a href="<c:url value="/shop/list.do?categoryId=2" />">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div
                            class="categories__item set-bg"
                            data-setbg="<c:url value="/assets/img/categories/valentino.jpg" />"
                            >
                            <div class="categories__text">
                                <h4>Valentino</h4>
                                <p>10+ items</p>
                                <a href="<c:url value="/shop/list.do?categoryId=3" />">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div
                            class="categories__item set-bg"
                            data-setbg="<c:url value="/assets/img/categories/lancome.jpg" />"
                            >
                            <div class="categories__text">
                                <h4>Lancome</h4>
                                <p>10+ items</p>
                                <a href="<c:url value="/shop/list.do?categoryId=4" />">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="section-title">
                    <h4>New product</h4>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">All</li>
                    <li data-filter=".CHANEL">Chanel</li>
                    <li data-filter=".GUCCI">Gucci</li>
                    <li data-filter=".VALENTINO">Valentino</li>
                    <li data-filter=".LANCÔME">Lanccôme</li>
                </ul>
            </div>
        </div>
        <div class="row property__gallery">
            <c:forEach var="product" items="${pList}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix <c:forEach var="cate" items="${cList}"><c:if test="${cate.id == product.categoryId}">${cate.name}</c:if></c:forEach>">
                            <div class="product__item sale">
                                <div
                                    class="product__item__pic set-bg"
                                    data-setbg="<c:url value="/assets/img/product/product-${product.id}_1.jpg" />"
                            >
                            <div class="label new">New</div>
                            <ul class="product__hover">
                                <li>
                                    <a href="<c:url value="/assets/img/product/product-${product.id}_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a>
                                </li>

                                <li>
                                    <a href="#"><span class="icon_bag_alt"></span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="<c:url value="/shop/detail.do?id=${product.id}" />">${product.name}</a></h6>

                            <div class="product__price">
                                <fmt:setLocale value="vi-VN"/>
                                <fmt:formatNumber value = "${product.price}" type = "currency"/>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="row d-flex justify-content-center">
            <a class="btn primary-btn text-white" href="<c:url value="/shop/list.do" />">
                More? Go to shop
                <i class="arrow_right"></i>
            </a>
        </div>
    </div>
</section>
<!-- Product Section End -->
