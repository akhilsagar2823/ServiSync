package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.JdbcConnector;
import dto.UserDto;


public class LoginAuthenticator {
    public String isLogin(UserDto user) {
        String emailId = user.getEmail();
        String password = user.getPassword();
        String firstName = null;
        String tablePassword = "";
        ArrayList<String> ret = new ArrayList<>();
        try {
            Connection con = JdbcConnector.getConnection();
            Statement st = con.createStatement();
            String query = "SELECT password, first_name FROM User_Info WHERE Email_Id = \"" + emailId + "\";";
            System.out.println("Query = " + query);

            ResultSet rs = st.executeQuery(query);

            if (rs.next()) {
                tablePassword = rs.getString(1);
            	firstName = rs.getString(2);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        if (emailId != null && password != null && !emailId.trim().equals("") && password.equals(tablePassword)) {
            return firstName;
        }

        return firstName;
    }
}