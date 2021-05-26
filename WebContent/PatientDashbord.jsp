
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%
String usrName = (String)session.getAttribute("userName");
%><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="pdash.css">
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
                <li class="menu__item">
                    <span class="menu__icon">
                        <svg width="21" height="20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M1.111 8.625a.71.71 0 00.497-.201l5.828-5.702 5.126 5.014a.71.71 0 00.994 0L19.88 1.55a.687.687 0 00.215-.489.674.674 0 00-.206-.492.705.705 0 00-.503-.201.717.717 0 00-.5.21l-5.828 5.7-5.126-5.013a.71.71 0 00-.994 0L.614 7.45a.683.683 0 00-.152.75.691.691 0 00.259.308.714.714 0 00.39.116zM14.113 13.438h-2.108a.348.348 0 00-.352.343v5.5c0 .19.157.344.352.344h2.108a.348.348 0 00.351-.344v-5.5a.348.348 0 00-.35-.344zM19.736 7.25h-2.109a.348.348 0 00-.351.344V19.28c0 .19.157.344.351.344h2.109a.348.348 0 00.351-.344V7.594a.348.348 0 00-.351-.344z"
                                fill="#A4A8BD" />
                            <path
                                d="M8.49 7.25H6.382a.348.348 0 00-.351.344V19.28c0 .19.157.344.351.344H8.49a.348.348 0 00.352-.344V7.594a.348.348 0 00-.352-.344zM2.868 13.438H.76a.348.348 0 00-.352.343v5.5c0 .19.157.344.352.344h2.108a.348.348 0 00.351-.344v-5.5a.348.348 0 00-.351-.344z"
                                fill="#A4A8BD" />
                        </svg> </span>
                    <a class="nav__link" href="index.html">Main</a>
                </li>

                <li class="menu__item">
                    <span class="menu__icon">
                        <svg width="23" height="22" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M10.779 10.588L1.877 6.004v9.992c0 .167.046.33.135.473.088.143.214.26.366.338l8.401 4.322V10.587zM11.248 9.795l8.902-4.583L11.68.907a.954.954 0 00-.864 0l-8.47 4.304 8.902 4.584zM11.716 10.588v10.541l8.402-4.326a.929.929 0 00.365-.335.902.902 0 00.135-.472V6.004l-8.902 4.584z"
                                fill="#A4A8BD" />
                        </svg> </span>Dashboard
                </li>
            </ul>
            <div class="nav__logout">
                <a class="nav__link" href="index.html">
                    <span class="icon">
                        <svg width="19" height="18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M10.736 7.5h-4.6v3h4.6V15l7.668-6-7.668-6v4.5z" fill="#A4A8BD" />
                            <path
                                d="M3.07 3h6.133V0H3.069C2.256 0 1.476.316.901.879A2.967 2.967 0 00.003 3v12c0 .796.323 1.559.898 2.121A3.102 3.102 0 003.069 18h6.134v-3H3.069V3z"
                                fill="#A4A8BD" />
                        </svg> </span>Logout</a>
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
                        <a class="nav__link" href="Consultatio.html">
                        Book appointment
                        </a>
                      </button>
                      <button class="btn btn--primary">
                        <a class="nav__link" href="#">
                       Lab Test
                        </a>
                      </button>
                    <button class="btn btn--primary">
                        <a class="nav__link" href="#">
                       Buy medicines
                        </a>
                      </button>
                      <button class="btn btn--primary">
                        <a class="nav__link" href="#">
                        my info
                        </a>
                      </button>
                </div>
            </div>
            <div class="cards">
        <div class="card">
 <header class="card__header">
            <sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation" user="root"
                     password="admin@123" />
        <sql:query dataSource="${myDS}" var="Patient">
              select * from patient where p_username LIKE "<%=usrName %>";
            </sql:query>
            <c:forEach var="row" items="${Patient.rows}">
             <div class="cards">
                <div id="info">
                   <h3>My Details</h3>
             <table>
                      <tr>
        <td><label for="">ID:</label></td>
           <td>
           <c:out value="${row.patient_id}" />
         </tr>
                     <tr>
                 <td><label for="">Name:</label></td>
          	 <td>
             <c:out value="${row.p_name}" />
               </tr>
				 
                    <tr>
                   <td><label for="">Contact:</label></td>
                     <td>
                    <c:out value="${row.p_contact}" />
                         </tr>
                    <tr>
                       <td><label for="">Location:</label></td>
                      <td>
                        <c:out value="${row.p_location}" />
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