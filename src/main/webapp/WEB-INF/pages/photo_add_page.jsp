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
    <%--<form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"--%>
    <form role="form" class="form-horizontal" action="/photo/add" enctype="multipart/form-data" method="POST">

        <h3>New photo</h3>

        <%--&lt;%&ndash;<select class="selectpicker form-control form-group" name="brand">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<option value="-1">Default</option>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<c:forEach items="${brands}" var="brand">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<option value="${brand.id}">${brand.name}</option>&ndash;%&gt;--%>
                <%--&lt;%&ndash;&ndash;%&gt;--%>
            <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</select>&ndash;%&gt;--%>



        <%--<select class="selectpicker form-control form-group" name="product">--%>
            <%--<option value="-1">Default</option>--%>
            <%--<c:forEach items="${brand.product}" var="product">--%>
                <%--<option value="${product.id}">${product.name}</option>--%>
            <%--</c:forEach>--%>
        <%--</select>--%>
        <%--<input class="form-control form-group" type="text" name="name" placeholder="product model">--%>
        <input type="hidden" name="productId" value="${productId}">
        <input type="file" name="photo">
        <%--<input class="form-control form-group" type="text" name="price" placeholder="enter price 100">--%>
        <%--<input class="form-control form-group" type="text" name="color" placeholder="enter color">--%>
        <%--<input class="form-control form-group" type="text" name="description" placeholder="description">--%>
        <%--<input class="form-control form-group" type="text" name="discount" placeholder="discount">--%>
        <input type="submit" class="btn btn-primary" value="Add">
    </form>
</div>
<%--<script>--%>
    <%--$('.selectpicker').selectpicker();--%>
<%--</script>--%>
</body>
</html>
