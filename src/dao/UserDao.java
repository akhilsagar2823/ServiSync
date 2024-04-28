package dao;

import db.JdbcConnector;
import dto.UserDto;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao
{

    public List<UserDto> getAllUserData()
    {
        List<UserDto> listOfUsers = new ArrayList<UserDto>();
        try
        {
            Connection con = JdbcConnector.getConnection();
            Statement st = con.createStatement();
            String query = "SELECT partyId,firstName,lastName,address,city,zip,state,country,phoneNo FROM party;";
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                UserDto user = new UserDto();
                user.setEmail(rs.getString(1));
                user.setFirstName(rs.getString(2));
                user.setLastName(rs.getString(3));

                listOfUsers.add(user);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return listOfUsers;
    }
}
