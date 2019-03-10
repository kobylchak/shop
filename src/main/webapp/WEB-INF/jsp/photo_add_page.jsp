<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>New Photo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" action="/photo/add" enctype="multipart/form-data" method="POST">
        <h3>New photo</h3>
        <input type="hidden" name="mobileId" value="${mobileId}">
        <input type="file" name="photo">
        <input type="submit" class="btn btn-primary" value="Add">
    </form>
</div>
</body>
</html>
