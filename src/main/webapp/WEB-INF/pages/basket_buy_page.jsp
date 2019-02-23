<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Buy Mobile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"
          action="/basket/buy" method="POST">
        <h3>BUY:</h3>
        <%--<h6>Choose mobile brand or at first create mobile brand--%>
            <%--<input type="submit" value="Add brand" onclick="window.location='/brand';"/>--%>
        <%--</h6>--%>
        <%--<select class="selectpicker form-control form-group" name="brand" required>--%>
            <%--<c:forEach items="${brands}" var="brand">--%>
                <%--<option value="${brand.id}">${brand.name}</option>--%>
            <%--</c:forEach>--%>
        <%--</select>--%>

        <input class="form-control form-group" type="text" name="delMethod" placeholder="enter delivery method">
        <input class="form-control form-group" type="text" name="delAddress" placeholder="enter delivert address">
        <%--<input class="form-control form-group" type="text" name="color" placeholder="enter color">--%>
        <%--<textarea class="form-control form-group" name="description" placeholder="description"></textarea>--%>
        <%--<input class="form-control form-group" type="text" name="discount" placeholder="discount">--%>
        <input type="submit" class="btn btn-primary" value="Add">
    </form>
</div>
</body>
</html>