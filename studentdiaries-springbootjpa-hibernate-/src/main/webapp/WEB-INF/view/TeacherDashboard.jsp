<%@ page import="org.apache.commons.lang.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 13-07-2018
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--ADD JQUERY ABOVE THE BOOTSTRAP TO ALLOW THE DROP DOWN WORK PROPERLY-->
    <script
            src="https://code.jquery.com/jquery-3.2.1.js"
            integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat|Muli" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <!-- BOOTSTRAP CSS -->
    <link rel="stylesheet" type="text/css" href="/static/mycss/admindashboard.css" />
    <link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />

    <link rel="stylesheet" type="text/css" href="/static/mycss/Maps/jquery-jvectormap-2.0.3.css" >


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="/static/javascript/Chart/Chart.js"></script>

    <title>Teacher | Dashboard</title>
</head>
<body id="main-body" class="animate-bottom" oncontextmenu="return false;">

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
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span id="fullname"><%= StringUtils.capitalize(session.getAttribute("sessionteacherfirstname").toString()) %> <%= StringUtils.capitalize(session.getAttribute("sessionteacherlastname").toString()) %></span></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/TeacherLogout">Logout</a>

                    </div>
                </li>


                <!-- This menu is hidden in bigger devices with d-sm-none.
           The sidebar isn't proper for smaller screens imo, so this dropdown menu can keep all the useful sidebar itens exclusively for smaller screens  -->
                <li class="nav-item dropdown d-sm-block d-md-none">
                    <a class="nav-link dropdown-toggle" href="#" id="smallerscreenmenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Menu
                    </a>
                    <div class="dropdown-menu" aria-labelledby="smallerscreenmenu">
                        <a class="dropdown-item" href="#">Dashboard</a>
                        <a class="teacherspage dropdown-item" href="AdminTeacherUsers.jsp">Teachers</a>
                        <a class="studentspage dropdown-item" href="#">Students</a>
                        <a class="dropdown-item" href="#">Profile</a>
                        <a class="dropdown-item" href="#">Tasks</a>
                        <a class="dropdown-item" href="#">Etc ...</a>
                    </div>
                </li><!-- Smaller devices menu END -->

            </ul>

        </div>
    </nav>

</header>



<!-- Bootstrap row -->
<div class="row" id="body-row">
    <!-- Sidebar -->
    <div id="sidebar-container" class="sidebar-expanded d-none d-md-block"><!-- d-* hiddens the Sidebar in smaller devices. Its itens can be kept on the Navbar 'Menu' -->
        <!-- Bootstrap List Group -->
        <ul class="list-group">
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title d-flex align-items-center menu-collapsed" style="border-width: 1px; border-color: #192a56; font-weight: bolder!important; color: #0984e3;">
                <small>TEACHER | MAIN MENU</small>
            </li>
            <!-- /END Separator -->
            <!-- Menu with submenu -->
            <a href="#submenu1" data-toggle="collapse" aria-expanded="false" class="bg-white text-dark list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-dashboard fa-fw mr-3"></span>
                    <span class="menu-collapsed">Dashboard</span>
                    <span class="submenu-icon ml-auto"></span>
                </div>
            </a>
            <!-- Submenu content -->
            <div id='submenu1' class="collapse sidebar-submenu">
                <a href="#" class="teacherspage list-group-item list-group-item-action bg-dark text-white">
                    <span class="menu-collapsed">Analysis</span>
                </a>
                <a href="/teacher/students" class="studentspage list-group-item list-group-item-action bg-dark text-white">
                    <span class="menu-collapsed">Students</span>
                </a>

            </div>
            <a href="#submenu2" data-toggle="collapse" aria-expanded="false" class="bg-white text-dark list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-user fa-fw mr-3"></span>
                    <span class="menu-collapsed">Profile</span>
                    <span class="submenu-icon ml-auto"></span>
                </div>
            </a>
            <!-- Submenu content -->
            <div id='submenu2' class="collapse sidebar-submenu">
                <a href="/teacher/profile" class="list-group-item list-group-item-action bg-dark text-white">
                    <span class="menu-collapsed">Profile Settings</span>
                </a>
                <a href="/teacher/password/change" class="list-group-item list-group-item-action bg-dark text-white">
                    <span class="menu-collapsed">Change Password</span>
                </a>
            </div>
            <a href="#" class="bg-white text-dark list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-tasks fa-fw mr-3"></span>
                    <span class="menu-collapsed">Tasks</span>
                </div>
            </a>
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed " id="options" style="border-width: 1px; border-color: #192a56; ">
                <small style="font-weight: bolder!important; color: #0984e3;">OPTIONS</small>
            </li>
            <!-- /END Separator -->
            <a href="/teacher/calendar" class="bg-white text-dark list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-calendar fa-fw mr-3"></span>
                    <span class="menu-collapsed">Calendar</span>
                </div>
            </a>
            <a href="#" class="bg-white text-dark list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-envelope-o fa-fw mr-3"></span>
                    <span class="menu-collapsed">Messages <span class="badge badge-pill badge-primary ml-2">5</span></span>
                </div>
            </a>
            <!-- Separator without title -->
            <li class="list-group-item sidebar-separator menu-collapsed myseperator bg-light" style="border-width: 1px; border-color: #192a56;"></li>
            <!-- /END Separator -->
            <a href="#" class="bg-white text-dark list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-question fa-fw mr-3"></span>
                    <span class="menu-collapsed">Help</span>
                </div>
            </a>
            <a href="#" data-toggle="sidebar-colapse" class="bg-white text-dark list-group-item list-group-item-action d-flex align-items-center">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span id="collapse-icon" class="fa fa-2x mr-3"></span>
                    <span id="collapse-text" class="menu-collapsed">Collapse</span>
                </div>
            </a>
            <!-- Logo -->
            <li class="list-group-item logo-separator d-flex justify-content-center" style="border-width: 1px; border-color: #192a56;">
                <img src="/static/images/Owl.jpg" width="30" height="30" />
            </li>
            <li class="list-group-item d-flex justify-content-center" style="border-width: 1px; border-color: #192a56;">
                <h3 >Student<span>Diaries</span></h3>
            </li>
        </ul><!-- List Group END-->
    </div><!-- sidebar-container END -->

    <!--To count number of Students-->
    <%
        Integer count = (Integer) request.getAttribute("count");
    %>

    <!-- MAIN -->
    <div class="col-md-8" id="main-page">

        <div class="card text-center col-md-6 col-lg-12 countcard">

            <div class="card-body align-items-center">
                <h1 class="text-center" ><strong id="count" data-max="<%= count%>"><%= count%></strong></h1>
                <div class="text-center">
                    <h4> Total number of Students.</h4>
                    <small><span id="fullname2"><%= StringUtils.capitalize(session.getAttribute("sessionteacherfirstname").toString()) %> <%= StringUtils.capitalize(session.getAttribute("sessionteacherlastname").toString()) %></span></small>
                </div>
            </div>

        </div>
        <br><br>

        <div class="text-center"><p>Overall Performance of Students.</p></div>
        <div class="form-inline">
            <div class="col-md-6 col-lg-12 text-center">
                <canvas id="myChart" width="800" height="300"></canvas>
            </div>
        </div>
        <br><br>


        <div class="card text-center col-md-6 col-lg-12 countcard" >

            <div class="card-body align-items-center">

                <div class="text-center">
                    <h5>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur consequatur doloremque dolorum, harum iusto magnam molestias nam nihil nisi officiis placeat praesentium quidem quo repellendus similique! Beatae quo rem repellendus.</h5>

                </div>
            </div>

        </div>
        <br><br>

        <div class="form-inline">

            <div class="col-md-6 col-lg-12">
                <div id="world-map" width="800" height="300"></div>
            </div>
        </div>
        <br>


        <div id="footer">
            <footer class="container">
                <p class="float-right"><a href="#main-header"> Back to top</a></p>
                <p class="float-right"><a href="/about/#contact">Contact Us</a></p>
                <p>&copy; StudentDiaries, Inc. 2017-2018 &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>
        </div>

    </div><!-- Main Col END -->

</div><!-- body-row END -->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="/static/javascript/sidebar/mysidebar.js"></script>


<script src="/static/javascript/Dashboard/TeacherDashboardStudentCount.js"></script>

<script src="/static/javascript/Dashboard/TeacherDashboardPie.js"></script>

</body>

<!--LOADER-->
<script>
    window.addEventListener("load", function(){
        var load_screen = document.getElementById("load_screen");
        document.body.removeChild(load_screen);
    });
</script>

</html>
