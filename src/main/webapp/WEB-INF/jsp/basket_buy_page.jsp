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
        <h6>Choose delivery method.</h6>
        <select class="selectpicker form-control form-group" name="delMethod" required>
            <option value="nova poshta">Nova poshta</option>
            <option value="ukrposhta">ukrposhta</option>
            <option value="intime">intime</option>
        </select>
        <input class="form-control form-group" type="text" name="delAddress" required placeholder="Enter delivert address">
        <input class="form-control form-group" type="text" name="phone" required placeholder="Enter your phone number">
        <input type="submit" class="btn btn-primary" value="Add">
    </form>
</div>
</body>
</html>
