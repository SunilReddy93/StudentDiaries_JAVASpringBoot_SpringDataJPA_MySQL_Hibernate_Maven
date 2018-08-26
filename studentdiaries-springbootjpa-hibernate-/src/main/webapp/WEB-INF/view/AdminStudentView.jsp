<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.studentdiaries.springboot.Model.Student" %>
<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 13-07-2018
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<%
    Student student = (Student) request.getAttribute("student");
%>

<body oncontextmenu="return false;">
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
                    <a class="nav-link dropdown-toggle" href="" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span id="fullname"><%= StringUtils.capitalize(session.getAttribute("sessionadminfirstname").toString()) %> <%= StringUtils.capitalize(session.getAttribute("sessionadminlastname").toString())%></span></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/AdminLogout">Logout</a>

                    </div>
                </li>



            </ul>

        </div>
    </nav>

</header>
<br>


<section class="checkfeedback2">
    <div class="container">
        <div class="form-inline">

            <div class="col-md-3">
                <h3><span><%= StringUtils.capitalize(student.getStudentFirstName()) %>'s </span>Profile</h3>
            </div>

            <div class="d-flex justify-content-end float-right ml-auto">
                <form class="form-inline" action="/admin/student/feedback/report" method="post" >
                    <input type="hidden" name="studentid" value="<%= student.getStudentId() %>">                       <div class="mr-2">
                    <small class="align-items-end">Select Date to check feedback:</small>
                </div>
                    <div class="input-group mr-2 datediv">
                        <main>
                            <input type="text" id="datepicker" name="datepicker" class="form-control datepicker" placeholder="MM/DD/YYYY" autocomplete="off" required aria-label="MM/DD/YYYY" aria-describedby="basic-addon2" />
                        </main>
                    </div>
                    <div >
                        <button type="submit" class="btn btn-success align-items-end">Check</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<br>


<section>
    <div class="container signupform">
        <div class="row">

            <div class="col">

                <div class="form-row">

                    <div class=" form-group col-lg-12">
                        <label>Student ID</label>
                        <input type="text" class="form-control" id="studentid" name="studentId" placeholder="Student ID" value="<%= student.getStudentId() %>" readonly>

                    </div>

                    <div class="form-group col-md-6">
                        <label>First Name</label>
                        <input type="text" class="form-control" id="firstname" name="studentFirstName" placeholder="First Name" value="<%= StringUtils.capitalize(student.getStudentFirstName()) %>" readonly>

                    </div>

                    <div class=" form-group col-md-6">
                        <label>Last Name</label>
                        <input type="text" class="form-control" id="lastname" name="studentLastName" placeholder="Last Name" value="<%= StringUtils.capitalize(student.getStudentLastName()) %>" readonly>

                    </div>
                    <div class="form-group col-md-6">
                        <label>Father Name</label>
                        <input type="text" class="form-control" id="fathername" name="studentFatherName" placeholder="Father Name" value="<%= StringUtils.capitalize(student.getStudentFatherName()) %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Mother Name</label>
                        <input type="text" class="form-control" id="mothername" name="studentMotherName" placeholder="Mother Name" value="<%= StringUtils.capitalize(student.getStudentMotherName()) %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Student Email ID</label>
                        <input type="email" class="form-control" id="email" name="studentEmail" placeholder="Student Email Address" value="<%= student.getStudentEmail() %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Parent Email ID</label>
                        <input type="email" class="form-control" id="parentemail" name="parentEmail" placeholder="Parent Email Address" value="<%= student.getParentEmail() %>" readonly>

                    </div>

                    <div class=" form-group col-md-6">
                        <label>Student Phone No.</label>
                        <input type="text" class="form-control" id="phone" name="studentPhone" placeholder="Student Phone No." value="<%= student.getStudentPhone() %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Parent Phone No.</label>
                        <input type="text" class="form-control" name="parentPhone" id="parentphone" placeholder="Parent Phone No." value="<%= student.getParentPhone() %>" readonly>

                    </div>


                    <div class=" form-group col-md-6">
                        <label>Student Roll No.</label>
                        <input type="text" class="form-control" id="rollno" name="rollno" placeholder="Student Roll No." value="<%= student.getRollno() %>" readonly>

                    </div>


                    <div class=" form-group col-md-6">
                        <label>Teacher ID</label>
                        <input type="text" class="form-control" id="teacher" name="teacherId" placeholder="Teacher ID" value="<%= student.getTeacherId() %>" readonly>
                    </div>

                    <div class=" form-group col-md-6">
                        <label>Course Name</label>
                        <input type="text" class="form-control" id="course" name="studentCourse" placeholder="Course" value="<%= WordUtils.capitalizeFully(student.getStudentCourse()) %>" readonly>
                    </div>

                    <div class=" form-group col-md-6">
                        <label>Year</label>
                        <input type="text" class="form-control" id="year" name="year" placeholder="Year" value="<%= student.getYear() %>" readonly>
                    </div>

                    <div class=" form-group col-lg-12">
                        <label>School/College</label>
                        <input type="text" class="form-control" id="school" name="studentSchool" placeholder="School" value="<%= WordUtils.capitalizeFully(student.getStudentSchool()) %>" readonly>
                    </div>
                    <br>

                    <div class="col-md-12" style="margin-left: 45%; margin-top: 20px;">
                        <a href="/admin/teachers/students" id="goback"><button class="btn btn-primary">Go Back</button></a>
                    </div>

                </div>

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

</body>

<script
        src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous">

</script>



<script>
    $(document).ready(function () {

        $( function() {
            $( ".datepicker" ).datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showAnim: 'clip'
            });


        } );

    });

</script>
