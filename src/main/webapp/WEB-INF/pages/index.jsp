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
    <title>MOBILKA</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="css/main.css">--%>
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
                <i class="fas fa-shopping-cart"></i></a></div>
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
        <%--<nav class="navbar navbar-expand-lg navbar-light bg-primary">--%>
        <a href="#" class="navbar-brand">
            <img src="<c:url value="/static/mob.png"/>" height="32" width="160" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a href="#" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Pricing</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">About us</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <%--<a href="/admin">All mobiles</a>--%>
                        <c:forEach items="${brands}" var="brand">
                            <a class="dropdown-item" href="/users/${brand.id}">${brand.name}</a>
                        </c:forEach>


                        <%--<a class="dropdown-item" href="#">Action</a>--%>
                        <%--<a class="dropdown-item" href="#">Another action</a>--%>
                        <%--<div class="dropdown-divider"></div>--%>
                        <%--<a class="dropdown-item" href="#">Something else here</a>--%>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input type="text" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0">Search</button>
            </form> <!-- action add NECESSERY-->
        </div>
    </nav>


    <%--<c:forEach items="${brands}" var="brand">--%>
    <%--&lt;%&ndash;<div class="card-group">&ndash;%&gt;--%>
    <%--<c:forEach items="${brand.mobiles}" var="mobile">--%>
    <%--<div class="card">--%>

    <%--<c:forEach items="${mobile.photos}" var="photo">--%>
    <%--&lt;%&ndash;<input type="checkbox" name="toDeletePhoto[]" value="${photo.id}"&ndash;%&gt;--%>
    <%--&lt;%&ndash;id="checkbox_${photo.id}"/>&ndash;%&gt;--%>
    <%--<img src="/photo/${photo.id}" height="100" alt="${mobile.name}"/>--%>
    <%--</c:forEach>--%>


    <%--&lt;%&ndash;<img src="..." class="card-img-top" alt="...">&ndash;%&gt;--%>
    <%--<div class="card-body">--%>
    <%--<h5 class="card-title">${mobile.name}</h5>--%>
    <%--<p class="card-text">${mobile.description}</p>--%>
    <%--<p class="card-text">--%>
    <%--<small class="text-muted">${mobile.price}</small>--%>
    <%--</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</c:forEach>--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--</c:forEach>--%>

    <%--<body>--%>
    <%--<div class="container">--%>
    <%--<div class="row justify-content-end	align-items-center">--%>
    <%--<div class="col">--%>
    <%--<div class="row">--%>
    <%--<div class="col-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores perferendis placeat--%>
    <%--modi amet quam illum magnam optio! Aspernatur, consequuntur itaque sit laboriosam, voluptates,--%>
    <%--molestias accusamus temporibus voluptas repellendus porro delectus veniam ut?Lorem ipsum.--%>
    <%--</div>--%>
    <%--<div class="col">Lorem ipsum.</div>--%>
    <%--<div class="col">Lorem ipsum.</div>--%>
    <%--<div class="col">Lorem ipsum.</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col offset-1">--%>
    <%--<div class="row">--%>
    <%--<div class="col">Lorem ipsum dolor.</div>--%>
    <%--<div class="col">Lorem ipsum dolor.</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col offset-1">--%>
    <%--<div class="row">--%>
    <%--<div class="col">Lorem ipsum dolor sit.</div>--%>
    <%--<div class="col">Lorem ipsum dolor sit.</div>--%>
    <%--<div class="col">Lorem ipsum dolor sit.</div>--%>
    <%--<div class="col">Lorem ipsum dolor sit.</div>--%>
    <%--<div class="col">Lorem ipsum dolor sit.</div>--%>

    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--<div class="container">--%>
    <%--<div class="row">--%>
    <%--<div class="col">--%>
    <%--<div class="card-deck">--%>
    <%--<c:forEach items="${brands}" var="brand">--%>

    <%--<c:forEach items="${brand.mobiles}" var="mobile">--%>


    <%--<div class="row">--%>
    <%--<div class="col-sm-6 col-md-4 col-lg-2">--%>
    <%--<div class="catprod product jsprod active" style="max-width: 18rem;">--%>
    <div class="container mt-4">
        <div class="row">
            <%--<div class="card-deck">--%>

            <%--<c:forEach items="${brands}" var="brand">--%>

            <c:forEach items="${mobiles}" var="mobile">


                <div class="col-auto mb-3">


                    <div class="card" style="width: 18rem;">
                        <div class="card-body">

                                <%--<div class="card border-success mb-3" style="max-width: 18rem;">--%>


                            <c:forEach items="${mobile.photos}" var="photo">
                                <img src="/photo/${photo.id}" class="card-img-top" alt="${mobile.name}">
                            </c:forEach>
                                <%--<div class="col-2"><i class="far fa-heart"></i></div>--%>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col"><h3 class="card-title">${mobile.name} </h3></div>
                                    <div class="col-3"><p class="h3"><i class="far fa-heart"></i></p></div>
                                </div>
                                    <%--<h5 class="card-title">${mobile.name} </h5>--%>
                                <p class="card-text">
                                    <span class="col"> ${mobile.description}</span>
                                </p>
                                <div class="row align-self-end">
                                    <div class="col-3">
                                        <a href="#" class="btn btn-success">Buy</a>
                                    </div>
                                    <div class="col">
                                        <p class="h5">${mobile.price}</p>
                                    </div>
                                    <div class="col-3">
                                        <a class="h3" href="/basket/${mobile.id}"><i class="fas fa-cart-plus"></i></a>
                                    </div>
                                    <%--<button type="button" id="basket" class="btn btn-default navbar-btn">basket</button>--%>
                                        <%--<p class="card-text"><a href="http://google.com"><i--%>
                                        <%--class="fas fa-allergies"></i></a>${mobile.description}</p>--%>
                                        <%--<a href="#" class="btn btn-success">Buy</a>--%>

                                    <%--<a href="/basket/${mobile.id}">${mobile.name}</a>--%>


                                </div>
                            </div>
                        </div>


                    </div>


                </div>

            </c:forEach>
            <%--</c:forEach>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>


    </div>

    <%--</div>--%>

    <%--</div>--%>
    <%--</div>--%>


    <%----%>
    <%--<div class="card">--%>
    <%--<img src="..." class="card-img-top" alt="...">--%>
    <%--<div class="card-body">--%>
    <%--<h5 class="card-title">Card title</h5>--%>
    <%--<p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>--%>
    <%--<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="card">--%>
    <%--<img src="..." class="card-img-top" alt="...">--%>
    <%--<div class="card-body">--%>
    <%--<h5 class="card-title">Card title</h5>--%>
    <%--<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>--%>
    <%--<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>--%>
    <%--</div>--%>
    <%--</div>--%>


    <%--<div align="center">--%>
    <%--<h1>Your login is: ${login}</h1>--%>
    <%--<h2>basketid = ${basketId}</h2>--%>
    <%--<h1>All mobiles</h1>--%>
    <%--<button type="button" id="basket" class="btn btn-default navbar-btn">basket</button>--%>
    <%--<table align="left" class="table table-striped">--%>
    <%--<thead>--%>
    <%--<tr>--%>
    <%--<td><b>Brand</b></td>--%>
    <%--<td><b>Mobile</b></td>--%>
    <%--<td><b>Photo</b></td>--%>
    <%--<td><b>Price</b></td>--%>
    <%--<td><b>Description</b></td>--%>
    <%--<td><b>Color</b></td>--%>
    <%--<td><b>Discount</b></td>--%>
    <%--</tr>--%>
    <%--</thead>--%>
    <%--<c:forEach items="${brands}" var="brand">--%>
    <%--<c:forEach items="${brand.mobiles}" var="mobile">--%>
    <%--<tr>--%>
    <%--<td>${mobile.brand.name}</td>--%>
    <%--<td><a href="/basket/${mobile.id}">${mobile.name}</a></td>--%>
    <%--<td>--%>
    <%--<c:forEach items="${mobile.photos}" var="photo">--%>
    <%--<input type="checkbox" name="toDeletePhoto[]" value="${photo.id}"--%>
    <%--id="checkbox_${photo.id}"/>--%>
    <%--<img src="/photo/${photo.id}" height="100" alt="${mobile.name}"/>--%>
    <%--</c:forEach>--%>
    <%--</td>--%>
    <%--<td>${mobile.price}</td>--%>
    <%--<td>${mobile.description}<a href="/mobile/description/${mobile.id}">change</a></td>--%>
    <%--<td>${mobile.color}</td>--%>
    <%--<td>${mobile.discount}</td>--%>
    <%--</tr>--%>
    <%--</c:forEach>--%>
    <%--</c:forEach>--%>
    <%--</table>--%>


    <c:url value="/logout" var="logoutUrl"/>
    <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
</div>
<%--<script>--%>
<%--$('.dropdown-toggle').dropdown();--%>
<%--$('#basket').click(function () {--%>
<%--window.location.href = '/basket/show/${basketName}';--%>
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
</body>
</html>
