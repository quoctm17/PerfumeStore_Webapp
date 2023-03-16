<%-- 
    Document   : revenue
    Created on : Feb 14, 2023, 11:12:28 AM
    Author     : Beyond Nguyen
--%>

<%@page import="java.util.Calendar"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String[] MONTHS = {
        "January", "February", "March", "April",
        "May", "June", "July", "August",
        "September", "October", "November", "December"
    };

    int CURRENT_YEAR = Calendar.getInstance().get(Calendar.YEAR);
%>


<!--hien thi doanh thu san pham-->
<div class="container-fluid p-3">
    <!-- Tab bar navigation-->
    <ul class="sub-nav row" style="margin-bottom: -1px" activeindex="2">
        <li class="sub-nav__item col" ><a href="<c:url value="/admin/revenue/list.do?time=daily" />" class="${time == "daily" ? "active" : ""}"><i class="fa-solid fa-filter-circle-dollar"></i><span>Daily</span></a></li>
        <li class="sub-nav__item col" ><a href="<c:url value="/admin/revenue/list.do?time=monthly" />" class="${time == "monthly" ? "active" : ""}"><i class="fa-solid fa-filter-circle-dollar"></i><span>Monthly</span></a></li>
        <li class="sub-nav__item col" ><a href="<c:url value="/admin/revenue/list.do?time=yearly" />" class="${time == "yearly" ? "active" : ""}"><i class="fa-solid fa-filter-circle-dollar"></i></i><span>Yearly</span></a></li>
    </ul>
    <!-- Divider-->
    <hr class="mt-0 mb-5">
    <!-- Profile content row-->
    <div class="row gx-5">
        <div class="col-xl-9">
            <div class="card card-raised mb-3">
                <div class="card-body p-3">
                    <canvas id="revenue-chart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-xl-3">
            <div class="card card-raised mb-3">
                <div class="card-body p-3">
                    <div class="card-title">Display by</div>
                    <form id="chart-option">
                        <table cellpadding="4">
                            <tbody>
                                <c:if test="${time == 'daily'}">
                                <div class="form-group">
                                    <tr>
                                        <td><label>Month</label></td>
                                        <td><select class="form-control-sm" name="month" onchange="handleOption()">
                                                <c:forEach var="month" items="<%= MONTHS%>" varStatus="loop">
                                                    <option value="${loop.count}">${month}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </div>
                            </c:if>

                            <c:if test="${time != 'yearly'}">
                                <div class="form-group">
                                    <tr>
                                        <td><label>Year</label></td>
                                        <td><select class="form-control-sm" name="year" onchange="handleOption()">
                                                <c:forEach begin="<%=CURRENT_YEAR - 10%>" end="<%=CURRENT_YEAR%>" varStatus="loop" >
                                                    <option value="${loop.index}">${loop.index}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </div>
                            </c:if>

                            <c:if test="${time == 'yearly'}">
                                <div class="form-group">
                                    <tr>
                                        <td><label>From</label></td>
                                        <td><select class="form-control-sm" name="year" onchange="handleOption()">
                                                <c:forEach begin="<%=CURRENT_YEAR - 10%>" end="<%=CURRENT_YEAR%>" varStatus="loop" >
                                                    <option value="${loop.index}">${loop.index}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </div>
                                <div class="form-group">
                                    <tr>
                                        <td><label>To</label></td>
                                        <td><select class="form-control-sm" name="endYear" onchange="handleOption()">
                                                <c:forEach begin="<%=CURRENT_YEAR - 10%>" end="<%=CURRENT_YEAR%>" varStatus="loop" >
                                                    <option value="${loop.index}">${loop.index}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </div>
                            </c:if>

                            </tbody>
                        </table>
                        <hr class="mt-4"/>
                        <div>
                            <a onclick="handleOption(type = 'bar')" style="padding:12px 2px; display: block; cursor: pointer">
                                <i class="fa-solid fa-chart-simple"></i>
                                <span style="margin-left: 4px">Bar chart</span>
                            </a>
                        </div>
                        <div>
                            <a onclick="handleOption(type = 'line')" style="padding:12px 2px; display: block; cursor: pointer">
                                <i class="fa-solid fa-chart-line"></i>
                                <span style="margin-left: 4px">Line chart</span>
                            </a>
                        </div>
                        <input type="hidden" name="time" value="${time}">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    const drawChart = (labels, totals, chartType) => {
        
        const ctx = document.getElementById('revenue-chart');

        new Chart(ctx, {
            type: chartType,
            data: {
                labels: labels,
                datasets: [{
                        label: '# total of revenue',
                        data: totals,
                        borderWidth: 1,
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }}
            }
        });
    }
    
    
    const handleOption = async (chartType = 'bar') => {
        const formE = document.getElementById("chart-option");
        const month = formE.querySelector("select[name=month]")?.value;
        const year = formE.querySelector("select[name=year]")?.value;
        const endYear = formE.querySelector("select[name=endYear]")?.value;
        const time = formE.querySelector("input[name=time]")?.value;

        const data = {
            month,
            year,
            endYear,
            time,
        }

        let list;
        const url = "<c:url value="/admin/revenue/read.do" />";
        await $.ajax({
            type: 'GET',
            url: url,
            data: data,
            success: function (data) {
                if (data) {
                    list = JSON.parse(data);
                }
            }
        });

        let labels = [];
        let totals = [];
        
        list.map(item => {
            labels.push(item.label)
            totals.push(item.total)
        })
        
        console.log(labels)
        
        drawChart(labels, totals, chartType)
    }
</script>

<script type="text/javascript">
    window.addEventListener('DOMContentLoaded', event => {

         handleOption();
        
    });
</script>