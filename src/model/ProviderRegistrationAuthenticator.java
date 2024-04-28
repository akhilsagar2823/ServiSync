package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import db.JdbcConnector;
import dto.ProviderDto;

public class ProviderRegistrationAuthenticator
{
	public boolean isRegister(ProviderDto provider)
	{
		int providerId = provider.getProvider_Id();
		String name = provider.getName();
		String services = provider.getService();
		String phone = provider.getPhone();
		String email = provider.getEmail();
		String address = provider.getAddress();
		String address2 = provider.getAddress2();
		String state = provider.getState();
		String zipcode = provider.getZipCode();
		String city = provider.getCity();
		int rating = provider.getRating();
		int noOfRating = provider.getNoOfRating();

		try
		{
			Connection con = JdbcConnector.getConnection();
			String query = "INSERT INTO Provider_Info (Provider_Id, Name, email_id, phone, Address_L1, Address_L2, City, State, ZipCode) "
					+ "VALUES(?,?,?,?,?,?,?,?,?);";
			PreparedStatement st1 = con.prepareStatement(query);
			st1.setInt(1, providerId);
			st1.setString(2,name);
			st1.setString(3,email);
			st1.setString(4,phone);
			st1.setString(5,address);
			st1.setString(6,address2);
			st1.setString(7,city);
			st1.setString(8,state);
			st1.setString(9,zipcode);
			st1.executeUpdate();
			st1.close();
			query = "INSERT INTO Provider (Provider_Id, Service, Rating, no_of_rating) VALUES(?, ?, ?, ?);";
			PreparedStatement st2 = con.prepareStatement(query);
			st2.setInt(1, providerId);
			st2.setString(2, services);
			st2.setInt(3, rating);
			st2.setInt(4, noOfRating);
			st2.executeUpdate();
			System.out.println("Provider Data Inserted into Database .");
			st2.close();
			
			return true;
			
		}
		catch (SQLException e)
		{
			
			System.out.println(e);
		}
		return false;
		
	}
}