<%-- 
    Document   : revenue
    Created on : Feb 14, 2023, 11:12:28 AM
    Author     : Beyond Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--hien thi doanh thu san pham-->
<h2>Revenue page</h2>
<h3>Design later</h3>
<form action="<c:url value="/admin/revenue.do" />">
    <select name="year" >
        <%
            for (int i = 2015; i < 2024; i++) {
        %>
        <option value="<%= i%>" ><%=i%></option>
        <%  }
        %>
    </select>
    <button type="submit" class="btn btn-success" name="op" value="Show Turnover By Year">Show Turnover By Year</button>
</form>

<form action="<c:url value="/admin/revenue.do" />">
    <input type="date" name="date" value="" />
    <button type="submit" class="btn btn-success" name="op" value="Show Turnover By Date">Show Turnover By Date</button>
</form>

<form action="<c:url value="/admin/revenue.do" />">
    <input type="number" name="week" value="" />
    <select name="year" >
        <%
            for (int i = 2015; i < 2024; i++) {
        %>
        <option value="<%= i%>" ><%=i%></option>
        <%  }
        %>
    </select>
    <button type="submit" class="btn btn-success" name="op" value="Show Turnover By Week">Show Turnover By Week</button>
</form>

<form action="<c:url value="/admin/revenue.do" />">
    <select name="month" >
        <%
            for (int i = 0; i < 13; i++) {
        %>
        <option value="<%= i%>" ><%=i%></option>
        <%  }
        %>
    </select>
    <select name="year" >
        <%
            for (int i = 2015; i < 2024; i++) {
        %>
        <option value="<%= i%>" ><%=i%></option>
        <%  }
        %>
    </select>
    <button type="submit" class="btn btn-success" name="op" value="Show Turnover By Month">Show Turnover By Month</button>
    <br><br>
    <h4>${requestScope.MESSAGE}</h4>
</form>