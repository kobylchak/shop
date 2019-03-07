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
    <title>ADMIN PHONES</title>
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
                    <a href="/baskets" class="nav-link">BASKETS</a>
                </li>
                <li class="nav-item">
                    <a href="/users" class="nav-link">USERS</a>
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
                <table class="table table-sm table-hover table-striped">
                    <div class="thead-dark">
                        <tr>
                            <td><p class="h5"><b>Id</b></p></td>
                            <td><p class="h5"><b>Brand</b></p></td>
                            <td><p class="h5"><b>Mobile</b></p></td>
                            <td><p class="h5"><b>Color</b></p></td>
                            <td><p class="h5"><b>IMEI</b></p></td>
                            <td><p class="h5"><b>Order</b></p></td>
                            <td><p class="h5"><b>Status</b></p></td>
                        </tr>
                    </div>
                    <c:forEach items="${phones}" var="phone">
                        <tr>
                            <td>${phone.id}</td>
                            <td>${phone.mobile.brand.name}</td>
                            <td><a href="/admin/mobile/" class="badge badge-pill badge-success">${phone.mobile.name}</a>
                            </td>
                            <td>${phone.mobile.color}</td>
                            <td>${phone.imei}<a class="h5" href="/mobilephone/description/${phone.id}"> <i
                                    class="fas fa-edit"></i></a></td>
                            <td>
                                <a href="/admin/orders/search/${phone.basket.order.id}"
                                   class="badge badge-danger">${phone.basket.order.id}</a>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${changeStatus}">
                                        <a class="h6" href="/mobilephone/status/${phone.id}">${phone.status}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="h6">${phone.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</body>
</html>
