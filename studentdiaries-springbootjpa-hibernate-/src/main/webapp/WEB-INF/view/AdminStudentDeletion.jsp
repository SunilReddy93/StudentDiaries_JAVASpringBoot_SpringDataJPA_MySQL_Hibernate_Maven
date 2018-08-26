<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentdiaries.springboot.Model.Student" %>
<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 13-07-2018
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    for (int i = 0; i < students.size(); i++) {


%>

<tr>
    <th>
        <div class="pretty p-icon p-curve p-has-indeterminate">
            <input type="checkbox" class="checkitem" value="<%= students.get(i).getStudentId() %>" name="<%= students.get(i).getStudentId() %>"/>
            <div class="state">
                <i class="icon mdi mdi-check"></i>
                <label>Check</label>
            </div>
            <div class="state p-is-indeterminate">
                <i class="icon mdi mdi-minus"></i>
                <label>Indeterminate</label>
            </div>
        </div>
    </th>
    <th scope="row"><%= students.get(i).getRollno() %></th>
    <th><%= students.get(i).getStudentId() %></th>
    <td><%= StringUtils.capitalize(students.get(i).getStudentFirstName()) %></td>
    <td><%= StringUtils.capitalize(students.get(i).getStudentLastName()) %></td>
    <td><%= WordUtils.capitalizeFully(students.get(i).getStudentCourse()) %></td>

</tr>

<%
    }
%>
