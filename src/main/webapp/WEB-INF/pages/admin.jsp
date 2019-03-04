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
    <%--<link rel="stylesheet" href="/static/css/admin.css">--%>
    <title>ADMIN</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>
</head>
<body>
<div class="container-fluid">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">--%>
        <%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
        <%--<nav class="navbar navbar-expand-lg navbar-light bg-primary">--%>
        <a href="#" class="navbar-brand">
            <img src="<c:url value="/static/mob.png"/>" height="30" width="150" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item  active">
                    <a href="/admin" class="nav-link">ORDERS</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/mobile" class="nav-link">MOBILES</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">PHONES</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">BASKETS</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">USERS</a>
                </li>

            </ul>
            <%--<form class="form-inline my-2 my-lg-0">--%>
            <%--<input type="text" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">--%>
            <%--<button class="btn btn-outline-success my-2 my-sm-0">Search</button>--%>
            <%--</form> <!-- action add NECESSERY-->--%>
        </div>
        <div class="d-none d-sm-block">
            <c:url value="/logout" var="logoutUrl"/>
            <p class="h3"><a href="${logoutUrl}"><i class="fas fa-sign-out-alt"></i></a></p>
        </div>

    </nav>


    <nav row class="navbar navbar-expand-lg navbar-light bg-light justify-content-around sticky-top">

        <a class="btn btn-outline-secondary" href="/admin/orders" role="button">All orders</a>
        <%--<div class="btn-group" role="group" aria-label="Basic example">--%>
            <%--<a href="/admin/orders" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">All orders</a>--%>
            <%--&lt;%&ndash;<button type="button" id="all_orders" class="btn btn-secondary">All orders</button>&ndash;%&gt;--%>
        <%--</div>--%>
        <div class="btn-group" role="group">
            <button id="btnGroupDrop1" type="button" class="btn  btn-outline-secondary dropdown-toggle"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Find by status
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="/admin/orders">All orders</a>
                <a class="dropdown-item" href="/admin">Not fulfilled</a>
                <a class="dropdown-item" href="/admin/orders/sold">Sold</a>
                <a class="dropdown-item" href="/admin/orders/returned">Returned</a>
            </div>
        </div>
        <%--<div class="col-xs-12 col-sm-4 col-md-4 col-lg-2 btn-group" role="group" aria-label="Basic example">--%>
            <%--<button type="button" id="delete_mobile" class="btn btn-danger"><i class="fas fa-times"></i> Model</button>--%>
            <%--<button type="button" id="delete_photo" class="btn btn-danger"><i class="fas fa-times"></i> Photo</button>--%>
        <%--</div>--%>
        <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 btn-group" role="toolbar"--%>
             <%--aria-label="Toolbar with button groups">--%>
            <%--<div class="input-group">--%>

                <%--<input type="text" name="newPrice" id="newPrice" placeholder="new price..."--%>
                       <%--class="form-control"--%>
                       <%--placeholder="Input group example" aria-label="Input group example"--%>
                       <%--aria-describedby="btnGroupAddon">--%>
                <%--<div class="btn-group mr-2" role="group" aria-label="First group">--%>
                    <%--<button type="button" id="change_price" class="btn btn-secondary"><i class="fas fa-pen-alt"></i>--%>
                        <%--price--%>
                    <%--</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 btn-group" role="toolbar"--%>
             <%--aria-label="Toolbar with button groups">--%>
            <%--<div class="input-group">--%>
                <%--<input type="text" name="newDiscount" id="newDiscount" placeholder="new discount..."--%>
                       <%--class="form-control"--%>
                       <%--placeholder="Input group example" aria-label="Input group example"--%>
                       <%--aria-describedby="btnGroupAddon">--%>
                <%--<div class="btn-group mr-2" role="group" aria-label="First group">--%>
                    <%--<button type="button" id="change_discount" class="btn btn-secondary"><i class="fas fa-pen-alt"></i>--%>
                        <%--discount--%>
                    <%--</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div>
            <form action="/admin/orders/search" method="post" class="form-inline my-2 my-lg-0">
                <input type="text" name="orderId" class="form-control mr-sm-2" placeholder="By order id"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search</button>
            </form>
        </div>
        <div>
            <form action="/admin/orders/user" method="post" class="form-inline my-2 my-lg-0">
                <input type="text" name="login" class="form-control mr-sm-2" placeholder="By user login"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search</button>
            </form>
        </div>
    </nav>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${allPages ne null}">
                <c:forEach var="i" begin="1" end="${allPages}">
                    <li class="page-item"><a class="page-link" href="/admin/?page=<c:out value="${i - 1}"/>">
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
        <c:when test="${emp ne null}">
            <div align="center" class="alert alert-success" role="alert">
                <p class="h3"><i class="fab fa-java"></i> There are no orders executed!</p>
            </div>
        </c:when>
        <c:otherwise>
            <div>
                    <%--<table class="table table-hover table-striped">--%>
                <table class="table table-sm table-hover table-striped">
                    <div class="thead-dark">
                        <tr>
                            <td></td>
                            <td><p class="h5"><b>Order</b></td>
                            <td><p class="h5"><i class="fas fa-user-circle"></i></p></td>
                            <td><p class="h5"><i class="fas fa-cart-arrow-down"></i></p></td>
                            <td><p class="h5"><b>Mobiles</b></p></td>
                            <td><p class="h5"><b>Ip</b></p></td>
                            <td><p class="h5"><b>Delivery method</b></p></td>
                            <td><p class="h5"><b>Delivery address</b></p></td>
                            <td><p class="h5"><b>Date order</b></p></td>
                            <td><p class="h5"><b>Date dispatcher</b></p></td>
                            <td><p class="h5"><b>Delcaration number</b></p></td>
                            <td><p class="h5"><b>Status</b></p></td>
                        </tr>
                    </div>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td><input type="checkbox" name="toDo[]" value="${order.id}" id="checkbox_${order.id}"/>
                            </td>
                            <td><span class="badge badge-danger">${order.id}</span></td>
                            <td><a class="h6" href="/admin/orders/user/${order.user.login}">${order.user.login}</a></td>
                            <td><span class="h6">${order.basket.id}</span></td>
                            <td>
                                <c:forEach items="${order.basket.phones}" var="phone">
                                    <p class="h6">
                                        <span class="badge badge-success">${phone.mobile.name}</span> - ${phone.imei}
                                    </p>
                                </c:forEach>
                            </td>
                            <td><span class="h6">${order.ipAddress}</span></td>
                            <td><span class="h6">${order.deliveryMethod}</span></td>
                            <td><span class="h6">${order.deliveryAddress}</span></td>
                            <td><span class="h6">${order.orderDate}</span></td>
                            <td><span class="h6">${order.dateDispatch}</span></td>
                            <td>
                                <span class="badge badge-secondary">${order.declarationNumber}</span>
                                <a class="h5" href="/admin/orders/declaration/${order.id}">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                            <td><c:choose>
                                <c:when test="${fishka ne null}">
                                    <a class="h6" href="/admin/orders/status/${order.id}">${order.status}</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="h6">${order.status}</span>
                                </c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
    <%--&lt;%&ndash;<nav class="navbar navbar-default">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"&ndash;%&gt;--%>
    <%--&lt;%&ndash;aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<span class="navbar-toggler-icon"></span>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
    <%--<div class="collapse navbar-collapse">--%>
    <%--<ul class="navbar-nav mr-auto">--%>
    <%--<li>--%>
    <%--<button type="button" id="add_brand" class="btn btn-default navbar-btn">Add brand</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<button type="button" id="add_mobile" class="btn btn-default navbar-btn">Add mobile model--%>
    <%--</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<button type="button" id="delete_mobile" class="btn btn-default navbar-btn">Delete mobile model--%>
    <%--</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<button type="button" id="delete_photo" class="btn btn-default navbar-btn">Delete photo</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<input type="text" name="newPrice" id="newPrice" placeholder="Check and enter new price">--%>
    <%--<button type="button" id="change_price" class="btn btn-default navbar-btn">Change price</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<input type="text" name="newDiscount" id="newDiscount" placeholder="Enter new discount">--%>
    <%--<button type="button" id="change_discount" class="btn btn-default navbar-btn">Change discount--%>
    <%--</button>--%>
    <%--</li>--%>
    <%--<li class="dropdown">--%>
    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"--%>
    <%--aria-expanded="false">Brands <span class="caret"></span></a>--%>
    <%--<ul class="dropdown-menu">--%>
    <%--<li><a href="/admin">All mobiles</a></li>--%>
    <%--<c:forEach items="${brands}" var="brand">--%>
    <%--<li><a href="/brand/${brand.id}">${brand.name}</a></li>--%>
    <%--</c:forEach>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--<li class="dropdown">--%>
    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"--%>
    <%--aria-expanded="false">Add mobile phones<span class="caret"></span></a>--%>
    <%--<ul class="dropdown-menu">--%>
    <%--<c:forEach items="${brands}" var="brand">--%>
    <%--<li><a href="/mobilephone/${brand.id}">${brand.name}</a></li>--%>
    <%--</c:forEach>--%>
    <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</li>&ndash;%&gt;--%>


    <%--</ul>--%>
    <%--<form class="form-inline my-2 my-lg-0">--%>
    <%--<input type="text" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">--%>
    <%--<button class="btn btn-outline-success my-2 my-sm-0">Search</button>--%>
    <%--</form> <!-- action add NECESSERY-->--%>
    <%--</div>--%>
    <%--</nav>--%>


    <div align="center">
        <c:url value="/logout" var="logoutUrl"/>
        <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>

    </div>


    <%--<div align="left">--%>
    <%--<nav class="navbar navbar-default">--%>
    <%--<div class="container-fluid">--%>
    <%--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
    <%--<ul id="moduleList" class="nav navbar-nav">--%>
    <%--<li>--%>
    <%--<button type="button" id="add_brand" class="btn btn-default navbar-btn">Add brand</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<button type="button" id="add_mobile" class="btn btn-default navbar-btn">Add mobile model--%>
    <%--</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<button type="button" id="delete_mobile" class="btn btn-default navbar-btn">Delete mobile model--%>
    <%--</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<button type="button" id="delete_photo" class="btn btn-default navbar-btn">Delete photo</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<input type="text" name="newPrice" id="newPrice" placeholder="Check and enter new price">--%>
    <%--<button type="button" id="change_price" class="btn btn-default navbar-btn">Change price</button>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<input type="text" name="newDiscount" id="newDiscount" placeholder="Enter new discount">--%>
    <%--<button type="button" id="change_discount" class="btn btn-default navbar-btn">Change discount--%>
    <%--</button>--%>
    <%--</li>--%>
    <%--<li class="dropdown">--%>
    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"--%>
    <%--aria-expanded="false">Brands <span class="caret"></span></a>--%>
    <%--<ul class="dropdown-menu">--%>
    <%--<li><a href="/admin">All mobiles</a></li>--%>
    <%--<c:forEach items="${brands}" var="brand">--%>
    <%--<li><a href="/brand/${brand.id}">${brand.name}</a></li>--%>
    <%--</c:forEach>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--<li class="dropdown">--%>
    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"--%>
    <%--aria-expanded="false">Add mobile phones<span class="caret"></span></a>--%>
    <%--<ul class="dropdown-menu">--%>
    <%--<c:forEach items="${brands}" var="brand">--%>
    <%--<li><a href="/mobilephone/${brand.id}">${brand.name}</a></li>--%>
    <%--</c:forEach>--%>
    <%--</ul>--%>
    <%--</li>--%>

    <%--</ul>--%>
    <%--<form class="navbar-form navbar-left" role="search" action="/search" method="post">--%>
    <%--<div class="form-group">--%>
    <%--<input type="text" class="form-control" name="pattern" placeholder="Search by mobile name">--%>
    <%--</div>--%>
    <%--<button type="submit" class="btn btn-default">Submit</button>--%>
    <%--</form>--%>

    <%--<button type="button" id="phones" class="btn btn-default navbar-btn">phones</button>--%>
    <%--<button type="button" id="find_users" class="btn btn-default navbar-btn">Find users</button>--%>
    <%--<button type="button" id="orders" class="btn btn-default navbar-btn">orders</button>--%>

    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--</nav>--%>


    <%--<table align="left" class="table table-striped">--%>
    <%--<thead>--%>
    <%--<tr>--%>
    <%--<td></td>--%>
    <%--<td><b>Brand</b></td>--%>
    <%--<td><b>Mobile</b></td>--%>
    <%--<td><b>Photo</b></td>--%>
    <%--<td><b>Price</b></td>--%>
    <%--<td><b>Description</b></td>--%>
    <%--<td><b>Color</b></td>--%>
    <%--<td><b>Discount</b></td>--%>
    <%--</tr>--%>
    <%--</thead>--%>
    <%--<c:forEach items="${mobiles}" var="mobile">--%>
    <%--<tr>--%>
    <%--<td><input type="checkbox" name="toDo[]" value="${mobile.id}" id="checkbox_${mobile.id}"/></td>--%>
    <%--<td>${mobile.brand.name}</td>--%>
    <%--<td>${mobile.name}</td>--%>
    <%--<td><a href="/photo/download/${mobile.id}"><img height="100" width="60"--%>
    <%--src="<c:url value="/static/addPhoto.png"/>"/></a>--%>
    <%--<c:forEach items="${mobile.photos}" var="photo">--%>
    <%--<input type="checkbox" name="toDeletePhoto[]" value="${photo.id}"--%>
    <%--id="checkbox_${photo.id}"/>--%>
    <%--<img src="/photo/${photo.id}" height="100" alt="${mobile.name}"/>--%>
    <%--</c:forEach>--%>
    <%--</td>--%>
    <%--<td>${mobile.price}</td>--%>
    <%--<td>${mobile.description}<a href="/mobile/description/${mobile.id}"> change</a></td>--%>
    <%--<td>${mobile.color}</td>--%>
    <%--<td>${mobile.discount}</td>--%>
    <%--</tr>--%>
    <%--</c:forEach>--%>
    <%--</table>--%>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${allPages ne null}">
                <c:forEach var="i" begin="1" end="${allPages}">
                    <li class="page-item"><a class="page-link" href="/admin/?page=<c:out value="${i - 1}"/>">
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
