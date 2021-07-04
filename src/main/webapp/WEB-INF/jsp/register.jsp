<%--&lt;%&ndash;<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">&ndash;%&gt;--%>
<%--&lt;%&ndash;<html>&ndash;%&gt;--%>
<%--&lt;%&ndash;<head>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<title>Let's TEST!</title>&ndash;%&gt;--%>
<%--&lt;%&ndash;</head>&ndash;%&gt;--%>
<%--&lt;%&ndash;<body>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div align="center">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<c:url value="/users/newuser" var="regUrl"/>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<form action="${regUrl}" method="POST">&ndash;%&gt;--%>
        <%--&lt;%&ndash;Login:<br/><input type="text" name="login"><br/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;Password:<br/><input type="password" name="password"><br/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;E-mail:<br/><input type="text" name="email"><br/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;Phone:<br/><input type="text" name="phone"><br/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<input type="submit"/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<c:if test="${exists ne null}">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p>User already exists!</p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</form>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>


    <%--&lt;%&ndash;<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">&ndash;%&gt;--%>
    <%--<link rel="stylesheet" href="static/css/login.css">--%>
    <%--<title>Let's TEST!</title>--%>
    <%--&lt;%&ndash;<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<script>&ndash;%&gt;--%>
    <%--&lt;%&ndash;$(function () {&ndash;%&gt;--%>
    <%--&lt;%&ndash;var $form_inputs = $('form input');&ndash;%&gt;--%>
    <%--&lt;%&ndash;var $rainbow_and_border = $('.rain, .border');&ndash;%&gt;--%>
    <%--&lt;%&ndash;/* Used to provide loping animations in fallback mode */&ndash;%&gt;--%>
    <%--&lt;%&ndash;$form_inputs.bind('focus', function () {&ndash;%&gt;--%>
    <%--&lt;%&ndash;$rainbow_and_border.addClass('end').removeClass('unfocus start');&ndash;%&gt;--%>
    <%--&lt;%&ndash;});&ndash;%&gt;--%>
    <%--&lt;%&ndash;$form_inputs.bind('blur', function () {&ndash;%&gt;--%>
    <%--&lt;%&ndash;$rainbow_and_border.addClass('unfocus start').removeClass('end');&ndash;%&gt;--%>
    <%--&lt;%&ndash;});&ndash;%&gt;--%>
    <%--&lt;%&ndash;$form_inputs.first().delay(800).queue(function () {&ndash;%&gt;--%>
    <%--&lt;%&ndash;$(this).focus();&ndash;%&gt;--%>
    <%--&lt;%&ndash;});&ndash;%&gt;--%>
    <%--&lt;%&ndash;});&ndash;%&gt;--%>
    <%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--</head>--%>
<%--<body>--%>





<%--<div class="container">--%>
    <%--<div class="row">--%>
        <%--<div class="col-md-offset-3 col-md-6">--%>

            <%--<div class="tab" role="tabpanel">--%>
                <%--<!-- Nav tabs -->--%>
                <%--<ul class="nav nav-tabs" role="tablist">--%>
                    <%--<li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">sign in</a></li>--%>
                    <%--<li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">sign up</a></li>--%>
                <%--</ul>--%>
                <%--<!-- Tab panes -->--%>
                <%--<div class="tab-content tabs">--%>
                    <%--<div role="tabpanel" class="tab-pane fade in active" id="Section1">--%>
                        <%--<c:url value="/j_spring_security_check" var="loginUrl"/>--%>
                        <%--<form action="${loginUrl}" method="POST" class="form-horizontal">--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputEmail1">Login</label>--%>
                                <%--<input type="text" name="j_login" placeholder="Login" class="form-control">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputPassword1">Password</label>--%>
                                <%--<input type="password" name="j_password" placeholder="Password" class="form-control" id="exampleInputPassword1">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<div class="main-checkbox">--%>
                                    <%--<input value="None" id="checkbox1" name="check" type="checkbox">--%>
                                    <%--<label for="checkbox1"></label>--%>
                                <%--</div>--%>
                                <%--<span class="text">Keep me Signed in</span>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<button type="submit" class="btn btn-default">Sign in</button>--%>
                            <%--</div>--%>
                            <%--&lt;%&ndash;<div class="form-group forgot-pass">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="submit" value="Forgot password" class="btn btn-default" onclick="window.location='/register';"/>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;&lt;%&ndash;<button type="submit" class="btn btn-default">forgot password</button>&ndash;%&gt;&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--<c:if test="${param.error ne null}">--%>
                                <%--<p>Wrong login or password!</p>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${exists ne null}">--%>
                                <%--<p>User already exists!</p>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${param.logout ne null}">--%>
                                <%--<p>Chao!</p>--%>
                            <%--</c:if>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                    <%--<div role="tabpanel" class="tab-pane fade" id="Section2">--%>


                        <%--<c:url value="/users/newuser" var="regUrl"/>--%>
                        <%--<form action="${regUrl}" method="POST" class="form-horizontal">--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputEmail1">First Name</label>--%>
                                <%--<input type="text" name="first" class="form-control" id="exampleInputEmail1" required>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputEmail1">Last Name</label>--%>
                                <%--<input type="text" name="last" class="form-control" id="exampleInputEmail1" required>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputEmail1">Login</label>--%>
                                <%--<input type="text" name="login" class="form-control" id="exampleInputEmail1">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputEmail1">Email address</label>--%>
                                <%--<input type="email" name="email"class="form-control" id="exampleInputEmail1" required>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="exampleInputPassword1">Password</label>--%>
                                <%--<input type="password" name="password" class="form-control" id="exampleInputPassword1">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<input type="submit" class="btn btn-default">Sign up</input>--%>
                            <%--</div>--%>
                            <%--<c:if test="${exists ne null}">--%>
                                <%--<p>User already exists!</p>--%>
                            <%--</c:if>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

        <%--</div><!-- /.col-md-offset-3 col-md-6 -->--%>
    <%--</div><!-- /.row -->--%>
<%--</div><!-- /.container -->--%>











<%--&lt;%&ndash;<body id="home">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div align="center">&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:url value="/j_spring_security_check" var="loginUrl"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="rain">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="border start">&ndash;%&gt;--%>
<%--&lt;%&ndash;<form action="${loginUrl}" method="POST">&ndash;%&gt;--%>
<%--&lt;%&ndash;<label for="email">Email</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;<label for="login">Login</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;<input type="text" name="j_login" placeholder="Login"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<label for="pass">Password</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;<label for="password">Password</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;<input type="password" name="j_password" placeholder="Password"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;&ndash;%&gt;--%>
<%--&lt;%&ndash;<input type="submit" value="LOG IN"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>

<%--&lt;%&ndash;<input type="submit" value="Resiter" onclick="window.location='/register';"/>&ndash;%&gt;--%>

<%--&lt;%&ndash;&lt;%&ndash;<a href="/forgot">Forgot password!!!</a>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;<p><a href="/register">Register new user</a></p>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;<c:if test="${param.error ne null}">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;<p>Wrong login or password!</p>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;</c:if>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;<c:if test="${param.logout ne null}">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;<p>Chao!</p>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;</c:if>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>


<%--&lt;%&ndash;<div align="center">&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:url value="/j_spring_security_check" var="loginUrl"/>&ndash;%&gt;--%>

<%--&lt;%&ndash;<form action="${loginUrl}" method="POST">&ndash;%&gt;--%>
<%--&lt;%&ndash;Login:<br/><input type="text" name="j_login"><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;Password:<br/><input type="password" name="j_password"><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<input type="submit"/><br>&ndash;%&gt;--%>
<%--&lt;%&ndash;<a href="/forgot">Forgot password!!!</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p><a href="/register">Register new user</a></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:if test="${param.error ne null}">&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Wrong login or password!</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:if test="${param.logout ne null}">&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Chao!</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>


<%--&lt;%&ndash;<form id="login" action="${loginUrl}" method="POST">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h1>Log In</h1>&ndash;%&gt;--%>
<%--&lt;%&ndash;<fieldset id="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;<input id="username" type="text" name="j_login" placeholder="Username" autofocus required>&ndash;%&gt;--%>
<%--&lt;%&ndash;<input id="password" type="password" name="j_password" placeholder="Password" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;</fieldset>&ndash;%&gt;--%>
<%--&lt;%&ndash;<fieldset id="actions">&ndash;%&gt;--%>
<%--&lt;%&ndash;<input type="submit" id="submit" value="Log in">&ndash;%&gt;--%>
<%--&lt;%&ndash;<a href="/forgot">Forgot your password?</a><a href="/register">Register</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;</fieldset>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>


<%--</div>--%>
<%--&lt;%&ndash;<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>&ndash;%&gt;--%>

<%--</body>--%>
<%--</html>--%>
