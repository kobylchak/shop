<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href='<c:url value="/static/mb2.ico" />' type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/main.css">
    <title>Basket page</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>
</head>
<body>


<div class="container">
    <div id="top">
        <div class="row justify-content-around">
            <div class="col-xs-12 align-self-end"><p class="h5"><i class="fas fa-phone-volume"></i> +38(098)50-14-393
            </p></div>
            <div class="col-xs-12 align-self-end"><p class="h5"><i class="fab fa-weixin"></i>beonconnection@gmail.com
            </p></div>
            <div class="col-xs-4 align-self-end">
                <c:set var="who" value="admin"/>
                <c:choose>
                    <c:when test="${who eq login}">
                        <p class="h2 align-self-end"><a href="/admin"><i class="fab fa-redhat"></i></a></p>
                    </c:when>
                    <c:otherwise>
                        <p class="h3 align-self-end"><a href="#"><i class="fas fa-user-circle"></i></a></p>
                    </c:otherwise>
                </c:choose>
            </div>
            <%--<div class="col"> <p>${login}</p></div>--%>
            <div class="col-xs-4 align-self-end"><a class="h3" href="/basket/show/${basketName}">
                <i class="fas fa-cart-arrow-down"></i></a></div>
            <div class="col-xs-4 align-self-end">
                <c:url value="/logout" var="logoutUrl"/>
                <p class="h3"><a href="${logoutUrl}"><i class="fas fa-sign-out-alt"></i></a></p></div>
        </div>
    </div>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<c:url value="/static/podarok.png"/>" class="d-block w-100" alt="">
            </div>
            <div class="carousel-item">
                <img src="<c:url value="/static/cashback.png"/>" class="d-block w-100" alt="">
            </div>
            <div class="carousel-item">
                <img src="<c:url value="/static/dostavka.png"/>" class="d-block w-100" alt="">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">--%>
        <%--&lt;%&ndash;<nav class="navbar navbar-expand-lg navbar-light bg-light">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<nav class="navbar navbar-expand-lg navbar-light bg-primary">&ndash;%&gt;--%>
        <%--<a href="#" class="navbar-brand">--%>
            <%--<img src="<c:url value="/static/mob.png"/>" height="32" width="160" alt="logo">--%>
        <%--</a>--%>
        <%--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"--%>
                <%--aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
            <%--<span class="navbar-toggler-icon"></span>--%>
        <%--</button>--%>
        <%--<div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
            <%--<ul class="navbar-nav mr-auto">--%>
                <%--<li class="nav-item active">--%>
                    <%--<a href="#" class="nav-link">Home</a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a href="#" class="nav-link">Pricing</a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a href="#" class="nav-link">About us</a>--%>
                <%--</li>--%>
                <%--<li class="nav-item dropdown">--%>
                    <%--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"--%>
                       <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                        <%--Dropdown--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>

                        <%--&lt;%&ndash;<a href="/admin">All mobiles</a>&ndash;%&gt;--%>
                        <%--<c:forEach items="${brands}" var="brand">--%>
                            <%--<a class="dropdown-item" href="/users/${brand.id}">${brand.name}</a>--%>
                        <%--</c:forEach>--%>


                        <%--&lt;%&ndash;<a class="dropdown-item" href="#">Action</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a class="dropdown-item" href="#">Another action</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="dropdown-divider"></div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a class="dropdown-item" href="#">Something else here</a>&ndash;%&gt;--%>
                    <%--</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--<form class="form-inline my-2 my-lg-0">--%>
                <%--<input type="text" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">--%>
                <%--<button class="btn btn-outline-success my-2 my-sm-0">Search</button>--%>
            <%--</form> <!-- action add NECESSERY-->--%>
        <%--</div>--%>
    <%--</nav>--%>


    <%--<div align="center">--%>
    <%--<h5>Mobiles in your basket:</h5>--%>
    <%--<c:forEach items="${basket.phones}" var="phone">--%>
    <%--<h5>mobile - ${phone.mobile.name} description - ${phone.mobile.description} price - ${phone.mobile.price}--%>
    <%--phone IMEI - ${phone.imei} phone basket - ${phone.basket.name}<a--%>
    <%--href="/basket/delete/${phone.id}">delete</a></h5>--%>
    <%--</c:forEach>--%>
    <%--<h2>total quantity: ${basket.totalQuantity} </h2>--%>
    <%--<h2>total price: ${basket.totalPrice}</h2>--%>
    <%--<button type="button" id="back" class="btn btn-default navbar-btn">back</button>--%>
    <%--<button type="button" id="buy" class="btn btn-default navbar-btn">buy</button>--%>
    <%--<c:url value="/logout" var="logoutUrl"/>--%>
    <%--<p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>--%>
    <%--</div>--%>
    <%--<div class="alert alert-light" align="center" role="alert">--%>
    <%--Mobiles in your basket:--%>
    <%--</div>--%>

    <div align="center">

        <c:choose>
            <c:when test="${basket.content}">
                <div class="alert alert-dark" align="center" role="alert">
                    Mobiles in your basket:
                </div>
                <c:forEach items="${basket.phones}" var="phone">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <c:forEach items="${phone.mobile.photos}" var="photo">
                                    <img src="/photo/${photo.id}" class="card-img" alt="${phone.mobile.name}">
                                </c:forEach>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="justify-content-between card-title">${phone.mobile.name}
                                        <a href="/basket/delete/${phone.id}"> <i class="far fa-times-circle"></i></a>
                                    </h5>
                                    <p class="card-text">${phone.mobile.description}</p>
                                    <p class="card-text">
                                        <small class="text-muted">There are ${phone.mobile.count} for sale.</small>
                                    </p>
                                </div>
                                    <%--<div class="card-body">--%>
                                    <%--<a href="#" class="card-link">Card link</a>--%>
                                    <%--<a href="#" class="card-link">Another link</a>--%>
                                    <%--</div>--%>
                            </div>

                        </div>

                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <hr/>

                </c:forEach>
                <div class="alert alert-success" role="alert">
                    total quantity: ${basket.totalQuantity}   total price: ${basket.totalPrice} UAH
                </div>

                <a class="btn btn-dark" href="/" role="button">Back</a>
                <a class="btn btn-success" href="/basket/buy" role="button">Buy</a>
                <div class="alert alert-light" role="alert">
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-dark" align="center" role="alert">
                    Your basket is empty!
                </div>
                <a class="btn btn-outline-dark" href="/" role="button">Back</a>
            </c:otherwise>
        </c:choose>
        <%--<c:forEach items="${basket.phones}" var="phone">--%>
            <%--<div class="card mb-3" style="max-width: 540px;">--%>
                <%--<div class="row no-gutters">--%>
                    <%--<div class="col-md-4">--%>
                        <%--<c:forEach items="${phone.mobile.photos}" var="photo">--%>
                            <%--<img src="/photo/${photo.id}" class="card-img" alt="${phone.mobile.name}">--%>
                        <%--</c:forEach>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-8">--%>
                        <%--<div class="card-body">--%>
                            <%--<h5 class="justify-content-between card-title">${phone.mobile.name}--%>
                                <%--<a href="/basket/delete/${phone.id}"> <i class="far fa-times-circle"></i></a>--%>
                            <%--</h5>--%>
                            <%--<p class="card-text">${phone.mobile.description}</p>--%>
                            <%--<p class="card-text">--%>
                                <%--<small class="text-muted">There are ${phone.mobile.count} for sale.</small>--%>
                            <%--</p>--%>
                        <%--</div>--%>
                            <%--&lt;%&ndash;<div class="card-body">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="#" class="card-link">Card link</a>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="#" class="card-link">Another link</a>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--</div>--%>

                <%--</div>--%>

                <%--<div class="card-footer">--%>
                    <%--<small class="text-muted">Last updated 3 mins ago</small>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<hr/>--%>

        <%--</c:forEach>--%>
        <%--<div class="alert alert-success" role="alert">--%>
           <%--total quantity: ${basket.totalQuantity}   total price: ${basket.totalPrice} UAH--%>
        <%--</div>--%>

        <%--<a class="btn btn-dark" href="/" role="button">Back</a>--%>
        <%--<a class="btn btn-success" href="/basket/buy" role="button">Buy</a>--%>
        <%--<div class="alert alert-light" role="alert">--%>
        <%--</div>--%>
    </div>

</div>


<%--<script>--%>
<%--$('.dropdown-toggle').dropdown();--%>
<%--$('#back').click(function () {--%>
<%--window.location.href = '/';--%>
<%--});--%>
<%--$('#buy').click(function () {--%>
<%--window.location.href = '/basket/buy';--%>
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
