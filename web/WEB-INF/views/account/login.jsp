<%-- 
    Document   : login
    Created on : Feb 2, 2023, 1:25:41 PM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <a href="<c:url value="/" />"><img src="<c:url value="/assets/img/logo.png" />" alt=""/></a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="wrap d-md-flex">
                    <div
                        class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last"
                        >
                        <div class="text w-100">
                            <h2>Welcome to login</h2>
                            <p class="text-white">Is a new member?</p>
                            <a href="<c:url value="/account/signup.do" />" class="btn btn-white btn-outline-white"
                               >Sign Up</a
                            >
                        </div>
                    </div>
                    <div class="login-wrap p-4 p-lg-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                            </div>

                        </div>
                        <form action="<c:url value="/account/login_handler.do">
                                  <c:if test="${redirect != null}"><c:param name="redirect" value="${redirect}"/></c:if>
                              </c:url>" class="signin-form" method="post">
                            <p class ="text-danger"> ${message} </p>

                            <div class="form-group mb-3">
                                <label class="label" for="email">Email</label>
                                <input
                                    id="email"
                                    name="email"
                                    type="text"
                                    class="form-control"
                                    placeholder="Email"
                                    value="${email}"
                                    required
                                    />
                            </div>

                            <div class="form-group mb-3">
                                <label class="label" for="password">Password</label>
                                <input
                                    id="password"
                                    name="pass"
                                    type="password"
                                    class="form-control"
                                    placeholder="Password"
                                    value="${pass}"
                                    required
                                    />
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50 text-left">
                                    <label class="checkbox-wrap checkbox-primary mb-0">Remember Me</label>
                                    <input class="checkmark mb-0" type="checkbox" value="1" name="remember"/>
                                </div>

                            </div>
                            <div class="form-group">
                                <button
                                    type="submit"
                                    class="form-control btn btn-primary submit px-3"
                                    >
                                    Sign In
                                </button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
