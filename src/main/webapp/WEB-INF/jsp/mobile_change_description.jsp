<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>New Description</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"
          action="/mobile/description" method="post">
        <div class="form-group"><h3>New Description for ${mobile.name}</h3></div>
        <div class="form-group"><input type="hidden" name="mobileId" value="${mobile.id}"></div>
        <div class="form-group"><textarea class="form-control form-group" name="newDescription" placeholder="old description: ${mobile.description}"></textarea></div>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Change"></div>
    </form>
</div>
</body>
</html>