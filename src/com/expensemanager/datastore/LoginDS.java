package com.expensemanager.datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.expensemanager.model.User;

public class LoginDS {

	public User getUser(String uname) {
		User user = new User();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			PreparedStatement ps = connect.prepareStatement("select * from login where username = '" + uname + "';");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setPassword(rs.getString("userpassword"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
