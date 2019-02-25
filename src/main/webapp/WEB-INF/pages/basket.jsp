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
    <c:forEach items="${basket.phones}" var="phone">
        <h5>mobile - ${phone.mobile.name} description - ${phone.mobile.description} price - ${phone.mobile.price}
            phone IMEI - ${phone.imei} phone basket - ${phone.basket.name}<a
                    href="/basket/delete/${phone.id}">delete</a></h5>
    </c:forEach>
    <h2>total quantity: ${basket.totalQuantity} </h2>
    <h2>total price: ${basket.totalPrice}</h2>
    <button type="button" id="back" class="btn btn-default navbar-btn">back</button>
    <button type="button" id="buy" class="btn btn-default navbar-btn">buy</button>
    <c:url value="/logout" var="logoutUrl"/>
    <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
</div>
<script>
    $('.dropdown-toggle').dropdown();
    $('#back').click(function () {
        window.location.href = '/';
    });
    $('#buy').click(function () {
        window.location.href = '/basket/buy';
    });
</script>
</body>
</html>
