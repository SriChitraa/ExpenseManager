package com.expensemanager.datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.expensemanager.model.Expense;
import com.expensemanager.model.User;

public class ExpenseDS {
	public ArrayList<Expense> viewExpense() {
		ArrayList<Expense> expenses = new ArrayList<>();
		User user = new User();
		int id= user.getId();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			Statement st = connect.createStatement();
			st.executeQuery("select * from expenses order by Date DESC where user_id='"+id+"';");
			ResultSet rs = st.getResultSet();
			while (rs.next()) {
				Expense list = new Expense();
				list.setDate(rs.getString("date"));
				list.setTime(rs.getString("time"));
				list.setCategory(rs.getString("category"));
				list.setAmount(rs.getInt("amount"));
				list.setContent(rs.getString("content"));
				expenses.add(list);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expenses;
	}
}
