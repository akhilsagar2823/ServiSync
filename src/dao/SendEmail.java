package dao;

import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail 
{
    public static void send(String mail,String name) throws IOException
    {

        String to = mail;
        String text = "Hello, "+name+"\n\n"+
            "You have successfully registered to the ServiSync. We are here to provide you basic services at your home.\n"+"Thank you for Registering \n";

        try {
            Properties properies = new Properties();
            properies.put("mail.smtp.host", "smtp.gmail.com");
            properies.put("mail.smtp.port", "578");
            properies.put("mail.smtp.auth", "true");
            properies.put("mail.smtp.starttls.enable", "true");
            properies.put("mail.smtp.starttls.required", "true");
            properies.put("mail.smtp.ssl.protocols", "TLSv1.2");
            properies.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            final String fromMail = "copythatbusiness@gmail.com";
            final String password = "dreo akup hmok vhjy";

            Session session = Session.getDefaultInstance(properies,
            	    new Authenticator() {
            	        protected PasswordAuthentication  getPasswordAuthentication() {
            	        return new PasswordAuthentication(
            	                   fromMail, password);
            	                }
    	    });         
            session.getDebug();
            System.out.println("Mail Sent !");

            MimeMessage message = new MimeMessage(session);
            System.out.println("Mail Sent !");

            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            
            message.setSubject("Registration Successful !!");
            message.setText(text);
            System.out.println("Mail Sent !");

            Transport.send(message);
            System.out.println("Mail Sent !");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static void sendOTP(String mail,String otp) throws IOException
    {
        String to = mail;
        String text = "Your OTP is : "+otp+"\n\n"+
                "Use This Otp to reset your password \n";

        try {
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.port", "465");
            properties.put("mail.smtp.starttls.required", "true");
            properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

            final String fromMail = "copythatbusiness@gmail.com";
            final String password = "dreo akup hmok vhjy";

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromMail, password);
                }
            });         session.getDebug();
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject("Registration Successful !!");
            message.setText(text);
            Transport trans = session.getTransport("smtp");
            trans.connect("smtp.gmail.com", 587, fromMail , password );
            trans.sendMessage(message, message.getAllRecipients());
            System.out.println("Mail Sent !");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
    }
  
    
}