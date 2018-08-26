<%@ page import="org.apache.commons.lang.WordUtils" %>
<%@ page import="com.studentdiaries.springboot.Model.Student" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 14-07-2018
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    Student student = (Student) request.getAttribute("student");
%>

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

    <title>Student Update | StudentDiaries</title>
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
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span id="fullname"><%= WordUtils.capitalizeFully(session.getAttribute("sessionstudentfirstname").toString()) %> <%= WordUtils.capitalizeFully(session.getAttribute("sessionstudentlastname").toString()) %></span></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/StudentLogout">Logout</a>

                    </div>
                </li>
            </ul>

        </div>
    </nav>

</header>
<div class="container heading">
    <h1><span>Student </span>Update Form</h1>
</div>
<br>

<section>
    <div class="container signupform">
        <div class="row">

            <div class="col">
                <form action="/student/profile/update/submit" method="POST" id="myform3">

                    <input type="hidden" value="<%= student.getStudentId()%>" name="studentId">
                    <input type="hidden" value="<%= student.getTeacherId()%>" name="teacherId">
                    <input type="hidden" value="<%= student.getStudentSchool()%>" name="studentSchool">
                    <input type="hidden" value="<%= student.getStudentCourse()%>" name="studentCourse">
                    <input type="hidden" value="<%= student.getStudentPassword()%>" name="studentPassword">


                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label>First Name</label>
                            <input type="text" class="form-control" id="firstname" name="studentFirstName" placeholder="First Name" value="<%= WordUtils.capitalizeFully(student.getStudentFirstName()) %>" required>
                            <p id="parafirstname" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Last Name</label>
                            <input type="text" class="form-control" id="lastname" name="studentLastName" placeholder="Last Name" value="<%= WordUtils.capitalizeFully(student.getStudentLastName()) %>" required>
                            <p id="paralastname" class="validation"></p>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Father Name</label>
                            <input type="text" class="form-control" id="fathername" name="studentFatherName" placeholder="Father Name" value="<%= WordUtils.capitalizeFully(student.getStudentFatherName()) %>" required>
                            <p id="parafathername" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Mother Name</label>
                            <input type="text" class="form-control" id="mothername" name="studentMotherName" placeholder="Mother Name" value="<%= WordUtils.capitalizeFully(student.getStudentMotherName()) %>" required>
                            <p id="paramothername" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Student Email ID</label>
                            <input type="email" class="form-control" id="email" name="studentEmail" placeholder="Student Email Address" value="<%= student.getStudentEmail() %>" readonly>
                            <p id="paraemail" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Parent Email ID</label>
                            <input type="email" class="form-control" id="parentemail" name="parentEmail" placeholder="Parent Email Address" value="<%= student.getParentEmail() %>" required>
                            <p id="paraparentemail" class="validation"></p>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Student Phone No.</label>
                            <input type="text" class="form-control" id="phone" name="studentPhone" placeholder="Student Phone No." value="<%= student.getStudentPhone() %>" required>
                            <div class="form-inline">
                                <p id="paraphone" class="validation"></p>
                                <p id="phoneajax" class="validation"></p>
                            </div>
                        </div>
                        <div class=" form-group col-md-6">
                            <label>Parent Phone No.</label>
                            <input type="text" class="form-control" name="parentPhone" id="parentphone" placeholder="Parent Phone No." value="<%= student.getParentPhone() %>" required>
                            <div class="form-inline">
                                <p id="paraparentphone" class="validation"></p>
                                <p id="parentphoneajax" class="validation"></p>
                            </div>
                        </div>



                        <div class=" form-group col-md-6">
                            <label>Student Roll No.</label>
                            <input type="text" class="form-control" id="rollno" name="rollno" placeholder="Student Roll No." value="<%= student.getRollno() %>" required>
                            <p id="pararollno" class="validation"></p>
                        </div>




                        <div class=" form-group col-md-6">
                            <label>Year</label>
                            <select class="form-control" id="year" name="year" required>
                                <option selected value="<%= student.getYear() %>"><%= student.getYear() %></option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>


                        <div class="col-md-6 final">
                            <a href="/student/profile" class="btn btn-primary">Go Back</a>
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
<script src="javascript/adminsignup/adminLastNamevalid.js"></script>

<script src="/static/javascript/adminsignup/adminPhoneValid.js"></script>
<script src="/static/javascript/adminsignup/singleformsubmit.js"></script>
<script src="/static/javascript/adminsignup/StudentFatherName.js"></script>
<script src="/static/javascript/adminsignup/StudentMotherName.js"></script>
<script src="/static/javascript/adminsignup/StudentParentPhone.js"></script>
<script src="/static/javascript/adminsignup/studentRollNo.js"></script>


<!--DB VERIFICATION-->
<script src="/static/javascript/DBVerification/StudentPhoneDBVerification.js"></script>
<script src="/static/javascript/DBVerification/ParentPhoneDBVerification.js"></script>
<script src="/static/javascript/DBVerification/StudentEmailDBVerification.js"></script>
<script src="/static/javascript/DBVerification/ParentEmailDBVerification.js"></script>

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