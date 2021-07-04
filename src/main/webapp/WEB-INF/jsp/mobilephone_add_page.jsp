<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>New Mobile Phone</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" content="application/x-www-form-urlencoded" accept-charset="UTF-8"
          action="/mobilephone" method="POST">
        <h3>New mobile phone</h3>

        <select class="selectpicker form-control form-group" name="mobile" required>
            <c:forEach items="${mobiles}" var="mobile">
                <option value="${mobile.id}">${mobile.name}</option>
            </c:forEach>
        </select>
        <input class="form-control form-group" type="text" name="imei" placeholder="mobile IMEI" required>
        <input type="submit" class="btn btn-primary" value="Add">
    </form>
</div>
</body>
</html>