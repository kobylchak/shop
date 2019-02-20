<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Basket page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
    <h5>MOBILES:</h5>
    <c:forEach items="${basket.mobiles}" var="mobile">
        <h5>mobile - ${mobile.name} description - ${mobile.description} price - ${mobile.price} <a href="/basket/delete/${mobile.id}">delete</a></h5>
    </c:forEach>
    <h2>total price: ${basket.totalPrice}
        <%--<c:set var="quantity" value="0"/>--%>
        <%--<c:forEach items="${basket.mobiles}" var="mobile">--%>
            <%--<c:set var="quantity" value="${quantity + mobile.price}"/>--%>
        <%--</c:forEach>--%>
        <%--<c:out value="${quantity}"/>--%>
    </h2>

    <button type="button" id="back" class="btn btn-default navbar-btn">back</button>


    <%--<table align="left" class="table table-striped">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--&lt;%&ndash;<td></td>&ndash;%&gt;--%>
            <%--<td><b>Brand</b></td>--%>
            <%--<td><b>Mobile</b></td>--%>
            <%--<td><b>Photo</b></td>--%>
            <%--<td><b>Price</b></td>--%>
            <%--<td><b>Description</b></td>--%>
            <%--<td><b>Color</b></td>--%>
            <%--<td><b>Discount</b></td>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--&lt;%&ndash;<c:forEach items="${brands}" var="brand">&ndash;%&gt;--%>
        <%--<c:forEach items="${basket.mobiles}" var="mobile">--%>
            <%--<tr>--%>
                    <%--&lt;%&ndash;<td><input type="checkbox" name="toDo[]" value="${mobile.id}" id="checkbox_${mobile.id}"/></td>&ndash;%&gt;--%>
                <%--<td>${mobile.brand.name}</td>--%>
                    <%--&lt;%&ndash;<td><a href="/basket/${mobile.id}">${mobile.name}</a></td>&ndash;%&gt;--%>
                <%--<td>${mobile.name}</td>--%>
                <%--<td>--%>
                        <%--&lt;%&ndash;&lt;%&ndash;<form role="form" class="form-horizontal" content="application/x-www-form-urlencoded"&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;accept-charset="UTF-8"&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;action="/basket" method="POST">&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;<input type="hidden" name="mobileId" value="${mobile.id}">&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;</form>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;</td>&ndash;%&gt;&ndash;%&gt;--%>


                        <%--&lt;%&ndash;&lt;%&ndash;<td><a href="/photo/download/${mobile.id}"><img height="100" width="60"&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;src="<c:url value="/static/addPhoto.png"/>"/></a>&ndash;%&gt;&ndash;%&gt;--%>
                    <%--<c:forEach items="${mobile.photos}" var="photo">--%>
                        <%--&lt;%&ndash;<input type="checkbox" name="toDeletePhoto[]" value="${photo.id}" id="checkbox_${photo.id}"/>&ndash;%&gt;--%>
                        <%--<img src="/photo/${photo.id}" height="100" alt="${mobile.name}"/>--%>
                    <%--</c:forEach>--%>
                <%--</td>--%>
                <%--<td>${mobile.price}</td>--%>
                <%--<td>${mobile.description}<a href="/mobile/description/${mobile.id}"> change</a></td>--%>
                <%--<td>${mobile.color}</td>--%>
                <%--<td>${mobile.discount}</td>--%>
            <%--</tr>--%>
            <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
        <%--</c:forEach>--%>

    <%--</table>--%>

    <%--<c:if test="${admin ne null}">--%>
    <%--<input type="submit" value="Secret admin page" onclick="window.location='/admin'; "/>--%>
    <%--</c:if>--%>
    <%--<c:if test="${user ne null}">--%>
    <%--<input type="submit" value="Let's TEST" onclick="window.location='/test'; "/>--%>
    <%--</c:if>--%>
    <%--<c:forEach var="s" items="${roles}">--%>
    <%--<h3><c:out value="${s}"/></h3>--%>
    <%--</c:forEach>--%>
    <%--<c:url value="/update" var="updateUrl"/>--%>
    <%--<form action="${updateUrl}" method="POST">--%>
    <%--E-mail:<br/><input type="text" name="email" value="${email}"/><br/>--%>
    <%--Phone:<br/><input type="text" name="phone" value="${phone}"/><br/>--%>
    <%--<input type="submit" value="Update"/>--%>
    <%--</form>--%>
    <c:url value="/logout" var="logoutUrl"/>
    <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
</div>
<script>
    $('.dropdown-toggle').dropdown();
    $('#back').click(function () {
        window.location.href = '/';
    });
</script>
</body>
</html>
