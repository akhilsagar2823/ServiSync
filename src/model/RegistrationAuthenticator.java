package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import db.JdbcConnector;
import dto.UserDto;

public class RegistrationAuthenticator
{
	public boolean isRegister(UserDto user)
	{
		String firstname = user.getFirstName();
		String lastname  = user.getLastName();
		String email     = user.getEmail();
		String password  = user.getPassword();

		try
		{
			Connection con = JdbcConnector.getConnection();
			String query = "insert into User_Info(Email_Id,password,first_name,last_name) values (?,?,?,?)";
			PreparedStatement st1 = con.prepareStatement(query);

			st1.setString(1,email);
			st1.setString(2,password);
			st1.setString(3,firstname);
			st1.setString(4,lastname);

			st1.executeUpdate();
			System.out.println("Data Inserted into Database .");
			st1.close();
			return true;
			
		}
		catch (SQLException e)
		{
			
			System.out.println(e);
		}
		return false;
		
	}
}