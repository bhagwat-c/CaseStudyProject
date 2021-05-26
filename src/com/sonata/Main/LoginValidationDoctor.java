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


@WebServlet("/LoginValidationDoctor")
public class LoginValidationDoctor extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      String userName=request.getParameter("user");
	      String password=request.getParameter("dpass");
	      
	      PatientDAOImpl dao=new PatientDAOImpl();
	      boolean checkd=dao.validateLoginDUP(userName, password);
	      
	      if(checkd==true) {
	    	  HttpSession session = request.getSession(true);
				session.setAttribute("userName",userName);
				
				RequestDispatcher rd=request.getRequestDispatcher("./index.html");
				rd.include(request, response);

	      }
	      else {
	    	  out.println("<script type=\"text/javascript\">");
	    	   out.println("alert('User or password incorrect');");
	    	   out.println("location='loginDr -.html';");
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
