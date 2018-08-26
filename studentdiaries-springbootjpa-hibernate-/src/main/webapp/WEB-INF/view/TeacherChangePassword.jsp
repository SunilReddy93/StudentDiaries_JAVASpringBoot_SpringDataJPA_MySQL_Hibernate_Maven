<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 14-07-2018
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat|Muli" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />
    <link rel="stylesheet" href="/static/mycss/adminsignup.css">
    <link rel="stylesheet" href="/static/mycss/Login.css">
    <link rel="stylesheet" href="/static/mycss/users/successorfailure.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Change Password | Teacher</title>
</head>
<body oncontextmenu="return false;">
<div id="load_screen"><div id="loading"></div></div>

<!-- HEADER -->
<header id="main-header">

    <nav class="navbar navbar-expand-md navbar-light bg-white fixed-top">
        <a class="navbar-brand" href="/index"><span>Student</span>Diaries</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/index">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about/#services">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span id="fullname"><%= WordUtils.capitalizeFully(session.getAttribute("sessionteacherfirstname").toString()) %> <%= WordUtils.capitalizeFully(session.getAttribute("sessionteacherlastname").toString()) %></span></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/TeacherLogout">Logout</a>

                    </div>
                </li>
            </ul>

        </div>
    </nav>
</header>
<br>

<div class="container heading">
    <%
        if (session.getAttribute("IncorrectOldPassword") != null)
        {
    %>
    <p style="color: red; margin-left: 38%"><%= session.getAttribute("IncorrectOldPassword").toString() %></p>
    <%
        session.removeAttribute("IncorrectOldPassword");
    }
    else if (session.getAttribute("NonMatchingNewPasswords") != null)
    {
    %>
    <p style="color: red; margin-left: 38%"><%= session.getAttribute("NonMatchingNewPasswords").toString() %></p>
    <%
        session.removeAttribute("NonMatchingNewPasswords");
    }
    else if (session.getAttribute("MatchingOldNewPasswords") != null)
    {
    %>
    <p style="color: red; margin-left: 36%"><%= session.getAttribute("MatchingOldNewPasswords").toString() %></p>
    <%
        session.removeAttribute("MatchingOldNewPasswords");
    }
    else if (session.getAttribute("Atleast6Characters") != null)
    {
    %>
    <p style="color: red; margin-left: 35%"><%= session.getAttribute("Atleast6Characters").toString() %></p>
    <%
            session.removeAttribute("Atleast6Characters");
        }
    %>


</div>
<br>

<div class="col-md-6 offset-md-3">
    <span class="anchor" id="formChangePassword"></span>



    <!-- form card change password -->
    <div class="card  border-info">

        <div class="card-header form-inline">
            <h3 class="mb-0">Change Password</h3>
            <img src="/static/images/Lock.png" class="float-right" style="width: 30px; height: 30px;">
        </div>
        <div class="card-body">
            <form class="form" role="form" autocomplete="off" action="/teacher/password/change/submit" method="post">
                <div class="form-group">
                    <label for="oldpassword">Current Password</label>
                    <input type="password" class="form-control" id="oldpassword" name="oldpassword"   required="">
                </div>
                <div class="form-group">
                    <label for="password">New Password</label>
                    <input type="password" class="form-control" id="password" name="password"  required="">

                    <span class="form-text small text-muted">The password must be 6-15 characters, and must <em>not</em> contain spaces.</span>
                    <p id="parapassword"></p>
                </div>
                <div class="form-group">
                    <label for="verifypassword">Verify</label>
                    <input type="password" class="form-control" id="verifypassword" name="verifypassword"  required="">
                    <span class="form-text small text-muted">To confirm, type the new password again.</span>
                </div>
                <div class="form-group">
                    <a class="btn btn-primary btn-lg" href="/teacher/dashboard">Go Back</a>
                    <button type="submit" class="btn btn-success btn-lg float-right">Save</button>
                </div>
            </form>
        </div>
    </div>
    <!-- /form card change password -->

</div>
<br><br><br>

<!--FOOTER-->
<section id="footer">
    <div class="container">
        <footer class="container">
            <p class="float-right"><a href="#main-header"> Back to top</a></p>
            <p class="float-right"><a href="/about/#contact">Contact Us</a></p>
            <p>&copy; StudentDiaries, Inc. 2017-2018 &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </div>
</section>


<!-- JS APIs-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script
        src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous"></script>

<script src="/static/javascript/adminsignup/adminPasswordValid.js"></script>
</body>
<!--LOADER-->
<script>
    window.addEventListener("load", function(){
        var load_screen = document.getElementById("load_screen");
        document.body.removeChild(load_screen);
    });
</script>
</html>