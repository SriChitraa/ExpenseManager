package com.expensemanager.datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDS {

	public boolean isValid(String uname, String password){

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			PreparedStatement ps = connect.prepareStatement("select * from login where username = '" + uname + "';");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return password.equals(rs.getString("userpassword"));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;				
	}
}
