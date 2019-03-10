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
          action="/mobilephone/status" method="post">
        <h3>Change status! Phone id - ${phone.id} </h3>
        <select class="selectpicker form-control form-group" name="status" required>
            <option value="RETURNED">RETURNED</option>
            <option value="SOLD">SOLD</option>
        </select>
        <div class="form-group"><input type="hidden" name="phoneId" value="${phone.id}"></div>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Change"></div>
    </form>
</div>
</body>
</html>