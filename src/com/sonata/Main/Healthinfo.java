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

@WebServlet("/Healthinfo")
public class Healthinfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      String pid=request.getParameter("user");
//	      String consultationSchedule=request.getParameter("dta");
	      String healthHistory=request.getParameter("healthhist");
	      String consultationHistory=request.getParameter("cnslthist");
	      
	      PatientDAOImpl dao=new PatientDAOImpl();
	    int check=dao.patientAppointment(pid,healthHistory,consultationHistory);
	    
	      if(check==1) {
	    	  
				RequestDispatcher rd=request.getRequestDispatcher("./PatientDashbord.jsp");
				rd.include(request, response);

	      }
	      else {
	    	  out.println("<script type=\"text/javascript\">");
	    	   out.println("alert('some mistake');");
	    	   out.println("location='healthInfo.html';");
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
