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
<%--<div align="left" class="container">--%>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="moduleList" class="nav navbar-nav">
                    <li>
                        <button type="button" id="add_product" class="btn btn-default navbar-btn">Add Product</button>
                    </li>
                    <li>
                        <button type="button" id="add_brand" class="btn btn-default navbar-btn">Add Brand</button>
                    </li>
                    <li>
                        <button type="button" id="delete_product" class="btn btn-default navbar-btn">Delete Product</button>
                    </li>
                    <li>
                        <button type="button" id="change_price" class="btn btn-default navbar-btn">Change price</button>
                        <input type="text" name="newPrice" id="newPrice" placeholder="Enter new price">
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Brands <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin">All products</a></li>
                            <c:forEach items="${brands}" var="brand">
                                <li><a href="/brand/${brand.id}">${brand.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search" action="/search" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="pattern" placeholder="Search">
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
            <td><b>Product</b></td>
            <td><b>Photo</b></td>
            <td><b>Price</b></td>
            <td><b>Description</b></td>
            <td><b>Color</b></td>
            <td><b>Discount</b></td>
        </tr>
        </thead>
        <c:forEach items="${products}" var="product">
            <tr>
                <td><input type="checkbox" name="toDo[]" value="${product.id}" id="checkbox_${product.id}"/></td>
                <c:choose>
                    <c:when test="${product.brand ne null}">
                        <td>${product.brand.name}</td>
                    </c:when>
                    <c:otherwise>
                        <td>Default</td>
                    </c:otherwise>
                </c:choose>
                <td>${product.product}</td>
                <td><img src="/photo/${product.id}"
                         height="100" alt="${product.product}"/></td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>${product.color}</td>
                <td>${product.discount}</td>    <%--можно попробывать здесь создать ссылку на изменение скидки--%>

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
    $('#add_product').click(function () {
        window.location.href = '/product_add_page';
    });
    $('#add_brand').click(function () {
        window.location.href = '/brand_add_page';
    });
    $('#delete_product').click(function () {
        var data = {'toDo[]': []};
        $(":checked").each(function () {
            data['toDo[]'].push($(this).val());
        });
        $.post("/product/delete", data, function (data, status) {
            window.location.reload();
        });
    });
    $('#change_price').click(function () {
        // var newPrice = $('newPrice').val();
        var newPrice = document.getElementById("newPrice").value;
        // var newPrice = 'newPrice';
        var data = {newPrice: newPrice, 'toDo[]': []};
        $(":checked").each(function () {
            data['toDo[]'].push($(this).val());
        });

        $.post("/product/change_price", data, function (data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>






































































































