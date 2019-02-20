<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Main shop page!</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
    <h1>Your login is: ${login}, your roles are:</h1>
    <%--<c:if test="${basket ne null}">--%>
    <%--<h5>MOBILES IN THE BASKET:</h5>--%>
    <%--<c:forEach items="${basket.mobiles}" var="mobile">--%>
    <%--<h5>mob - ${mobile.name} description - ${mobile.description} price - ${mobile.price}</h5>--%>
    <%--</c:forEach>--%>
    <%--</c:if>--%>
    <h1>All mobiles</h1>
    <button type="button" id="basket" class="btn btn-default navbar-btn">basket</button>
    <table align="left" class="table table-striped">
        <thead>
        <tr>
            <%--<td></td>--%>
            <td><b>Brand</b></td>
            <td><b>Mobile</b></td>
            <td><b>Photo</b></td>
            <td><b>Price</b></td>
            <td><b>Description</b></td>
            <td><b>Color</b></td>
            <td><b>Discount</b></td>
        </tr>
        </thead>
        <c:forEach items="${brands}" var="brand">
            <c:forEach items="${brand.mobiles}" var="mobile">
                <tr>
                        <%--<td><input type="checkbox" name="toDo[]" value="${mobile.id}" id="checkbox_${mobile.id}"/></td>--%>
                    <td>${mobile.brand.name}</td>
                    <td><a href="/basket/${mobile.id}">${mobile.name}</a></td>
                    <td>
                            <%--<form role="form" class="form-horizontal" content="application/x-www-form-urlencoded"--%>
                            <%--accept-charset="UTF-8"--%>
                            <%--action="/basket" method="POST">--%>
                            <%--<input type="hidden" name="mobileId" value="${mobile.id}">--%>
                            <%----%>
                            <%--</form>--%>
                            <%--</td>--%>


                            <%--<td><a href="/photo/download/${mobile.id}"><img height="100" width="60"--%>
                            <%--src="<c:url value="/static/addPhoto.png"/>"/></a>--%>
                        <c:forEach items="${mobile.photos}" var="photo">
                            <input type="checkbox" name="toDeletePhoto[]" value="${photo.id}"
                                   id="checkbox_${photo.id}"/>
                            <img src="/photo/${photo.id}" height="100" alt="${mobile.name}"/>
                        </c:forEach>
                    </td>
                    <td>${mobile.price}</td>
                    <td>${mobile.description}<a href="/mobile/description/${mobile.id}"> change</a></td>
                    <td>${mobile.color}</td>
                    <td>${mobile.discount}</td>
                </tr>
            </c:forEach>
        </c:forEach>

    </table>
    <c:url value="/logout" var="logoutUrl"/>
    <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
</div>
<script>
    $('.dropdown-toggle').dropdown();
    $('#basket').click(function () {
        window.location.href = '/basket/show/${basketName}';
    });
</script>
</body>
</html>
