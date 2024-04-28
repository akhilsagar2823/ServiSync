package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.JdbcConnector;
import dto.ProviderDto;

public class ProviderIdGenerator {

	public static void genetate(ProviderDto provider) {
		int provider_Id;
        try {
            Connection con = JdbcConnector.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT MAX(Provider_ID) FROM provider_info;");
            while (rs.next()) {
                provider_Id = rs.getInt(1)+1;
                provider.setProvider_Id(provider_Id);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
