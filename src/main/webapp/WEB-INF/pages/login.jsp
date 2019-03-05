<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href='<c:url value="/static/mb2.ico" />' type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="static/css/login.css">
    <title>MOBILKA</title>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>--%>
    <%--<script>--%>
    <%--$(function () {--%>
    <%--var $form_inputs = $('form input');--%>
    <%--var $rainbow_and_border = $('.rain, .border');--%>
    <%--/* Used to provide loping animations in fallback mode */--%>
    <%--$form_inputs.bind('focus', function () {--%>
    <%--$rainbow_and_border.addClass('end').removeClass('unfocus start');--%>
    <%--});--%>
    <%--$form_inputs.bind('blur', function () {--%>
    <%--$rainbow_and_border.addClass('unfocus start').removeClass('end');--%>
    <%--});--%>
    <%--$form_inputs.first().delay(800).queue(function () {--%>
    <%--$(this).focus();--%>
    <%--});--%>
    <%--});--%>
    <%--</script>--%>
</head>
<body>


<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">

            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab"
                                                              data-toggle="tab">sign in</a></li>
                    <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">sign
                        up</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content tabs">
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                        <c:url value="/j_spring_security_check" var="loginUrl"/>
                        <form action="${loginUrl}" method="POST" class="form-horizontal">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Login</label>
                                <input type="text" name="j_login" placeholder="Login" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="j_password" placeholder="Password" class="form-control"
                                       id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <div class="main-checkbox">
                                    <input value="None" id="checkbox1" name="check" type="checkbox">
                                    <label for="checkbox1"></label>
                                </div>
                                <span class="text">Keep me Signed in</span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default">Sign in</button>
                            </div>
                            <%--<div class="form-group forgot-pass">--%>
                            <%--<input type="submit" value="Forgot password" class="btn btn-default" onclick="window.location='/register';"/>--%>
                            <%--&lt;%&ndash;<button type="submit" class="btn btn-default">forgot password</button>&ndash;%&gt;--%>
                            <%--</div>--%>
                            <c:if test="${param.error ne null}">
                                <%--<p class="text-primary">Wrong login or password!</p>--%>
                                <p class="text-danger">Wrong login or password!</p>
                                <%--<p>Wrong login or password!</p>--%>
                            </c:if>
                            <c:if test="${exists ne null}">
                                <p class="text-danger">User already exists!</p>
                                <%--<p class="text-primary">User already exists!</p>--%>
                                <%--<p>User already exists!</p>--%>
                            </c:if>
                            <c:if test="${param.logout ne null}">
                                <p class="text-primary">Chao!</p>
                                <%--<p>Chao!</p>--%>
                            </c:if>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Section2">


                        <c:url value="/newuser" var="regUrl"/>
                        <form action="${regUrl}" method="POST" class="form-horizontal">
                            <div class="form-group">
                                <label for="exampleInputEmail1">First Name</label>
                                <input type="text" name="first" class="form-control" id="exampleInputEmail1" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Last Name</label>
                                <input type="text" name="last" class="form-control" id="exampleInputEmail1" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Login</label>
                                <input type="text" name="login" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-default">Sign up</input>
                            </div>
                            <c:if test="${exist ne null}">
                                <p>User already exists!</p>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>

        </div><!-- /.col-md-offset-3 col-md-6 -->
    </div><!-- /.row -->
</div><!-- /.container -->


<%--<body id="home">--%>
<%--<div align="center">--%>
<%--<c:url value="/j_spring_security_check" var="loginUrl"/>--%>
<%--<div class="rain">--%>
<%--<div class="border start">--%>
<%--<form action="${loginUrl}" method="POST">--%>
<%--<label for="email">Email</label>--%>
<%--<label for="login">Login</label>--%>
<%--<input type="text" name="j_login" placeholder="Login"/>--%>
<%--<label for="pass">Password</label>--%>
<%--<label for="password">Password</label>--%>
<%--<input type="password" name="j_password" placeholder="Password"/>--%>
<%----%>
<%--<input type="submit" value="LOG IN"/>--%>
<%--</form>--%>

<%--<input type="submit" value="Resiter" onclick="window.location='/register';"/>--%>

<%--&lt;%&ndash;<a href="/forgot">Forgot password!!!</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p><a href="/register">Register new user</a></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:if test="${param.error ne null}">&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Wrong login or password!</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:if test="${param.logout ne null}">&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Chao!</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</body>--%>


<%--<div align="center">--%>
<%--<c:url value="/j_spring_security_check" var="loginUrl"/>--%>

<%--<form action="${loginUrl}" method="POST">--%>
<%--Login:<br/><input type="text" name="j_login"><br/>--%>
<%--Password:<br/><input type="password" name="j_password"><br/>--%>
<%--<input type="submit"/><br>--%>
<%--<a href="/forgot">Forgot password!!!</a>--%>
<%--<p><a href="/register">Register new user</a></p>--%>
<%--<c:if test="${param.error ne null}">--%>
<%--<p>Wrong login or password!</p>--%>
<%--</c:if>--%>
<%--<c:if test="${param.logout ne null}">--%>
<%--<p>Chao!</p>--%>
<%--</c:if>--%>
<%--</form>--%>


<%--<form id="login" action="${loginUrl}" method="POST">--%>
<%--<h1>Log In</h1>--%>
<%--<fieldset id="inputs">--%>
<%--<input id="username" type="text" name="j_login" placeholder="Username" autofocus required>--%>
<%--<input id="password" type="password" name="j_password" placeholder="Password" required>--%>
<%--</fieldset>--%>
<%--<fieldset id="actions">--%>
<%--<input type="submit" id="submit" value="Log in">--%>
<%--<a href="/forgot">Forgot your password?</a><a href="/register">Register</a>--%>
<%--</fieldset>--%>
<%--</form>--%>


</div>
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>

</body>
</html>
