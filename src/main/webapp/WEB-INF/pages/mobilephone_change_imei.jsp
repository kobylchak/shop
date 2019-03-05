<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>New IMEI</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"
          action="/mobilephone/description" method="post">
        <div class="form-group"><h3>New IMEI for phone id -${phone.id}. Old IMEI -${phone.imei}</h3></div>
        <div class="form-group"><input type="hidden" name="phoneId" value="${phone.id}"></div>
        <div class="form-group"><input class="form-control form-group" type="text" name="newImei" placeholder="mobile IMEI" required></div>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Change"></div>
    </form>
</div>
</body>
</html>