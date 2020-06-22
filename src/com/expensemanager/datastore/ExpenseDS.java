package com.expensemanager.datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.expensemanager.model.Expense;

public class ExpenseDS {
	public ArrayList<Expense> getExpenseForChart(int userId) {
		ArrayList<Expense> expenses = new ArrayList<>();
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			Statement st = connect.createStatement();
			st.executeQuery("select date,time,category, sum(amount) as \"amount\",content  from expenses where user_id="+userId+" group by category;");
			ResultSet rs = st.getResultSet();
			while (rs.next()) {
				Expense expense = new Expense();
				expense.setDate(rs.getString("date"));
				expense.setTime(rs.getString("time"));
				expense.setCategory(rs.getString("category"));
				expense.setAmount(rs.getInt("amount"));
				expense.setContent(rs.getString("content"));
				expenses.add(expense);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expenses;
	}
		public ArrayList<Expense> getExpense(int userId) {
			ArrayList<Expense> expenses = new ArrayList<>();
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
				Statement st = connect.createStatement();
				st.executeQuery("select * from expenses where user_id="+userId+" order by date desc;");
				ResultSet rs = st.getResultSet();
				while (rs.next()) {
					Expense expense = new Expense();
					expense.setDate(rs.getString("date"));
					expense.setTime(rs.getString("time"));
					expense.setCategory(rs.getString("category"));
					expense.setAmount(rs.getInt("amount"));
					expense.setContent(rs.getString("content"));
					expenses.add(expense);
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return expenses;
	}
}
