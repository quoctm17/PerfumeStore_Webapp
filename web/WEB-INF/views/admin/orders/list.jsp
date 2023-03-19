<%-- 
Document   : list
Created on : Feb 28, 2023, 4:16:03 PM
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
                        <h2>Manage <b>Orders</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addOrdersModal" class="btn btn-success" data-toggle="modal"><i class="material-icons fa fa-plus-circle"></i> <span>Add New Orders</span></a>

                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Date</th>
                        <th>Customer ID</th>
                        <th>Employee ID</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${list}">
                        <tr>
                            <td>${o.id}</td>
                            <td>${o.date}</td>
                            <td>${o.customerId}</td>
                            <td class="emp-id_${o.id}">${o.employeeId == 0 ? "NOT YET" : o.employeeId}</td>
                            <td>
                                <c:if test="${o.status == null}">
                                    <span class="order-status-${o.id} badge badge-warning">Pending</span>
                                </c:if>
                                <c:if test="${o.status != null}">
                                    <span class="order-status-${o.id} badge badge-${o.status == "Completed" ? "success" : "danger"}">${o.status}</span>
                                </c:if>
                            </td>
                            <td>
                                <a href="#!" onclick="handleAccept(${o.id})" class="accept ${o.status == "Failed" ? "disabled" : ""} accept-order-${o.id}"><i class="material-icons fa fa-check" data-toggle="tooltip" title="Accept"></i></a>
                                <a href="#detailOrdersModal" onclick="handleDetailOrder(${o.id})" class="seemore" data-toggle="modal"><i class="fa-solid fa-eye" data-toggle="tooltip" title="See more"></i></a>
                                <a href="#deleteOrdersModal" onclick="handleRejectModal(${o.id})" class="delete ${o.status == "Completed" ? "disabled" : ""} delete-order-${o.id}" data-toggle="modal"><i class="fa-solid fa-xmark" data-toggle="tooltip" title="Reject"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? "disabled" : ""}"><a href="<c:url value="/admin/orders/list.do?page=${currentPage - 1}" />"  class="page-link">Previous</a></li>
                        <c:forEach var="page" begin="1" end="${numOfPages}">
                        <li class="page-item ${currentPage == page ? "active" : ""}"><a href="<c:url value="/admin/orders/list.do?page=${page}" />" class="page-link">${page}</a></li>
                        </c:forEach>
                    <li class="page-item ${currentPage == numOfPages ? "disabled" : ""}"><a href="<c:url value="/admin/orders/list.do?page=${currentPage + 1}" />" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>        
</div>

<!-- Add Modal HTML -->
<div id="addOrdersModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<c:url value="/admin/Orders/create.do" />">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Orders</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text"  name="name" class="form-control" required>
                    </div>
                    <div class="row">
                        <div class="form-group col">
                            <label>Phone</label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                        <div class="form-group col">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <input type="text" name="category" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>  
                    <div class="form-group">
                        <label>Delivery Address</label>
                        <input type="text" name="deliveryAddress" class="form-control" required>
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

<!-- detail Modal HTML -->
<div id="detailOrdersModal" class="modal fade">
    <div class="modal-dialog" style="max-width: 680px;">
        <div class="modal-content">
            <div class="modal-header">						
                <h4 class="modal-title">Edit Product</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body" id="showTable">

            </div>
            <div class="modal-footer">
                <input class="btn btn-info" data-dismiss="modal" value="Okay">
            </div>
        </div>
    </div>
</div>

<!-- Delete Modal HTML -->
<div id="deleteOrdersModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">						
                    <h4 class="modal-title">Reject Order</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <p>Are you sure you want to reject these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="hidden" name="id" value="delete">
                    <button onclick="handleReject()" type="submit" class="btn btn-danger" data-dismiss="modal" >Reject</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    const handleAccept = id => {

        const empId = "${sessionScope.acc.id}";
        const empIdE = document.querySelector('td.emp-id_' + id);
        empIdE.innerHTML = empId;

        const label = document.querySelector('span.order-status-' + id);

        label.classList.remove("badge-warning");
        label.classList.add("badge-success");
        label.innerHTML = 'Completed';

        const deleteBtn = document.querySelector('a.delete-order-' + id);
        deleteBtn.classList.add("disabled");

        const url = "<c:url value="/admin/orders/accept.do?&id=" />" + id;

        $.ajax({
            type: 'GET',
            url: url,
            success: function (data) {
            }
        });
    }

    const handleDetailOrder = (id) => {
        const url = "<c:url value="/admin/orders/read.do?&id=" />" + id;

        $.ajax({
            type: 'GET',
            url: url,
            success: function (data) {
                const res = JSON.parse(data)
                constructTable(res)
            }
        });
    }

    const handleRejectModal = (id) => {
        document.querySelector('#deleteOrdersModal input[name=id]').value = id;
    }

    const handleReject = () => {
        const id = document.querySelector('#deleteOrdersModal input[name=id]').value;

        const empId = "${sessionScope.acc.id}";
        const empIdE = document.querySelector('td.emp-id_' + id);
        empIdE.innerHTML = empId;

        const label = document.querySelector('span.order-status-' + id);

        label.classList.remove("badge-warning");
        label.classList.add("badge-danger");
        label.innerHTML = 'Failed';

        const acceptBtn = document.querySelector('a.accept-order-' + id);
        acceptBtn.classList.add("disabled");

        const url = "<c:url value="/admin/orders/reject.do?&id=" />" + id;

        $.ajax({
            type: 'GET',
            url: url,
            success: function (data) {
            }
        });
    }

    const constructTable = data => {
        let col = [];
        for (let i = 0; i < data.length; i++) {
            for (let key in data[i]) {
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
        }

        // Create a table.
        const table = document.createElement("table");
        table.classList.add('table');
        table.classList.add('table-hover');
        // Create table header row using the extracted headers above.
        let tr = table.insertRow(-1);                   // table row.

        for (let i = 0; i < col.length; i++) {
            let th = document.createElement("th");      // table header.
            th.innerHTML = col[i];
            tr.appendChild(th);
        }

        // add json data to the table as rows.
        for (let i = 0; i < data.length; i++) {

            tr = table.insertRow(-1);

            for (let j = 0; j < col.length; j++) {
                let tabCell = tr.insertCell(-1);
                tabCell.innerHTML = data[i][col[j]];
            }
        }

        // Now, add the newly created table with json data, to a container.
        const divShowData = document.getElementById('showTable');
        divShowData.innerHTML = "";
        divShowData.appendChild(table);
    }
</script>
