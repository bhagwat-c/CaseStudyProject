<%
String usrName = (String)session.getAttribute("userName");
//int id = Integer.parseInt(session.getAttribute("pid")+" ");
%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prescription</title>
<link rel="stylesheet" href="precs.css">
</head>
<body>
	<div class="container">
		<header class="row">
			<div class="col-10">
				<div class="doc-details">
					<p class="doc-name">Dr..</p>
					<p class="doc-meta">MS - General Surgery , F.I.A.G.E.S ,
						F.UROGYN(USA) , FECSM (Oxford , UK) , MBBS</p>
					<p class="doc-meta">Rgn: 2341</p>
				</div>

				<div class="clinic-details">
					<p class="doc-meta">Clinic Name</p>
					<p class="doc-meta">#1, Crescent Park Street, Chennai</p>
				</div>

			</div>

		</header>
		<div class="prescription">
			<p style="margin-left: 15px; font-size: 10px; font-weight: bold;">
				Name of patient: <%=usrName %></p>



	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation"
							user="root" password="admin@123" />
						<sql:query dataSource="${myDS}" var="observation">
              select * from observation where patient_id LIKE (select patient_id from patient where p_username like '<%=usrName %>');
            </sql:query>
						<c:forEach var="row" items="${observation.rows}">
							<div class="cards">
								<div id="info">
									
									<table>
										<tr>
											<td><label for="">PRESCRIPTION:</label></td>
											<td><c:out value="${row.PRESCRIPTION}" /></td>
										</tr>
										<tr>
											<td><label for="">DOIGNISTIC:</label></td>
											<td><c:out value="${row.DOIGNISTIC}" /></td>
										</tr>

										<tr>
											<td><label for="">MEDS_PRESCRIBED:</label></td>
											<td><c:out value="${row.MEDS_PRESCRIBED}" /></td>
										</tr>
	</c:forEach>
</table>

		</div>

		<p
			style="font-size: 9px; text-align: right; padding-bottom: 15px; padding-right: 25px;"></p>
		<p style="font-size: 6px; text-align: center; padding-bottom: 20px;">This
			is a digitally generated Prescription</p>
	</div>
</body>
</html>