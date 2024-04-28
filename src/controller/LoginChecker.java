package controller;

import java.io.IOException;

import dto.UserDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LoginAuthenticator;
import model.PasswordEncryptor;

/**
 * Servlet implementation class LoginChecker
 */
@WebServlet("/LoginChecker")
public class LoginChecker extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.sendRedirect("login.html");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		UserDto user = new UserDto();

		PasswordEncryptor.encrypt(password, user);
		
		user.setEmail(emailId);
		
		LoginAuthenticator authenticator = new LoginAuthenticator();
		String firstName = authenticator.isLogin(user);
		
		if(firstName != null && !firstName.isEmpty())
		{
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(3000);
			session.setAttribute("emailId",emailId);
			session.setAttribute("firstName", firstName);
			response.sendRedirect("Home.jsp");
		}else
		{
			response.sendRedirect("loginError.html");
		}		
	}
}