package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//import com.mysql.jdbc.*;

public class JdbcConnector
{
	

		public static Connection getConnection() {
			System.out.println("Jdbc Connection Started");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loaded");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servisync","root","123456");
			System.out.println("Connected");
			return con;

		}
		catch (ClassNotFoundException e)
		{
			System.out.println(e);
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
		return null;
	}	
}