package com.sonata.Main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonata.DAOImpl.PatientDAOImpl;
import com.sonata.Model.Patient;


@WebServlet("/LoginValidationPatient")
public class LoginValidationPatient extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      String userName=request.getParameter("user");
	      String password=request.getParameter("pass");
	      
	      
			
	      
	      PatientDAOImpl dao=new PatientDAOImpl();
	      boolean check=dao.validateLoginUP(userName, password);
	      	Patient p = new Patient();
	      
	     
	      
	      if(check==true) {
	    	  HttpSession session = request.getSession(true);
				session.setAttribute("userName",userName);
				//session.setAttribute("Id", dao.getPatientId(p)+" ");
				//System.out.println(userName);
				RequestDispatcher rd=request.getRequestDispatcher("./PatientDashbord.jsp");
				rd.include(request, response);

	      }
	      else {
	    	  RequestDispatcher rd=request.getRequestDispatcher("./fail.html");
				rd.include(request, response);
	      }
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
