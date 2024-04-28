package controller;

import java.io.IOException;

import dao.SendEmail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("login.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String otp = generateOTP();
        SendEmail.sendOTP(email,otp);
        HttpSession session = request.getSession(true);
        session.setAttribute("email",email);
        session.setAttribute("otp",otp);    	
        response.sendRedirect("forgotPassword.jsp");
        
    }
    
    public static String generateOTP()
    {
        int randomPin =(int) (Math.random()*9000)+1000;
        String otp = String.valueOf(randomPin);
        return otp;
    }
}