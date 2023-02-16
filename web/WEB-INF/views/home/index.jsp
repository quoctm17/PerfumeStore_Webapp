<%-- 
    Document   : index
    Created on : Feb 6, 2023, 10:09:20 AM
    Author     : PHT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                <p>358 items</p>
                                <a href="#">Shop now</a>
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
                                <p>273 items</p>
                                <a href="#">Shop now</a>
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
                                <p>159 items</p>
                                <a href="#">Shop now</a>
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
                                <p>792 items</p>
                                <a href="#">Shop now</a>
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
                    <li data-filter=".women">Chanel</li>
                    <li data-filter=".men">Gucci</li>
                    <li data-filter=".kid">Valentino</li>
                    <li data-filter=".accessories">Lancome</li>
                </ul>
            </div>
        </div>
        <div class="row property__gallery">
            <div class="col-lg-3 col-md-4 col-sm-6 mix women">
                <div class="product__item">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <div class="label new">New</div>
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Buttons tweed blazer</a></h6>

                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix men">
                <div class="product__item">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Flowy striped skirt</a></h6>

                        <div class="product__price">$ 49.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix accessories">
                <div class="product__item">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <div class="label stockout">out of stock</div>
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Cotton T-Shirt</a></h6>

                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix cosmetic">
                <div class="product__item">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Slim striped pocket shirt</a></h6>

                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix kid">
                <div class="product__item">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Fit micro corduroy shirt</a></h6>

                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div
                class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic"
                >
                <div class="product__item sale">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <div class="label sale">Sale</div>
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Tropical Kimono</a></h6>

                        <div class="product__price">$ 49.0 <span>$ 59.0</span></div>
                    </div>
                </div>
            </div>
            <div
                class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic"
                >
                <div class="product__item">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Contrasting sunglasses</a></h6>

                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div
                class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic"
                >
                <div class="product__item sale">
                    <div
                        class="product__item__pic set-bg"
                        data-setbg="<c:url value="assets/img/product/product-1_1.jpg" />"
                        >
                        <div class="label">Sale</div>
                        <ul class="product__hover">
                            <li>
                                <a href="<c:url value="assets/img/product/product-1_1.jpg" />" class="image-popup"
                                   ><span class="arrow_expand"></span
                                    ></a>
                            </li>

                            <li>
                                <a href="#"><span class="icon_bag_alt"></span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Water resistant backpack</a></h6>

                        <div class="product__price">$ 49.0 <span>$ 59.0</span></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row d-flex justify-content-center">
            <a class="btn primary-btn text-white" href="<c:url value="/product/shopping.do" />">
                More? Go to shop
                <i class="arrow_right"></i>
            </a>
        </div>
    </div>
</section>
<!-- Product Section End -->
