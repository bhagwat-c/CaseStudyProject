package com.sonata.Main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonata.DAOImpl.PatientDAOImpl;

@WebServlet("/PatientAppointment1")
public class PatientAppointment1 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      String userName=request.getParameter("appname");
	      String consultationSchedule=request.getParameter("dta");
	      String healthHistory=request.getParameter("ahh");
	      String consultationHistory=request.getParameter("ach");
	      
	      PatientDAOImpl dao=new PatientDAOImpl();
	      boolean check=dao.patientAppointment(userName, consultationSchedule,healthHistory,consultationHistory);
	      
	      if(check==true) {
				RequestDispatcher rd=request.getRequestDispatcher("./success.html");
				rd.include(request, response);

	      }
	      else {
	    	  out.println("<script type=\"text/javascript\">");
	    	   out.println("alert('some mistake');");
	    	   out.println("location='bookapp.html';");
	    	   out.println("</script>");
	      }
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
