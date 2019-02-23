<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Let's TEST!</title>
</head>
<body>
<div align="center">
    <c:url value="/users/newuser" var="regUrl"/>
    <form action="${regUrl}" method="POST">
        Login:<br/><input type="text" name="login"><br/>
        Password:<br/><input type="password" name="password"><br/>
        E-mail:<br/><input type="text" name="email"><br/>
        Phone:<br/><input type="text" name="phone"><br/>
        <input type="submit"/>
        <c:if test="${exists ne null}">
            <p>User already exists!</p>
        </c:if>
    </form>
</div>
</body>
</html>
