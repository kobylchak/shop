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
    <title>ADMIN ORDERS</title>
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
                <li class="nav-item active">
                    <a href="/admin" class="nav-link">ORDERS</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/mobile" class="nav-link">MOBILES</a>
                </li>
                <li class="nav-item">
                    <a href="/mobilephone" class="nav-link">PHONES</a>
                </li>
                <li class="nav-item">
                    <a href="/baskets" class="nav-link">BASKETS</a>
                </li>
                <li class="nav-item ">
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

        <a class="btn btn-outline-primary" href="/admin" role="button">All orders</a>
        <div class="btn-group" role="group">
            <button id="btnGroupDrop1" type="button" class="btn  btn-outline-secondary dropdown-toggle"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Find by status
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="/admin">All orders</a>
                <a class="dropdown-item" href="/admin/orders/notfulfilled">Not fulfilled</a>
                <a class="dropdown-item" href="/admin/orders/sold">Sold</a>
                <a class="dropdown-item" href="/admin/orders/returned">Returned</a>
            </div>
        </div>

        <a class="btn btn-outline-danger" href="/admin/orders/status/change" role="button">Change status</a>

        <div>
            <form action="/admin/orders/search" method="post" class="form-inline my-2 my-lg-0">
                <input type="text" name="orderId" class="form-control mr-sm-2" placeholder="By order id"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search order</button>
            </form>
        </div>
        <div>
            <form action="/admin/orders/user" method="post" class="form-inline my-2 my-lg-0">
                <input type="text" name="login" class="form-control mr-sm-2" placeholder="By user login"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search order(s)</button>
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

    <c:choose>
        <c:when test="${notFulfilledOrders}">
            <div align="center" class="alert alert-success" role="alert">
                <p class="h3"><i class="fab fa-java"></i> There are no NOT_FULFILLED orders!</p>
            </div>
        </c:when>

        <c:when test="${returnedOrdersEmpty}">
            <div align="center" class="alert alert-dark" role="alert">
                Returned orders are missing.
            </div>
        </c:when>
        <c:when test="${soldOrdersEmpty}">
            <div align="center" class="alert alert-dark" role="alert">
                Sold orders are missing.
            </div>
        </c:when>
        <c:when test="${orderMissing}">
            <div align="center" class="alert alert-danger" role="alert">
                You can change the status only in orders sold and returned!
                But they are missing.
            </div>
        </c:when>
        <c:otherwise>
            <c:if test="${headNotfulfilledOrders}">
                <div align="center" class="alert alert-success" role="alert">
                    <p class="h5">There are NOT_FULFILLED orders. Please, enter number of declaration!</p>
                </div>
            </c:if>
            <div>
                <table class="table table-sm table-hover table-striped">
                    <div class="thead-dark">
                        <tr>
                            <td><p class="h5"><b>Order</b></td>
                            <td><p class="h5"><i class="fas fa-user-circle"></i></p></td>
                            <td><p class="h5"><i class="fas fa-shopping-cart"></i></p></td>
                            <td><p class="h5"><b>Ip</b></p></td>
                            <td><p class="h5"><b>Delivery</b></p></td>
                            <td><p class="h5"><b>Delivery address</b></p></td>
                            <td><p class="h5"><b>Date order</b></p></td>
                            <td><p class="h5"><b>Date dispatcher</b></p></td>
                            <td><p class="h5"><b>Delcaration number</b></p></td>
                            <td><p class="h5"><b>Status</b></p></td>
                        </tr>
                    </div>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td><span class="badge badge-danger">${order.id}</span></td>
                            <td><a href="/users/order/${order.user.id}"
                                   class="badge badge-pill badge-dark">${order.user.login}</a></td>
                            <td><a href="/baskets/find/${order.basket.id}"
                                   class="badge badge-warning">${order.basket.id}</a></td>
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
                                <c:when test="${changeStatus}">
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
