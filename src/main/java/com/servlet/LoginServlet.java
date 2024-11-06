package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.entities.User;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//try block with paramater which has PrintWriter to convert console output to the web page 
			//fetch data from database
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// Authencticate User
			UserDAO userDao = new UserDAO(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			
			HttpSession httpSession= request.getSession();


			if (user == null) {
				out.println("<h1>Invalid Details</h1>");
				httpSession.setAttribute("message", "Invalid Details");
				response.sendRedirect("login.jsp");
				return;
			} else {
				out.println("<h1>Welcome " + user.getUserName() + "</h1>");
			}
			//We have to redirect the admin to admin.jsp and normal user to normal.jsp so for that we will need to store the details of the user first for that we have to use session, cookies, URL or HTML form etc 
			//here we will be using HttpSession to remember login details and then we will re direct them
			httpSession.setAttribute("Current-user", user);
			
			if(user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp"); //this will redirect to admin.jsp Only if user is equals to admin.
			}else if(user.getUserType().equals("normal")) {
				response.sendRedirect("Normal.jsp");
			}

		}
	}
