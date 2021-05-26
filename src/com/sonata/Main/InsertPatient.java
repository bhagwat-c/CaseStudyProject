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


@WebServlet("/InsertPatient")
public class InsertPatient extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String usrName = request.getParameter("t1");
		String pass = request.getParameter("t2");
		String name = request.getParameter("t4");
		String ct=request.getParameter("t5");
		long contact = Long.parseLong(ct);
		String location = request.getParameter("t6");
		
		
		Patient p = new Patient();
		
		p.setUserName(usrName);
		p.setPassword(pass);
		p.setName(name);
		p.setContact(contact);
		p.setLocation(location);
		
		
		PatientDAOImpl dao = new PatientDAOImpl();
		
		
		HttpSession session = request.getSession(true);
		session.setAttribute("userName",p.getName());
		
		boolean checkuser = dao.validateRegUserExists(usrName);
		if(checkuser==true) {
			//out.println("not succesful");
			 out.println("<script type=\"text/javascript\">");
			   out.println("alert('User exist');");
			   out.println("location='logo.html';");
			   out.println("</script>");
		}
		else {
		
		int row= dao.insertPatient(p);
	
		if(row==1) {
						session.setAttribute("userId", dao.getPatientId(p)+" ");
			
			RequestDispatcher rd = request.getRequestDispatcher("./success.jsp");
			rd.include(request, response);
		}
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
