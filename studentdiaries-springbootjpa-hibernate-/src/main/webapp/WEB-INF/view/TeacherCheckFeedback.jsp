<%@ page import="com.studentdiaries.springboot.CustomModel.FeedbackStudentDetails" %>
<%@ page import="com.studentdiaries.springboot.Model.Feedback" %>
<%@ page import="com.studentdiaries.springboot.Model.Student" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 15-07-2018
  Time: 00:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<%
    FeedbackStudentDetails feedbackStudentDetails = (FeedbackStudentDetails) request.getAttribute("studentfeedback");

    Feedback feedback = feedbackStudentDetails.getFeedback();
    Student student = feedbackStudentDetails.getStudent();

    SimpleDateFormat dateformat = new SimpleDateFormat("E, dd MMM yyyy");
    String desireddate = dateformat.format(feedback.getFeedbackDate());
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

    <link rel="stylesheet" href="//cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css">

    <!-- BOOTSTRAP CSS -->
    <link rel="stylesheet" type="text/css" href="/static/mycss/users/AdminProfileSettings.css"/>
    <link rel="stylesheet" type="text/css" href="/static/mycss/users/teacherusers.css"/>

    <link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Feedback | Student</title>
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

<div class="container">
    <div class="card">
        <div class="card-header text-center">
            <h3><%= WordUtils.capitalizeFully(student.getStudentFirstName()) %> <%= WordUtils.capitalizeFully(student.getStudentLastName())%>'s feedback for <%= desireddate %></h3>
        </div>

        <div class="card-body">
            <div class="form-inline text-center">

                <p class="card-text col-md-6">Attendance:

                    <%
                        if (feedback.getAttendance().equals("absent"))
                        {
                    %>
                    <span style="color: red;">Absent</span>
                    <%
                    }
                    else if (feedback.getAttendance().equals("present"))
                    {
                    %>
                    <span style="color: green;">Present</span>
                    <%
                        }
                    %>
                </p>



                <hr>
                <p class="card-text col-md-6">Performance:

                    <%
                        if (feedback.getPerformance() > 8)
                        {
                    %>
                    <span style="color: green;">Very Good</span>
                    <%
                    }
                    else if (feedback.getPerformance() > 5)
                    {
                    %>
                    <span style="color: green;">Good</span>
                    <%
                    }
                    else if (feedback.getPerformance() == 5)
                    {
                    %>
                    <span style="color: orange;">Satisfactory</span>
                    <%
                    }
                    else if (feedback.getPerformance() > 3)
                    {
                    %>
                    <span style="color: red;">Poor</span>
                    <%
                    }
                    else if (feedback.getPerformance() > 0)
                    {
                    %>
                    <span style="color: red;">Very Poor</span>
                    <%
                        }
                    %>
                </p>


                <p class="card-text col-md-6">Behaviour:

                    <%
                        if (feedback.getBehaviour() > 8)
                        {
                    %>
                    <span style="color: green;">Very Good</span>
                    <%
                    }
                    else if (feedback.getBehaviour() > 5)
                    {
                    %>
                    <span style="color: green;">Good</span>
                    <%
                    }
                    else if (feedback.getBehaviour() == 5)
                    {
                    %>
                    <span style="color: orange;">Satisfactory</span>
                    <%
                    }
                    else if (feedback.getBehaviour() > 3)
                    {
                    %>
                    <span style="color: red;">Poor</span>
                    <%
                    }
                    else if (feedback.getBehaviour() > 0)
                    {
                    %>
                    <span style="color: red;">Very Poor</span>
                    <%
                        }
                    %>
                </p>



                <p class="card-text col-md-6">Improvement:

                    <%
                        if (feedback.getImprovement() > 8)
                        {
                    %>
                    <span style="color: green;">Very Good</span>
                    <%
                    }
                    else if (feedback.getImprovement() > 5)
                    {
                    %>
                    <span style="color: green;">Good</span>
                    <%
                    }
                    else if (feedback.getImprovement() == 5)
                    {
                    %>
                    <span style="color: orange;">Satisfactory</span>
                    <%
                    }
                    else if (feedback.getImprovement() > 3)
                    {
                    %>
                    <span style="color: red;">Poor</span>
                    <%
                    }
                    else if (feedback.getImprovement() > 0)
                    {
                    %>
                    <span style="color: red;">Very Poor</span>
                    <%
                        }
                    %>
                </p>
            </div>

            <hr>
            <div class="text-center">
                <h5>Remark</h5>
                <p class="card-text"><%=feedback.getRemark() %></p>
            </div>

            <hr>

            <div class="text-center">
                <a href="/teacher/students" class="btn btn-primary">Go Back</a>
            </div>
        </div>

        <div class="card-footer text-muted text-center">
            <small>All Rights Reserved.</small>
        </div>
    </div>
</div>
<br>

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


