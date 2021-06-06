<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%
    	int id=Integer.parseInt(request.getParameter("pid"));
    	session.setAttribute("pid",id);
    	session.setAttribute("drid",session.getAttribute("drid"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="pinfo.css" type="text/css">
</head>
<body>

<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation"
							user="root" password="admin@123" />
						<sql:query dataSource="${myDS}" var="Patient">
              select * from patient where patient_id LIKE "<%=id %>";
            </sql:query>
						<c:forEach var="row" items="${Patient.rows}">
							<div class="cards">
								<div id="info">
									<h3>Patient's Details</h3>
									<table>
										<tr>
											<td><label for="">ID:</label></td>
											<td><c:out value="${row.patient_id}" />
										</tr>
										<tr>
											<td><label for="">Name:</label></td>
											<td><c:out value="${row.p_name}" />
										</tr>

										<tr>
											<td><label for="">Contact:</label></td>
											<td><c:out value="${row.p_contact}" />
										</tr>
										<tr>
											<td><label for="">Location:</label></td>
											<td><c:out value="${row.p_location}" />
										</tr>
									  <tr>
							                <td><label for="">Consultation schedule:</label></td>
							                <td><c:out value="${row.P_CONSULTATION_SCHEDULED}"/>
							        </tr>
							         <tr>
							                <td><label for="">Consultation history:</label></td>
							                <td><c:out value="${row.P_CONSULTATION_HISTORY}"/>
							        </tr>
							         <tr>
							                <td><label for="">Health history:</label></td>
							                <td><c:out value="${row.P_HEALTH_HISTORY}"/>
							        </tr>
          
          
	</c:forEach>
</table>
</div>
</br>

<div class="content">
                        <form action="./Observation" method="get">
                            <div class="user-details">
                                <div class="input-box">
                                    <span class="details">PRESCRIPTION</span>
                                    <input type="text" placeholder="Enter Prescription" name="presc" required>
                                </div>
                                <div class="input-box">
                                    <span class="details">DIAGNOSTIC</span>
                                    <input type="text" placeholder="Enter Diagnostic" name="digno" required>
                                </div>
                                <div class="input-box">
                                    <span class="details">MEDS_PRESCRIBED</span>
                                    <input type="text" placeholder="Enter Medicine" name="meds" required>
                                </div>
                                <div class="input-box">
                                    <button type="submit" value="Submit" class="submit-btn">Submit</button>
                                </div>
                        </form>
                        </div>


</form>
</body>
</html>