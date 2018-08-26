<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.commons.lang.WordUtils" %>
<%@ page import="com.studentdiaries.springboot.Model.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 13-07-2018
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Admin admin = (Admin) request.getAttribute("admin");
%>
<html>
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat|Muli" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <!-- CHECKBOX CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" />

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css">


    <!-- BOOTSTRAP CSS -->
    <link rel="stylesheet" type="text/css" href="/static/mycss/users/AdminProfileSettings.css"/>

    <link rel="stylesheet" type="text/css" href="/static/mycss/users/teacherusers.css"/>

    <link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Admin | Profile</title>
</head>
<body oncontextmenu="return false;">
<div id="load_screen"><div id="loading"></div></div>

<!-- MAIN- NAVBAR -->
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
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span id="fullname"><%= StringUtils.capitalize(session.getAttribute("sessionadminfirstname").toString()) %> <%= StringUtils.capitalize(session.getAttribute("sessionadminlastname").toString())%></span></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/AdminLogout">Logout</a>

                    </div>
                </li>

            </ul>

        </div>
    </nav>

</header>
<br>

<!-- HEADER 2-->

<header id="header">
    <div class="container container1" id="container-header" >
        <div class="row">
            <div class="col-md-6">
                <div class="fafaicons">
                    <a href="/admin/dashboard" title="Dashboard"><i class="material-icons md-dark">arrow_back</i></a>
                </div>
            </div>


            <div class="fafaicons d-flex justify-content-end float-right ml-auto">
                <a  href="/admin/profile/updateform" title="Edit Profile"><span><i class="material-icons">
create</i></span></a>
            </div>

            <div class="fafaicons d-flex justify-content-end float-right">
                <a href="" data-toggle="modal" data-target="#ModalCenter" title="Delete Account" id="trash"><span><i class="material-icons">delete</i></span></a>
            </div>


            <!-- Modal -->
            <div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Warning!</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete the account?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <a href="/admin/account/delete"> <button type="button" class="btn btn-primary">Yes</button></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end float-right">
                <a  id="profilename" href="#" title="Admin Name">
                    <h3><%= StringUtils.capitalize(admin.getAdminFirstName()) %></h3>
                </a>
            </div>
        </div>

    </div>
</header>


<section>
    <div class="container py-3">
        <div class="card">
            <div class="row ">
                <div class="col-md-4">
                    <img id="image" src="/static/images/giphy.gif" class="img-fluid w-100 img-responsive d-flex justify-content-center align-items-center">
                </div>
                <div class="col-md-8 px-3">
                    <div class="card-block px-3">
                        <h5 class="card-title"><%= StringUtils.capitalize(admin.getAdminFirstName()) %> <%= StringUtils.capitalize(admin.getAdminLastName()) %></h5>
                        <p class="card-text">Admin ID: <%= admin.getAdminId() %>, <%= WordUtils.capitalizeFully(admin.getAdminSchool()) %>, <%= StringUtils.capitalize(admin.getAdminCity()) %> </p>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><p><span><i class="fa fa-envelope"></i></span>  <%= admin.getAdminEmail() %></p></li>
                            <li class="list-group-item"><p><span><i class="fa fa-phone"></i></span>  <%= admin.getAdminPhone() %></p> </li>

                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#" class="card-link"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="card-link"><i class="fa fa-linkedin"></i></a>
                            <a href="#" class="card-link"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="card-link"><i class="fa fa-youtube"></i></a>
                        </div>
                    </div>

                </div>



            </div>

        </div>
    </div>
    </div>

</section>


<!-- FOOTER-->
<section id="footer">
    <div class="container">
        <footer class="container">
            <p class="float-right"><a href="#main-header"> Back to top</a></p>
            <p class="float-right"><a href="/about/#contact">Contact Us</a></p>
            <p>&copy; StudentDiaries, Inc. 2017-2018 &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </div>
</section>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script
        src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous"></script>

</body>
<!--LOADER-->
<script>
    window.addEventListener("load", function(){
        var load_screen = document.getElementById("load_screen");
        document.body.removeChild(load_screen);
    });
</script>
</html>