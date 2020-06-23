package com.expensemanager.datastore;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
			st.executeQuery("select date,time,category, sum(amount) as \"amount\",content  from expenses where user_id="+ userId + " group by category;");
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
			st.executeQuery("select * from expenses where user_id=" + userId + " order by date desc;");
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
			e.printStackTrace();
		}
		return expenses;
	}

	public void addExpense(String date, String time, String category, int amount, int userId,String content) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			CallableStatement call = (CallableStatement) connect.prepareCall("call addExpense(?,?,?,?,?,?)");
			call.setString(1, date);
			call.setString(2, time);
			call.setString(3, category);
			call.setInt(4, amount);
			call.setInt(5, userId);
			call.setString(6, content);
			call.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Expense> getExpense(int userId, String category, String start, String end) {
		ArrayList<Expense> expenses = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			PreparedStatement ps = connect.prepareStatement("select * from expenses where category = '" + category + "' and user_id=" + userId
							+ " and date between '" + start + "'and'" + end + "' order by date Desc;");
			ResultSet rs = ps.executeQuery();
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
			e.printStackTrace();
		}
		return expenses;
	}
}
