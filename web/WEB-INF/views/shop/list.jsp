<%-- 
    Document   : shopping
    Created on : Feb 14, 2023, 10:15:49 AM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="<c:url value="/" />"><i class="fa fa-home"></i> Home</a>
                    <span>Shop</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="shop__sidebar">
                    <div class="sidebar__categories">
                        <div class="section-title">
                            <h4>Categories</h4>
                        </div>
                        <div class="categories__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading active">
                                        <a>All</a>
                                    </div>  
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a>Chanel</a>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a>Gucci</a>
                                    </div>

                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a >Accessories</a>
                                    </div>

                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a >Cosmetic</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__categories">
                        <div class="section-title">
                            <h4>Shop by</h4>
                        </div>
                        <div class="categories__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading active">
                                        <a>Newest</a>
                                    </div>  
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a>Best seller</a>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a>Price: low to high</a>
                                    </div>

                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a >Price: hight to low</a>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/assets/img/product/product-2_1.jpg" />">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li><a href="<c:url value="/assets/img/product/product-2_1.jpg" />" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Furry hooded parka</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 text-center">
                        <div class="pagination__option">                            
                            <a href="#"><i class="fa fa-angle-left"></i></a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

