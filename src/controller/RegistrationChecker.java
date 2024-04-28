package controller;

import java.io.IOException;

import dao.SendEmail;
import dto.UserDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PasswordEncryptor;
import model.RegistrationAuthenticator;

/**
 * Servlet implementation class RegistrationChecker
 */
@WebServlet("/RegistrationChecker")
public class RegistrationChecker extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.sendRedirect("login.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String firstname = request.getParameter("firstName");
		String lastname  = request.getParameter("lastName");
		String email     = request.getParameter("emailId");
		String password  = request.getParameter("password");
		UserDto user = new UserDto();

		PasswordEncryptor.encrypt(password, user);
		System.out.println("Gathered all data from Register Form ");

		user.setFirstName(firstname);
		user.setLastName(lastname);
		user.setEmail(email);
		


		RegistrationAuthenticator authenticator = new RegistrationAuthenticator();
		boolean login = authenticator.isRegister(user);
		
		if(login)
		{
			response.sendRedirect("successfulRegistration.html");
			SendEmail.send(email, firstname);
		}
		else
			response.sendRedirect("registrationError.html");
			
	}

}