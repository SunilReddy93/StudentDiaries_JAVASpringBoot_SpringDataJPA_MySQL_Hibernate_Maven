<%@ page import="com.studentdiaries.springboot.Model.Student" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 13-07-2018
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- DATEPICKER CSS & JS-->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css"/>

<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Montserrat|Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
<link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />
<link rel="stylesheet" href="/static/mycss/adminsignup.css">


<%
    Student student = (Student) request.getAttribute("student");

%>




<section class="checkfeedback">
    <div class="container">
        <div class="form-inline">

            <div class="col-md-3">
                <h3><span><%= StringUtils.capitalize(student.getStudentFirstName()) %>'s </span>Profile</h3>
            </div>

            <div class="d-flex justify-content-end float-right ml-auto">
                <form class="form-inline" action="/teacher/student/feedback/report" method="post" >
                    <input type="hidden" name="studentid" value="<%= student.getStudentId() %>">                       <div class="mr-2">
                    <small class="align-items-end">Select Date to check feedback:</small>
                </div>
                    <div class="input-group mr-2">
                        <main>
                            <input type="text" id="date" name="date" class="form-control" placeholder="MM/DD/YYYY" autocomplete="off" required aria-label="MM/DD/YYYY" aria-describedby="basic-addon2" />
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
                        <input type="text" class="form-control" id="studentid" name="studentid" placeholder="Student ID" value="<%= student.getStudentId() %>" readonly>

                    </div>

                    <div class="form-group col-md-6">
                        <label>First Name</label>
                        <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" value="<%= StringUtils.capitalize(student.getStudentFirstName()) %>" readonly>

                    </div>

                    <div class=" form-group col-md-6">
                        <label>Last Name</label>
                        <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" value="<%= StringUtils.capitalize(student.getStudentLastName()) %>" readonly>

                    </div>
                    <div class="form-group col-md-6">
                        <label>Father Name</label>
                        <input type="text" class="form-control" id="fathername" name="fathername" placeholder="Father Name" value="<%= StringUtils.capitalize(student.getStudentFatherName()) %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Mother Name</label>
                        <input type="text" class="form-control" id="mothername" name="mothername" placeholder="Mother Name" value="<%= StringUtils.capitalize(student.getStudentMotherName()) %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Student Email ID</label>
                        <input type="email" class="form-control" id="email" name="studentemail" placeholder="Student Email Address" value="<%= StringUtils.capitalize(student.getStudentEmail()) %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Parent Email ID</label>
                        <input type="email" class="form-control" id="parentemail" name="parentemail" placeholder="Parent Email Address" value="<%= StringUtils.capitalize(student.getParentEmail()) %>" readonly>

                    </div>

                    <div class=" form-group col-md-6">
                        <label>Student Phone No.</label>
                        <input type="text" class="form-control" id="phone" name="studentphone" placeholder="Student Phone No." value="<%= student.getStudentPhone() %>" readonly>

                    </div>
                    <div class=" form-group col-md-6">
                        <label>Parent Phone No.</label>
                        <input type="text" class="form-control" name="parentphone" id="parentphone" placeholder="Parent Phone No." value="<%= student.getParentPhone() %>" readonly>

                    </div>


                    <div class=" form-group col-md-6">
                        <label>Student Roll No.</label>
                        <input type="text" class="form-control" id="rollno" name="rollno" placeholder="Student Roll No." value="<%= student.getRollno() %>" readonly>

                    </div>


                    <div class=" form-group col-md-6">
                        <label>Teacher ID</label>
                        <input type="text" class="form-control" id="teacher" name="teacher" placeholder="Teacher ID" value="<%= student.getTeacherId() %>" readonly>
                    </div>

                    <div class=" form-group col-md-6">
                        <label>Course Name</label>
                        <input type="text" class="form-control" id="course" name="course" placeholder="Course" value="<%= WordUtils.capitalizeFully(student.getStudentCourse()) %>" readonly>
                    </div>

                    <div class=" form-group col-md-6">
                        <label>Year</label>
                        <input type="text" class="form-control" id="year" name="year" placeholder="Year" value="<%= student.getYear() %>" readonly>
                    </div>

                    <div class=" form-group col-lg-12">
                        <label>School/College</label>
                        <input type="text" class="form-control" id="school" name="school" placeholder="School" value="<%= WordUtils.capitalizeFully(student.getStudentSchool()) %>" readonly>
                    </div>


                    <div class="col-md-12">
                        <a href="/teacher/students" id="goback"><button type="submit"  class="btn btn-primary">Go Back</button></a>
                    </div>

                </div>

            </div>
        </div>
    </div>
</section>


<br><br>

<script
        src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous">

</script>

<!--DATEPICKER-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>


<script>
    $(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.checkfeedback main').length>0 ? $('.checkfeedback main').parent() : "body";
        var options={
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        };
        date_input.datepicker(options);
    })
</script>

