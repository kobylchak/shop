<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>New Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"
          action="/product/add" method="POST">
        <h3>New product</h3>
        <select class="selectpicker form-control form-group" name="brand" required>
            <option value="-1">Choose brand</option>
            <c:forEach items="${brands}" var="brand" >
                <option value="${brand.id}">${brand.name}</option>
            </c:forEach>
        </select>
        <input class="form-control form-group" type="text" name="name" placeholder="product model">
        <input class="form-control form-group" type="text" name="price" placeholder="enter price 100">
        <input class="form-control form-group" type="text" name="color" placeholder="enter color">


        <textarea class="form-control form-group" name="description" placeholder="description"></textarea>
        <%--<input class="form-control form-group" type="text" name="description" placeholder="description">--%>
        <input class="form-control form-group" type="text" name="discount" placeholder="discount">
        <input type="submit" class="btn btn-primary" value="Add">
    </form>
</div>
<script>
    $('.selectpicker').selectpicker();
</script>
</body>
</html>
