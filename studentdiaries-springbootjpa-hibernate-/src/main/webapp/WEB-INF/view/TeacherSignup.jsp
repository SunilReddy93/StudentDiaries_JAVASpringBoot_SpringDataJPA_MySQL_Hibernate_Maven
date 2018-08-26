<%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 10-07-2018
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <link rel="stylesheet" type="text/css" href="/static/javascript/Scroll/selectric.css">

    <title>Teacher Signup | StudentDiaries</title>

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
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/admin/login">Admin</a>
                        <a class="dropdown-item" href="/teacher/login">Teacher</a>
                        <a class="dropdown-item" href="/student/login">Student</a>
                    </div>
                </li>
            </ul>

        </div>
    </nav>

</header>
<div class="container heading">
    <h1><span>Teacher </span>Signup</h1>
</div>
<br>

<section>
    <div class="container signupform">
        <div class="row">

            <div class="col">
                <form action="/teacher/save" method="POST" id="myform2">
                    <input type="hidden" name="fno" value="2">
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label>First Name</label>
                            <input type="text" class="form-control" id="firstname" name="teacherFirstName" placeholder="First Name" required>
                            <p id="parafirstname" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Last Name</label>
                            <input type="text" class="form-control" id="lastname" name="teacherLastName" placeholder="Last Name" required>
                            <p id="paralastname" class="validation"></p>
                        </div>

                        <div class=" form-group col-md-6">
                            <label>Email ID</label>
                            <input type="email" class="form-control" name="teacherEmail" id="email" placeholder="Email Address" required>
                            <p id="paraemail" class="validation"></p>
                        </div>

                        <div class=" form-group col-md-6">
                            <label>Phone No.</label>
                            <input type="text" class="form-control" name="teacherPhone" id="phone" placeholder="Phone No." required>
                            <div class="form-inline">
                                <p id="paraphone" class="validation"></p>
                                <p id="phoneajax" class="validation"></p>
                            </div>
                        </div>

                        <div class=" form-group col-lg-12">
                            <label>Password</label>
                            <input type="password" class="form-control" name="teacherPassword" id="password" placeholder="Password" required>
                            <p id="parapassword" class="validation"></p>
                        </div>

                        <div class=" form-group col-md-6">
                            <label>Admin ID</label>

                            <select class="form-control" name="adminId" id="adminid" required>

                                <option hidden selected disabled value="">Please select</option>

                            </select>

                        </div>

                        <div class=" form-group col-md-6">
                            <label>School/College</label>


                            <select class="form-control" name="teacherSchool" id="school" required>
                                <option hidden selected disabled value="0">Please select</option>

                            </select>

                        </div>


                        <div class=" form-group col-lg-12">
                            <label>Course Name</label>
                            <select class="form-control" name="teacherCourse" id="course" required>
                                <option hidden selected disabled value="">Please select</option>
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





                        <div class="col-md-6 final">
                            <p>Already a Student Member? <a href="/teacher/login">Signin</a></p>
                        </div>
                        <div class="col-md-6 final d-flex justify-content-end">
                            <button type="submit" id="signup" class="btn btn-success" disabled>Sign Up</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<br><br>

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

<!--Select Scroll-->
<script src="/static/javascript/Scroll/jquery.selectric.js"></script>

<script src="/static/javascript/adminsignup/adminFirstNameValid.js"></script>
<script src="/static/javascript/adminsignup/adminLastNamevalid.js"></script>
<script src="/static/javascript/adminsignup/EmailValidation.js"></script>
<script src="/static/javascript/adminsignup/adminPhoneValid.js"></script>
<script src="/static/javascript/adminsignup/adminPasswordValid.js"></script>
<script src="/static/javascript/adminsignup/singleformsubmit.js"></script>

<!--DB VERIFICATION-->
<script src="/static/javascript/DBVerification/TeacherEmailDBVerification.js"></script>
<script src="/static/javascript/DBVerification/TeacherPhoneDBVerification.js"></script>

<script src="/static/javascript/AJAX/AjaxTeacherAdminId.js"></script>
<script src="/static/javascript/AJAX/AjaxTeacherAdminSchoolSignup.js"></script>

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