package controller;

import java.io.IOException;

import dao.SendEmail;
import dto.ProviderDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProviderIdGenerator;
import model.ProviderRegistrationAuthenticator;

@WebServlet("/ProviderRegistration")
public class ProviderRegistrationChecker extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.sendRedirect("login.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("name");
		String email     = request.getParameter("email");
		String phone  = request.getParameter("phone");
		String address  = request.getParameter("address");
		String address2  = request.getParameter("address2");
		String state  = request.getParameter("state");
		String zipcode  = request.getParameter("zipcode");
		String city  = request.getParameter("city");
		String services  = request.getParameter("services");
		
		services = services.equals("other")? request.getParameter("otherOption"):services;
		ProviderDto provider = new ProviderDto();

		ProviderIdGenerator.genetate(provider);
		provider.setName(name);
		provider.setService(services);
		provider.setEmail(email);
		provider.setPhone(phone);
		provider.setAddress(address);
		provider.setAddress2(address2);
		provider.setState(state);
		provider.setZipCode(zipcode);
		provider.setCity(city);
		provider.setRating(0);
		provider.setNoOfRating(0);
		


		ProviderRegistrationAuthenticator authenticator = new ProviderRegistrationAuthenticator();
		boolean login = authenticator.isRegister(provider);
		
		if(login)
		{
			response.sendRedirect("successfulRegistration.html");
//			SendEmail.send(email, name);
		}
		else
			response.sendRedirect("registrationError.html");
			
	}
}