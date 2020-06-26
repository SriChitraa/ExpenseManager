package com.expensemanager.datastore;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.expensemanager.model.Expense;

public class ExpenseDS {

	public ArrayList<Expense> getExpenseForChart(int userId) {
		ArrayList<Expense> expenses = new ArrayList<>();
		try {
			Connection connect = getConnection();
			Statement st = connect.createStatement();
			st.executeQuery("select date,time,category, sum(amount) as \"amount\",content  from expenses where user_id="
					+ userId + " group by category;");
			ResultSet rs = st.getResultSet();
			return buildExpenses(rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenses;
	}

	private ArrayList<Expense> buildExpenses(ResultSet rs) throws SQLException {
		ArrayList<Expense> expenses = new ArrayList<>();
		while (rs.next()) {
			Expense expense = new Expense();
			expense.setDate(rs.getString("date"));
			expense.setTime(rs.getString("time"));
			expense.setCategory(rs.getString("category"));
			expense.setAmount(rs.getInt("amount"));
			expense.setContent(rs.getString("content"));
			expenses.add(expense);
		}
		return expenses;
	}

	private Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
		return connect;
	}

	public void addExpense(String date, String time, String category, int amount, int userId, String content) {
		try {
			Connection connect = getConnection();
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

	public ArrayList<Expense> getExpenses(int userId, String category, String startDate, String endDate) {
		ArrayList<Expense> expenses = new ArrayList<>();
		QueryBuilder queryBuilder = new QueryBuilder();
		String query = queryBuilder.buildExpenseQuery(category, userId, startDate, endDate);
		try {
			Connection connect = getConnection();
			PreparedStatement ps = connect.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			return buildExpenses(rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenses;
	}

}
