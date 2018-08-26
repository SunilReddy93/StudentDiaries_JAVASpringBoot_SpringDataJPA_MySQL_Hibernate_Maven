<%@ page import="java.util.List" %>
<%@ page import="com.studentdiaries.springboot.Model.Teacher" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.commons.lang.WordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Sunil Reddy
  Date: 12-07-2018
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Teacher> teachers = (List<Teacher>) request.getAttribute("teacherIds");

    for (int i = 0; i < teachers.size(); i++) {


%>

<tr>
    <th>
        <div class="pretty p-icon p-curve p-has-indeterminate">
            <input type="checkbox" class="checkitem" value="<%= teachers.get(i).getTeacherId() %>" name="<%= teachers.get(i).getTeacherId() %>"/>
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
    <th scope="row"><%= teachers.get(i).getTeacherId() %></th>
    <td><%= StringUtils.capitalize(teachers.get(i).getTeacherFirstName()) %></td>
    <td><%= StringUtils.capitalize(teachers.get(i).getTeacherLastName()) %></td>
    <td><%= WordUtils.capitalizeFully(teachers.get(i).getTeacherCourse()) %></td>

</tr>

<%
    }
%>