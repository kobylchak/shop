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
    <title>ADMIN MOBILES</title>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <a href="#" class="navbar-brand">
        </a>
        <img src="<c:url value="/static/mob.png"/>" height="30" width="150" alt="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="/admin" class="nav-link">ORDERS</a>
                </li>
                <li class="nav-item active">
                    <a href="/mobile" class="nav-link">MOBILES</a>
                </li>
                <li class="nav-item">
                    <a href="/mobilephone" class="nav-link">PHONES</a>
                </li>
                <li class="nav-item ">
                    <a href="/baskets" class="nav-link">BASKETS</a>
                </li>
                <li class="nav-item">
                    <a href="/users" class="nav-link">USERS</a>
                </li>
                <li class="nav-item ">
                    <a href="/statistic" class="nav-link">STATISTIC</a>
                </li>
            </ul>
            <div>
                <form action="/mobile/search" method="post" class="d-none d-lg-block form-inline my-2 my-lg-0">
                    <input type="text" name="pattern" class="form-control mr-sm-2" placeholder="search mobiles by model"
                           aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0">Search</button>
                </form>
            </div>
        </div>
        <div class=" col-lg-1 d-none d-sm-none d-md-none">
            <c:url value="/logout" var="logoutUrl"/>
            <p class="h3"><a href="${logoutUrl}"><i class="fas fa-sign-out-alt"></i></a></p>
        </div>
    </nav>
    <nav row class="navbar navbar-expand-lg navbar-light bg-light justify-content-around sticky-top">
        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-3 btn-group" role="group" aria-label="Basic example">
            <button type="button" id="add_brand" class="btn btn-success"><i class="fas fa-plus"></i>Brand</button>
            <button type="button" id="add_mobile" class="btn btn-success"><i class="fas fa-plus"></i>Model</button>
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-success" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"><i class="fas fa-plus"></i>Phone
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <c:forEach items="${brands}" var="brand">
                        <li><a class="dropdown-item" href="/mobilephone/${brand.id}">${brand.name}</a></li>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-1 btn-group" role="group">
            <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Find by brand
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="/mobile">All mobiles</a>
                <c:forEach items="${brands}" var="brand">
                    <li><a class="dropdown-item" href="/brand/${brand.id}">${brand.name}</a></li>
                </c:forEach>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2 btn-group" role="group" aria-label="Basic example">
            <button type="button" id="delete_mobile" class="btn btn-danger"><i class="fas fa-times"></i> Model</button>
            <button type="button" id="delete_photo" class="btn btn-danger"><i class="fas fa-times"></i> Photo</button>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 btn-group" role="toolbar"
             aria-label="Toolbar with button groups">
            <div class="input-group">

                <input type="text" name="newPrice" id="newPrice" placeholder="new price..."
                       class="form-control"
                       placeholder="Input group example" aria-label="Input group example"
                       aria-describedby="btnGroupAddon">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <button type="button" id="change_price" class="btn btn-secondary"><i class="fas fa-pen-alt"></i>
                        price
                    </button>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 btn-group" role="toolbar"
             aria-label="Toolbar with button groups">
            <div class="input-group">
                <input type="text" name="newDiscount" id="newDiscount" placeholder="new discount..."
                       class="form-control"
                       placeholder="Input group example" aria-label="Input group example"
                       aria-describedby="btnGroupAddon">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <button type="button" id="change_discount" class="btn btn-secondary"><i class="fas fa-pen-alt"></i>
                        discount
                    </button>
                </div>
            </div>
        </div>
        <div>
            <form action="/admin/search" method="post" class="d-none d-sm-block d-lg-none form-inline my-2 my-lg-0">
                <input type="text" name="pattern" class="form-control mr-sm-2" placeholder="search mobiles by model"
                       aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search</button>
            </form>
        </div>
    </nav>
    <div align="center">
        <c:url value="/logout" var="logoutUrl"/>
        <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${pages ne null}">
                <c:forEach var="i" begin="1" end="${pages}">
                    <li class="page-item"><a class="page-link" href="/mobile/?page=<c:out value="${i - 1}"/>">
                        <c:out value="${i}"/></a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${byGroupPages ne null}">
                <c:forEach var="i" begin="1" end="${byGroupPages}">
                    <li class="page-item"><a class="page-link"
                                             href="/brand/${brandId}?page=<c:out value="${i - 1}"/>"><c:out
                            value="${i}"/></a></li>
                </c:forEach>
            </c:if>
        </ul>
    </nav>
    <div>
        <table class="table table-sm table-hover table-striped">
            <div class="thead-dark">
                <tr>
                    <td><p class="h5"><b>Model</b></p></td>
                    <td><p class="h5"><b>Brand</b></p></td>
                    <td><p class="h5"><b>Model</b></p></td>
                    <td><p class="h5"><b>Photo</b></p></td>
                    <td><p class="h5"><b>UAH</b></p></td>
                    <td><p class="h5"><b>Description</b></p></td>
                    <td><p class="h5"><b>Color</b></p></td>
                    <td><p class="h5"><b>Discount</b></p></td>
                    <td><p class="h5"><b>For sale</b></p></td>
                    <td><p class="h5"><b>Sold</b></p></td>
                    <td><p class="h5"><b>Total</b></p></td>
                </tr>
            </div>
            <c:forEach items="${mobiles}" var="mobile">
                <tr>
                    <td><input type="checkbox" name="toDo[]" value="${mobile.id}" id="checkbox_${mobile.id}"/></td>
                    <td>${mobile.brand.name}</td>
                    <td><span class="badge badge-pill badge-success">${mobile.name}</span></td>
                    <td><a class="h5" href="/photo/download/${mobile.id}"><i class="fas fa-download"></i></a>
                        <c:forEach items="${mobile.photos}" var="photo">
                            <input type="checkbox" name="toDeletePhoto[]" value="${photo.id}"
                                   id="checkbox_${photo.id}"/>
                            <img src="/photo/${photo.id}" height="50" alt="${mobile.name}"/>
                        </c:forEach>
                    </td>
                    <td>${mobile.price}</td>
                    <td>${mobile.description}<a class="h5" href="/mobile/description/${mobile.id}"> <i
                            class="fas fa-edit"></i></a>
                    </td>
                    <td>${mobile.color}</td>
                    <td>${mobile.discount}</td>
                    <td>${mobile.countForSale}</td>
                    <td>${mobile.countSold}</td>
                    <td>${mobile.generalCount}</td>
                </tr>
            </c:forEach>
        </table>
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
<script src="/static/js/admin.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</body>
