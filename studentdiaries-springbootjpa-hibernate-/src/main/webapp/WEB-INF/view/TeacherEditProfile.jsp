<%@ page import="com.studentdiaries.springboot.Model.Teacher" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 14-07-2018
  Time: 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Teacher teacher = (Teacher) request.getAttribute("teacher");
%>


<html>
<head>

    <link rel="stylesheet" href="/static/mycss/adminsignup.css">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    <link href="https://fonts.googleapis.com/css?family=Montserrat|Muli" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/javascript/Scroll/selectric.css">


    <title>Teacher Profile Update Form</title>
</head>
<body oncontextmenu="return false;">

<div id="load_screen"><div id="loading"></div></div>

<!-- HEADER-NAVBAR -->
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

            </ul>

        </div>
    </nav>

</header>
<br>

<div class="container heading">
    <h1>Teacher Profile Update Form</h1>
</div>
<br>

<section>
    <div class="container signupform">
        <div class="row">

            <div class="col">
                <form action="/teacher/profile/update/submit" method="POST" id="myform2">

                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label>Teacher ID</label>
                            <input type="text" class="form-control" id="teacherid" name="teacherId" placeholder="Teacher ID" value="<%= teacher.getTeacherId() %>" readonly>
                            <p id="paraid" class="validation"></p>
                        </div>


                        <div class="form-group col-md-6">
                            <label>First Name</label>
                            <input type="text" class="form-control" id="firstname" name="teacherFirstName" placeholder="First Name" value="<%= StringUtils.capitalize(teacher.getTeacherFirstName()) %>" required>
                            <p id="parafirstname" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Last Name</label>
                            <input type="text" class="form-control" id="lastname" name="teacherLastName" placeholder="Last Name" value="<%= StringUtils.capitalize(teacher.getTeacherLastName()) %>" required>
                            <p id="paralastname" class="validation"></p>
                        </div>

                        <div class=" form-group col-md-6">
                            <label>Email ID</label>
                            <input type="email" class="form-control" name="teacherEmail" id="email" placeholder="Email Address" value="<%= teacher.getTeacherEmail() %>" readonly>
                            <p id="paraemail" class="validation"></p>
                        </div>

                        <div class=" form-group col-md-6">
                            <label>Phone No.</label>
                            <input type="text" class="form-control" name="teacherPhone" id="phone" placeholder="Phone No." value="<%= teacher.getTeacherPhone() %>" required>
                            <div class="form-inline">
                                <p id="paraphone" class="validation"></p>
                                <p id="phoneajax" class="validation"></p>
                            </div>
                        </div>


                        <div class=" form-group col-md-6">
                            <label>Reference Admin ID</label>
                            <input type="text" class="form-control" name="adminId" id="adminid" placeholder="Reference Admin ID" value="<%= teacher.getAdminId() %>" readonly>
                        </div>



                        <div class=" form-group col-lg-12">

                            <label>School/College</label>
                            <input type="text" class="form-control" name="teacherSchool" id="school" placeholder="School" value="<%= WordUtils.capitalizeFully(teacher.getTeacherSchool()) %>" readonly>

                        </div>


                        <div class=" form-group col-lg-12">
                            <label>Course Name</label>
                            <select class="form-control" name="teacherCourse" id="course" required>
                                <option value="<%= WordUtils.capitalizeFully(teacher.getTeacherCourse()) %>"><%= WordUtils.capitalizeFully(teacher.getTeacherCourse()) %></option>
                                <option>Bachelor of Commerce</option>
                                <option>Master of Science</option>
                                <option>Bachelor of Business Administration</option>
                                <option>Bachelor of Computer Application</option>
                                <option>Bachelor of Engineering</option>
                                <option>Pharmacy</option>
                                <option>Bachelor of Technology</option>
                                <option>Diploma in Computer Management</option>
                                <option>Master of Computer Application</option>
                                <option>Master of Business Management</option>
                                <option>Bachelor of Science</option>
                            </select>
                        </div>

                        <input type="hidden" name="teacherPassword" value="<%= teacher.getTeacherPassword()%>">


                        <div class="col-md-6 final">
                            <a href="/teacher/profile" class="btn btn-primary">Go Back</a>
                        </div>
                        <div class="col-md-6 final d-flex justify-content-end">
                            <button type="submit" id="signup" class="btn btn-success" disabled>Update</button>
                        </div>


                    </div>
                </form>
            </div>
        </div>
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

<script src="/static/javascript/adminsignup/adminFirstNameValid.js"></script>
<script src="/static/javascript/adminsignup/adminLastNamevalid.js"></script>
<script src="/static/javascript/adminsignup/adminPhoneValid.js"></script>
<script src="/static/javascript/adminsignup/singleformsubmit.js"></script>


<!--DB VERIFICATION-->
<script src="/static/javascript/DBVerification/TeacherPhoneDBVerification.js"></script>

<!--Select Scroll-->
<script src="/static/javascript/Scroll/jquery.selectric.js"></script>


<!--Select Scroll-->
<script>
    $(function() {
        $('select').selectric({
            maxHeight: 150
        });
    });
</script>

</body>
<!--LOADER-->
<script>
    window.addEventListener("load", function(){
        var load_screen = document.getElementById("load_screen");
        document.body.removeChild(load_screen);
    });
</script>

</html>
