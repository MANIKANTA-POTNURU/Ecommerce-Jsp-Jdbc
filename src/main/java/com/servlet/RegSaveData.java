package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;
import com.model.UserManager;

/**
 * Servlet implementation class RegSaveData
 */
public class RegSaveData extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegSaveData() {
        super();
 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int id=Integer.parseInt(request.getParameter("reg-id"));
		String username=request.getParameter("reg-name");
		String email = request.getParameter("reg-email");
		String password = request.getParameter("reg-pwd");
		User U = new User();
		
		U.setId(id);
		U.setName(username);
		U.setEmail(email);
		U.setPassword(password);

		UserManager UM = new UserManager();
		String ack = "";
		try
		{
			ack = UM.saveRegistrationData(U);
		}catch(Exception e)
		{
			ack = e.getMessage();
		}
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		pw.println(ack);
		
		RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
		rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
