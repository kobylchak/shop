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
    <title>ADMIN BASKETS</title>
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
                <li class="nav-item">
                    <a href="/mobilephone" class="nav-link">PHONES</a>
                </li>
                <li class="nav-item active">
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

        <a class="btn btn-outline-primary" href="/baskets" role="button">All baskets</a>
        <div class="btn-group" role="group">
            <button id="btnGroupDrop1" type="button" class="btn  btn-outline-secondary dropdown-toggle"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Find by status
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="/baskets">All baskets</a>
                <a class="dropdown-item" href="/baskets/paid">Paid baskets</a>
                <a class="dropdown-item" href="/baskets/notpaid">Not paid baskets</a>
            </div>
        </div>

        <a class="btn btn-outline-danger" href="/baskets/notpaid" role="button">Clear not paid basket</a>

        <div>
            <form action="/baskets/find/" method="post" class="form-inline my-2 my-lg-0">
                <input type="text" name="basketId" class="form-control mr-sm-2" placeholder="By basket id"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search basket</button>
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
        </ul>
    </nav>

    <div>
        <table class="table table-sm table-hover table-striped">
            <div class="thead-dark">
                <tr>
                    <td><p class="h5"><i class="fas fa-shopping-cart align-self-end"></i></p></td>
                    <td><p class="h5"><i class="fas fa-user-circle align-self-end"></i></p></td>
                    <td><p class="h5"><b>Model-IMEI-price</b></p></td>
                    <td><p class="h5"><b>Total quantity</b></p></td>
                    <td><p class="h5"><b>Total price</b></p></td>
                    <c:if test="${!clearPosibility}">
                        <td><p class="h5"><b>Date order</b></p></td>
                    </c:if>
                    <td><p class="h5"><b>Input in basket</b></p></td>
                    <c:if test="${clearPosibility}">
                        <td>
                            <p class="h5"><b>Clear basket</b></p></td>
                        </td>
                    </c:if>
                    <td><p class="h5"><b>Status</b></p></td>
                </tr>
            </div>
            <c:forEach items="${baskets}" var="basket">
                <tr>
                    <td><span class="badge badge-warning">${basket.id}</span></td>
                    <td><a href="/users/basket/${basket.us.id}"
                           class="badge badge-pill badge-dark">${basket.us.login}</a>
                    </td>
                    <td>
                        <c:forEach items="${basket.phones}" var="phone">
                        <p class="h6">
                            <span class="badge badge-pill badge-success">${phone.mobile.name}</span> - ${phone.imei}
                            - ${phone.mobile.price}
                        </p>
                        </c:forEach>
                    <td><span class="h6">${basket.totalQuantity}</span></td>
                    <td><span class="h6">${basket.totalPrice}</span></td>
                    <c:if test="${!clearPosibility}">
                        <td><span class="h6">${basket.order.orderDate}</span></td>
                    </c:if>
                    <td><span class="h6">${basket.putInBasket}</span></td>
                    <c:if test="${clearPosibility}">
                        <td>
                            <a href="/baskets/clear/${basket.id}" class="badge badge-danger">Clear</a>
                        </td>
                    </c:if>
                    <td><span class="h6">${basket.status}</span></td>

                </tr>
            </c:forEach>
        </table>
    </div>

    <div align="center">
        <c:url value="/logout" var="logoutUrl"/>
        <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${allPages ne null}">
                <c:forEach var="i" begin="1" end="${allPages}">
                    <li class="page-item"><a class="page-link" href="/admin/?page=<c:out value="${i - 1}"/>">
                        <c:out value="${i}"/></a>
                    </li>
                </c:forEach>
            </c:if>

        </ul>
    </nav>
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
