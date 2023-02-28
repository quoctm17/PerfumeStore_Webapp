<%-- 
    Document   : category
    Created on : Feb 24, 2023, 6:55:30 AM
    Author     : Beyond Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid p-lg-5">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Category</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addCategoryModal" class="btn btn-success" data-toggle="modal"><i class="material-icons fa fa-plus-circle"></i> <span>Add New Category</span></a>

                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${list}">
                        <tr>
                            <td>${category.id}</td>
                            <td>${category.name}</td>
                            <td class="line-clamp">${category.description}</td>
                            <td>
                                <a href="#editCategoryModal" onclick="handleEditCate(${category.id})" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                                <a href="#deleteCategoryModal" onclick="handleDeleteCate(${category.id})" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>        
</div>

<!-- Add Modal HTML -->
<div id="addCategoryModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/category/create.do" />">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Category</h4>
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
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>
                
<!-- Edit Modal HTML -->
<div id="editCategoryModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/category/update.do" />">
                <div class="modal-header">						
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Id</label>
                        <input style="pointer-events: none" type="text" name="id" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text"  name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" name="description" required></textarea>
                    </div>  	
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Update">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Delete Modal HTML -->
<div id="deleteCategoryModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/category/delete.do" />">
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
                    <input type="hidden" name="id" value="delete">
                    <button type="submit" class="btn btn-danger" >Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const handleEditCate = (id) => {
        const url = "<c:url value="/admin/category/read.do?&id=" />" + id;
        
        $.ajax({
            type: 'GET',
            url: url,
            success: function (data) {
                const cate = JSON.parse(data);
                document.querySelector('#editCategoryModal input[name=id]').value = cate.id;
                document.querySelector('#editCategoryModal input[name=name]').value = cate.name;
                document.querySelector('#editCategoryModal textarea[name=description]').value = cate.description;
            }
        });
    }
    
    const handleDeleteCate = (id) => {
        document.querySelector('#deleteCategoryModal input[name=id]').value = id;
    }
</script>