<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Let's TEST!</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
    <h1>Secret page for admins only!</h1>
    <c:url value="/logout" var="logoutUrl"/>
    <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
</div>
<div align="left">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="moduleList" class="nav navbar-nav">
                    <li>
                        <button type="button" id="add_brand" class="btn btn-default navbar-btn">Add Brand</button>
                    </li>
                    <li>
                        <button type="button" id="add_mobile" class="btn btn-default navbar-btn">Add Mobile</button>
                    </li>
                    <li>
                        <button type="button" id="delete_mobile" class="btn btn-default navbar-btn">Delete Mobile
                        </button>
                    </li>
                    <li>
                        <button type="button" id="delete_photo" class="btn btn-default navbar-btn">Delete Photo</button>
                    </li>
                    <li>
                        <input type="text" name="newPrice" id="newPrice" placeholder="Check and enter new price">
                        <button type="button" id="change_price" class="btn btn-default navbar-btn">Change price</button>
                    </li>
                    <li>
                        <input type="text" name="newDiscount" id="newDiscount" placeholder="Enter new discount">
                        <button type="button" id="change_discount" class="btn btn-default navbar-btn">Change discount
                        </button>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Brands <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin">All mobiles</a></li>
                            <c:forEach items="${brands}" var="brand">
                                <li><a href="/brand/${brand.id}">${brand.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <button type="button" id="find_users" class="btn btn-default navbar-btn">Find Users</button>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search" action="/search" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="pattern" placeholder="Search by mobile name">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </nav>
    <table align="left" class="table table-striped">
        <thead>
        <tr>
            <td></td>
            <td><b>Brand</b></td>
            <td><b>Mobile</b></td>
            <td><b>Photo</b></td>
            <td><b>Price</b></td>
            <td><b>Description</b></td>
            <td><b>Color</b></td>
            <td><b>Discount</b></td>
        </tr>
        </thead>
        <c:forEach items="${mobiles}" var="mobile">
            <tr>
                <td><input type="checkbox" name="toDo[]" value="${mobile.id}" id="checkbox_${mobile.id}"/></td>
                    <td>${mobile.brand.name}</td>
                <td>${mobile.name}</td>
                <td><a href="/photo/download/${mobile.id}"><img height="100" width="60"
                                                                 src="<c:url value="/static/addPhoto.png"/>"/></a>
                    <c:forEach items="${mobile.photos}" var="photo">
                        <input type="checkbox" name="toDeletePhoto[]" value="${photo.id}" id="checkbox_${photo.id}"/>
                        <img src="/photo/${photo.id}" height="100" alt="${mobile.name}"/>
                    </c:forEach>
                </td>
                <td>${mobile.price}</td>
                <td>${mobile.description}<a href="/mobile/description/${mobile.id}"> change</a></td>
                <td>${mobile.color}</td>
                <td>${mobile.discount}</td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${allPages ne null}">
                <c:forEach var="i" begin="1" end="${allPages}">
                    <li><a href="/admin/?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>
                </c:forEach>
            </c:if>
            <c:if test="${byGroupPages ne null}">
                <c:forEach var="i" begin="1" end="${byGroupPages}">
                    <li><a href="/brand/${brandId}?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>
                </c:forEach>
            </c:if>
        </ul>
    </nav>
</div>
<script>
    $('.dropdown-toggle').dropdown();
    $('#add_mobile').click(function () {
        window.location.href = '/mobile';
    });

    $('#add_brand').click(function () {
        window.location.href = '/brand';
    });
    $('#delete_mobile').click(function () {
        var data = {'toDo[]': []};
        $(":checked").each(function () {
            data['toDo[]'].push($(this).val());
        });
        $.post("/mobile/delete", data, function (data, status) {
            window.location.reload();
        });
    });
    $('#delete_photo').click(function () {
        var data = {'toDeletePhoto[]': []};
        $(":checked").each(function () {
            data['toDeletePhoto[]'].push($(this).val());
        });
        $.post("/photo/delete", data, function (data, status) {
            window.location.reload();
        });
    });
    $('#change_price').click(function () {
        var newPrice = document.getElementById("newPrice").value;
        var data = {newPrice: newPrice, 'toDo[]': []};
        $(":checked").each(function () {
            data['toDo[]'].push($(this).val());
        });
        $.post("/mobile/change_price", data, function (data, status) {
            window.location.reload();
        });
    });
    $('#change_discount').click(function () {
        var newDiscount = document.getElementById("newDiscount").value;
        var data = {newDiscount: newDiscount, 'toDo[]': []};
        $(":checked").each(function () {
            data['toDo[]'].push($(this).val());
        });
        $.post("/mobile/change_discount", data, function (data, status) {
            window.location.reload();
        });
    });
    $('#find_users').click(function () {
        window.location.href = '/users';
    });
</script>
</body>
</html>
