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
    <link rel="stylesheet" href="static/css/login.css">
    <title>MOBILKA</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="tab" role="tabpanel">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab"
                                                              data-toggle="tab">sign in</a></li>
                    <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">sign
                        up</a></li>
                </ul>
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
                            <c:if test="${param.error ne null}">
                                <p class="text-danger">Wrong login or password!</p>
                            </c:if>
                            <c:if test="${exists ne null}">
                                <p class="text-danger">User already exists!</p>
                            </c:if>
                            <c:if test="${param.logout ne null}">
                                <p class="text-primary">Chao!</p>
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
                                <input type="text" name="login" class="form-control" id="exampleInputEmail1" required>
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
</body>
</html>
