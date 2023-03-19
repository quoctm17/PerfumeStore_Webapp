<%-- 
    Document   : index
    Created on : Feb 13, 2023, 4:56:11 PM
    Author     : Beyond Nguyen
--%>

<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--list danh sach product de admin CRUD-->

<div class="container-fluid p-lg-5">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Product</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addProductModal" class="btn btn-success" data-toggle="modal"><i class="material-icons fa fa-plus-circle"></i> <span>Add New Product</span></a>

                    </div>
                </div>
            </div>

            <%
                List<Category> listCategory = (List<Category>) request.getAttribute("LIST_CATEGORY");
            %>


            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th style="width: 100px"></th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Discount</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${requestScope.LIST_ALL_PRODUCTS}">


                        <tr>
                            <td><img src="<c:url value="/assets/img/product/product-${p.id}_1.jpg" />" ></td>
                            <td>${p.name}</td>
                            <td class="line-clamp">${p.description}</td>
                            <td>${p.price}</td>
                            <td>${p.discount}</td>
                            <td>${p.categoryId}</td>
                            <td>
                                <a href="#editProductModal" onclick="handleEditCate(${p.id})" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                                <a href="#deleteProductModal"  onclick="handleDeleteCate(${p.id})" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? "disabled" : ""}"><a href="<c:url value="/admin/product/list.do?page=${currentPage - 1}" />"  class="page-link">Previous</a></li>
                        <c:forEach var="page" begin="1" end="${numOfPages}">
                        <li class="page-item ${currentPage == page ? "active" : ""}"><a href="<c:url value="/admin/product/list.do?page=${page}" />" class="page-link">${page}</a></li>
                        </c:forEach>
                    <li class="page-item ${currentPage == numOfPages ? "disabled" : ""}"><a href="<c:url value="/admin/product/list.do?page=${currentPage + 1}" />" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>        
</div>


<!-- Add Modal HTML -->
<div id="addProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/product/create.do" />" enctype="multipart/form-data" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Add product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" name="description" required></textarea>
                    </div>
                    <div class="row">
                        <div class="form-group col">
                            <label>Price</label>
                            <input type="number" min="0" name="price" class="form-control" required>
                        </div>
                        <div class="form-group col">
                            <label>Discount</label>
                            <input type="number" step="0.1" min="0" max="1"  name="discount" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select name="categoryId" class="form-control">
                            <%
                                for (Category ca : listCategory) {
                            %>
                            <option value="<%= ca.getId()%>"><%= ca.getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col">
                            <img class="col preview-1" src="" />
                        </div>
                        <div class="col">
                            <img class="col preview-2" src="" />
                        </div>
                        <div class="col">
                            <img class="col preview-3" src="" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col">
                            <label>Image</label>
                            <input onchange="handleChangeImage(1, '#addProductModal')" type="file" accept="image/*" name="pImg-1" class="form-control-file input-file-1" required>
                        </div>
                        <div class="form-group col">
                            <label>Image</label>
                            <input onchange="handleChangeImage(2, '#addProductModal')" type="file" accept="image/*" name="pImg-2" class="form-control-file input-file-2" required>
                        </div>
                        <div class="form-group col">
                            <label>Image</label>
                            <input onchange="handleChangeImage(3, '#addProductModal')" type="file" accept="image/*" name="pImg-3" class="form-control-file input-file-3" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <button type="submit" class="btn btn-success" name="op" value="create">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit Modal HTML -->
<div id="editProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/product/update.do" />" enctype="multipart/form-data" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group col">
                            <label>Id</label>
                            <input style="pointer-events: none" type="text" name="id" class="form-control" required>
                        </div>
                        <div class="form-group col">
                            <label>Category</label>
                            <select name="categoryId" class="form-control">
                                <%
                                    for (Category ca : listCategory) {
                                %>
                                <option value="<%= ca.getId()%>"><%= ca.getName()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" name="description" required></textarea>
                    </div>
                    <div class="row">
                        <div class="form-group col">
                            <label>Price</label>
                            <input type="number" min="0" name="price" class="form-control" required>
                        </div>
                        <div class="form-group col">
                            <label>Discount</label>
                            <input type="number" step="0.1" min="0" max="1"  name="discount" class="form-control" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <img class="col preview-1" src="<c:url value="/assets/img/product/product-1_1.jpg" />" />
                        </div>
                        <div class="col">
                            <img class="col preview-2" src="<c:url value="/assets/img/product/product-1_2.jpg" />" />
                        </div>
                        <div class="col">
                            <img class="col preview-3" src="<c:url value="/assets/img/product/product-1_3.jpg" />" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col">
                            <label>Image</label>
                            <input onchange="handleChangeImage(1, '#editProductModal')" type="file" accept="image/*" name="pImg-1" class="form-control-file input-file-1" required>
                        </div>
                        <div class="form-group col">
                            <label>Image</label>
                            <input onchange="handleChangeImage(2, '#editProductModal')" type="file" accept="image/*" name="pImg-2" class="form-control-file input-file-2" required>
                        </div>
                        <div class="form-group col">
                            <label>Image</label>
                            <input onchange="handleChangeImage(3, '#editProductModal')" type="file" accept="image/*" name="pImg-3" class="form-control-file input-file-3" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <button type="submit" class="btn btn-info" name="op" value="update_handler">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Delete Modal HTML -->
<div id="deleteProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/product/delete.do" />">
                <div class="modal-header">						
                    <h4 class="modal-title">Delete Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="hidden" name="id">
                    <button type="submit" class="btn btn-danger" name="op" value="delete">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const handleEditCate = (id) => {
        const url = "<c:url value="/admin/product/read.do?&id=" />" + id;

        $.ajax({
            type: 'GET',
            url: url,
            success: function (data) {
                const cate = JSON.parse(data);
                document.querySelector('#editProductModal input[name=id]').value = cate.id;
                document.querySelector('#editProductModal input[name=name]').value = cate.name;
                document.querySelector('#editProductModal textarea[name=description]').value = cate.description;
                document.querySelector('#editProductModal input[name=price]').value = cate.price;
                document.querySelector('#editProductModal input[name=discount]').value = cate.discount;
                for (let i = 1; i <= 3; i++) {
                    document.querySelector('#editProductModal img.preview-' + i).src = "<c:url value="/assets/img/product/" />" + "product-" + id + "_" + i + ".jpg"
                }
            }
        });
    }

    const handleDeleteCate = (id) => {
        document.querySelector('#deleteProductModal input[name=id]').value = id;
    }

    function handleChangeImage(i, id) {
        const e = document.querySelector(id + ' .input-file-' + i);
        document.querySelector(id + ' img.preview-' + i).src = URL.createObjectURL(e.files[0]);
    }
</script>