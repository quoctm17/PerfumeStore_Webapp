<%-- 
    Document   : info
    Created on : Feb 28, 2023, 3:14:40 PM
    Author     : Beyond Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-xl p-5">
    <!-- Tab bar navigation-->
    <ul class="sub-nav" style="margin-bottom: -1px" activeindex="2">
        <li class="sub-nav__item" label="Billing"><a href="<c:url value="/profile/info.do" />" class="active"><i class="fa fa-info"></i><span>Information</span></a></li>
        <li class="sub-nav__item" label="Billing"><a href="<c:url value="/profile/security.do" />"><i class="fa fa-lock"></i><span>Security</span></a></li>
    </ul>
    <!-- Divider-->
    <hr class="mt-0 mb-5">
    <!-- Profile content row-->
    <div class="row gx-5">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card card-raised mb-3">
                <div class="card-body p-5">
                    <div class="card-title">Profile Image</div>
                    <div class="card-subtitle mb-4">This image will be publicly visible to other users.</div>
                    <div class="text-center">
                        <!-- Profile picture image-->
                        <img id="avatar-preview" class="img-fluid rounded-circle mb-1" src="<c:url value="/assets/img/account/avatar-${sessionScope.acc.id}.jpg" />" alt="..." style="width: 150px; height: 150px; object-fit: cover;">
                        <!-- Profile picture help block-->
                        <div class="caption text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                        <!-- Profile picture upload button-->
                        <label for="avatar" class="btn btn-primary mdc-ripple-upgraded" type="button">
                            Upload new image
                            <i class="fa fa-upload"></i>
                        </label>
                    </div>
                </div>
            </div>

            <div class="card card-raised mb-5">
                <div class="card-body p-5">
                    <c:if test="${acc.role == 'ROLE_CUSTOMER'}">
                        <div class="card-title">Your category</div>
                        <div class="card-subtitle mb-4">Bye more to obtain higher level and get more promotion</div>
                        <div class="text-center">
                            <!-- Profile picture image-->
                            <img class="img-fluid rounded-circle mb-1" src="<c:url value="/assets/img/customer-level/${cus.category}.jpg" />" alt="..." style="width: 150px; height: 150px; object-fit: cover;">
                            <div class="caption text-muted mb-4">${cus.category} Customer</div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card card-raised mb-5">
                <div class="card-body p-5">
                    <div class="card-title">Account Details</div>
                    <div class="card-subtitle mb-4">Review and update your account information below.</div>
                    <form method="post" action="<c:url value="/profile/updateInfo.do" />" enctype="multipart/form-data">
                        <!-- Form Group (username)-->
                        <div class="mb-4 form-group">
                            <label class="label">Username</label>
                            <input class="w-100 form-control" name="username" value="${acc.user}">
                        </div>
                        <!-- Form Row-->
                        <div class="row">
                            <!-- Form Group (email)-->
                            <div class="col-md-6">
                                <div class="form-group mb-4">
                                    <label class="label">Email</label>
                                    <input class="w-100 form-control" name="email" value="${acc.email}">
                                </div>
                            </div>
                            <!-- Form Group (phone)-->
                            <div class="col-md-6">
                                <div class="form-group mb-4">
                                    <label class="label">Phone</label>
                                    <input class="w-100 form-control" name="phone" value="${acc.phone}">
                                </div>
                            </div>
                        </div>
                        <!-- Form Group (address)-->
                        <div class="mb-4 form-group">
                            <label class="label">Address</label>
                            <input class="w-100 form-control" name="address" value="${acc.address}">
                        </div>

                        <c:if test="${acc.role == 'ROLE_CUSTOMER'}">
                            <div class="mb-4 form-group">
                                <label class="label">Delivery address</label>
                                <input class="w-100 form-control" name="deliveryAddress" value="${cus.deliveryAddress}">
                            </div>
                        </c:if>
                        <input id="avatar" name="avatar" type="file" accept="image/*" style="display: none" />
                        <input type="hidden" name="isAvaChange" value="false">
                        <!-- Save changes button-->
                        <div class="text-end"><button class="btn btn-primary" type="submit">Save changes</button></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelector("#avatar").addEventListener("change", (e) => {
        document.querySelector("#avatar-preview").src = URL.createObjectURL(e.target.files[0]);
        document.querySelector("input[name=isAvaChange]").value = true;
    })
</script>
