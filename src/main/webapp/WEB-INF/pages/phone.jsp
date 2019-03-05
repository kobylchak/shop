<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href='<c:url value="/static/mb2.ico" />' type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <title>ADMIN</title>
</head>
<body>
<div class="container-fluid">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <a href="#" class="navbar-brand">
            <img src="<c:url value="/static/mob.png"/>" height="30" width="150" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="/admin" class="nav-link">ORDERS</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/mobile" class="nav-link">MOBILES</a>
                </li>
                <li class="nav-item active">
                    <a href="/mobilephone" class="nav-link">PHONES</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">BASKETS</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">USERS</a>
                </li>

            </ul>
        </div>
        <div class="d-none d-sm-block">
            <c:url value="/logout" var="logoutUrl"/>
            <p class="h3"><a href="${logoutUrl}"><i class="fas fa-sign-out-alt"></i></a></p>
        </div>

    </nav>

    <nav row class="navbar navbar-expand-lg navbar-light bg-light justify-content-around sticky-top">

        <div class="btn-group">
            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                <i class="fas fa-plus"></i>Phone
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <c:forEach items="${brands}" var="brand">
                    <li><a class="dropdown-item" href="/mobilephone/${brand.id}">${brand.name}</a></li>
                </c:forEach>
            </div>
        </div>

        <a class="btn btn-outline-primary" href="/mobilephone" role="button">All phones</a>

        <div class="btn-group" role="group">
            <button id="btnGroupDrop1" type="button" class="btn  btn-outline-secondary dropdown-toggle"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Find by status
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="/mobilephone">All phones</a>
                <a class="dropdown-item" href="/mobilephone/forsale">For sale</a>
                <a class="dropdown-item" href="/mobilephone/inbasket">In a basket</a>
                <a class="dropdown-item" href="/mobilephone/sold">Sold</a>
                <a class="dropdown-item" href="/mobilephone/returned">Returned</a>
            </div>
        </div>

        <a class="btn btn-outline-danger" href="/mobilephone/status/change" role="button">Change status</a>

        <div>
            <form action="/mobilephone/imei" method="post" class="form-inline my-2 my-lg-0">
                <input type="text" name="imei" class="form-control mr-sm-2" placeholder="By IMEI"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search phone</button>
            </form>
        </div>


    </nav>


    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${allPages ne null}">
                <c:forEach var="i" begin="1" end="${allPages}">
                    <li class="page-item"><a class="page-link" href="/mobilephone/?page=<c:out value="${i - 1}"/>">
                        <c:out value="${i}"/></a>
                    </li>
                </c:forEach>
            </c:if>
            <%--<c:if test="${byGroupPages ne null}">--%>
            <%--<c:forEach var="i" begin="1" end="${byGroupPages}">--%>
            <%--<li class="page-item"><a class="page-link"--%>
            <%--href="/brand/${brandId}?page=<c:out value="${i - 1}"/>"><c:out--%>
            <%--value="${i}"/></a></li>--%>
            <%--</c:forEach>--%>
            <%--</c:if>--%>
        </ul>
    </nav>
    <c:choose>
        <c:when test="${SoldAndReturnedPhonesMissing}">
            <div align="center" class="alert alert-danger" role="alert">
                You can change the status only in phones sold and returned!
                But they are missing.
            </div>
        </c:when>
        <c:otherwise>
            <div>
                    <%--<table class="table table-hover table-striped">--%>
                <table class="table table-sm table-hover table-striped">
                    <div class="thead-dark">
                        <tr>
                            <td><b>Id</b></td>
                            <td><b>Brand</b></td>
                            <td><b>Mobile</b></td>
                                <%--<td><b>Photo</b></td>--%>
                                <%--<td><b>Price</b></td>--%>
                                <%--<td><b>Description</b></td>--%>
                            <td><b>Color</b></td>
                            <td><b>IMEI</b></td>
                            <td><b>Order</b></td>
                                <%--<td><b>Basket</b></td>--%>
                            <td><b>Status</b></td>
                        </tr>
                    </div>
                    <c:forEach items="${phones}" var="phone">
                        <tr>
                                <%--<td><input type="checkbox" name="toDo[]" value="${mobile.id}" id="checkbox_${mobile.id}"/></td>--%>

                            <td>${phone.id}</td>
                            <td>${phone.mobile.brand.name}</td>
                            <td>${phone.mobile.name}</td>
                                <%--<td><a class="h5" href="/photo/download/${mobile.id}"><i class="fas fa-download"></i></a>--%>
                                <%--<c:forEach items="${mobile.photos}" var="photo">--%>
                                <%--<input type="checkbox" name="toDeletePhoto[]" value="${photo.id}"--%>
                                <%--id="checkbox_${photo.id}"/>--%>
                                <%--<img src="/photo/${photo.id}" height="50" alt="${mobile.name}"/>--%>
                                <%--</c:forEach>--%>
                                <%--</td>--%>
                                <%--<td>${mobile.price}</td>--%>
                                <%--<td>${mobile.description}<a class="h5" href="/mobile/description/${mobile.id}"> <i--%>
                                <%--class="fas fa-edit"></i></a>--%>
                                <%--</td>--%>
                            <td>${phone.mobile.color}</td>
                            <td>${phone.imei}<a class="h5" href="/mobilephone/description/${phone.id}"> <i
                                    class="fas fa-edit"></i></a></td>
                            <td>
                                <a href="/admin/orders/search/${phone.basket.order.id}"
                                   class="badge badge-danger">${phone.basket.order.id}</a>
                                    <%--<span class="badge badge-danger">--%>
                                    <%--<a href="/admin/orders/search/${phone.basket.order.id}">${phone.basket.order.id}</a>--%>
                                    <%--</span>--%>
                            </td>
                                <%--<td>${phone.basket.id}</td>--%>
                                <%--<td>${phone.imei}</td>--%>
                            <td><c:choose>
                                <c:when test="${fishka}">
                                    <a class="h6" href="/mobilephone/status/${phone.id}">${phone.status}</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="h6">${phone.status}</span>
                                </c:otherwise>
                            </c:choose>
                            </td>
                                <%--<td>${phone.status}</td>--%>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <div align="center">
        <c:url value="/logout" var="logoutUrl"/>
        <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>

    </div>
</div>


<%--<script>--%>
<%--$('.dropdown-toggle').dropdown();--%>
<%--$('#all_orders').click(function () {--%>
<%--window.location.href = '/admin/orders';--%>
<%--});--%>
<%--</script>--%>
<%--});--%>

<%--$('#add_brand').click(function () {--%>
<%--window.location.href = '/brand';--%>
<%--});--%>
<%--$('#delete_mobile').click(function () {--%>
<%--var data = {'toDo[]': []};--%>
<%--$(":checked").each(function () {--%>
<%--data['toDo[]'].push($(this).val());--%>
<%--});--%>
<%--$.post("/mobile/delete", data, function (data, status) {--%>
<%--window.location.reload();--%>
<%--});--%>
<%--});--%>
<%--$('#delete_photo').click(function () {--%>
<%--var data = {'toDeletePhoto[]': []};--%>
<%--$(":checked").each(function () {--%>
<%--data['toDeletePhoto[]'].push($(this).val());--%>
<%--});--%>
<%--$.post("/photo/delete", data, function (data, status) {--%>
<%--window.location.reload();--%>
<%--});--%>
<%--});--%>
<%--$('#change_price').click(function () {--%>
<%--var newPrice = document.getElementById("newPrice").value;--%>
<%--var data = {newPrice: newPrice, 'toDo[]': []};--%>
<%--$(":checked").each(function () {--%>
<%--data['toDo[]'].push($(this).val());--%>
<%--});--%>
<%--$.post("/mobile/change_price", data, function (data, status) {--%>
<%--window.location.reload();--%>
<%--});--%>
<%--});--%>
<%--$('#change_discount').click(function () {--%>
<%--var newDiscount = document.getElementById("newDiscount").value;--%>
<%--var data = {newDiscount: newDiscount, 'toDo[]': []};--%>
<%--$(":checked").each(function () {--%>
<%--data['toDo[]'].push($(this).val());--%>
<%--});--%>
<%--$.post("/mobile/change_discount", data, function (data, status) {--%>
<%--window.location.reload();--%>
<%--});--%>
<%--});--%>
<%--$('#find_users').click(function () {--%>
<%--window.location.href = '/users';--%>
<%--});--%>
<%--</script>--%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<%--<script src="/static/js/admin.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


</body>
</html>
