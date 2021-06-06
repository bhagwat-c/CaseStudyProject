<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String usrName = (String)session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation" user="root"
		password="admin@123" />

	<sql:query dataSource="${myDS}" var="Patient">
select * from patient where p_username LIKE "<%=usrName %>";
</sql:query>
	<c:forEach var="row" items="${Patient.rows}">
		<div class="cards">
			<div id="info">
				<h1>My Details</h1>
				<table>
					<tr>
						<td><label for="">ID</label></td>
						<td><c:out value="${row.patient_id}" />
					</tr>

					<tr>
						<td><br></td>
					</tr>

					<tr>
						<td><label for="">Name</label></td>
						<td><c:out value="${row.p_name}" />
					</tr>

					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td><label for="">Contact</label></td>
						<td><c:out value="${row.p_contact}" />
					</tr>

					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td><label for="">Location</label></td>
						<td><c:out value="${row.p_location}" />
					</tr>

					<tr>
						<td><br></td>
					</tr>
					<!--  <tr>
                <td><label for="">Location</label></td>
                <td><c:out value="${row.p_location}"/>
                </tr>
          
          <tr>
         		 <td><br></td>
          </tr> -->

					</c:forEach>

				</table>
			</div>
		</div>
</body>
</html>