<%-- 
    Document   : index
    Created on : Feb 13, 2023, 4:56:11 PM
    Author     : Beyond Nguyen
--%>

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
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons fa fa-plus-circle"></i> <span>Add New Product</span></a>

                    </div>
                </div>
            </div>
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
                    <tr>
                        <td><img src="<c:url value="/assets/img/product/product-5_1.jpg" />" ></td>
                        <td>Thomas Hardy Thomas Hardy Thomas Hardy Thomas Hardy</td>
                        <td class="line-clamp">lorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad</td>
                        <td>5700000</td>
                        <td>0.2</td>
                        <td>Chanel</td>
                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/assets/img/product/product-5_1.jpg" />" ></td>
                        <td>Thomas Hardy Thomas Hardy Thomas Hardy Thomas Hardy</td>
                        <td class="line-clamp">lorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad</td>
                        <td>5700000</td>
                        <td>0.2</td>
                        <td>Chanel</td>
                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/assets/img/product/product-5_1.jpg" />" ></td>
                        <td>Thomas Hardy Thomas Hardy Thomas Hardy Thomas Hardy</td>
                        <td class="line-clamp">lorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad</td>
                        <td>5700000</td>
                        <td>0.2</td>
                        <td>Chanel</td>
                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/assets/img/product/product-5_1.jpg" />" ></td>
                        <td>Thomas Hardy Thomas Hardy Thomas Hardy Thomas Hardy</td>
                        <td class="line-clamp">lorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad</td>
                        <td>5700000</td>
                        <td>0.2</td>
                        <td>Chanel</td>
                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/assets/img/product/product-5_1.jpg" />" ></td>
                        <td>Thomas Hardy Thomas Hardy Thomas Hardy Thomas Hardy</td>
                        <td class="line-clamp">lorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad lorem ispum sadasd sdas das das  das d sdsa d sadlorem ispum sadasd sdas das das  das d sdsa d sad</td>
                        <td>5700000</td>
                        <td>0.2</td>
                        <td>Chanel</td>
                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons fa fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                        </td>
                    </tr>
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

<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">						
                    <h4 class="modal-title">Add Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" required>
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
<div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">						
                    <h4 class="modal-title">Edit Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" required>
                    </div>					
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
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
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>