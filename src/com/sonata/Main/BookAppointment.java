package com.sonata.Main;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonata.DAOImpl.PatientDAOImpl;


@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("pid"));
		int drid=Integer.parseInt(request.getParameter("Doctor"));
		String date=request.getParameter("dta");
		String healthhist=request.getParameter("ahh");
		String consulthist=request.getParameter("ach");
		
		PatientDAOImpl dao=new PatientDAOImpl();
		int check=dao.bookAppointment(id, drid, date, healthhist, consulthist);
		
		if(check==1) {
           RequestDispatcher rd=request.getRequestDispatcher("./Booked.jsp");
           rd.include(request, response);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
