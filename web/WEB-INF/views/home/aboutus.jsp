<%-- 
    Document   : aboutus
    Created on : Feb 6, 2023, 10:10:06 AM
    Author     : PHT
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
                    <span>About us</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Blog Details Section Begin -->
<section class="blog-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <div class="blog__details__content">
                    <div class="blog__details__item">
                        <img src="img/blog/details/blog-details.jpg" alt="">
                        <div class="blog__details__item__title">
                            <h4>20 years, a journey of determination, perseverance and effort...</h4>
                        </div>
                    </div>
                    <div class="blog__details__desc" id = "introduction">
                        <h4 class="mb-3">Introduction</h4>
                        <p>Welcome to our online perfume store, where we provide a professional platform to explore and purchase high-quality fragrances for both men and women. Our website is designed to cater to your needs and provide you with an extensive collection of perfumes, colognes, and fragrance gift sets. Perfumes have been an essential part of our lives for centuries, and they have always held a special place in our hearts. A great perfume can transform your mood, enhance your confidence, and help you make a lasting impression. At our online perfume store, we bring you a wide variety of fragrances to choose from, so you can find the perfect scent for any occasion.</p>
                    </div>
                    <div class="blog__details__desc" id = "mission">
                        <h4 class="mb-3">Our mission</h4>
                        <p>Our mission is to provide our customers with an unparalleled shopping experience, making it easy for you to discover and purchase the best fragrances available on the market. We are passionate about perfumes and believe that everyone deserves to experience the joy of wearing a great scent. That's why we have curated a collection of fragrances that includes both classic and modern scents, so you can find the perfect perfume that fits your personality and style. Our team is dedicated to providing you with exceptional customer service, from the moment you start exploring our website until you receive your purchase.</p>
                    </div>
                    <div class="blog__details__quote">
                        <div class="icon"><i class="fa fa-quote-left"></i></div>
                        <p>"Sometimes, you have to give up. Sometimes, knowing when to give up, when to try something else, is genius. Giving up doesn’t mean stopping. Don’t ever stop." — Phil Knight, co-founder of Nike</p>
                    </div>
                    <div class="blog__details__desc" id = "collection">
                        <h4 class="mb-3">Our collection</h4>
                        <p>We offer a vast collection of fragrances for both men and women, with scents that are sure to suit any taste. Our perfumes come from some of the most popular brands in the industry, and we take pride in the quality of the products we offer. Our collection includes classic scents that have stood the test of time, as well as modern fragrances that are breaking new ground in the industry. We also offer niche fragrances that are more exclusive and harder to find, for those who want something truly unique.

                            For women, we offer a range of floral and fruity scents, as well as more intense and sophisticated fragrances. Some of our most popular perfumes for women include Chanel No. 5, Dior J'adore, and Yves Saint Laurent Black Opium. For men, we offer classic woody scents, fresh aquatic fragrances, and more intense and spicy colognes. Some of our most popular men's fragrances include Acqua Di Gio by Giorgio Armani, Aventus by Creed, and Bleu de Chanel by Chanel.</p>
                    </div>
                    <div class="blog__details__desc" id = "gift">
                        <h4 class="mb-3">Fragrance Gift Sets</h4>
                        <p>We also offer a wide range of fragrance gift sets that make the perfect gift for any occasion. Our gift sets come in various sizes and contain everything you need to smell fantastic from head to toe. They are a great way to explore new scents, or you can even mix and match fragrances to create a signature scent that's unique to you.</p>
                    </div>
                    <div class="blog__details__desc" id = "experience">
                        <h4 class="mb-3">Shopping Experience</h4>
                        <p>At our online perfume store, we have made it easy for you to find your perfect fragrance. Our website is user-friendly, and our search function allows you to filter fragrances by brand, gender, and price. We also offer detailed product descriptions and reviews, so you can make an informed decision before making a purchase. We pride ourselves on the speed and efficiency of our shipping process, and we offer free shipping on orders over a certain amount. We also offer easy returns and exchanges if you are not satisfied with your purchase.</p>
                    </div>
                    <div class="blog__details__desc" id = "conclusion">
                        <h4 class="mb-3">Conclusion</h4>
                        <p>In conclusion, we are a dedicated team of perfume lovers who are passionate about helping you find the perfect scent for any occasion. Our online perfume store offers a wide range of fragrances for both men and women, as well as fragrance gift sets that make the perfect gift for your loved ones. Our collection includes classic and modern scents from some of the most popular brands in the industry, as well as niche fragrances that are harder to find. We are committed to providing our customers with exceptional customer service, and we are confident that you will find your</p>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__item">
                        <div class="section-title">
                            <h4>Content</h4>
                        </div>
                        <ul>
                            <li><a href="#introduction">Introduction</a></li>
                            <li><a href="#mission">Our mission </a></li>
                            <li><a href="#collection">Our collection </a></li>
                            <li><a href="#gift">Fragrance gift set</a></li>
                            <li><a href="#experience">Shopping experience </a></li>
                            <li><a href="#conclusion">Conclusion </a></li>
                        </ul>
                    </div>
                    <div class="blog__sidebar__item">
                        <div class="section-title">
                            <h4>Tags cloud</h4>
                        </div>
                        <div class="blog__sidebar__tags">
                            <a href="#!">Determination</a>
                            <a href="#!">Perseverance</a>
                            <a href="#!">Effort</a>
                            <a href="#!">Success</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- Blog Details Section End -->

<!-- Banner Section Begin -->
<section class="banner set-bg" data-setbg="<c:url value="/assets/img/comment-banner.jpg"/>">
    <div class="container">
        <div class="row">
            <div class="col-xl-7 col-lg-8 m-auto">
                <div class="banner__slider owl-carousel">
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>The Chloe Collection</span>
                            <h1>The Project Jacket</h1>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>The Chloe Collection</span>
                            <h1>The Project Jacket</h1>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>The Chloe Collection</span>
                            <h1>The Project Jacket</h1>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End -->

