<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
String user=(String)session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
 
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="appoinments.css" type="text/css">
    <title>View Appointments</title>
</head>
 
<body>
 
    <h1>Appointment List</h1>
    <table>
        <tr>
            <th>Schedule ID</th>
            <th>Patient ID</th>
            <th>Date</th>
        </tr>
        <tr>
            <td>
                <br>
            </td>
        </tr>
        <sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation" user="root" password="admin@123" />
 
            <sql:query dataSource="${myDS}" var="Patient">
                  SELECT * FROM schedules WHERE DOC_ID=(SELECT DOC_ID FROM doctor WHERE d_username LIKE "<%=user %>" );
                    </sql:query>
             <c:forEach var="row" items="${Patient.rows}">
            <tr>
                <td>
                    <c:out value="${row.s_id}" />
                <td>
                    <c:out value="${row.patient_id}" />
                <td>
                    <c:out value="${row.doc_schedule}" />
                    <c:set var="drid" scope="session" value="${row.doc_id}" />
                    <!-- <td><button><a href="#">Click Here</a></button></td> -->
            </tr>
        </c:forEach>
    </table>
 
    <form action="pinfo.jsp"  onsubmit="return validateForm()" method="get">
        <h2>Patient Details</h2>
        <input type="text" class="form_field" name="pid" id="pid" placeholder="Enter patient id" autocomplete="off" />
        <button type="submit" class="submit-btn">Check Info</button>
    </form>
    <script>
        function validateForm() {
            var pid = document.getElementById("pid").value;
            if (pid == "") {
                alert("Enter the Patient Id");
                return false;
            }
            if (isNaN(pid)) {
                alert("only numbers are allowed");
                return false;
            }
        }
    </script>
 
</body>
 
</html>