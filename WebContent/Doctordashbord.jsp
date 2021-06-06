
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String usrName = (String)session.getAttribute("userName");
%><!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dr dashbord</title>
<link rel="stylesheet" href="dash.css">
<script>
    
   window.onload=function close(){
        document.getElementById("pdash").style.display="none"; 
    } /*
   function Dashboard(){ 
        document.getElementById("pdash").style.display="block"; 
        
    } */
    
    function Dashboard() {
    	  var x = document.getElementById("pdash");
    	  if (x.style.display === "none") {
    	    x.style.display = "block";
    	  } else {
    	    x.style.display = "none";
    	  }
    	}
   
    
    </script>
</head>

<body>
	<div class="app">
		<aside class="nav">
			<div class="burger">
				<span class="line"></span>
			</div>
			<div class="nav__logo">
				<img src="https://assets.codepen.io/2709552/logo_1.svg" />
			</div>
			<ul class="menu">
				<li class="menu__item"><span class="menu__icon"> <svg
							width="23" height="22" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                            <path
								d="M10.779 10.588L1.877 6.004v9.992c0 .167.046.33.135.473.088.143.214.26.366.338l8.401 4.322V10.587zM11.248 9.795l8.902-4.583L11.68.907a.954.954 0 00-.864 0l-8.47 4.304 8.902 4.584zM11.716 10.588v10.541l8.402-4.326a.929.929 0 00.365-.335.902.902 0 00.135-.472V6.004l-8.902 4.584z"
								fill="#A4A8BD" />
                        </svg>
				</span> <a class="nav__link" href="index.html">Main</a></li>
				

				<li class="menu__item"><span class="menu__icon"> <svg
							width="23" height="22" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                            <path
								d="M10.779 10.588L1.877 6.004v9.992c0 .167.046.33.135.473.088.143.214.26.366.338l8.401 4.322V10.587zM11.248 9.795l8.902-4.583L11.68.907a.954.954 0 00-.864 0l-8.47 4.304 8.902 4.584zM11.716 10.588v10.541l8.402-4.326a.929.929 0 00.365-.335.902.902 0 00.135-.472V6.004l-8.902 4.584z"
								fill="#A4A8BD" />
                        </svg>
				</span>Dashboard</li>
				
			</ul>
			<div class="nav__logout">
				<a class="nav__link" href="index.html"> <span class="icon">
						<svg width="19" height="18" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                            <path
								d="M10.736 7.5h-4.6v3h4.6V15l7.668-6-7.668-6v4.5z"
								fill="#A4A8BD" />
                            <path
								d="M3.07 3h6.133V0H3.069C2.256 0 1.476.316.901.879A2.967 2.967 0 00.003 3v12c0 .796.323 1.559.898 2.121A3.102 3.102 0 003.069 18h6.134v-3H3.069V3z"
								fill="#A4A8BD" />
                        </svg>
				</span>Logout
				</a>
			</div>
		</aside>
		<main class="main">
			<header class="main__header">
				<div class="main__search">
					<input type="search" size="25" placeholder="Search" />
				</div>
				<div class="main__user">
					<div class="main__title">
						<h5>
							<%=usrName%>
						</h5>
					</div>
				</div>
			</header>

			<div class="team">

				<div class="team__setting">
					
					<button class="btn btn--primary">
						<a class="nav__link" href="Pathalogy.html"> Lab Test </a>
					</button>
					<button class="btn btn--primary">
						<a class="nav__link" href="Appointments.jsp"> Appointment </a>
					</button>
					<button class="btn btn--primary" onclick="Dashboard()">
						<a class="nav__link" href="#"> my info </a>
					</button>
				</div>
			</div>
			<div id="pdash" class="cards">
				<div class="card">

					<header class="card__header">
						<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation"
							user="root" password="admin@123" />
						<sql:query dataSource="${myDS}" var="Doctor">
              select * from doctor where D_USERNAME LIKE "<%=usrName %>";
            </sql:query>
						<c:forEach var="row" items="${Doctor.rows}">
							<div class="cards">
								<div id="info">
									<h3>My Details</h3>
									<table>
										<tr>
											<td><label for="">ID:</label></td>
											<td><c:out value="${row.DOC_ID}" />
										</tr>
										<tr>
											<td><label for="">Name:</label></td>
											<td><c:out value="${row.DOC_NAME}" />
										</tr>

										<tr>
											<td><label for="">Contact:</label></td>
											<td><c:out value="${row.DOC_CONTACT}" />
										</tr>
										<tr>
											<td><label for="">Location:</label></td>
											<td><c:out value="${row.DOC_LOCATION}" />
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
					</header>

				</div>
			</div>
	</div>


	</main>
	</div>
</body>

</html>