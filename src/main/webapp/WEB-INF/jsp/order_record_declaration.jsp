<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"
          action="/admin/orders/declaration" method="post">
        <div class="form-group"><h3>Enter number of declaration, where order id: ${order.id}:</h3></div>
        <div class="form-group"><input type="hidden" name="orderId" value="${order.id}"></div>
        <input class="form-control form-group" type="text" name="declaration" placeholder="Enter number of declaration">
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Change"></div>
    </form>
</div>
</body>
</html>