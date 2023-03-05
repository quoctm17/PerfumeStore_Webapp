<%-- 
    Document   : shopping
    Created on : Feb 14, 2023, 10:15:49 AM
    Author     : Beyond Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                    <div class="card-heading ${categoryId == null ? "active" : ""}">
                                        <a href="<c:url value="/shop/list.do"/>">All</a>
                                    </div>  
                                </div>
                                <c:forEach var="category" items="${cList}">
                                    <div class="card">
                                        <div class="card-heading ${category.id == categoryId ? "active" : ""}">
                                            <a href="<c:url value="/shop/list.do">
                                                   <c:forEach items="${param}" var="entry">
                                                       <c:if test="${entry.key == 'search'}">
                                                           <c:param name="${entry.key}" value="${entry.value}" />
                                                       </c:if>
                                                   </c:forEach>
                                                   <c:param name="category" value="${category.id}" />
                                               </c:url>">${category.name}</a>
                                        </div>
                                    </div>
                                </c:forEach>


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
                                    <div class="card-heading ${sort == "newest" ? "active" : ""}">
                                        <a href="<c:url value="/shop/list.do">
                                               <c:forEach items="${param}" var="entry">
                                                   <c:if test="${entry.key != 'sort'}">
                                                       <c:param name="${entry.key}" value="${entry.value}" />
                                                   </c:if>
                                               </c:forEach>
                                               <c:param name="sort" value="newest" />
                                           </c:url>">Newest</a>
                                    </div>  
                                </div>
                                <div class="card">
                                    <div class="card-heading ${sort == "popular" ? "active" : ""}">
                                        <a href="<c:url value="/shop/list.do">
                                               <c:forEach items="${param}" var="entry">
                                                   <c:if test="${entry.key != 'sort'}">
                                                       <c:param name="${entry.key}" value="${entry.value}" />
                                                   </c:if>
                                               </c:forEach>
                                               <c:param name="sort" value="popular" />
                                           </c:url>">Best seller</a>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading ${sort == "low_price" ? "active" : ""}">
                                        <a href="<c:url value="/shop/list.do">
                                               <c:forEach items="${param}" var="entry">
                                                   <c:if test="${entry.key != 'sort'}">
                                                       <c:param name="${entry.key}" value="${entry.value}" />
                                                   </c:if>
                                               </c:forEach>
                                               <c:param name="sort" value="low_price" />
                                           </c:url>">Price: low to high</a>
                                    </div>

                                </div>
                                <div class="card">
                                    <div class="card-heading ${sort == "high_price" ? "active" : ""}">
                                        <a href="<c:url value="/shop/list.do">
                                               <c:forEach items="${param}" var="entry">
                                                   <c:if test="${entry.key != 'sort'}">
                                                       <c:param name="${entry.key}" value="${entry.value}" />
                                                   </c:if>
                                               </c:forEach>
                                               <c:param name="sort" value="high_price" />
                                           </c:url>" >Price: hight to low</a>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="row">
                    <c:forEach var="product" items="${displayList}">
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
                                    <h6><a href="<c:url value="/shop/detail.do?id=${product.id}&quantity=1"/>">${product.name}</a></h6>
                                    <div class="product__price">
                                        <fmt:setLocale value="vi-VN"/>
                                        <fmt:formatNumber value = "${product.price}" type = "currency"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-lg-12 text-center">
                        <div class="pagination__option">                            
                            <a 
                                class="${currentPage == 1 ? "disabled" : ""}"
                                href="<c:url value="/shop/list.do">
                                    <c:forEach items="${param}" var="entry">
                                        <c:if test="${entry.key != 'page'}">
                                            <c:param name="${entry.key}" value="${entry.value}" />
                                        </c:if>
                                    </c:forEach>
                                    <c:param name="page" value="${currentPage - 1}" />
                                </c:url>"><i class="fa fa-angle-left"></i></a>

                            <c:forEach var="page" begin="1" end="${numOfPages}">
                                <a 
                                    class="${currentPage == page ? "active" : ""}"
                                    href="<c:url value="/shop/list.do">
                                        <c:forEach items="${param}" var="entry">
                                            <c:if test="${entry.key != 'page'}">
                                                <c:param name="${entry.key}" value="${entry.value}" />
                                            </c:if>
                                        </c:forEach>
                                        <c:param name="page" value="${page}" />
                                    </c:url>"
                                    >
                                    ${page}
                                </a>
                            </c:forEach> 

                            <a 
                                class="${currentPage == numOfPages ? "disabled" : ""}"
                                href="<c:url value="/shop/list.do">
                                    <c:forEach items="${param}" var="entry">
                                        <c:if test="${entry.key != 'page'}">
                                            <c:param name="${entry.key}" value="${entry.value}" />
                                        </c:if>
                                    </c:forEach>
                                    <c:param name="page" value="${currentPage + 1}" />
                                </c:url>"><i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

