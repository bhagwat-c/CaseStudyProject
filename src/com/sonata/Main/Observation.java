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


@WebServlet("/Observation")
public class Observation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession session=request.getSession(false); 
		
		int pid=Integer.parseInt(session.getAttribute("pid")+"");
		int drid=Integer.parseInt(session.getAttribute("drid")+"");
	
		String presc=request.getParameter("presc");
		String digst = request.getParameter("digno");
		String meds = request.getParameter("meds");
		PatientDAOImpl dao = new PatientDAOImpl();
		int check=dao.observation(pid, drid, presc, meds);
		if(check==1) {
			RequestDispatcher rd = request.getRequestDispatcher("./obs.jsp");
			rd.include(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
